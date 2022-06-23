<?php
/* Este script es el que se redirecciona a localhost donde esta el printer
y debe haber un apache corriendo con soporte php
Agregar el usuario al grupo en debian
usermod -a -G lp www-data
Permisos al puerto
su -c 'chmod 777 /dev/usb/lp0'
*/
header("Access-Control-Allow-Origin: *");

$printer="/dev/usb/lp0";
$d = $_REQUEST['datos'];

try {
	//iniciar string
	
	$latinchars = array( 'ñ','á','é', 'í', 'ó','ú','ü','Ñ','Á','É','Í','Ó','Ú','Ü','°');
	$encoded = array("\xa5","A","E","I","O","U","\x9a","\xa5","A","E","I","O","U","\x9a","\xf8");

	//$datos = str_replace($latinchars, $encoded, $d);

	//send data to USB printer
	$fp=fopen($printer, 'wb');
	fwrite($fp,$d);
	fclose($fp);
	echo "imnpreso";

}
 catch (Throwable $t) {
    // Executed only in PHP 7, will not match in PHP 5.x
     echo 'NO SE PUDO IMPRIMIR: " Excepción capturada: ',  $t->getMessage(), "\n";
} catch (Exception $e) {
    // Executed only in PHP 5.x, will not be reached in PHP 7
    echo 'NO SE PUDO IMPRIMIR: " Excepción capturada: ',  $e->getMessage(), "\n";
}
?>
