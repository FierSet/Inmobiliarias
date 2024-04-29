<?php

require_once '../Conection/Conection.php';

$data = json_decode(file_get_contents('php://input'), true);

$celular = $data['celular'];
$email = $data['email'];
$whatsapp = $data['whatsapp'];
$facebook = $data['facebook'];
$instagram = $data['instagram'];
$estado = $data['estado'];
$colonia = $data['colonia'];
$Ciudad = $data['Ciudad'];
$calle = $data['calle'];
$no_local = $data['no_local'];
$logo = $data['logo'];
$sub_logo = $data['sub_logo'];
$titulo = $data['titulo'];
$desripcion = $data['desripcion'];

$rutine_local = 
"Call updatecontacts( 
'$celular', 
'$email', 
'$whatsapp', 
'$facebook', 
'$instagram',
'$estado',
'$colonia',
'$Ciudad',
'$calle',
'$no_local',
'$logo',
'$sub_logo',
'$titulo',
'$desripcion');";

$resultado_local = mysqli_query($conexion, $rutine_local);
$filas_local = mysqli_num_rows($resultado_local);
//
if($filas_local)
    echo ('error');
else
    echo ('complete');

mysqli_close($conexion);


?>