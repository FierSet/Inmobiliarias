<?php

require_once '../Conection/Conection.php';

$data = json_decode(file_get_contents('php://input'), true);

if ($data['borrar'] == 'borrar') 
{
    $borrar = "Call borrarliston({$data['ID']});";

    $resultado_borrar = mysqli_query($conexion, $borrar);
    while (mysqli_next_result(($conexion))) {;}

    echo ('Borrado con exito');
} 
else if($data['borrar'] == 'noborrar')
{

    if ($data['ID']) 
    {

        $rutine_update = "Call updatelistones( 
            {$data['ID']},
            {$data['tipo']}, 
        '{$data['titulo1']}', 
        '{$data['descrip1']}', 
        '{$data['titulo2']}', 
        '{$data['descrip2']}',
        '{$data['titulo3']}',
        '{$data['descrip3']}',
        '{$data['Imagen']}'
        );";

        $resultado_update = mysqli_query($conexion, $rutine_update);
        while (mysqli_next_result(($conexion))) {;}

        echo('Actualizacion completada.');
    }
    else
    {
        $createliston = "Call createliston(
            {$data['tipo']}, 
        '{$data['titulo1']}', 
        '{$data['descrip1']}', 
        '{$data['titulo2']}', 
        '{$data['descrip2']}',
        '{$data['titulo3']}',
        '{$data['descrip3']}',
        '{$data['Imagen']}'
        );";

        $resultado_createliston = mysqli_query($conexion, $createliston);


        echo('Creacion completada.');
    }

}

mysqli_close($conexion);

?>