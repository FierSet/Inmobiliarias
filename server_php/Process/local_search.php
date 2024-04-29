<?php
require_once '../Conection/Conection.php';


$data = json_decode(file_get_contents('php://input'), true);

$ID = $data['ID'];

$rutine_local = "Call getcasalocal($ID);";

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
    echo ("No found");

mysqli_close($conexion);

?>