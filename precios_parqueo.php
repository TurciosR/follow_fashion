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
error_reporting( E_ERROR | E_PARSE ); 

include ("_core.php");

function init(){
// Page setup
$_PAGE = array ();
$title = "Actualizar precios del parqueo";
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
                    //-----------------------------
                    $preciosParqueo = loadPrices();
                    //-----------------------------
                    ?>
                    <div class="ibox-content">
                        <!--load datables estructure html-->
                        <header>
                            <h4><?php echo $title; ?></h4>
                        </header>
                        <section>
                        <div class="row"style="font-size: 1.1em;">

                            <div class="col-lg-3">
                                <div class="form-group has-info single-line">
                                    <label class="control-label" for="Nombre">Precio por fracción</label>
                                    <input type="number" step="0.25" placeholder="$"
                                    class="form-control input-precio-parqueo" id="precio_fraccion" name="precio_fraccion"
                                    value="<?php echo $preciosParqueo['precio_fraccion'];?>" autocomplete="off">
                                </div>

                                <div class="form-group has-info single-line">
                                    <label class="control-label" for="Nombre">Minutos por fracción</label>
                                    <input type="number" step="1" min="1" max=59 placeholder=""
                                    class="form-control input-precio-parqueo" id="minutos_fraccion" name="minutos_fraccion"
                                    value="<?php echo $preciosParqueo['minutos_fraccion'];?>" autocomplete="off">
                                </div>
                            </div><!--col-lg-3-->


                            <div class="col-lg-3">
                                <div class="form-group has-info single-line">
                                    <label class="control-label" for="Nombre">Precio por 1 Hora</label>
                                    <input type="number" step="1.00" min="0" placeholder="$"
                                    class="form-control input-precio-parqueo" id="precio_hora" name="precio_hora"
                                    value="<?php echo $preciosParqueo['precio_hora'];?>" autocomplete="off">
                                </div>

                                <div class="form-group text-center">
                                  <button id="btn_updatePrices" class="btn btn-primary">
                                    <i class="fa fa-save"></i> Guardar
                                  </button>
                                </div>
                            </div><!--col-lg-3-->

                        </div><!--Fin Row-->


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
        echo" <script type='text/javascript' src='js/funciones/funciones_parqueo.js'></script>";
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
        "SELECT fecha, entrada, total, salida
        FROM parqueo
        WHERE fecha BETWEEN '$fechaInicio' AND '$fechaFin'
        AND id_sucursal=$id_sucursal"
    );

    //Obtener los precios del parqueo de la sucursal activa.
    $preciosParqueo = _fetch_array(_query(
        "SELECT precio_hora,precio_fraccion, minutos_fraccion
        FROM parqueo_precios
        WHERE id_sucursal=".$id_sucursal
        ." AND activo=1"
    ));
    
    $infoParqueos['total_parqueados'] = 0;
    $infoParqueos['en_parqueo']       = 0;
    $infoParqueos['total_cobrar']     = 0;
    $infoParqueos['total_cobrado']    = 0;
    if(_num_rows($parqueos) > 0){
        //$result = $result[0];
        foreach($parqueos AS $key => $rowParked){
            
            if($rowParked['salida'] == "" || $rowParked['salida'] == null){
                //calcular el tiempo de parqueo.
                $inicioParqueo   = date('H:i:s', strtotime($rowParked['entrada']));
                $dateTimeObject1 = date_create($inicioParqueo); 
                $dateTimeObject2 = date_create(date('H:i:s'));
                
                $difference = date_diff($dateTimeObject1, $dateTimeObject2);

                $infoParqueos['total_cobrar'] += (
                    ($difference->h * $preciosParqueo['precio_hora'] )
                    +(
                        intval($difference->i / $preciosParqueo['minutos_fraccion'])
                        * $preciosParqueo['precio_fraccion']
                    )
                );
                $infoParqueos['en_parqueo'] += 1;
            }else{
                $infoParqueos['total_cobrado'] += $rowParked['total'];
            }
         
            
            $infoParqueos['total_parqueados'] += 1;
        }
        $infoParqueos['total_cobrado'] = number_format($infoParqueos['total_cobrado'], 2);
        $infoParqueos['total_cobrar' ] = number_format($infoParqueos['total_cobrar'], 2);
    }
    header('ContentType: application/json');
    echo json_encode($infoParqueos);
}

function loadPrices(){
    //Obtener los precios del parqueo de la sucursal activa.
    $id_sucursal = $_SESSION['id_sucursal'];
    $preciosParqueo = _fetch_array(_query(
        "SELECT precio_hora,precio_fraccion, minutos_fraccion
        FROM parqueo_precios
        WHERE id_sucursal=".$id_sucursal
        ." AND activo=1"
    ));
    return $preciosParqueo;
}

function updatePrices(){
    $id_sucursal     = $_SESSION['id_sucursal'];
    $hourPrice       = $_REQUEST['hourPrice'];
    $fractionPrice   = $_REQUEST['fractionPrice'];
    $fractionMinutes = $_REQUEST['fractionMinutes'];
    $data = [];
    $data['status'] = 'Error';
    $data['msg']    = 'No se pudo actualizar los precios.';

    $formdata = array(
        'precio_hora' => $hourPrice,
        'precio_fraccion' => $fractionPrice,
        'minutos_fraccion'=> $fractionMinutes
    );
    $updatedPrices = _update(
        "parqueo_precios",
        $formdata,
        "id_sucursal=$id_sucursal"
    );
    if($updatedPrices){
        $data['status'] = 'Success';
        $data['msg']    = 'Precios actualizados correctamente.';
    }
    header("ContentType: application/json");
    echo json_encode($data);
}

///----------------------------------
if(isset($_REQUEST['action'])){
    switch($_REQUEST['action']){
        case 'update_parkingPrices':
            updatePrices();
            break;
    }
}else{
    init();
}
?>
