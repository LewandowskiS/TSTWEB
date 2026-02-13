<?php

header("Access-Control-Allow-Origin: http://localhost:8000");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Access-Control-Allow-Credentials: true");

// Handle preflight OPTIONS requests
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

include 'result2XML.php';



// CAMBIO 1: 'localhost' cambia a 'database' (el nombre del servicio en docker-compose)
// CAMBIO 2: La contraseña es vacía '' como pediste.
$con = mysqli_connect('database', 'root', 'root');

if (!$con) {
    // Es útil imprimir el error exacto para depurar si algo falla
    error_log("Error de conexión a MySQL: " . mysqli_connect_error()); 

    echo "Error: No se pudo conectar a MySQL." . PHP_EOL;
    echo "errno de depuración: " . mysqli_connect_errno() . PHP_EOL;
    echo "error de depuración: " . mysqli_connect_error() . PHP_EOL;
    exit;
}

// CAMBIO 3: Asegúrate de que este nombre coincida con MYSQL_DATABASE en tu docker-compose.yml
// En el ejemplo anterior usamos 'tstweb'. Si tu SQL crea 'baseDatos', cambia esto a 'baseDatos'.
mysqli_select_db($con, "baseDatos");

// El resto de tu lógica sigue igual...
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST["code"]) && ($group_id=$_POST["code"]) != "0" ){
    // Nota: Es recomendable escapar $group_id para evitar inyección SQL, 
    // pero para este ejercicio lo dejaremos así.
    $group_id = mysqli_real_escape_string($con, $group_id); 
    $sql="SELECT e.nombre, e.apellido, e.fecha_nacimiento, g.codigo, e.nota FROM estudiante e JOIN grupo g ON e.grp=g.id WHERE g.id=".$group_id.";";
} else {
    $sql="SELECT e.nombre, e.apellido, e.fecha_nacimiento, g.codigo, e.nota FROM estudiante e JOIN grupo g ON e.grp=g.id;";
}

$result = mysqli_query($con,$sql);

if($result){
    header('Content-Type: application/xml');
    echo result2XML($result,"estudiantes","estudiante");
} else {
    // Agregamos un manejo de error por si la consulta falla
    echo "Error en la consulta: " . mysqli_error($con);
}

mysqli_close($con);
?>