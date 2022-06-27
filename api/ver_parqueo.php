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

ini_set("allow_url_fopen", true);
ini_set("allow_url_include", true);

include_once("_conexion.php");

$data = json_decode(file_get_contents("php://input"),true);

if (!empty($data["id_parqueo"]) ){

    $queryParqueo=_fetch_array(_query(
        "SELECT * FROM parqueo
        WHERE id_parqueo=$data[id_parqueo]"
    ));

    $preciosParqueo = _fetch_array(_query(
        "SELECT precio_hora,precio_fraccion, minutos_fraccion
        FROM parqueo_precios
        WHERE id_sucursal=".$queryParqueo['id_sucursal']
        ." AND activo=1"
    ));

    //Calculate total to pay
    $inicioParqueo   = date('H:i:s', strtotime($queryParqueo['entrada']));
    $dateTimeObject1 = date_create($inicioParqueo);
    $dateTimeObject2 = date_create(date("Y-m-d H:i:s"));
    
    //Calcular diferencias
    $difference = date_diff($dateTimeObject1, $dateTimeObject2);
    $horas      = $difference->h;
    $fracciones =  (1+(intval($difference->i / $preciosParqueo['minutos_fraccion']))); 

    //Calcular total
    $total = (
        ($horas * $preciosParqueo['precio_hora'])
        +($fracciones * $preciosParqueo['precio_fraccion'])
    );
    //Pasar a formato de billetico
    $total = number_format($total,2);

    $dataExecuted = [];
    $dataExecuted['horas']      = $horas;
    $dataExecuted['fracciones'] = $fracciones;
    $dataExecuted['total_cobro']= $total;
    $dataExecuted['placa']      = $queryParqueo['placa'];
    $dataExecuted['id_parqueo']      = $queryParqueo['id_parqueo'];
    $dataExecuted['num_doc']    = $queryParqueo['numero_doc'];
    $dataExecuted['precio_hora']= $preciosParqueo['precio_hora'];
    $dataExecuted['precio_fraccion'] = $preciosParqueo['precio_fraccion'];
    
    $dataExecuted['entrada']    = date(
        'h:i A', strtotime($queryParqueo['entrada'])
    );
    $dataExecuted['salida']    = date(
        'h:i A', strtotime(date("Y-m-d H:i:s"))
    );


        http_response_code(200);
        $response['code'] = 200;
        $response['message'] = "REGISTRO DE PARQUEO OBTENIDO";
        $response['data'] = $dataExecuted;

        echo json_encode($response, true);

	
} 

else{

    http_response_code(400);
    $response['code'] = 400;
    $response['message'] = "DATOS INCOMPLETOS";
    $response['data'] = null;

     echo json_encode($response, true);

}

?>
