<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

ini_set("allow_url_fopen", true);
ini_set("allow_url_include", true);

include_once("_conexion.php");
ini_set('error_reporting', E_ALL);
ini_set('display_errors', 1);
$data = json_decode(file_get_contents("php://input"),true);

if (!empty($data["id_sucursal"]) && !empty($data["placa"]) && !empty($data["fecha"]) && !empty($data["entrada"])){
	//Leer correlativo para incrementarlo.
    //EL CORRELATIVO PTIK, obtiene el ultimo en la base de datos. y le suma 1. 
    //ese nuevo valor, es el que se va a usar en el ticket y a actualizar en la 
    //tabla de correlativos.

    $correlativo = _fetch_array(_query(
      "SELECT tik_parqueo FROM correlativo WHERE id_sucursal=$data[id_sucursal]"
    ));
    //sumamos el correlativo del ticket y a partir de aqui, usaremos este valor.
    $correlativo = ($correlativo['tik_parqueo'] + 1);
    $num_doc     = str_pad($correlativo, 10, "0", STR_PAD_LEFT)."_PTIK";

	$tablename = "parqueo";
    $dataform = array(    
        "id_sucursal" => $data["id_sucursal"],
        "placa"       => $data["placa"],
        "fecha"       => $data["fecha"],
        "entrada"     => $data["entrada"],
        "numero_doc"  => $num_doc
    );

    _update(
        'correlativo',
        ['tik_parqueo' => $correlativo],
        "id_sucursal=$data[id_sucursal]"
    );

    $success = _insert($tablename, $dataform);

    if($success){
        $dataform['id_parqueo'] = _insert_id();
        http_response_code(200);

        $response['code'] = 200;
        $response['message'] = "DATOS INSERTADOS";
        $response['data'] = $dataform;

        echo json_encode($response, true);
    }else{
        $response['code'] = 500;
        $response['message'] = "DATOS DEL SERVIDOR";
        $response['data'] = null;

        echo json_encode($response, true);
    }
	
} 

else{

    http_response_code(400);
    $response['code'] = 400;
    $response['message'] = "DATOS INCOMPLETOS";
    $response['data'] = null;

     echo json_encode($response, true);

}

?>
