# FoodTrack DB

Proyecto de diseño de base de datos para gestionar operaciones de foodtrucks en distintos puntos de una ciudad.

El objetivo es construir un esquema relacional que permita organizar la información de los foodtrucks, sus productos, las ubicaciones donde operan y los pedidos realizados por los clientes.

## Descripción del modelo

El modelo está compuesto por cinco tablas principales:

- **Foodtruck**  
Guarda la información de cada foodtruck, como nombre, tipo de cocina y ciudad.

- **Productos**  
Contiene los productos que ofrece cada foodtruck, incluyendo su precio y stock disponible.  
Cada producto pertenece a un foodtruck.

- **Locacion**  
Registra las ubicaciones y fechas en las que opera cada foodtruck.

- **Ordenes**  
Almacena los pedidos realizados, incluyendo fecha, estado y total.  
Cada orden está asociada a un foodtruck.

- **Detalle_Ordenes**  
Relaciona las órdenes con los productos.  
Cada fila representa un producto dentro de una orden y la cantidad solicitada.

## Relaciones principales

- Un foodtruck puede tener muchos productos.  
- Un foodtruck puede tener muchas ubicaciones.  
- Un foodtruck puede tener muchas órdenes.  
- Una orden puede tener varios productos a través de la tabla Detalle_Ordenes.  
- Un producto puede aparecer en múltiples órdenes.

## Implementación

El esquema fue implementado en Microsoft SQL Server y ejecutado mediante DBeaver como cliente.

El archivo `scripts/create_tables.sql` contiene todas las instrucciones necesarias para crear las tablas y sus relaciones.

## Versionado

El proyecto se encuentra versionado con Git y alojado en GitHub, permitiendo llevar un seguimiento de los cambios realizados en el diseño de la base de datos.

## Modificacion de los .CSV

Se eliminaron las columnas ID de los archivos CSV ya que en la base de datos las claves primarias están definidas como IDENTITY (autoincrementales).
Esto permite evitar conflictos durante la carga de datos y asegura que SQL Server genere los identificadores automáticamente.

## Orden de carga de datos

Debido a las relaciones entre tablas (claves foráneas), los archivos CSV deben importarse en el siguiente orden:

1- Foodtruck
2- Productos
3- Locacion
4- Ordenes
5- Detalle_Ordenes

Esto garantiza que las tablas que contienen claves foráneas encuentren previamente los registros necesarios en las tablas padre.