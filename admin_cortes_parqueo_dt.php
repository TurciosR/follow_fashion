<?php
include("_core.php");
require('ssp.customized.class.php');

    $id_sucursal = $_SESSION['id_sucursal'];
    $today = date('Y-m-d');
    $data = [];
    $fechaInicio = $_REQUEST['fechaInicio'];
    $fechaFin = $_REQUEST['fechaFin'];

    // DB table to use
    $table = 'cortes_parqueo';
 
    // Table's primary key
    $primaryKey = 'id_corte_parqueo';
    // MySQL server connection information
    $sql_details = array(
    'user' => $username,
    'pass' => $password,
    'db'   => $dbname,
    'host' => $hostname
    );
    $joinQuery="";
    $extraWhere=" id_sucursal=$id_sucursal
        AND fecha BETWEEN '$fechaInicio' AND '$fechaFin'";

    $columns = array(
        array('db' => 'id_corte_parqueo', 'dt' => 0, 'field' => 'id_corte_parqueo'),
        array('db' => 'fecha',      'dt' => 1, 'field'       => 'fecha'),
        array('db' => 'hora', 'dt' => 2, 'field' => 'hora'),
        array('db' => 'id_usuario', 'dt'  =>3,'formatter' => function($id_usuario){
            $userData = _fetch_array(_query(
                "SELECT nombre FROM usuario WHERE id_usuario=$id_usuario"
            ));
            return $userData['nombre'];

        }, 'field' => 'id_usuario'),
        array('db' => 'efectivo_en_caja','dt' => 4, 'formatter' =>function($efectivo){
            return "$".$efectivo;
        }, 'field' => 'efectivo_en_caja'),
        array('db' => 'total_corte', 'dt' => 5, 'formatter' => function($total_corte){
            return "$".$total_corte;
        }, 'field' => 'total_corte'),
        array('db' => 'diferencia', 'dt' => 6, 'formatter' => function($diff){
            return "$".$diff;
        }, 'field' => 'diferencia'
        ),
        array('db' => 'id_corte_parqueo', 'dt' => 7, 'formatter' => function($id_corte_parqueo){
               $menudrop = "";
               $link=permission_usr($_SESSION['id_usuario'],'anular_parqueo');
               if($link!='NOT' || $_SESSION['admin']=='1'){
                $menudrop .= "<div class='btn-group'>
                    <a href='#' data-toggle='dropdown' class='btn btn-primary dropdown-toggle'>
                    <i class='fa fa-bars icon-white'></i> Menu<span class='caret'></span></a>
                    <ul class='dropdown-menu dropdown-primary'>
                    <li>
                        <a data-toggle='modal'
                            href='modals/corte_parqueo_view.php?id_corte=$id_corte_parqueo'
                            data-target='#viewModal' data-refresh='true'>
                            <i class=\"fa fa-print\"></i> Reimprimir
                        </a>
                    </li>
                    </ul>
                    </div>";
               }

               return $menudrop;
            },
            'field' => 'id_corte_parqueo'
        )
    );
    echo json_encode(
        SSP::simple($_GET, $sql_details, $table, $primaryKey, $columns, $joinQuery, $extraWhere)
    );
?>