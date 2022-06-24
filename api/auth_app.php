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

$query = "SELECT admin, id_usuario, id_empleado, nombre, id_sucursal, usuario
    FROM usuario
    WHERE usuario='".$_REQUEST['usuario']."'
    AND password='".MD5($_REQUEST['pwd'])."'";

    //Ya que solo es para fines de conteo: 
$queryParqueados = _query(
    "SELECT fecha, entrada FROM parqueo WHERE salida IS NULL"
);

$result = _fetch_all($query);

if(sizeof($result) > 0){
    $infoParqueados['total_parqueados'] = 0;
    $infoParqueados['total_cobrar']     = 0;
    

    $result = $result[0];

    $result['admin'] = (int)$result['admin'];
    $result['id_usuario'] = (int)$result['id_usuario'];

    //Obtener los precios del parqueo de la sucursal activa.
    $preciosParqueo = _fetch_array(_query(
        "SELECT precio_hora,precio_fraccion, minutos_fraccion
        FROM parqueo_precios
        WHERE id_sucursal=".$result['id_sucursal']
        ." AND activo=1"
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

    //unset($result['password']);
    unset($result['id_empleado']);

    //$result['permisos'] = _fetch_all("SELECT usuario_modulo.id_usuario, usuario_modulo.id_modulo, modulo.nombre FROM usuario_modulo INNER JOIN modulo on usuario_modulo.id_modulo=modulo.id_modulo WHERE usuario_modulo.id_usuario=".$result['id_usuario']);

    /*foreach ($result['permisos'] as $key => $val){
        $result['permisos'][$key]['nombre'] = strtolower($result['permisos'][$key]['nombre']);
        $result['permisos'][$key]['nombre'] = str_replace(" ", "_", $result['permisos'][$key]['nombre']);

        $result['permisos'][$key]['id_usuario'] = (int)  $result['permisos'][$key]['id_usuario'];
        $result['permisos'][$key]['id_modulo'] = (int)  $result['permisos'][$key]['id_modulo'];
    }*/
    $infoParqueados['total_cobrar'] = number_format($infoParqueados['total_cobrar'], 2);
    $result['infoParqueados'] = $infoParqueados;
    http_response_code(200);
    echo json_encode($result);
}else{
    http_response_code(400);
    echo json_encode(array("estatus"=>"CREDENCIALES INCORRECTAS"));
}