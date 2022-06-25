/**
 * This file is part of the OpenPyme1.
 * 
 * (c) Open Solution Systems <operaciones@tumundolaboral.com.sv>
 * 
 * For the full copyright and license information, please refere to LICENSE file
 * that has been distributed with this source code.
 */

$(document).ready(function (){
  if(!$('#bodyMainTable') === 'undefined'){
    loadTable();
  }
});

$(document).on('click', '#btn_reloadTable', function (){
    loadTable();
});

dataTable = $('#editable2').DataTable().destroy();
  $('#editable2').DataTable({
    "pageLength": 50,
    "serverSide": true,
    "order": [[0, "asc"]],
    "ajax": {
      url: "cuentas_por_pagar_dt.php?fechai="+fechai+"&fechaf="+fechaf,
      type: 'POST',
      //dataType: 'JSON',
      data:{
      }
    },
    "language": {
      "sProcessing": "Procesando...",
      "sLengthMenu": "Mostrar _MENU_ registros",
      "sZeroRecords": "No se encontraron resultados",
      "sEmptyTable": "Ningún dato disponible en esta tabla",
      "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
      "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
      "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
      "sInfoPostFix": "",
      "sSearch": "Buscar:",
      "sUrl": "",
      "sInfoThousands": ",",
      "sLoadingRecords": "Cargando...",
      "oPaginate": {
        "sFirst": "Primero",
        "sLast": "Último",
        "sNext": "Siguiente",
        "sPrevious": "Anterior"
      },
      "oAria": {
        "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
        "sSortDescending": ": Activar para ordenar la columna de manera descendente"
      }
    }
  }); // End of DataTable


function loadTable(){
  
  let fechaInicio = $('#fechaInicio').val();
  let fechaFin    = $('#fechaFin').val();

  let bodyMainTable = $('#bodyMainTable');
  $(bodyMainTable).html('');

  $.ajax({
    type: "POST", 
    url: 'admin_parqueo.php',
    data: {
      action  : "loadTable",
      fInicio : fechaInicio,
      fFin    : fechaFin
    },
    dataType:"json",
    success: function(response){
      if(response.length == 0){
        row = '<tr><td>No se encontraron datos para mostrar</td></tr>';
        $(bodyMainTable).append(row);
      }else{

        $('#editable2').DataTable({
          pageLength: 50,
          serverSide: true,
          order: [[0, "asc"]],
          ajax: {
            url: "cuentas_por_pagar_dt.php?fechai="+fechai+"&fechaf="+fechaf,
            type: 'POST',
            //dataType: 'JSON',
            data:{ }
          },
        }); // End of DataTable
        
        //Queda pendiente arreglar este desvergue

        response.forEach(element => {
          row = "";
          row += '<tr>';
          row += '<td>'+element.id_parqueo+'</td>';
          row += '<td>'+element.fecha+'</td>';
          row += '<td>'+element.numero_doc+'</td>';
          row += '<td>'+element.placa+'</td>';
          row += '<td>'+element.entrada+'</td>';
          row += '<td>'+element.salida+'</td>';
          row += '<td>'+element.total_cobro+'</td>';
          $(bodyMainTable).append(row);
        });



      }


        $(bodyMainTable).append( response );
    },
    error: function(xhr){
      row = '<tr><td>No se encontraron datos...</td></tr>';
      $(bodyMainTable).append(row);
    }
  });

}