<?php 
/**
 * This file is part of the OpenPyme1.
 * 
 * (c) Open Solution Systems <operaciones@tumundolaboral.com.sv>
 * 
 * For the full copyright and license information, please refere to LICENSE file
 * that has been distributed with this source code.
 */

mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
ini_set('display_errors', true);
error_reporting( E_ALL );

include ('../_conexion.php');

  $id_corte_parqueo = $_REQUEST['id_corte'];
  $courtData = loadCourtData($id_corte_parqueo);
?>
<span hidden id="isUnlocked"><?php echo $isUnlocked; ?></span>

    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"
            aria-hidden="true">&times;</button>
        <h4 class="modal-title">Detalle de corte de Parqueo</h4>
    </div>
    <div class="modal-body">
        <div class="wrapper wrapper-content  animated fadeInRight">

            <!---Unlocked View--->
            <div class="row">
                <div class="col-md-12 text-center">
                    
                    <table class="table table-hover table-bordered">
                        <thead>
                            <th></th>
                            <th></th>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Fecha y Hora de Corte</td>
                                <td><?php echo $courtData['fecha'] . " — "
                                    .date('h:i A', strtotime($courtData['hora'])); ?></td>
                            </tr>
                            <tr>
                                <td>Realizado por:</td>
                                <td><?php echo $courtData['nombre']; ?></td>
                            </tr>
                            <tr>
                                <td>Total corte:</td>
                                <td>$<?php echo $courtData['total_corte']; ?></td>
                            </tr>
                            <tr>
                                <td>Total Efectivo en caja:</td>
                                <td>$<?php echo $courtData['efectivo_en_caja']; ?></td>
                            </tr>
                            <tr>
                                <td>Diferencia:</td>
                                <td>$<?php echo $courtData['diferencia']; ?></td>
                            </tr>
                            <tr>
                                <td>Inicio de correlativos:</td>
                                <td><?php echo $courtData['correlativo_inicio']; ?></td>
                            </tr>
                            <tr>
                                <td>Fin de correlativos:</td>
                                <td><?php echo $courtData['correlativo_fin']; ?></td>
                            </tr>
                            <tr>
                                <td>Ticket anulados:</td>
                                <td><?php echo $courtData['ticket_anulados']; ?></td>
                            </tr>
                            <tr>
                                <td>Monto anulado:</td>
                                <td>$<?php echo $courtData['monto_anulado']; ?></td>
                            </tr>
                            <tr>
                                <td>Clientes totales:</td>
                                <td><?php echo $courtData['total_parqueados']; ?></td>
                            </tr>
                        </tbody>
                    </table>

                    <button id="btn_rePrint" class="btn btn-primary"
                    style="margin-top: 1.3em;" data-id-corte-parqueo="<?php echo $id_corte_parqueo; ?>">
                        <i class="fa fa-print"></i> Reimprimir
                    </button>

                </div><!--col-md-12 text-center-->
            </div><!--Row-->
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
    </div>

<script>

/**
 * print the court
 */
$('#btn_rePrint').on('click', function(e) {
  reprintCourt($(this).data('id-corte-parqueo'));
});


</script>
<!--======================= modal-footer ================================= -->


<?php
/**
 * Load all court Data
 */
function loadCourtData($id_corte_parqueo){
    $courtData = _fetch_array(_query(
        "SELECT cortes_parqueo.*, usuario.nombre
        FROM cortes_parqueo
        LEFT JOIN usuario
        ON usuario.id_usuario = cortes_parqueo.id_usuario
        WHERE id_corte_parqueo=$id_corte_parqueo"
    ));
    return $courtData;
}
?>