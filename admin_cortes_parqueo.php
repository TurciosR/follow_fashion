<?php
/**
 * This file is part of the OpenPyme1.
 * 
 * (c) Open Solution Systems <operaciones@tumundolaboral.com.sv>
 * 
 * For the full copyright and license information, please refere to LICENSE file
 * that has been distributed with this source code.
 */

mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
ini_set('display_errors', 1);
error_reporting( E_ALL ); 

include ("_core.php");

function init(){
// Page setup
$_PAGE = array ();
$title = "Registros del parqueo";
$_PAGE ['title'] = $title;
$_PAGE ['links'] = null;
$_PAGE ['links'] .= '<link href="css/bootstrap.min.css" rel="stylesheet">';
$_PAGE ['links'] .= '<link href="font-awesome/css/font-awesome.css" rel="stylesheet">';
$_PAGE ['links'] .= '<link href="css/plugins/toastr/toastr.min.css" rel="stylesheet">';
$_PAGE ['links'] .= '<link href="css/plugins/jQueryUI/jquery-ui-1.10.4.custom.min.css" rel="stylesheet">';
$_PAGE ['links'] .= '<link href="css/plugins/jqGrid/ui.jqgrid.css" rel="stylesheet">';
$_PAGE ['links'] .= '<link href="css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">';
$_PAGE ['links'] .= '<link href="css/plugins/dataTables/dataTables.responsive.css" rel="stylesheet">';
$_PAGE ['links'] .= '<link href="css/plugins/dataTables/dataTables.tableTools.min.css" rel="stylesheet">';
$_PAGE ['links'] .= '<link href="css/plugins/datapicker/datepicker3.css" rel="stylesheet">';
$_PAGE ['links'] .= '<link href="css/plugins/sweetalert/sweetalert.css" rel="stylesheet">';
$_PAGE ['links'] .= '<link href="css/animate.css" rel="stylesheet">';
$_PAGE ['links'] .= '<link href="css/style.css" rel="stylesheet">';
include_once "header.php";
include_once "main_menu.php";

$id_sucursal = $_SESSION["id_sucursal"];
$today = date('Y-m-d');

//permiso del script
$id_user=$_SESSION["id_usuario"];
$admin=$_SESSION["admin"];

$uri = $_SERVER['SCRIPT_NAME'];
$filename=get_name_script($uri);
$links=permission_usr($id_user,$filename);
//permiso del script
?>

<div class="wrapper wrapper-content  animated fadeInRight">
    <div class="row" id="row1">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <?php
                if ($links!='NOT' || $admin=='1' ) {
                    echo "<div class='ibox-title'>";
                    //permiso del script
                    $filename='admin_parqueo.php';
                    $link=permission_usr($id_user,$filename);
                    if ($link!='NOT' || $admin=='1' )
                    echo "<a href='precios_parqueo.php' class='btn btn-primary' role='button'>
                        <i class='fa fa-usd icon-large'></i> Precios de parqueo</a>";
                    echo "</div>";

                    ?>
                    <div class="ibox-content">
                        <!--load datables estructure html-->
                        <header>
                            <h4><?php echo $title; ?></h4>
                        </header>
                        <section>
                        <div class="row"style="font-size: 1.1em;">
                            <div class="col-md-2">
                                  <label >Desde</label>
                                  <input type="text" class="form-control datepick"
                                  style="width: 10em; display: inline-block"
                                    id="fechaInicio" value="<?php echo date('Y-m-d');?>">
                              </div><!--col-md-2-->

                                <div class="col-md-2">
                                <div class="form-group">
                                  <label>Hasta</label>
                                  <input type="text" class="form-control datepick"
                                    id="fechaFin" value="<?php echo date('Y-m-d');?>"
                                    style="width: 10em; display: inline-block">
                                </div>
                            </div><!--col-md-2-->

                            <div class="col-md-2">
                                <div class="form-group">
                                  <button id="btn_reloadTable" class="btn btn-primary">
                                    <i class="fa fa-reload"></i> Actualizar datos
                                  </button>
                                </div>
                            </div><!--col-md-2-->

                        </div><!--Fin Row-->
                            
                            <table class="table table-striped table-bordered table-hover" id="editable">
                                <thead>
                                    <tr>
                                        <th class="col-lg-1">Id </th>
                                        <th class="col-lg-1">Fecha</th>
                                        <th class="col-lg-1">Hora</th>
                                        <th class="col-lg-2">Usuario</th>
                                        <th class="col-lg-2">Efectivo en caja</th>
                                        <th class="col-lg-2">Total sistema</th>
                                        <th class="col-lg-2">Diferencia</th>
                                        <th class="col-lg-2">Acciones</th>
                                    </tr>
                                </thead>
                                <tbody id="bodyMainTable">
                                    
                                </tbody>
                            </table>
                            <input type="hidden" name="autosave" id="autosave" value="false-0">
                        </section>
                        <!--Show Modal Popups View & Delete -->
                        <div class='modal fade' id='viewModal' tabindex='-1'
                            role='dialog' aria-labelledby='myModalLabel' aria-hidden='true'>
                            <div class='modal-dialog modal-md'>
                                <div class='modal-content modal-md'></div><!-- /.modal-content -->
                            </div><!-- /.modal-dialog -->
                        </div><!-- /.modal -->
                        <div class='modal fade' id='deleteModal' tabindex='-1'
                            role='dialog' aria-labelledby='myModalLabel' aria-hidden='true'>
                            <div class='modal-dialog modal-sm'>
                                <div class='modal-content modal-sm'></div><!-- /.modal-content -->
                            </div><!-- /.modal-dialog -->
                        </div><!-- /.modal -->
                    </div><!--div class='ibox-content'-->
                </div><!--<div class='ibox float-e-margins' -->
                </div> <!--div class='col-lg-12'-->
            </div> <!--div class='row'-->
        </div><!--div class='wrapper wrapper-content  animated fadeInRight'-->
        <?php
        include("footer.php");
        echo" <script type='text/javascript' src='js/funciones/funciones_admin_corte_parqueo.js'></script>";
    } //permiso del script
    else {
        echo "<br><br><div class='alert alert-warning'>No tiene permiso para este modulo.</div></div></div></div></div>";
        include_once ("footer.php");
    }
}

