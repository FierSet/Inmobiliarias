<?php

require_once '../Conection/Conection.php';

$data = json_decode(file_get_contents('php://input'), true);

//print_r ($data);

$query = "Call actualizarcasalocal(
    {$data['ID']},
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
    );";

$subirlocal = mysqli_query($conexion, $query);

echo ('hecho');


mysqli_close($conexion);

?>