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

//include ('_conexion.php');

/**Calculate all params resume, to use. on a one place.
 * params for detail of parking. for admin, api and court
 * 
 * @param mysqliObject $parqueosQuery the result query of parqueo
 * @param int $id_sucursal current sucursal, default is 1
 */
function getResumeStats_parking($parqueosQuery, $id_sucursal=1){
    $infoParqueos['total_parqueados'] = 0;
    $infoParqueos['en_parqueo']       = 0;
    $infoParqueos['total_cobrar']     = 0.00;
    $infoParqueos['total_cobrado']    = 0.00;
    $infoParqueos['total_anulada']    = 0.00;
    $infoParqueos['num_anuladas']     = 0;
    $infoParqueos['tiempo_estadia']   = "";

    //Obtener los precios del parqueo de la sucursal activa.
    $preciosParqueo = _fetch_array(_query(
        "SELECT precio_hora,precio_fraccion, minutos_fraccion
        FROM parqueo_precios
        WHERE id_sucursal=".$id_sucursal
        ." AND activo=1"
    ));

    //obtain info
    if(_num_rows($parqueosQuery) > 0){
        //$result = $result[0];
        foreach($parqueosQuery AS $key => $rowParked){

            if($rowParked['anulada'] == 1){
                $infoParqueos['num_anuladas'] += 1;
                $infoParqueos['total_anulada']+= $rowParked['total'];
                continue;
            }

            if($rowParked['salida'] == "" || $rowParked['salida'] == null){
                //calcular el tiempo de parqueo.
                $inicioParqueo   = date('H:i:s', strtotime($rowParked['entrada']));
                $dateTimeObject1 = date_create($inicioParqueo); 
                $dateTimeObject2 = date_create(date('H:i:s'));
                
                $difference = date_diff($dateTimeObject1, $dateTimeObject2);

                $infoParqueos['tiempo_estadia'] = str_pad($difference->h, 2, "0", STR_PAD_LEFT).":";
                $infoParqueos['tiempo_estadia'] .= str_pad($difference->i, 2, "0", STR_PAD_LEFT);

                $horas      = ($difference->h * $preciosParqueo['precio_hora'] );
                $fracciones = (1+intval($difference->i / $preciosParqueo['minutos_fraccion']));

                $infoParqueos['total_cobrar'] += ($horas + $fracciones);
                $infoParqueos['en_parqueo'] += 1;
            }else{
                $infoParqueos['total_cobrado'] += $rowParked['total'];
            }
         
            
            $infoParqueos['total_parqueados'] += 1;
        }
        $infoParqueos['total_cobrado'] = number_format($infoParqueos['total_cobrado'], 2);
        $infoParqueos['total_cobrar' ] = number_format($infoParqueos['total_cobrar'], 2);
    }
    return $infoParqueos;
}


?>