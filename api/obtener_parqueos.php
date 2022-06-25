<?php

include_once("_conexion.php");

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

// agregamos el total de horas transcurridas, concatenando la fecha de hoy con la hora de entrada
// y haciendo la resta entre la hora actual y la de entrada
$sql = "SELECT *, TIMESTAMPDIFF(MINUTE, TIMESTAMP(fecha,entrada) , NOW()) AS minutos
 FROM parqueo WHERE salida IS NULL";

$parqueos = _fetch_all($sql);
if(sizeof($parqueos) > 0){

    $response['code'] = 200;
    $response['message'] = "DATOS OBTENIDOS";
    $response['data'] = $parqueos;

    echo json_encode($response, true);
}else{
     $response['code'] = 200;
    $response['message'] = "NO SE ENCONTRARON DATOS";
    $response['data'] = [];

    echo json_encode($response, true);
}
