<?php
require_once '../Conection/Conection.php';


if (!$conexion) {
    die("Connection failed: " . mysqli_connect_error());
}
else
{
    echo "Connected successfully";
    mysqli_close($conexion);
}

?>
