<?php
require_once '../Conection/Conection.php';

$datos = array();

$rutine_local = "Call inmoviliariarando();";

$resultado_local = mysqli_query($conexion, $rutine_local);
$filas_local = mysqli_num_rows($resultado_local);

while($row = mysqli_fetch_object($resultado_local))
{
    //echo json_encode($row);
    $datos[] = $row;
}

if($filas_local)
    echo json_encode($datos);
else
    echo ("No data");

mysqli_close($conexion);
?>