<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include("_conexion.php");

$query = "SELECT * FROM usuario WHERE usuario='".$_POST['usuario']."' AND password='".MD5($_POST['pwd'])."'";

$result = _fetch_all($query);

if(sizeof($result) > 0){
    $result = $result[0];

    $result['admin'] = (int)$result['admin'];
    $result['id_usuario'] = (int)$result['id_usuario'];

    //unset($result['password']);
    unset($result['id_empleado']);

    $result['permisos'] = _fetch_all("SELECT usuario_modulo.id_usuario, usuario_modulo.id_modulo, modulo.nombre FROM usuario_modulo INNER JOIN modulo on usuario_modulo.id_modulo=modulo.id_modulo WHERE usuario_modulo.id_usuario=".$result['id_usuario']);

    foreach ($result['permisos'] as $key => $val){
        $result['permisos'][$key]['nombre'] = strtolower($result['permisos'][$key]['nombre']);
        $result['permisos'][$key]['nombre'] = str_replace(" ", "_", $result['permisos'][$key]['nombre']);

        $result['permisos'][$key]['id_usuario'] = (int)  $result['permisos'][$key]['id_usuario'];
        $result['permisos'][$key]['id_modulo'] = (int)  $result['permisos'][$key]['id_modulo'];
    }

    http_response_code(200);
    echo json_encode($result);
}else{
    http_response_code(400);
    echo json_encode(array("estatus"=>"CREDENCIALES INCORRECTAS"));
}