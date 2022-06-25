/**
 * This file is part of the OpenPyme1.
 * 
 * (c) Open Solution Systems <operaciones@tumundolaboral.com.sv>
 * 
 * For the full copyright and license information, please refere to LICENSE file
 * that has been distributed with this source code.
 */

 $(document).on('keyup change', '.input-precio-parqueo', function (){
  validateValues(this);
  console.log("lo polisia");
});

$(document).on('click', '#btn_reloadTable', function (){
    loadTable();
});

$(document).on('click', '#btn_updatePrices', function (){
  updatePrices();
});

$(document).ready(function() {
  $('.datepick').datepicker();
  setTimeout(function(){
    loadTable();
  }, 100); 
});


/**
 * generate data on table
 */
function loadTable(){
  
  let fechaInicio = $('#fechaInicio').val();
  let fechaFin    = $('#fechaFin').val();
  let table = $('#editable');
    
  
  $('#bodyMainTable').empty();
  dataTable = $('#editable').DataTable({
    "pageLength": 50,
    "order": [
      [0, 'desc'],
      [1, 'desc']
    ],
    "processing": true,
    "serverSide": true,
    "ajax": {
      url: "admin_parqueo_dt.php",
      data:{
        fechaInicio : fechaInicio,
        fechaFin    : fechaFin
      },
      error: function() { // error handling
        //$(".editable2-error").html("");
        $("#editable").append(
          '<tbody class="editable_grid-error">'
            +'<tr><th colspan="3">No se encontró información segun busqueda </th>'
            +'</tr></tbody>'
        );
        $("#editable_processing").css("display", "none");
        $(".editable-error").remove();
      }
    },
    "columnDefs": [{
      "targets": 1, //index of column starting from 0
      "render": function(data, type, full, meta) {
        if (data != null)
          return '<p class="text-success"><strong>' + data + '</strong></p>';
        else
          return '';
      }
    }],
    destroy: true
  });
  dataTable.ajax.reload();

  loadResume(fechaInicio, fechaFin);

}

/**
 * Load a short resume to status on parking
 * @param {*} fInicio date from start list
 * @param {*} fFin  date for end list
 */
function loadResume(fInicio, fFin){
  $.ajax({
    type: 'POST',
    url: "admin_parqueo.php",
    data: {
      action      : "resumeStats",
      fechaInicio : fInicio,
      fechaFin    : fFin 
    },
    dataType: 'json',
    success: function(datax){
      $('#totalCobrado').text(datax.total_cobrado);
      $('#porCobrar').text(datax.total_cobrar);
      $('#totalParqueados').text(datax.total_parqueados);
      $('#enParqueo').text(datax.en_parqueo);
    }
  });
}

/**
 * Validate the inputs in precios_parqueo.php for prevent negatives numbers
 */
function validateValues(inputObj){
  let price = parseFloat($(inputObj).val());
  price = ((isNaN(price)) ? 0 : price);
  if(price < 0){
    $(inputObj).val(0);
  }
}

function updatePrices(){
  //verify price is not empty
  let hourPrice       = $('#precio_hora').val();
  let fractionPrice   = $('#precio_fraccion').val();
  let fractionMinutes = $('#minutos_fraccion').val();

  if(hourPrice == "" || fractionMinutes == "" || fractionPrice == ""){
    display_notify('Error', 'debe llenar todos los campos');
  }else{
    $.ajax({
      type: 'POST',
      url: "precios_parqueo.php",
      data: {
        action     : "update_parkingPrices",
        hourPrice  : hourPrice,
        fractionMinutes: fractionMinutes,
        fractionPrice  : fractionPrice
      },
      dataType: 'json',
      success: function(datax){
        display_notify(datax.status, datax.msg);
      },
      error: function(){
        display_notify('Error', 'Ocurrió un error en la respuesta del servidor');
      }
    });
  }
}