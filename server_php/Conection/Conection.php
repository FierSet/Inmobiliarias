<?php
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: x-api-key, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
// Encabezado de contenido de acuerdo a lo que se va a devolver
header("Content-type: application/json; charset=utf-8");
// Permite solo el método POST para evitar errores
header("Access-Control-Allow-Methods: POST");
header("Allow: POST");

$host = "localhost:3306";
$user = "root";  
$pass = "";     
$db = "inmoviliaria";


$conexion = mysqli_connect( $host, $user, $pass, $db );
/*
if (!$conexion) {
    die("Connection failed: " . mysqli_connect_error());
}
else
{
    echo "Connected successfully";
    mysqli_close($conexion);
}
*/
?>