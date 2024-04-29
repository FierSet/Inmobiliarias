<?php

require_once '../Conection/Conection.php';

$data = json_decode(file_get_contents('php://input'), true);

$resultado_listones = "Call listones();";

$resultado_listones = mysqli_query($conexion, $resultado_listones);
$filas_local = mysqli_num_rows($resultado_listones);

while($row = mysqli_fetch_object($resultado_listones))
{
    //echo json_encode($row);
    $datos[] = $row;
}

if($filas_local)
    echo json_encode($datos);
else
    echo ('No se encontraron resultados');

mysqli_close($conexion);
