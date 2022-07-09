<?php
/**
 * This file is part of the OpenPyme1.
 * 
 * (c) Open Solution Systems <operaciones@tumundolaboral.com.sv>
 * 
 * For the full copyright and license information, please refere to LICENSE file
 * that has been distributed with this source code.
 */

// mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
// ini_set('display_errors', true);
// error_reporting( E_ERROR | E_PARSE );
require("_core.php");
require("num2letras.php");
require('fpdf/fpdf.php');


$pdf=new fPDF('P','mm', 'Letter');
$pdf->SetMargins(10,5);
$pdf->SetTopMargin(2);
$pdf->SetLeftMargin(10);
$pdf->AliasNbPages();
$pdf->SetAutoPageBreak(true,1);

$id_corte = $_REQUEST["id_corte"];
$sql_corte = _query("SELECT cc.*, u.nombre AS nombre_empleado, c.nombre AS nombre_caja
  FROM controlcaja as cc
  LEFT JOIN usuario as u ON cc.id_empleado = u.id_usuario
  LEFT JOIN caja as c ON cc.caja = c.id_caja
  WHERE cc.id_corte = '$id_corte'");
$cuenta = _num_rows($sql_corte);
if($cuenta > 0)
{
  $row = _fetch_array($sql_corte);
  $turno = $row["turno"];
  $total_cobro = $row["total_cobro"];
  $total_mora = $row["total_mora"];
  $vales = $row["vales"];
  $ingresos = $row["ingresos"];
  $id_apertura = $row["id_apertura"];
  $monto_apertura = $row["cashinicial"];
  $fecha_corte = $row["fecha_corte"];
  $hora_corte = $row["hora_corte"];
  $saldo_caja = $row["saldo_caja"];
  $faltante = $row["faltante"];
  $sobrante = $row["sobrante"];
  $nombre_empleado = $row["nombre_empleado"];
  $nombre_caja = $row["nombre_caja"];

  $totalt = $row["totalt"];
  $totalf = $row["totalf"];
  $totalcf = $row["totalcf"];

  $total_doc = number_format($totalt+$totalf+$totalcf, 2,'.','');

  $total_cm = $total_cobro + $total_mora;
  $total_mcaja = $ingresos - $vales;
}
$min = $_REQUEST["l"];
$fini = $fecha_corte;
$fin = ($_REQUEST["ffin"]);
$fini1 = $_REQUEST["fini"];
$fin1 = $_REQUEST["ffin"];

$title = "CORTE CAJA";
$empresa = "";
$titulo = "";
if($fini!="")
{
    list($a,$m,$d) = explode("-", $fini);

    $fech="AL $d DE ".meses($m)." DE $a";

}
$impress = "REPORTE DE COSTO UTILIDAD ".$fech;


$existenas = "";
if($min>0)
{
    $existenas = "CANTIDAD: $min";
}


class PDF extends FPDF
{
    var $a;
    var $b;
    var $c;
    var $d;
    var $e;
    var $f;
    // Cabecera de página\
    public function Header()
    {
      $this->SetFont('Arial','',12);

      $this->Cell(100,6,utf8_decode($this->a),0,0,'L');
      $this->MultiCell(100,6,$this->d,0,'R',0);
    }

    public function Footer()
    {
      // Posición: a 1,5 cm del final
      $this->SetY(-15);
      // Arial italic 8
      $this->SetFont('Arial', 'I', 8);
      // Número de página requiere $pdf->AliasNbPages();
      //utf8_decode() de php que convierte nuestros caracteres a ISO-8859-1
      $this-> Cell(40, 10, utf8_decode('Fecha de impresión: '.date('Y-m-d')), 0, 0, 'L');
      $this->Cell(160, 10, utf8_decode('Página ').$this->PageNo().'/{nb}', 0, 0, 'R');
    }
    public function setear($a,$b,$c,$d)
    {
      # code...
      $this->a=$a;
      $this->b=$b;
      $this->c=$c;
      $this->d=$d;
    }
}

$pdf=new PDF('P','mm', 'Letter');
$pdf->setear($title,$empresa,$titulo,$fech);
$pdf->SetMargins(10,5);
$pdf->SetTopMargin(8);
$pdf->SetLeftMargin(8);
$pdf->AliasNbPages();
$pdf->SetAutoPageBreak(true,20);
$pdf->AddPage();

$pdf->SetFont('Arial','',10);
$pdf->Cell(20,5,"",0,1,'C',0);
//$pdf->SetXY($set_x, $set_y);
$pdf->Cell(20,5,utf8_decode("TURNO N° ".$turno),0,1,'L',0);
//$pdf->SetXY($set_x+20,$set_y);
$pdf->Cell(77,5,utf8_decode("CAJERO: ".Mayu($nombre_empleado)),0,1,'L',0);

$pdf->Cell(20,5,"",0,1,'C',0);
//$pdf->SetXY($set_x, $set_y);
$pdf->Cell(200,5,utf8_decode("DOCUMENTOS"),0,1,'C',0);
$set_x = $pdf->GetX();
$set_y = $pdf->GetY();

$pdf->Line($set_x,$set_y,$set_x+200,$set_y);
$pdf->Cell(150,5,utf8_decode("TIQUETE"),0,0,'L',0);
$pdf->Cell(50,5,number_format($totalt, 2, '.', ','),0,1,'R',0);

$pdf->Line($set_x,$set_y,$set_x+200,$set_y);
$pdf->Cell(150,5,utf8_decode("FACTURA"),0,0,'L',0);
$pdf->Cell(50,5,number_format($totalf, 2, '.', ','),0,1,'R',0);

$pdf->Line($set_x,$set_y,$set_x+200,$set_y);
$pdf->Cell(150,5,utf8_decode("CREDITO FISCAL"),0,0,'L',0);
$pdf->Cell(50,5,number_format($totalcf, 2, '.', ','),0,1,'R',0);

$set_x = $pdf->GetX();
$set_y = $pdf->GetY();
$pdf->Line($set_x,$set_y,$set_x+200,$set_y);
$pdf->Cell(150,5,utf8_decode("TOTAL"),0,0,'L',0);
$pdf->Cell(50,5,number_format($total_doc, 2, '.', ','),0,1,'R',0);

$pdf->Cell(20,5,"",0,1,'C',0);
$pdf->Cell(200,5,utf8_decode("COBROS CREDITO"),0,1,'C',0);
$set_x = $pdf->GetX();
$set_y = $pdf->GetY();

$pdf->Line($set_x,$set_y,$set_x+200,$set_y);
$pdf->Cell(150,5,utf8_decode("CLIENTE"),0,0,'L',0);
$pdf->Cell(50,5,"MONTO",0,1,'R',0);

$set_x = $pdf->GetX();
$set_y = $pdf->GetY();
$pdf->Line($set_x,$set_y,$set_x+200,$set_y);

$sql_cuenta = _query("SELECT mc.*, f.numero_doc, f.id_cliente, f.nombre AS nombre_f, c.nombre AS nombre_c
  FROM mov_caja AS mc
  join abono_credito on abono_credito.id_abono_credito = mc.idtransace
  join credito on credito.id_credito = abono_credito.id_credito
  JOIN factura AS f ON credito.id_factura = f.id_factura
  JOIN cliente AS c ON f.id_cliente = c.id_cliente
  WHERE mc.id_apertura = '$id_apertura' AND mc.numero_doc != ''");
$cuenta_cuenta = _num_rows($sql_cuenta);
$total_cobros = 0;
if($cuenta_cuenta > 0)
{
  while ($row_cuenta = _fetch_array($sql_cuenta))
  {
    $monto = $row_cuenta["valor"];
    $entrada = $row_cuenta["entrada"];
    $salida = $row_cuenta["salida"];
    $numero_doc = $row_cuenta['numero_doc'];
    $idtransace = $row_cuenta['idtransace'];
    $nombre_c = $row_cuenta['nombre_c'];
    $nombre_f = $row_cuenta['nombre_f'];

    if($nombre_c == "")
    {
      $nombre_text = $nombre_f;
    }
    else
    {
        $nombre_text = $nombre_c;
    }

    $pdf->Line($set_x,$set_y,$set_x+200,$set_y);
    $pdf->Cell(150,5,utf8_decode($nombre_text),0,0,'L',0);
    $pdf->Cell(50,5,number_format($monto, 2, '.', ','),0,1,'R',0);

    $total_cobros += $monto;
  }
  $set_x = $pdf->GetX();
  $set_y = $pdf->GetY();
  $pdf->Line($set_x,$set_y,$set_x+200,$set_y);
  $pdf->Line($set_x,$set_y,$set_x+200,$set_y);
  $pdf->Cell(150,5,utf8_decode("TOTAL"),0,0,'L',0);
  $pdf->Cell(50,5,number_format($total_cobros, 2, '.', ','),0,1,'R',0);
}

//////////////////////MOVIMIENTO caja
$pdf->Cell(20,5,"",0,1,'C',0);
//$pdf->SetXY($set_x, $set_y);
$pdf->Cell(200,5,utf8_decode("MOVIMIENTOS DE CAJA"),0,1,'C',0);
$set_x = $pdf->GetX();
$set_y = $pdf->GetY();
$pdf->Line($set_x,$set_y,$set_x+200,$set_y);
$pdf->Cell(150,5,utf8_decode("INGRESOS"),0,0,'L',0);
$pdf->Cell(50,5,number_format($ingresos, 2, '.', ','),0,1,'R',0);

$pdf->Cell(150,5,utf8_decode("VALES"),0,0,'L',0);
$pdf->Cell(50,5,number_format($vales, 2, '.', ','),0,1,'R',0);
$set_x = $pdf->GetX();
$set_y = $pdf->GetY();
$pdf->Line($set_x,$set_y,$set_x+200,$set_y);
$pdf->Cell(150,5,utf8_decode("TOTAL"),0,0,'L',0);
$pdf->Cell(50,5,number_format($total_mcaja, 2, '.', ','),0,1,'R',0);


/////////////////Saldo caja

$pdf->Cell(20,5,"",0,1,'C',0);
//$pdf->SetXY($set_x, $set_y);
$pdf->Cell(200,5,utf8_decode("SALDO CAJA"),0,1,'C',0);
$set_x = $pdf->GetX();
$set_y = $pdf->GetY();
$pdf->Line($set_x,$set_y,$set_x+200,$set_y);
$pdf->Cell(150,5,utf8_decode("APERTURA DE CAJA"),0,0,'L',0);
$pdf->Cell(50,5,number_format($monto_apertura, 2, '.', ','),0,1,'R',0);

$pdf->Cell(150,5,utf8_decode("INGRESOS DEL DIA"),0,0,'L',0);
$pdf->Cell(50,5,number_format($total_doc, 2, '.', ','),0,1,'R',0);

$pdf->Cell(150,5,utf8_decode("COBROS CREDITO"),0,0,'L',0);
$pdf->Cell(50,5,number_format($total_cobros, 2, '.', ','),0,1,'R',0);


$pdf->Cell(150,5,utf8_decode("SALDO CAJA"),0,0,'L',0);
$pdf->Cell(50,5,number_format($total_mcaja, 2, '.', ','),0,1,'R',0);

$set_x = $pdf->GetX();
$set_y = $pdf->GetY();
$pdf->Line($set_x,$set_y,$set_x+200,$set_y);

$general = $monto_apertura + $total_doc + $total_mcaja + $total_cobros;
$pdf->Cell(150,5,utf8_decode("TOTAL"),0,0,'L',0);
$pdf->Cell(50,5,number_format($general, 2, '.', ','),0,1,'R',0);

ob_clean();
$pdf->Output("reporte_corte_caja.pdf","I");
