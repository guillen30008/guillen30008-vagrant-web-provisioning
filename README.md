# Taller Vagrant + Provisionamiento con Shell- Nicolas Rojas Cabal- 2226088

## Pasos de instalación
# 1. proceso para levantar las maquinas:
vagrant up web.

vagrant up db.

# 2.IPs usadas:
Web → 192.168.56.10.

DB → 192.168.56.11.

# 3.Navegador:
http://192.168.56.10 → index.html

http://192.168.56.10/info.php → conexión PHP ↔ PostgreSQL

<img width="446" height="302" alt="image" src="https://github.com/user-attachments/assets/5ea0868a-a28b-4e7d-86ad-665f1a08f0c4" />

<img width="656" height="340" alt="image" src="https://github.com/user-attachments/assets/3fc5da22-e6bd-4256-9450-365e73459879" />

# 4. Scripts utilizados:
provision-web.sh: instala Apache, PHP y php-pgsql, y copia el contenido de www/ a /var/www/html.

provision-db.sh: instala PostgreSQL, crea el usuario appuser, la base appdb, y una tabla productos con datos de ejemplo.
