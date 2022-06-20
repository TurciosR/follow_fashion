<?php
require('_core.php');
require('fpdf/fpdf.php');
//error_reporting(E_ERROR | E_PARSE);
$params="";

$id_sucursal = $_SESSION["id_sucursal"];

class PDF extends FPDF
{
    var $a;
    var $b;
    var $c;
    var $d;
    var $e;
    var $f;
    var $w;
    // Cabecera de página\
    public function Header()
    {
        $this->AddFont('latin','','latin.php');
        $this->SetFont('latin', '', 10);

        $set_y=$this->GetY();
        $set_x=$this->GetX();
        $this->SetXY($set_x, $set_y);
        $this->AddFont('latin','','latin.php');
        $this->SetFont('latin', '', 8);

        $this->Cell(205, 5, utf8_decode("REPORTE DE VENTAS POR CLIENTE DESDE EL ".$this->a." HASTA EL ".$this->b), "B", 1, 'L', 0);
        $this->Ln(5);

        $array_data = array(
            array(mb_strtoupper($this->c),205,"L"),
          );
        $this->LineWriteB($array_data);

        $this->Ln(5);

        $array_data = array(
            array("FECHA",20,"C"),
            array("HORA",20,"C"),
            array("TIPO DOC",20,"C"),
            array("NUM",10,"C"),
            array("NOMBRE",50,"L"),
            array("DIRECCCION",60,"L"),
            array("TOTAL",25,"R"),
          );
        $this->LineWriteB($array_data);

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
        $this->Cell(165, 10, utf8_decode('Página ').$this->PageNo().'/{nb}', 0, 0, 'R');
    }
    public function setear($a,$b,$c,$d,$e,$f,$g,$w)
    {
      # code...
      $this->a=$a;
      $this->b=$b;
      $this->c=$c;
      $this->d=$d;
      $this->e=$e;
      $this->f=$f;
      $this->g=$g;
      $this->w=$w;
    }

    public function LineWriteB($array)
    {
      $ygg=0;
      $maxlines=1;
      $array_a_retornar=array();
      $array_max= array();
      foreach ($array as $key => $value) {
        // /Descripcion/
        $nombr=$value[0];
        // /fpdf width/
        $size=$value[1];
        // /fpdf alignt/
        $aling=$value[2];
        $jk=0;
        $w = $size;
        $h  = 0;
        $txt=$nombr;
        $border=0;
        if(!isset($this->CurrentFont))
          $this->Error('No font has been set');
        $cw = &$this->CurrentFont['cw'];
        if($w==0)
          $w = $this->w-$this->rMargin-$this->x;
        $wmax = ($w-2*$this->cMargin)*1000/$this->FontSize;
        $s = str_replace("\r",'',$txt);
        $nb = strlen($s);
        if($nb>0 && $s[$nb-1]=="\n")
          $nb--;
        $b = 1;

        $sep = -1;
        $i = 0;
        $j = 0;
        $l = 0;
        $ns = 0;
        $nl = 1;
        while($i<$nb)
        {
          // Get next character
          $c = $s[$i];
          if($c=="\n")
          {
            $array_a_retornar[$ygg]["valor"][]=substr($s,$j,$i-$j);
            $array_a_retornar[$ygg]["size"][]=$size;
            $array_a_retornar[$ygg]["aling"][]=$aling;
            $jk++;

            $i++;
            $sep = -1;
            $j = $i;
            $l = 0;
            $ns = 0;
            $nl++;
            if($border && $nl==2)
              $b = $b2;
            continue;
          }
          if($c==' ')
          {
            $sep = $i;
            $ls = $l;
            $ns++;
          }
          $l += $cw[$c];
          if($l>$wmax)
          {
            // Automatic line break
            if($sep==-1)
            {
              if($i==$j)
                $i++;
              $array_a_retornar[$ygg]["valor"][]=substr($s,$j,$i-$j);
              $array_a_retornar[$ygg]["size"][]=$size;
              $array_a_retornar[$ygg]["aling"][]=$aling;
              $jk++;
            }
            else
            {
              $array_a_retornar[$ygg]["valor"][]=substr($s,$j,$sep-$j);
              $array_a_retornar[$ygg]["size"][]=$size;
              $array_a_retornar[$ygg]["aling"][]=$aling;
              $jk++;

              $i = $sep+1;
            }
            $sep = -1;
            $j = $i;
            $l = 0;
            $ns = 0;
            $nl++;
            if($border && $nl==2)
              $b = $b2;
          }
          else
            $i++;
        }
        // Last chunk
        if($this->ws>0)
        {
          $this->ws = 0;
        }
        if($border && strpos($border,'B')!==false)
          $b .= 'B';
        $array_a_retornar[$ygg]["valor"][]=substr($s,$j,$i-$j);
        $array_a_retornar[$ygg]["size"][]=$size;
        $array_a_retornar[$ygg]["aling"][]=$aling;
        $jk++;
        $ygg++;
        if ($jk>$maxlines) {
          // code...
          $maxlines=$jk;
        }
      }

      $ygg=0;
      foreach($array_a_retornar as $keys)
      {
        for ($i=count($keys["valor"]); $i <$maxlines ; $i++) {
          // code...
          $array_a_retornar[$ygg]["valor"][]="";
          $array_a_retornar[$ygg]["size"][]=$array_a_retornar[$ygg]["size"][0];
          $array_a_retornar[$ygg]["aling"][]=$array_a_retornar[$ygg]["aling"][0];
        }
        $ygg++;
      }



      $data=$array_a_retornar;
      $total_lineas=count($data[0]["valor"]);
      $total_columnas=count($data);

      for ($i=0; $i < $total_lineas; $i++) {
        // code...
        for ($j=0; $j < $total_columnas; $j++) {
          // code...
          $salto=0;
          $abajo="LR";
          if ($i==0) {
            // code...
            $abajo="TLR";
          }
          if ($j==$total_columnas-1) {
            // code...
            $salto=1;
          }
          if ($i==$total_lineas-1) {
            // code...
            $abajo="BLR";
          }
          if ($i==$total_lineas-1&&$i==0) {
            // code...
            $abajo="1";
          }
          // if ($j==0) {
          //   // code...
          //   $abajo="0";
          // }
          $abajo=0;

          $str = $data[$j]["valor"][$i];
          $this->Cell($data[$j]["size"][$i],4,$str,$abajo,$salto,$data[$j]["aling"][$i]);
        }

      }
    }
}

