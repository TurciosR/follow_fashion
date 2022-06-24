<?php
/**
 * This file is part of the OpenPyme1.
 * 
 * (c) Open Solution Systems <operaciones@tumundolaboral.com.sv>
 * 
 * For the full copyright and license information, please refere to LICENSE file
 * that has been distributed with this source code.
 */
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once("_conexion.php");
ini_set('error_reporting', E_ALL);
ini_set('display_errors', 1);
$data = json_decode(file_get_contents("php://input"),true);

if (!empty($data->id_sucursal) && !empty($data->placa) && !empty($data->fecha) && !empty($data->entrada)){
	
	$tablename = "prestamo";
    $dataform = array(    
        "id_sucursal" => $data->id_sucursal,
        "placa" => $data->placa,
        "fecha" => $data->fecha,
        "entrada" => $data->entrada,
    );

    $success = _insert($tablename, $dataform);

    if($query){
        $dataform['id_parqueo'] = _insert_id();
        http_response_code(200);
        echo json_encode(array( "new" => $dataform ));
    }else{
        http_response_code(500);
        echo json_encode(array( "new" => []));
    }
	
} 

else{

    http_response_code(400);
     echo json_encode(array( "new" => []));

}

?>
