<?php
/**
 * This file is part of the OpenPyme1.
 * 
 * (c) Open Solution Systems <operaciones@tumundolaboral.com.sv>
 * 
 * For the full copyright and license information, please refere to LICENSE file
 * that has been distributed with this source code.
 */
/*
  mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
  ini_set('display_errors', 1);
  error_reporting( E_ERROR | E_PARSE );
*/
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include("_conexion.php");

$data = json_decode(file_get_contents("php://input"),true);


if(!isset($data['usuario']) || !isset($data['password'])){
    $response['code'] = 400;
    $response['message'] = "PETICION INCORRECTA";
    $response['data'] = $data;

    http_response_code(400);
    echo json_encode($response,true);
    die();
}

$query = "SELECT id_sucursal, id_usuario, nombre, usuario, admin, precios
    FROM usuario
    WHERE usuario='".$data['usuario']."'
    AND password='".MD5($data['password'])."'";

$result = _fetch_all($query);



$result = _fetch_all($query);

if(sizeof($result) > 0){
    
    

    $result = $result[0];

    $result['admin'] = (int)$result['admin'];
    $result['id_usuario'] = (int)$result['id_usuario'];
    $result['id_sucursal'] = (int)$result['id_sucursal'];
    $result['precios'] = (int)$result['precios'];
    unset($result['id_empleado']);

    //unset($result['password']);


    //$result['permisos'] = _fetch_all("SELECT usuario_modulo.id_usuario, usuario_modulo.id_modulo, modulo.nombre FROM usuario_modulo INNER JOIN modulo on usuario_modulo.id_modulo=modulo.id_modulo WHERE usuario_modulo.id_usuario=".$result['id_usuario']);

    /*foreach ($result['permisos'] as $key => $val){
        $result['permisos'][$key]['nombre'] = strtolower($result['permisos'][$key]['nombre']);
        $result['permisos'][$key]['nombre'] = str_replace(" ", "_", $result['permisos'][$key]['nombre']);

        $result['permisos'][$key]['id_usuario'] = (int)  $result['permisos'][$key]['id_usuario'];
        $result['permisos'][$key]['id_modulo'] = (int)  $result['permisos'][$key]['id_modulo'];
    }*/
    
    $response['code'] = 200;
    $response['message'] = "SESION INICIADA CON EXITO";
    $response['data'] = $result;

    http_response_code(200);
    echo json_encode($response, true);
}else{
    $response['code'] = 400;
    $response['message'] = "CREDENCIALES INCORRECTAS";
    $response['data'] = null;

    http_response_code(400);
    echo json_encode($response,true);
}