<?php

require_once '../Conection/Conection.php';

$data = json_decode(file_get_contents('php://input'), true);

$searchbasedata = "
    '{$data['tipo_propiedad']}',
    '{$data['status_local']}',
    '{$data['calle']}',
    {$data['Codigo_postal']},
    '{$data['ciudad']}',
    '{$data['Region']}',
    '{$data['pais']}',
    {$data['recamaras']},
    {$data['banos']},
    {$data['estacionamientos']},
    {$data['area']},
    {$data['precio']},
    '{$data['desripcion']}',
    '{$data['Imagen1']}',
    '{$data['Imagen2']}',
    '{$data['Imagen3']}'
    ";

$basedata = "
    '{$data['tipo_propiedad']}',
    '{$data['status_local']}',
    '{$data['calle']}',
    {$data['Codigo_postal']},
    '{$data['ciudad']}',
    '{$data['Region']}',
    '{$data['pais']}',
    {$data['recamaras']},
    {$data['banos']},
    {$data['estacionamientos']},
    {$data['area']},
    {$data['precio']},
    '{$data['desripcion']}',
    '{$data['Imagen1']}',
    '{$data['Imagen2']}',
    '{$data['Imagen3']}',
    '{$data['fechainicio']}',
    '{$data['fechadeactualizacion']}',
    '{$data['fechatermino']}'
    ";

$searchcreate = "Call searchcreation($searchbasedata);";
$searquery = mysqli_query($conexion, $searchcreate); 
while(mysqli_next_result(($conexion))){;} //resuelve el elrror de sinceonizacion y poder usar mas consultas
$filas_local = mysqli_num_rows($searquery);

if ($filas_local) 
{
    $datos = array();
    while ($row = mysqli_fetch_object($searquery)) 
    {
        $datos[] = $row;
    }

    $Earray = $datos[0];

    echo ("El elemento ya existente con ID: " . $Earray->ID);

} 
else 
{
    $query = "Call crearcasalocal($basedata);";
    //echo ($query);
    $subirlocal = mysqli_query($conexion, $query);
    while(mysqli_next_result(($conexion))){;}
    
    $searchcreate = "Call searchcreation($searchbasedata);";
    $searquery = mysqli_query($conexion, $searchcreate);
    while(mysqli_next_result(($conexion))){;} 
    $filas_local = mysqli_num_rows($searquery);

    $datos = array();
    while ($row = mysqli_fetch_object($searquery)) 
    {
        $datos[] = $row;
    }
    echo ("creado con Exito. Puedes buscarlo con este ID: ". $datos[0] -> ID);
}

mysqli_close($conexion);