function getResumeStats(){
    $id_sucursal  = $_SESSION['id_sucursal'];
    $fechaInicio  = $_REQUEST['fechaInicio'];
    $fechaFin     = $_REQUEST['fechaFin']; 
    $parqueos = _query(
        "SELECT fecha, entrada, total, salida, anulada
        FROM parqueo
        WHERE fecha BETWEEN '$fechaInicio' AND '$fechaFin'
        AND id_sucursal=$id_sucursal"
    );

    $infoParqueos = getResumeStats_parking($parqueos, $id_sucursal);

    header('ContentType: application/json');
    echo json_encode($infoParqueos);
}

/**
 * Cancel a registered parking by any situation, Via POST, receive id_parqueo
 * @return void
 */
function cancelParking(){
    $id_parqueo = $_POST['id_parking'];
    $data['status'] = "Warning";
    $data['msg']    = "No se pudo completar la anulacion de este parqueo";

    _update('parqueo',["anulada" => 1], "id_parqueo=$id_parqueo");
    if(_affected_rows() > 0){
        $data['msg']    = "Anulado Correctamente";
        $data['status'] = "Success";
    }
    header("ContentType: application/json");
    echo json_encode($data);
}

function reprintCourt(){
    include ('facturacion_funcion_imprimir.php');
    $id_corte = $_REQUEST['id_corte'];
    $id_sucursal=$_SESSION['id_sucursal'];

    $infoCourt = _fetch_array(_query(
        "SELECT cortes_parqueo.*, usuario.nombre
        FROM cortes_parqueo
        LEFT JOIN usuario
        ON usuario.id_usuario = cortes_parqueo.id_usuario
        WHERE id_corte_parqueo=$id_corte"
    ));

    //Valido el sistema operativo y lo devuelvo para saber a que puerto redireccionar
    $info = $_SERVER['HTTP_USER_AGENT'];
    $so_cliente = ((strpos($info, 'Windows')) == TRUE) ? 'win' : 'lin';

    //directorio de script impresion cliente
    $headers="";
    $footers="";

    $sql_pos    = "SELECT *  FROM sucursal  WHERE id_sucursal='$id_sucursal' ";
    $result_pos = _query($sql_pos);
    $row1    = _fetch_array($result_pos);
    $headers = ""."|".""."|".""."|";
    $footers = "GRACIAS POR SU COMPRA, VUELVA PRONTO......"."|";
    

    $info_factura = print_ticket_corte_parqueo($infoCourt);
    
    //Direccion de impresion local
    $row_dir_print=_fetch_array(_query(
        "SELECT *  FROM config_dir WHERE id_sucursal='$id_sucursal'"
    ));
    $dir_print=$row_dir_print['dir_print_script'];
    $shared_printer_win=$row_dir_print['shared_printer_matrix'];
    $shared_printer_pos=$row_dir_print['shared_printer_pos'];

    $nreg_encode['tipo_impresion']     = "TIK";
    $nreg_encode['shared_printer_win'] = $shared_printer_win;
    $nreg_encode['shared_printer_pos'] = $shared_printer_pos;
    $nreg_encode['dir_print'] = $dir_print;
    $nreg_encode['facturar']  = $info_factura;
    $nreg_encode['sist_ope']  = $so_cliente;
    $nreg_encode['headers']   = $headers;
    $nreg_encode['footers']   = $footers;

    header("ContentType: application/json");
    echo json_encode($nreg_encode);
}


///----------------------------------
if(isset($_REQUEST['action'])){
    switch($_REQUEST['action']){
        case 'resumeStats':
            getResumeStats();
            break;
        case 'reprintCourt':
            reprintCourt();
            break;
    }
}else{
    init();
}
?>