$pdf = new PDF('P', 'mm', 'letter');

$pdf->SetMargins(10, 10);
$pdf->SetLeftMargin(5);
$pdf->AliasNbPages();
$pdf->SetAutoPageBreak(true, 15);
$pdf->AliasNbPages();

$fini = $_REQUEST['fini'];
$fin = $_REQUEST['fin'];


$sql_clientes = _query("SELECT DISTINCT factura.id_cliente,cliente.nombre,cliente.direccion,cliente.referencia FROM factura left join cliente ON factura.id_cliente=cliente.id_cliente WHERE tipo_documento!='DEV' AND tipo_documento!='NC' AND fecha between '$fini' AND '$fin' " );

$total_general = 0;
while ($row = _fetch_array($sql_clientes)) {
  // code...
  $pdf->setear(ED($fini),ED($fin),utf8_decode($row['nombre']).". ".utf8_decode($row["referencia"]),"","","","","");

  $pdf->AddPage();

  $total_cliente = 0;

  $pdf->Line(5,$pdf->GetY(),210,$pdf->GetY());
  $sql_factura = _query("SELECT factura.fecha,factura.hora,factura.tipo_documento,factura.num_fact_impresa, factura.nombre,factura.direccion,factura.total FROM factura WHERE  tipo_documento!='DEV' AND tipo_documento!='NC' AND factura.id_cliente=$row[id_cliente] AND fecha between '$fini' AND '$fin' ");

  while ($row2 = _fetch_array($sql_factura) )
  {
    if($row2["tipo_documento"]=="TIK")
    {
      $row2['nombre'] = $row['nombre'];
      $row2['direccion'] = $row['direccion'];
    }
    $array_data = array(
        array(ED($row2['fecha']),20,"C"),
        array(hora($row2['hora']),20,"R"),
        array($row2['tipo_documento'],20,"C"),
        array($row2['num_fact_impresa'],10,"C"),
        array(utf8_decode(mb_strtoupper($row2['nombre'])),50,"L"),
        array(utf8_decode(mb_strtoupper($row2['direccion'])),60,"L"),
        array(number_format($row2['total'],2),25,"R"),
      );
    $pdf->LineWriteB($array_data);
    $total_cliente = $total_cliente + $row2['total'];
  }


  $pdf->Line(5,$pdf->GetY(),210,$pdf->GetY());
  $array_data = array(
      array("TOTAL CLIENTE",180,"C"),
      array(number_format($total_cliente,2),25,"R"),
    );
  $pdf->LineWriteB($array_data);
  $total_general = $total_general + $total_cliente;


}

  $pdf->Line(5,$pdf->GetY(),210,$pdf->GetY());
$array_data = array(
    array("TOTAL GENERAL",180,"C"),
    array(number_format($total_general,2),25,"R"),
  );
$pdf->LineWriteB($array_data);

$pdf->Output("venta_cliente_pdf.pdf", "I");
