<?php

include_once("_conexion.php");

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

$infoParqueados['total_parqueados'] = 0;
$infoParqueados['total_cobrar']     = 0;

//Ya que solo es para fines de conteo: 
$queryParqueados = _query(
    "SELECT fecha, entrada FROM parqueo WHERE salida IS NULL"
);

//Obtener los precios del parqueo de la sucursal activa.
$preciosParqueo = _fetch_array(_query(
    "SELECT precio_hora,precio_fraccion, minutos_fraccion
    FROM parqueo_precios
    WHERE id_sucursal=1 AND activo=1"
));

foreach($queryParqueados AS $key => $rowParked){
    //calcular el tiempo de parqueo.
    $inicioParqueo = date('H:i:s', strtotime($rowParked['entrada']));
    $dateTimeObject1 = date_create($inicioParqueo); 
    $dateTimeObject2 = date_create(date('H:i:s'));
    
    $difference = date_diff($dateTimeObject1, $dateTimeObject2); 
 
    $infoParqueados['total_cobrar'] += (
        ($difference->h * $preciosParqueo['precio_hora'] )
       +(
            intval($difference->i / $preciosParqueo['minutos_fraccion'])
            * $preciosParqueo['precio_fraccion']
        )
    );
    $infoParqueados['total_parqueados'] += 1;
}

$infoParqueados['total_cobrar'] = number_format($infoParqueados['total_cobrar'], 2);

$response['code'] = 200;
$response['message'] = "INFORMACION OBTENIDA CON EXITO";
$response['data'] = $infoParqueados;

http_response_code(200);
echo json_encode($response, true);