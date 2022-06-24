<?php 
/**
 * This file is part of the OpenPyme1.
 * 
 * (c) Open Solution Systems <operaciones@tumundolaboral.com.sv>
 * 
 * For the full copyright and license information, please refere to LICENSE file
 * that has been distributed with this source code.
 */

 /**
  * El mambo de este Script: contiene solo los controladores (Input y boton)
  * para solo importarlo al script principal de venta.php a la hora de pulsar
  * el boton con el candadito para desbloquear la edicion de precio
  * por porentaje de utilidad deseada sobre el costo del producto.
  */
  $isUnlocked = (isset($_REQUEST['isUnlocked'])) ? $_REQUEST['isUnlocked'] : false;
?>
<span hidden id="isUnlocked"><?php echo $isUnlocked; ?></span>

    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"
            aria-hidden="true">&times;</button>
        <h4 class="modal-title">Aplicar precio personalizado</h4>
    </div>
    <div class="modal-body">
        <div class="wrapper wrapper-content  animated fadeInRight">
            <!------Locked View --->
            <div class="row" id="lockedView" <?php echo ($isUnlocked) ? 'hidden' : ''; ?>>
                <div class="col-md-12 text-center">
                    <label>Ingrese su clave para habilitar la edición del precio de venta
                        en base a un porcentaje de utilidad </label>
                    <input type="password" id="unlockPass" class="form-control">
                    <button id="btn_unlockPercentage" class="btn btn-primary"
                    style="margin-top: 1.3em;" data-row-table="<?php echo $_REQUEST['fila']; ?>">
                        <i class="fa fa-lock"></i> Desbloquear
                    </button>
                </div>

            </div>

            <!---Unlocked View--->
            <div class="row" id="unlockedView" <?php echo ($isUnlocked) ? '' : 'hidden'; ?>>
                <div class="col-md-12 text-center">
                    <label id="unlock_prodDescription">Producto de Prueba</label>
                    <label id="unlock_prodPresentation">Presentacion de Prueba</label>
                    <table class="table table-hover table-bordered">
                        <thead>
                            <th>Precio venta</th>
                            <th>Costo</th>
                            <th>Porcentaje </th>
                            <th>Nuevo precio</th>
                        </thead>
                        <tbody>
                            <td>$<span id="unlock_sellPrice">0.00</span></td>
                            <td>$<span id="unlock_prodCost">0.00</span></td>
                            <td>
                                <input type="number" step="1.00" min="0" value="0"
                                style="width: 5em; border:none; text-align:right;"
                                id="unlock_percentOverCost">%
                            </td>
                            <td>$<span id="unlock_newPrice">0.00</span></td>
                        </tbody>
                    </table>

                    <button id="btn_unlockPercentApply" class="btn btn-primary"
                    style="margin-top: 1.3em;" data-row-table="<?php echo $_REQUEST['fila']; ?>">
                        <i class="fa fa-check"></i> Aplicar
                    </button>

                </div><!--col-md-12 text-center-->
            </div><!--Row-->
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
    </div>

<script>
/**@abstract Run this code for automatic load data when init modal*/
$(document).ready(function() {
    if($('#isUnlocked').text() == "true"){
        loadProductData_toUnlock(
            $('#btn_unlockPercentage').data('row-table')
        );
    }else{
        $('#unlockPass').focus();
    }
});

/**
 * create listener event for unlock editor price based on cost
 */
$('#btn_unlockPercentage').on('click', function(e) {
  unlockPercentageUtility(this);
});

</script>
<!--/modal-footer -->
