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
include ("utils/parqueo.php");

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
                    #=================================
                    $infoParqueo = getResumeStats();
                    $correlativos= getCorrelativos();
                    #=================================
                    echo "<div class='ibox-title'>";
                    //permiso del script
                    $filename='corte_parqueo.php';
                    $link=permission_usr($id_user,$filename);
                    if ($link!='NOT' || $admin=='1' )
                    ?>
                    <div class="ibox-content">
                        <!--load datables estructure html-->
                        <header>
                            <h4><?php echo $title; ?></h4>
                        </header>
                        <section>
                            <!------------------- <Section> ----------------->
                        <div class="row"style="font-size: 1.1em;">
                            <div class="col-md-6">
                               
                                <table class="table table-hover table-bordered">
                                    <thead>
                                        <tr>
                                            <th><label>Detalle de cobro por uso de parqueo - <?php 
                                                echo date('d-m-Y',strtotime($today)); 
                                                ?></label></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Total clientes:</td>
                                            <td class="text-right"><span id="total_parqueados">
                                                <?php echo $infoParqueo['total_parqueados']; ?>
                                            </span></td>
                                        </tr>
                                        <tr>
                                            <td>Total cobrado:</td>
                                            <td class="text-right"><span id="total_cobrado">$
                                                <?php echo number_format($infoParqueo['total_cobrado'], 2); ?>
                                            </span></td>
                                        </tr>
                                        <tr>
                                            <td>Pendiente de cobrar:</td>
                                            <td class="text-right">$<span id="total_cobrar">
                                                <?php echo number_format($infoParqueo['total_cobrar'], 2); ?>
                                            </span></td>
                                        </tr>
                                        <tr>
                                            <td>Tickets anulados:</td>
                                            <td class="text-right">
                                                <?php echo $infoParqueo['num_anuladas']; ?>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Monto de tickets anulados:</td>
                                            <td class="text-right">$<span id="total_anulado">
                                                <?php echo number_format($infoParqueo['total_anulada'], 2); ?>
                                            </span</td>
                                        </tr>

                                        <tr>
                                            <td>Inicio de Correlativo:</td>
                                            <td class="text-right"><span id="total_anulado">
                                                <?php echo $correlativos['min_used']; ?>
                                            </span</td>
                                        </tr>
                                        <tr>
                                            <td>Ultimo Correlativo:</td>
                                            <td class="text-right"><span id="total_anulado">
                                                <?php echo $correlativos['max_used']; ?>
                                            </span</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div><!--col-md-2------------------------------------>

                            <div class="col-md-6">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <table class="table table-hover table-striped">
                                            <thead>
                                                <th class="text-center">Total del Corte</th>
                                                <th class="text-center">Diferencia</th>
                                            </thead>
                                            <tbody>
                                                <td class="text-right">$<span id="total_corte">
                                                        <?php echo number_format($infoParqueo['total_cobrado'], 2); ?>
                                                    </span>
                                                </td>
                                                <td class="text-right font-bold text-danger"
                                                id="diffChar">$<span id="diferencia">
                                                        -<?php echo number_format($infoParqueo['total_cobrado'], 2); ?>
                                                    </span>
                                                </td>
                                            </tbody>
                                        </table>
                                    </div>
                                </div><!--row--->
                                <br>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <label>Efectivo en caja:</label>
                                        <input class="form-control" type="number"
                                        step="1.00" id="efectivo_caja">

                                        <div class="text-center" style="margin-top: 1.2em;">
                                            <button id="initCorte" class="btn btn-primary">
                                                <i class="fa fa-save"></i> Guardar corte
                                            </button>
                                        </div>
                                        
                                    </div>
                                    
                                </div><!--row--->
                                
                               
                            </div><!--col-md-2-->

                           
                            <!------------------- </Section> ----------------->
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
        echo" <script type='text/javascript' src='js/funciones/funciones_corte_parqueo.js'></script>";
    } //permiso del script
    else {
        echo "<br><br><div class='alert alert-warning'>No tiene permiso para este modulo.</div></div></div></div></div>";
        include_once ("footer.php");
    }
}

function getResumeStats(){
    $id_sucursal  = $_SESSION['id_sucursal'];
    $today  = date('Y-m-d');
    $parqueos = _query(
        "SELECT fecha, entrada, total, salida, anulada
        FROM parqueo
        WHERE fecha = '$today'
        AND id_sucursal=$id_sucursal
        AND id_corte_parqueo=0"
    );

    return getResumeStats_parking($parqueos, $id_sucursal);
}

function getCorrelativos(){
    $id_sucursal  = $_SESSION['id_sucursal'];
    $today  = date('Y-m-d');
    $correlativos = _fetch_array(_query(
        "SELECT MIN(numero_doc) AS min_used,
        MAX(numero_doc) AS max_used
        FROM parqueo
        WHERE fecha = '$today'
        AND id_sucursal=$id_sucursal
        AND id_corte_parqueo=0"
    ));
    return $correlativos;
}

/**
 * Init the court for parking data collected
 */
function courtParking(){
    $id_sucursal = $_SESSION['id_sucursal'];
    $infoParqueo = getResumeStats();
    $correlativos= getCorrelativos();
    $diferencia  = $_POST['diff'];
    $efectivo    = $_POST['efectivo'];

    $data['status'] = 'warning';
    $data['msg']    = "El corte no pudo ser registrado";
    $passed = false;

    _begin();

    $formData = array(
        "id_sucursal" => $id_sucursal,
        "fecha"       => date('Y-m-d'),
        "hora"        => date('H:i:s'),
        "efectivo_en_caja"   => $efectivo,
        "diferencia"         => $diferencia,
        "correlativo_inicio" => $correlativos['min_used'],
        "correlativo_fin"    => $correlativos['max_used'],
        "total_corte"        => $infoParqueo['total_cobrado'],
        "ticket_anulados"    => $infoParqueo['num_anuladas'],
        "total_parqueados"   => $infoParqueo['total_parqueados'],
        "monto_anulado"      => $infoParqueo['total_anulada'],
        "id_usuario"         => $_SESSION['id_usuario']
    );
    _insert('cortes_parqueo', $formData);

    $insertedID = _insert_id();
    if($insertedID > 0){
        //Actualizar el id de los registros del parqueo con el ID insertado.
        //para diferenciar que este registro, ya está en un corte.

        //Update all registrys whit id_corte_parqueo = 0
        _update(
            'parqueo',
            array("id_corte_parqueo" => $insertedID),
            "id_sucursal=$id_sucursal AND id_corte_parqueo=0"
        );
        if(_affected_rows() > 0){
            $data['status'] = "success";
            $data['msg']    = "Corte #$insertedID registrado correctamente";
            $data['id_corte_parqueo'] = $insertedID;
            $passed = true;
        }
    }

    if($passed == true){
        _commit();
    }else{
        _rollback();
    }

    header("ContentType: application/json");
    echo json_encode($data);
}

///----------------------------------
if(isset($_REQUEST['action'])){
    switch($_REQUEST['action']){
        case 'resumeStats':
            getResumeStats();
            break;
        case 'courtParking':
            courtParking();
            break;
    }
}else{
    init();
}
?>
