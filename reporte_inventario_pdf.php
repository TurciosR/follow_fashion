<?php
require('_core.php');
require('fpdf/fpdf.php');

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

    //Encabezado General
    $this->SetFont('Arial', '', 14);
    if($this->PageNo()==1)
    {
      $this->MultiCell(280, 6, $this->a, 0, 'C', 0);
      $this->SetFont('Arial', '', 10);
      $this->Cell(280, 6, utf8_decode($this->b), 0, 1, 'C');
      $this->Cell(280, 6, utf8_decode($this->c." ".$this->d), 0, 1, 'C');
    }
    $this->SetFont('Arial', '', 10);
    $this->Cell(25, 5, utf8_decode("CODIGO"), "B", 0, 'L', 0);
    $this->Cell(95, 5, utf8_decode("PRODUCTO"), "B", 0, 'L', 0);
    $this->Cell(35, 5, utf8_decode("PRESENTACIÓN"), "B", 0, 'L', 0);
    $this->Cell(35, 5, utf8_decode("DESCRIPCIÓN"), "B", 0, 'L', 0);
    $this->Cell(15, 5, utf8_decode("COSTO"), "B", 0, 'C', 0);
    $this->Cell(15, 5, utf8_decode("PRECIO"), "B", 0, 'C', 0);
    $this->Cell(25, 5, utf8_decode("EXISTENCIA"), "B", 0, 'C', 0);
    $this->Cell(20, 5, utf8_decode("TOTAL($)"), "B", 1, 'R', 0);

    $this->SetFont('Arial', '', 8);
  }

  public function Footer()
  {
    $this->SetY(-15);
    $this->SetFont('Arial', 'I', 8);
    $this-> Cell(40, 10, utf8_decode('Fecha de impresión: '.date('Y-m-d')), 0, 0, 'L');
    $this->Cell(220, 10, utf8_decode('Página ').$this->PageNo().'/{nb}', 0,0, 'R');
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
        //$abajo="LR";
        $abajo=0;
        if ($i==0) {
          // code...
          //$abajo="TLR";
        }
        if ($j==$total_columnas-1) {
          // code...
          $salto=1;
        }
        if ($i==$total_lineas-1) {
          // code...
          $abajo="B";
        }
        if ($i==$total_lineas-1&&$i==0) {
          // code...
          $abajo="B";
        }

        $abajo=0;
        $str = $data[$j]["valor"][$i];
        $this->Cell($data[$j]["size"][$i],4,$str,$abajo,$salto,$data[$j]["aling"][$i]);
      }

    }
  }
}

$id_sucursal = $_SESSION["id_sucursal"];
$sql_empresa = "SELECT * FROM sucursal WHERE id_sucursal='$id_sucursal'";
$resultado_emp=_query($sql_empresa);
$row_emp=_fetch_array($resultado_emp);
$nombre_a = utf8_decode(Mayu((trim($row_emp["descripcion"]))));
//$direccion = Mayu(utf8_decode($row_emp["direccion_empresa"]));
$direccion = utf8_decode(Mayu((trim($row_emp["direccion"]))));

$logo = "img/62b1ee1c1c090_follow_logo.png";

$title = $nombre_a;
$fech = date("d/m/Y");
$titulo = "REPORTE DE INVENTARIO";

$impress = "REPORTE DE INVENTARIO ".$fech;

$id_ubicacion=0;
$ubicacion= "GENERAL";
$where="";
if(isset($_REQUEST['id_ubicacion']))
{
  if(round($_REQUEST['id_ubicacion'],2)!=0)
  {
    $id_ubicacion=$_REQUEST['id_ubicacion'];
    $where = " AND su.id_ubicacion=$id_ubicacion ";
    $sql_ubi = _query("SELECT * FROM ubicacion where id_ubicacion=$id_ubicacion");
    while ($row_u = _fetch_array($sql_ubi)) {
      $ubicacion=$row_u['descripcion'];
      $where = " AND su.id_ubicacion=$id_ubicacion ";
    }
  }
}

$pdf = new PDF('L', 'mm', 'letter');
$pdf->setear($nombre_a,$direccion,$titulo,$ubicacion,"","","","");
$pdf->SetMargins(10, 10);
$pdf->SetLeftMargin(5);
$pdf->AliasNbPages();
$pdf->SetAutoPageBreak(true, 15);
$pdf->AliasNbPages();
$pdf->AddPage();

$sql_lab=_query("SELECT DISTINCT producto.id_proveedor,proveedor.nombre FROM producto LEFT JOIN proveedor ON producto.id_proveedor=proveedor.id_proveedor ORDER BY nombre ASC ");
$total_general = 0;
$gt=0;
while ($rlab = _fetch_array($sql_lab)) {
  // code...
  $sql_stock = _query("SELECT pr.id_producto,pr.descripcion, pr.barcode, c.nombre_cat as cat, SUM(su.cantidad) as cantidad
  FROM producto AS pr
  LEFT JOIN categoria AS c ON pr.id_categoria=c.id_categoria
  JOIN stock_ubicacion AS su ON pr.id_producto=su.id_producto
  WHERE su.id_sucursal='$id_sucursal' $where AND id_proveedor=$rlab[id_proveedor] GROUP BY su.id_producto ORDER BY pr.descripcion");

  $contar = _num_rows($sql_stock);
  if ($contar > 0) {
      $pdf->Ln(2);
      if($gt==0)
      {
        $gt=1;
      }
      else {
        $pdf->AddPage();
      }
      if ($rlab['nombre']=="")
      {
        $rlab['nombre']="NO DEFINIDO";
      }
    $array_data = array(
      array(utf8_decode("PROVEEDOR: ".$rlab['nombre']),265,"C"),
    );
    $pdf->LineWriteB($array_data);

    $pdf->Line(5,$pdf->GetY(),270,$pdf->GetY());
    $pdf->ln(1);
    $pdf->Line(5,$pdf->GetY(),270,$pdf->GetY());
    $pdf->ln(1);
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
      $jj=0;
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
        $total_general = $total_general + $total_costo;

        if ($jj==0)
        {
          $array_data = array(
            array(utf8_decode($barcode),25,"L"),
            array(utf8_decode($descripcion),95,"L"),
            array(utf8_decode($presentacion),35,"L"),
            array(utf8_decode($descripcion_pr),35,"L"),
            array(utf8_decode(number_format($costo, 2)),15,"R"),
            array(utf8_decode(number_format($precio, 2)),15,"R"),
            array(utf8_decode($exis),25,"R"),
            array(utf8_decode(number_format($total_costo, 4)),20,"R"),
          );
          $pdf->LineWriteB($array_data);

        }
        else {
          $array_data = array(
            array(utf8_decode(""),25,"L"),
            array(utf8_decode(""),95,"L"),
            array(utf8_decode($presentacion),35,"L"),
            array(utf8_decode($descripcion_pr),35,"L"),
            array(utf8_decode(number_format($costo, 2)),15,"R"),
            array(utf8_decode(number_format($precio, 2)),15,"R"),
            array(utf8_decode($exis),25,"R"),
            array(utf8_decode(number_format($total_costo, 4)),20,"R"),
          );
          $pdf->LineWriteB($array_data);
        }
        $jj++;
      }
      $pdf->Line(5,$pdf->GetY(),270,$pdf->GetY());
    }
  }
}

$pdf->Cell(240, 5, utf8_decode("TOTAL"), 0, 0, 'L', 0);
$pdf->Cell(25, 5, utf8_decode("$ ".number_format($total_general, 4)), 0, 0, 'R', 0);
$pdf->Output("reporte_inventario.pdf", "I");
