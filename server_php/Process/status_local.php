<?php

require_once '../Conection/Conection.php';

$datos = array();

$rutine_status = "Call statuslist();";
$rutine_tipo = "Call tipolista();";

$resultadostatus = mysqli_query($conexion, $rutine_status);
while(mysqli_next_result(($conexion))){;} 
$filasstatus = mysqli_num_rows($resultadostatus);

$resultadotipo = mysqli_query($conexion, $rutine_tipo);
while(mysqli_next_result(($conexion))){;} 
$filastipo = mysqli_num_rows($resultadotipo);

while($row = mysqli_fetch_object($resultadostatus))
{
    $datos[] = $row;
}

while($row = mysqli_fetch_object($resultadotipo))
{
    $datos[] = $row;
}


if($filasstatus and $filastipo)
    echo json_encode($datos);
else
    echo ("No data");

mysqli_close($conexion);
?>

