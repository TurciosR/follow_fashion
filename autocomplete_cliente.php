<?php
	include ("_conexion.php");
	$query = $_REQUEST["query"];
	$entrada=_query("SELECT * FROM cliente WHERE  nombre LIKE '%$query%'");
	$datos = "";
	while($raw=_fetch_array($entrada))
		{	
			$id_cliente=$raw["id_cliente"];
			$nombre = $raw["nombre"];
			$datos[]= $id_cliente."| ".$nombre;
		}
		echo json_encode($datos);
?>
