<?php
require_once '../Conection/Conection.php';

$data = json_decode(file_get_contents('php://input'), true);

$key = $data['key'];

$rutine_llave = "Call checarllave('$key');";

$rutine_llave = mysqli_query($conexion, $rutine_llave);
$filas_local = mysqli_num_rows($rutine_llave);

while($row = mysqli_fetch_object($rutine_llave))
{
    //echo json_encode($row);
    $datos[] = $row;
}

if($filas_local)
    echo ('Access accept');
else
    echo ('Access denied');

mysqli_close($conexion);

?>