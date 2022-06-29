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

include_once("_conexion.php");

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

$infoParqueados['total_parqueados'] = 0;
$infoParqueados['total_cobrar']     = 0;
$infoParqueados['total_cobrado']    = 0;

$fecha_hoy = date('Y-m-d');

//Ya que solo es para fines de conteo: 
$queryParqueados = _query(
    "SELECT fecha, entrada, total, salida
        FROM parqueo
        WHERE fecha ='$fecha_hoy'"
);

//Obtener los precios del parqueo de la sucursal activa.
$preciosParqueo = _fetch_array(_query(
    "SELECT precio_hora,precio_fraccion, minutos_fraccion
    FROM parqueo_precios
    WHERE id_sucursal=1 AND activo=1"
));

foreach($queryParqueados AS $key => $rowParked){
 
    //calcular el tiempo de parqueo.
    if($rowParked['salida'] == "" || $rowParked['salida'] == null){
        $inicioParqueo = date('H:i:s', strtotime($rowParked['entrada']));
        $dateTimeObject1 = date_create($inicioParqueo); 
        $dateTimeObject2 = date_create(date('H:i:s'));
        
        $difference = date_diff($dateTimeObject1, $dateTimeObject2);
        
        
    
        $infoParqueados['total_cobrar'] += (
            ($difference->h * $preciosParqueo['precio_hora'] )
                +(
                (1+intval($difference->i / $preciosParqueo['minutos_fraccion']))
                * $preciosParqueo['precio_fraccion']
            )
        );
        $infoParqueados['total_parqueados'] += 1;
    }else{
        $infoParqueados['total_cobrado'] += $rowParked['total'];
    }

}

if($difference->h == 0 && $difference == 0){
    $infoParqueados['total_cobrado'] = $preciosParqueo['precio_fraccion'];
}

$infoParqueados['total_cobrado'] = number_format($infoParqueados['total_cobrado'], 2);
//$infoParqueados['total_cobrar'] = number_format($infoParqueados['total_cobrar'], 2);
$infoParqueados['total_cobrar'] = $infoParqueados['total_cobrado'];

$response['code'] = 200;
$response['message'] = "INFORMACION OBTENIDA CON EXITO";
$response['data'] = $infoParqueados;

http_response_code(200);
echo json_encode($response, true);