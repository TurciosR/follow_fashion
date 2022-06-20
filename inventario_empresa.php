<?php
include_once "_core.php";
include ('num2letras.php');
include ('facturacion_funcion_imprimir.php');

function initial() {
	// Page setup
	$id_user=$_SESSION["id_usuario"];

	$_PAGE = array ();
	$_PAGE ['title'] = 'Inventario por Empresa';
	$_PAGE ['links'] = null;
	$_PAGE ['links'] .= '<link href="css/bootstrap.min.css" rel="stylesheet">';
	$_PAGE ['links'] .= '<link href="font-awesome/css/font-awesome.css" rel="stylesheet">';
	$_PAGE ['links'] .= '<link href="css/plugins/iCheck/custom.css" rel="stylesheet">';
	$_PAGE ['links'] .= '<link href="css/plugins/chosen/chosen.css" rel="stylesheet">';
	$_PAGE ['links'] .= '<link href="css/plugins/select2/select2.css" rel="stylesheet">';
	$_PAGE ['links'] .= '<link href="css/plugins/toastr/toastr.min.css" rel="stylesheet">';
	$_PAGE ['links'] .= '<link href="css/plugins/jQueryUI/jquery-ui-1.10.4.custom.min.css" rel="stylesheet">';
	$_PAGE ['links'] .= '<link href="css/plugins/jqGrid/ui.jqgrid.css" rel="stylesheet">';
	$_PAGE ['links'] .= '<link href="css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">';
	$_PAGE ['links'] .= '<link href="css/plugins/dataTables/dataTables.responsive.css" rel="stylesheet">';
	$_PAGE ['links'] .= '<link href="css/plugins/dataTables/dataTables.tableTools.min.css" rel="stylesheet">';
	$_PAGE ['links'] .= '<link href="css/plugins/fileinput/fileinput.css" media="all" rel="stylesheet" type="text/css"/>';
	$_PAGE ['links'] .= '<link href="css/animate.css" rel="stylesheet">';
	$_PAGE ['links'] .= '<link href="css/style.css" rel="stylesheet">';
	$_PAGE ['links'] .= '<link href="css/plugins/datapicker/datepicker3.css" rel="stylesheet">';

	include_once "header.php";
	include_once "main_menu.php";
	//permiso del script
	$id_user=$_SESSION["id_usuario"];
	$admin=$_SESSION["admin"];

	$uri = $_SERVER['SCRIPT_NAME'];
	$filename=get_name_script($uri);
	$links=permission_usr($id_user, $filename);


	//permiso del script
	if ($links!='NOT' || $admin=='1' ){
		?>
		<div class="wrapper wrapper-content  animated fadeInRight">
			<div class="row">
				<div class="col-lg-12">
					<div class="ibox ">
						<div class="ibox-title">
							<h5>Inventario Por empresa</h5>
						</div>
						<div class="ibox-content">
							<input type="hidden" name="process" id="process" value="utilidad">
							<div class="row">
								<div class="col-md-12">
									<label>PROVEEDOR</label>
									<select style='width:100%' id="proveedor" name="proveedor">
										<option selected value="0">TODOS LOS PROVEEDORES</option>
										<?php
										$sql_p = _query("SELECT proveedor.id_proveedor,proveedor.nombre FROM proveedor ORDER BY proveedor.nombre ASC");
										while ($row = _fetch_array($sql_p)) {
											?>
											<option value="<?=$row['id_proveedor'] ?>"><?=$row['nombre'] ?></option>
											<?php
										}
										 ?>
									</select>
								</div>
								<input type="hidden" name="id_sucursal" id="id_sucursal">
							</div>
							<br>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group has-info">
										<input type="submit" id="submit1" name="submit1" value="Imprimir" class="btn btn-primary m-t-n-xs" />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

		<?php
		include_once ("footer.php");

		?>
		<script type="text/javascript">
		$(document).ready(function() {

			$(document).on('click', '#submit1', function(event) {
				var fechaini = $("#fini").val();
				var fecha = $("#ffin").val();
				var proveedor = $("#proveedor").val();
				var cadena = "inventario_empresa_pdf.php?proveedor="+proveedor;
				window.open(cadena, '', '');
			});
			$('#proveedor').select2();
		});
	</script>
	<?php
} //permiso del script
else {
	echo "<div></div><br><br><div class='alert alert-warning'>No tiene permiso para este modulo.</div>";
}
}


if(!isset($_POST['process'])){
	initial();
}
else
{
	if(isset($_POST['process'])){
		switch ($_POST['process']) {
			case 'edit':
			//insertar_empresa();
			editar();
			break;
		}
	}
}
?>
