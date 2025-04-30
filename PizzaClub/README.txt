🍕 PizzaClub Database

Este sistema está diseñado para gestionar las operaciones de una cadena de pizzerías, con características como clientes, empleados, pedidos, productos y sucursales. A continuación, encontrarás una descripción detallada de la estructura y funcionamiento de la base de datos.


🎯 Objetivo

Te han contratado para diseñar una web que permita hacer pedidos de comida a domicilio por Internet.

Ten en cuenta las siguientes indicaciones para modelar cómo sería la base de datos del proyecto:
Para cada cliente/a almacenamos un identificador único:
Nombre.
Apellidos.
Dirección.
Código postal.
Localidad.
Provincia.
Número de teléfono.
Los datos de localidad y provincia estarán almacenados en tablas separadas. Sabemos que una localidad pertenece a una única provincia, y que una provincia puede tener muchas localidades. Para cada localidad almacenamos un identificador único y un nombre. Para cada provincia almacenamos un identificador único y un nombre.

Una persona puede realizar muchos pedidos, pero un único pedido sólo puede ser realizado por una única persona. De cada pedido se almacena un identificador único:
Fecha/hora.
Si el pedido es para reparto a domicilio o para recoger en tienda.
La cantidad de productos que se han seleccionado de cada tipo.
El precio total.

Un pedido puede constar de uno o varios productos.


Los productos pueden ser pizzas, hamburguesas y bebidas. De cada producto se almacena un identificador único:
Nombre.
Descripción.
Imagen.
Precio.

En el caso de las pizzas existen varias categorías que pueden ir cambiando de nombre a lo largo del año. Una pizza solo puede estar dentro de una categoría, pero una categoría puede tener muchas pizzas.


De cada categoría se almacena un identificador único y un nombre. Un pedido es gestionado por una única tienda y una tienda puede gestionar muchos pedidos. De cada tienda se almacena un identificador único:
Dirección.
Código postal.
Localidad.
Provincia.


En una tienda pueden trabajar muchos empleados/as y un empleado/a solo puede trabajar en una tienda. De cada empleado/a, se almacena un identificador único:
Nombre.
Apellidos.
NIF.
Teléfono.
Si trabaja como cocinero/a o repartidor/a. Para los pedidos de reparto a domicilio interesa guardar quién es el repartidor/a que hace la entrega del pedido y la fecha/hora del momento de la entrega.


📂 Estructura de la Base de Datos

La base de datos de **PizzaClub** está compuesta por las siguientes tablas principales:

1. **Clientes (`client`)** 👤  
   Registra información básica de los clientes, incluyendo datos de contacto y ubicación.

2. **Empleados (`employees`)** 👔  
   Contiene información del personal, como nombre, rol y sucursal asignada.

3. **Productos (`product`)** 🍕  
   Registro de los productos disponibles, incluyendo nombre, tipo, descripción, precio y categoría.

4. **Pedidos (`order`)** 🛍️  
   Registro de pedidos realizados, con detalles sobre el cliente, sucursal, empleado asignado, productos y precios.

5. **Detalles de Pedido (`order_details`)** 📄  
   Especifica los productos incluidos en cada pedido y sus cantidades.

6. **Sucursales (`store`)** 🏢  
   Información sobre las sucursales, incluyendo ubicación y vecindario.

7. **Provincias y Vecindarios (`province`, `vecinity`)** 📍  
   Tablas de referencia para gestionar la localización geográfica de clientes y sucursales.



🛠️ Relaciones entre Tablas

La base de datos utiliza claves foráneas para mantener la integridad de los datos. A continuación, se describen las relaciones principales:

- Un **cliente** puede realizar múltiples **pedidos**.
- Cada **pedido** está asociado a un **cliente**, un **empleado**, una **sucursal** y uno o más **productos**.
- Cada **producto** pertenece a una **categoría** y puede estar en múltiples **pedidos**.
- Una **sucursal** está ubicada en un **vecindario**, que a su vez pertenece a una **provincia**.
- Cada **empleado** está asignado a una **sucursal** específica.



🌟 Características Destacadas

- **Gestión Integral:** Permite registrar clientes, empleados, productos, pedidos y sucursales en un solo sistema.
- **Ubicación Geográfica:** Uso de provincias y vecindarios para una mejor organización de clientes y sucursales.
- **Detalles Precisos:** Registro detallado de cada pedido, incluyendo productos y cantidades.



📊 Diagrama Relacional

Un ejemplo visual de las relaciones principales:  


[Client] <--> [Order] <--> [Order_Details] <--> [Product]
         |           |
      [Store]      [Employees]
         |
   [Vecinity] <--> [Province]




🛠 Herramientas Utilizadas

- **MySQL Workbench 8.0**: Utilizado para modelar la base de datos y ejecutar consultas.
- **SQL Scripts**: Scripts utilizados para crear y consultar la base de datos de manera eficiente.



🚀 Cómo Usar

1. Instala [MySQL Workbench 8.0](https://dev.mysql.com/downloads/workbench/).
2. Carga los scripts SQL proporcionados para la creación de la base de datos.
3. Ejecuta las consultas para validar el diseño y explorar las funcionalidades.
