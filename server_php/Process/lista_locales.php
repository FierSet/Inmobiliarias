<?php
require_once '../Conection/Conection.php';

$max_database = $_GET['maxdatabase'];

$leng = $_GET['leng'];
$current = $_GET['current'];
$tipo_propiedad = $_GET['tipo_propiedad'];
$status_loca = $_GET['status_loca'];



if($max_database == "get" )
    $lista = "Call getstatuslocal('$status_loca', '$tipo_propiedad', $leng, $current);"; 
else
    $lista = "Call getlengs('$status_loca', '$tipo_propiedad');"; 

$resultado_local = mysqli_query($conexion, $lista);
$filas_local = mysqli_num_rows($resultado_local);

while($row = mysqli_fetch_object($resultado_local))
{
    //echo json_encode($row);
    $datos[] = $row;
}

if($filas_local)
    echo json_encode($datos);
else
{
    $datos[] = "No data";
    echo json_encode($datos);
}
mysqli_close($conexion);

/*

INSERT INTO immoviliaria (tipo_propiedad, status_local, calle, Codigo_postal, ciudad, Region, pais, recamaras, banos, estacionamientos, area, precio, Imagen1,Imagen2, Imagen3, fechainicio, fechadeactualizacion, fechatermino)
SELECT tipo_propiedad, status_local, calle, Codigo_postal, ciudad, Region, pais, recamaras, banos, estacionamientos, area, precio, Imagen1,Imagen2, Imagen3, fechainicio, fechadeactualizacion, fechatermino FROM immoviliaria;

*/

?>