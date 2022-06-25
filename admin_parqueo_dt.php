<?php
include("_core.php");
require('ssp.customized.class.php');

    $id_sucursal = $_SESSION['id_sucursal'];
    $today = date('Y-m-d');
    $data = [];
    $fechaInicio = $_REQUEST['fechaInicio'];
    $fechaFin = $_REQUEST['fechaFin'];

    // DB table to use
    $table = 'parqueo';
 
    // Table's primary key
    $primaryKey = 'id_parqueo';
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
        array(
            'db'   => 'id_parqueo',
            'dt'   => 0,
            'field'=> 'id_parqueo'
        ),
        array(
            'db'    => 'fecha',
            'dt'    => 1,
            'field' => 'fecha'
        ),
        array(
            'db'    => 'numero_doc',
            'dt'    => 2,
            'field' => 'numero_doc'
        ),
        array(
            'db'    => 'placa',
            'dt'    => 3,
            'field' => 'placa'
        ),
        array('db' => 'entrada',
            'dt' => 4,
            'formatter' => function($entrada){
                return date('h:i A', strtotime($entrada));
            },
            'field' => 'entrada'
        ),
        array(
            'db' => 'salida',
            'dt' => 5,
            'formatter' => function($salida, $row){
               if($salida == ''){
                $salida = '<b>En el parqueo</b>';
               }else{
                $salida = date('h:i A', strtotime(($salida)));
               }
               return $salida;
            },
            'field' => 'salida'
        ),
        array(
            'db' => 'total',
            'dt' => 6,
            'formatter' => function ($total, $row) {
                if($row['salida'] == ''){
                    $id_sucursal = $_SESSION['id_sucursal'];
                    $preciosParqueo = _fetch_array(_query(
                        "SELECT precio_hora,precio_fraccion, minutos_fraccion
                        FROM parqueo_precios
                        WHERE id_sucursal=".$id_sucursal
                        ." AND activo=1"
                    ));

                    $inicioParqueo = date('H:i:s', strtotime($row['entrada']));
                    $dateTimeObject1 = date_create($inicioParqueo); 
                    $dateTimeObject2 = date_create(date('H:i:s'));

                    $difference = date_diff($dateTimeObject1, $dateTimeObject2);
                    $total = (
                        ($difference->h * $preciosParqueo['precio_hora'] )
                        +(
                            (intval($difference->i / $preciosParqueo['minutos_fraccion']) +1)
                            * $preciosParqueo['precio_fraccion']
                        )
                    );
                }
                return "$".number_format($total,2);
            },
            'field' => 'total'
        )
    );
    echo json_encode(
        SSP::simple($_GET, $sql_details, $table, $primaryKey, $columns, $joinQuery, $extraWhere)
    );
?>