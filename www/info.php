<?php
  echo "<h1>Productos (PHP ↔ PostgreSQL)</h1>";

$host = "192.168.56.11";   // IP de la VM db
$db   = "appdb";
$user = "appuser";
$pass = "appsecret";
$dsn  = "pgsql:host=$host;port=5432;dbname=$db;";

try {
  $pdo = new PDO($dsn, $user, $pass, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
  $q = $pdo->query("SELECT id, nombre, precio FROM productos ORDER BY id");
  echo "<table border='1' cellpadding='6'><tr><th>ID</th><th>Nombre</th><th>Precio</th></tr>";
  foreach ($q as $r) {
    echo "<tr><td>{$r['id']}</td><td>{$r['nombre']}</td><td>{$r['precio']}</td></tr>";
  }
  echo "</table>";
} catch (Exception $e) {
  http_response_code(500);
  echo "<h2>Error de conexión</h2><pre>".$e->getMessage()."</pre>";
}


?>
