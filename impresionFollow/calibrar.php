<?php
//ultima modificacion:  06/05/2016
/* Este script es el que se redirecciona a localhost donde esta el printer
y debe haber un apache corriendo con soporte php
Agregar el usuario al grupo en debian
usermod -a -G lp www-data
Permisos al puerto
su -c 'chmod 777 /dev/usb/lp0'
*/
header("Access-Control-Allow-Origin: *");
//$texto = strtoupper($_REQUEST['datosventa']);

$texto="";
//$efectivo = $_REQUEST['efectivo'];
//$cambio = $_REQUEST['cambio'];
$info = $_SERVER['HTTP_USER_AGENT'];
$msj_fin='GRACIAS POR SU COMPRA, VUELVA PRONTO !';
const ESC = "\x1b";
$line=str_repeat("_",40)."\n";
//$sp=str_repeat(" ",40)."\n";
$line1=str_repeat("_",30)."\n";
$initialized = chr(27).chr(64);
$condensed1 =Chr(27). chr(15);
$condensed0 =Chr(27). chr(18);
//$printer="/dev/LX-350";
$printer="/dev/usb/lp0";

$latinchars = array( 'ñ','á','é', 'í', 'ó','ú','ü','Ñ','Á','É','Í','Ó','Ú','Ü');
//$encoded = array("\xa4","\xa0", "\x82","\xa1","\xa2","\xa3", "\x81","\xa5","\xb5","\x90","\xd6","\xe0","\xe9","\x9a");
$encoded = array("\xa5","A","E","I","O","U","\x9a","\xa5","A","E","I","O","U","\x9a");
$textoencodificado = str_replace($latinchars, $encoded, $texto);

//$factura_codificada = str_replace($latinchars, $encoded, $factura);
$condensed = Chr(27).Chr(33).Chr(4);
$bold1 = Chr(27).Chr(69);
$bold0 = Chr(27).Chr(70);
$initialized = chr(27).chr(64);
$condensed1 =Chr(27). chr(15);
$condensed0 =Chr(27). chr(18);
$corte = Chr(27) . Chr(109);
$font12cpi =Chr(27). chr(77);
$avancelinea=Chr(10);
$avance=Chr(27). chr(48); //1/8 pulgada menos espacio entre lineas
$avance1sexto=Chr(27). chr(50); //1/6 pulgada mas espacio entre lineas
$string='';
$string.= $initialized;
$string.= $avancelinea.$avancelinea;
$string.= $condensed;
$string.= chr(27).chr(116).chr(2); //CODE PAGE MULTILINGUAL
$string.= chr(27).chr(33).chr(1); //FONT A
$string.= chr(15); //modo condensado lx350
$string.= $avance;

for($i=0;$i<70;$i++)
{
    $string.=str_pad($i,7," ",STR_PAD_RIGHT)."-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-"."\n";
}


$string.=$textoencodificado;


$string.= chr(12); //page Feed
//send data to USB printer
$fp0=fopen($printer, 'wb');
fwrite($fp0,$string);
fclose($fp0);
?>
