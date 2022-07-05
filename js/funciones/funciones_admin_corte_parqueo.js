/**
 * This file is part of the OpenPyme1.
 * 
 * (c) Open Solution Systems <operaciones@tumundolaboral.com.sv>
 * 
 * For the full copyright and license information, please refere to LICENSE file
 * that has been distributed with this source code.
 */
//================== <Event Listeners> ====================//
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

$(document).on('click', '[data-btn-anular=""]', function (){
  cancelParking(this);
});

//================== </Event Listeners> ====================//

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
      url: "admin_cortes_parqueo_dt.php",
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

function reprintCourt(id_corte){
    
  $.ajax({
    type : "POST",
    url : "admin_cortes_parqueo.php",
    data : {
      action   : "reprintCourt",
      id_corte : id_corte
    },
    dataType : 'json',
    success : function(datos) {
      let sist_ope = datos.sist_ope;
      let dir_print=datos.dir_print;
      let tipo_impresion= datos.tipo_impresion;
      let shared_printer_win=datos.shared_printer_win;
      let shared_printer_pos=datos.shared_printer_pos;
      let headers=datos.headers;
      let footers=datos.footers;
      //esta opcion es para generar recibo en  printer local y validar si es win o linux
      // alert(tipo_impresion+"--"+sist_ope)
      console.log(datos);
      
      if (tipo_impresion == 'TIK') {
        if (sist_ope == 'win') {
          $.post("http://"+dir_print+"printcorte1.php", {
            datosvale: datos.facturar,
            efectivo: 0,
            cambio: 0,
            shared_printer_pos:shared_printer_pos,
            headers:headers,
            footers:footers,

          })
        } else {
          $.post("http://"+dir_print+"printcorte1.php", {
            datosvale: datos.facturar,
            efectivo: 0,
            cambio: 0,
            headers:headers,
            footers:footers,
          }, function(data, status) {

            if (status != 'success') {
              //alert("No Se envio la impresión " + data);
            }

          });
        }
      }//Fin para impresion
    }
  });
}