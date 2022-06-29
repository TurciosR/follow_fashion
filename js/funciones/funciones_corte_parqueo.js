/**
 * This file is part of the OpenPyme1.
 * 
 * (c) Open Solution Systems <operaciones@tumundolaboral.com.sv>
 * 
 * For the full copyright and license information, please refere to LICENSE file
 * that has been distributed with this source code.
 */
//================== <Event Listeners> ====================//
 $(document).on('keyup change', '#efectivo_caja', function (){
  calculateDiff();
});
$(document).on('click', '#initCorte', function (){
  initCorte();
});

//================== </Event Listeners> ====================//

function calculateDiff(){
  let totalCorte = parseFloat($('#total_corte').text());
  let efectivo   = parseFloat($('#efectivo_caja').val());
  let diff       = 0;

  totalCorte = ((isNaN(totalCorte)) ? 0.00 : totalCorte);
  efectivo   = ((isNaN(efectivo))   ? 0.00 : efectivo);
  if(efectivo<0){
    efectivo=0;
    $('#efectivo_caja').val('0');
  }

  diff = (efectivo-totalCorte);
  console.log(diff);

  //Si es menor, a cero, hay sobrante. si es mayor, es faltante.
  if(diff > 0){
    $('#diffChar').removeClass('text-danger');
    $('#diffChar').addClass('text-success');

  }else if(diff < 0){
    $('#diffChar').removeClass('text-success');
    $('#diffChar').addClass('text-danger');
  }else{
    $('#diffChar').removeClass('text-success');
    $('#diffChar').removeClass('text-danger');
  }

  $('#diferencia').text(diff.toFixed(2));
}

function initCorte(){
  let efectivo   = $('#efectivo_caja').val();
  let diff       = $('#diferencia').text();
  if(efectivo != ""){
    swal({
      title: "Confirme para guardar el corte",
      text: "",
      type: "warning",
      showCancelButton: true,
      cancelButtonText: "Cancelar",
      confirmButtonColor: "#DD6B55",
      confirmButtonText: "Confirmar",
      closeOnConfirm: false },
      
      function(isConfirm){
        if(isConfirm == true){
          $.ajax({
            type: 'POST',
            url: "corte_parqueo.php",
            data: {
              action   : "courtParking",
              efectivo : efectivo,
              diff     : diff 
            },
            dataType: 'json',
            success: function(datax){
              if(datax.status.toLowerCase() == 'success'){
                reprintCourt(datax.id_corte_parqueo);
                display_notify(datax.status,datax.msg);
                setTimeout(function(){
                  window.location.href = "admin_cortes_parqueo.php";
                }, 1000)
              }else{
                swal(datax.msg, "", datax.status);
              }
              
            },
            error: function(datax){
              swal(
                "No se pudo guardar el corte",
                "El servidor ha retornado un error.",
                "error"
              );
            }
          });
        }
      });
  }else{
    swal("Debe ingresar un monto de efectivo en caja", "", "warning");
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