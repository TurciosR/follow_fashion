<?php
require('_core.php');
require('fpdf/fpdf.php');
error_reporting(E_ERROR | E_PARSE);
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
        $this->SetFont('latin', '', 9);

        $this->Cell(30, 5, utf8_decode("PROVEEDOR: ".$this->a), 0, 1, 'L', 0);
        $this->Ln(5);
        $this->Cell(30, 5, utf8_decode("CODIGO"), "B", 0, 'L', 0);
        $this->Cell(65, 5, utf8_decode("PRODUCTO"),"B", 0, 'L', 0);
        $this->Cell(30, 5, utf8_decode("PRESENTACIÓN"), "B", 0, 'L', 0);
        $this->Cell(30, 5, utf8_decode("DESCRIPCIÓN"), "B", 0, 'L', 0);
        $this->Cell(30, 5, utf8_decode("UBICACIÓN"), "B", 0, 'C', 0);
        $this->Cell(20, 5, utf8_decode("COSTO"), "B", 0, 'C', 0);
        $this->Cell(20, 5, utf8_decode("PRECIO"), "B", 0, 'C', 0);
        $this->Cell(25, 5, utf8_decode("EXISTENCIA"), "B", 0, 'C', 0);
        $this->Cell(20, 5, utf8_decode("TOTAL($)"), "B", 1, 'R', 0);

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
        $this->Cell(225, 10, utf8_decode('Página ').$this->PageNo().'/{nb}', 0, 0, 'R');
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

$pdf = new PDF('L', 'mm', 'letter');

$pdf->SetMargins(10, 10);
$pdf->SetLeftMargin(5);
$pdf->AliasNbPages();
$pdf->SetAutoPageBreak(true, 15);
$pdf->AliasNbPages();

$where_clause = "";

if(isset($_REQUEST['proveedor']))
{
  if(round($_REQUEST['proveedor'],2)>0)
  {
    $where_clause = " WHERE id_proveedor=$_REQUEST[proveedor] ";
  }
}
$sql_prov = _query("SELECT proveedor.id_proveedor,proveedor.nombre FROM proveedor  $where_clause  ORDER BY proveedor.nombre ASC");

$total_global=0;


while($row_p = _fetch_array($sql_prov))
{

  $sql_stock = _query("SELECT pr.id_producto,pr.descripcion, pr.barcode, c.nombre_cat as cat, SUM(su.stock) as cantidad
                       FROM producto AS pr
                       LEFT JOIN categoria AS c ON pr.id_categoria=c.id_categoria
                       JOIN stock AS su ON pr.id_producto=su.id_producto
                       WHERE su.stock>0 AND su.id_sucursal='$id_sucursal' AND pr.id_proveedor=$row_p[id_proveedor] GROUP BY su.id_producto ORDER BY pr.descripcion");
  $contar = _num_rows($sql_stock);
  if ($contar > 0) {
    $total_general = 0;
    $pdf->setear($row_p['nombre'],"","","","","","","");
    $pdf->AddPage();

      while ($row = _fetch_array($sql_stock)) {
          $id_producto = $row['id_producto'];
          $descripcion=$row["descripcion"];
          $cat = $row['cat'];
          $barcode = $row['barcode'];
          $existencias = $row['cantidad'];
          $estante='NO ASIGNADO';
          $posicion='';

          $sql_pres = _query("SELECT pp.*, p.nombre as descripcion_pr FROM presentacion_producto as pp, presentacion as p WHERE pp.id_presentacion=p.id_presentacion AND pp.id_producto='$id_producto' ORDER BY pp.unidad DESC");
          $npres = _num_rows($sql_pres);

          $exis = 0;

          $cp = 0;

          while ($rowb = _fetch_array($sql_pres)) {

              $unidad = $rowb["unidad"];
              $costo = $rowb["costo"];
              $precio = $rowb["precio"];
              $descripcion_pr = $rowb["descripcion"];
              $presentacion = $rowb["descripcion_pr"];
              if ($existencias >= $unidad) {
                  $exis = intdiv($existencias, $unidad);
                  $existencias = $existencias%$unidad;
              } else {
                  $exis =  0;
              }
              $total_costo = round(($costo) * $exis, 4);
              $total_general += $total_costo;

              if($cp==0)
              {
                $array_data = array(
                    array(utf8_decode($barcode),30,"L"),
                    array(utf8_decode($descripcion),65,"L"),
                    array(utf8_decode($presentacion),30,"L"),
                    array(utf8_decode($descripcion_pr),31,"L"),
                    array(utf8_decode("$estante"." "."$posicion"),30,"L"),
                    array(utf8_decode(number_format($costo, 2)),20,"R"),
                    array(utf8_decode(number_format($precio, 2)),20,"R"),
                    array(utf8_decode($exis),25,"R"),
                    array(utf8_decode(number_format($total_costo, 4)),20,"R"),
                  );
                  $pdf->LineWriteB($array_data);
              }
              else {
                $array_data = array(
                    array(utf8_decode(""),30,"L"),
                    array(utf8_decode(""),65,"L"),
                    array(utf8_decode($presentacion),30,"L"),
                    array(utf8_decode($descripcion_pr),31,"L"),
                    array(utf8_decode("$estante"." "."$posicion"),30,"L"),
                    array(utf8_decode(number_format($costo, 2)),20,"R"),
                    array(utf8_decode(number_format($precio, 2)),20,"R"),
                    array(utf8_decode($exis),25,"R"),
                    array(utf8_decode(number_format($total_costo, 4)),20,"R"),
                  );
                  $pdf->LineWriteB($array_data);
              }
              $cp++;

          }

          $pdf->Line(5,$pdf->GetY(),276,$pdf->GetY());
      }
      $pdf->Cell(245, 5, utf8_decode("TOTAL PROVEEDOR"), 0, 0, 'L', 0);

      $pdf->Cell(26, 5, utf8_decode("$".number_format($total_general, 4)), 0, 1, 'R', 0);
      $total_global = $total_global + $total_general;
  }
}

$pdf->Cell(245, 5, utf8_decode("TOTAL GENERAL"), 0, 0, 'L', 0);

$pdf->Cell(26, 5, utf8_decode("$".number_format($total_global, 4)), 0, 1, 'R', 0);

$pdf->Output("inventario_empresa_pdf.pdf", "I");
