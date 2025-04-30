👓 Optica Database

Este sistema está diseñado para gestionar las operaciones de una óptica, con características como clientes, empleados, proveedores, ventas y productos (monturas y lentes). A continuación, encontrarás una descripción detallada de la estructura y funcionamiento de la base de datos.



🎯 Objetivo

Una óptica, llamada "Cul d'Ampolla", quiere informatizar la gestión de los clientes/as y ventas de gafas.

En primer lugar, la óptica quiere saber cuál es el proveedor de cada una de las gafas. En concreto quiere saber de cada proveedor:
El nombre
La dirección (calle, número, piso, puerta, ciudad, código postal y país)
Teléfono
Fax
NIF.

La política de compras de la óptica se basa en que las gafas de una marca se comprarán a un único proveedor (así podrá sacar más buenos precios), pero pueden comprar gafas de varias marcas a un proveedor. De las gafas quiere saber:
La marca.
La graduación de cada uno de los cristales.
El tipo de montura (flotante, pasta o metálica).
El color de la montura.
El color de cada vidrio.
El precio.

De los clientes/as quiere almacenar:
El nombre.
La dirección postal.
El teléfono.
El correo electrónico.
La fecha de registro.
Cuando llega un/a cliente/a nuevo, almacenar el/la cliente/a que le ha recomendado el establecimiento (siempre que alguien le haya recomendado).
Nuestro sistema deberá indicar quién ha sido el empleado/a que ha vendido cada gafa.

📂 Estructura de la Base de Datos

La base de datos de **Optica** está compuesta por las siguientes tablas principales:

1. **Clientes (`clients`)** 👤  
   Registra información básica de los clientes, incluyendo datos de contacto y referencias.

2. **Empleados (`employees`)** 👔  
   Contiene información de los empleados y sus ventas asociadas.

3. **Monturas (`frames`)** 🕶️  
   Información detallada sobre las monturas, incluyendo tipo, color, precio y receta.

4. **Proveedores (`providers`)** 🚚  
   Detalles de los proveedores que suministran productos a la óptica.

5. **Ventas (`sales`)** 💸  
   Registra las transacciones realizadas, vinculando clientes, empleados y productos.



🛠️ Relaciones entre Tablas

La base de datos utiliza claves foráneas para garantizar la consistencia de los datos. A continuación, las relaciones principales:

- Un **cliente** puede ser referido por otro cliente.
- Un **empleado** puede realizar múltiples **ventas**.
- Cada **venta** está asociada a un **cliente**, un **empleado** y, opcionalmente, a una **montura**.
- Una **montura** está vinculada a un **proveedor**.



🌟 Características Destacadas

- **Integridad de Datos:** Uso extensivo de claves foráneas para mantener consistencia en las relaciones.
- **Gestión de Ventas:** Registro detallado de las transacciones, incluyendo información de clientes y productos.
- **Trazabilidad de Productos:** Cada montura está asociada a un proveedor específico.



📊 Diagrama Relacional

Un ejemplo visual de las relaciones principales:  


[Clients] <--> [Sales] <--> [Employees]
       |            |
 [Frames] <-- [Providers]




🛠 Herramientas Utilizadas

- **MySQL Workbench 8.0**: Utilizado para modelar la base de datos y ejecutar consultas.
- **SQL Scripts**: Scripts utilizados para la creación y consulta de la base de datos.



🚀 Como Usar

1. Instala [MySQL Workbench 8.0](https://dev.mysql.com/downloads/workbench/).
2. Carga los scripts SQL proporcionados para la creación de la base de datos.
3. Ejecuta las consultas para validar el diseño y explorar las funcionalidades.

