<?php

include_once("_conexion.php");

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8; mimetype=application/json");

// agregamos el total de horas transcurridas, concatenando la fecha de hoy con la hora de entrada
// y haciendo la resta entre la hora actual y la de entrada
$sql = "SELECT *, TIMESTAMPDIFF(MINUTE, TIMESTAMP(fecha,entrada) , NOW()) AS minutos
 FROM parqueo WHERE fecha = '".date('Y-m-d')."'";

$parqueos = _fetch_all($sql);
if(sizeof($parqueos) > 0){

    http_response_code(200);
    echo json_encode($parqueos);
}else{
    http_response_code(500);
    echo json_encode(array("status"=>"ERROR"));
}
