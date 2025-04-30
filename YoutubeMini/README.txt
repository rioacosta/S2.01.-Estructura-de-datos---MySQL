📺 YouTubeMini Database

Este sistema está diseñado para gestionar una aplicación de video similar a YouTube, con características como canales, videos, comentarios, reacciones, listas de reproducción, y mucho más. A continuación, encontrarás una descripción de su estructura y funcionamiento.


🎯 Objetivo

Trataremos de hacer un modelo sencillo de cómo sería la base de datos para una versión reducida de YouTube.

De cada usuario/a guardamos un identificador único:
Email.
Password.
Nombre de usuario/a.
Fecha de nacimiento.
Sexo.
País.
Código postal.


Un usuario/a publica vídeos. De cada vídeo guardamos un identificador único:
Un título.
Una descripción.
Un tamaño.
El nombre del archivo de vídeo.
Duración del vídeo.
Un thumbnail.
El número de reproducciones.
El número de likes.
El número de dislikes.

Un vídeo puede tener tres estados diferentes: público, oculto y privado. Un vídeo puede tener muchas etiquetas. Una etiqueta se identifica por un identificador único y un nombre de etiqueta. Interesa guardar quién es el usuario/a que publica el vídeo y en qué fecha/hora lo hace.


Un usuario/a puede crear un canal. Un canal tiene un identificador único:
Un nombre.
Una descripción.
Una fecha de creación.


Un usuario/a se puede suscribir a los canales de otros usuarios/as. Un usuario/a puede darle un like o un dislike a un vídeo una única vez. Habrá que llevar un registro de los usuarios/as que le han dado like y dislike a un determinado vídeo y en qué fecha/hora lo hicieron.


Un usuario/a puede crear playlists con los vídeos que le gustan. Cada playlist tiene un identificador único:
Un nombre.
Una fecha de creación.
Un estado que indica que puede ser pública o privada.


Un usuario/a puede escribir comentarios en un vídeo determinado. Cada comentario está identificado por un identificador único:
El texto del comentario.
La fecha/hora en la que se realizó.


Un usuario/a puede marcar un comentario como me gusta o no me gusta. Habrá que llevar un registro de los usuarios/as que han marcado un comentario como me gusta/no me gusta, y en qué fecha/hora lo hicieron.


📂 Estructura de la Base de Datos

La base de datos **YouTubeMini** está compuesta por las siguientes tablas principales:

1. **Usuarios (`user`)** 👤  
   Registra la información básica de los usuarios, como su correo electrónico, nombre de usuario y datos demográficos.

2. **Canales (`channel`)** 📡  
   Permite a los usuarios crear canales con descripciones y fechas de creación.

3. **Videos (`video`)** 🎥  
   Contiene información de los videos subidos, incluyendo título, descripción, duración, y metadatos como vistas, likes y dislikes.

4. **Comentarios (`comment`)** 💬  
   Los usuarios pueden comentar en videos. Esta tabla almacena el texto del comentario, fecha y hora.

5. **Reacciones a Comentarios (`commentreaction`)** 👍👎  
   Los usuarios pueden reaccionar a comentarios con "Like" o "Dislike".

6. **Listas de Reproducción (`playlist`)** 📃  
   Los usuarios pueden crear listas de reproducción públicas o privadas, que contienen videos.

7. **Suscripciones (`subscription`)** 🔔  
   Los usuarios pueden suscribirse a canales.

8. **Etiquetas (`tag`)** 🏷️  
   Los videos pueden estar etiquetados para una mejor clasificación.

9. **Reacciones a Videos (`videoreaction`)** 😃😡  
   Similar a las reacciones a comentarios, pero aplicadas a videos.

10. **Relación Video-Etiqueta (`videotag`)** 🔗  
    Relaciona videos con etiquetas específicas.

11. **Relación Lista de Reproducción-Video (`playlistvideo`)** 🔄  
    Asocia videos a listas de reproducción.


🛠️ Relaciones entre Tablas

La base de datos utiliza claves foráneas para mantener la integridad referencial. A continuación, se describen las relaciones más importantes:

- Un **usuario** puede tener múltiples **canales**, **videos**, **comentarios** y **listas de reproducción**.
- Un **canal** pertenece a un solo **usuario**.
- Un **video** pertenece a un solo **usuario** y puede estar en varias **listas de reproducción**.
- Los **comentarios** están asociados a un **video** y un **usuario**.
- Los **tags** pueden ser asignados a múltiples **videos**.
- Las **suscripciones** conectan a un **usuario** con un **canal**.


🌟 Características Destacadas

- **Integridad de Datos:** Uso extensivo de claves foráneas para garantizar consistencia.
- **Privacidad:** Videos y listas de reproducción pueden ser públicas o privadas.
- **Personalización:** Los usuarios pueden crear canales, listas de reproducción y etiquetar videos.


### Diagramas de Relaciones principales:  

[User] --> [Channel]
[User] --> [Video] --> [Comment]
[User] --> [Playlist] <--> [Video]
[Video] <--> [Tag]


🛠 Herramientas Utilizadas
-MySQL Workbench 8.0 - Se utilizó para el modelado de bases de datos y la ejecución de consultas.
-SQL Scripts - Se utilizó para crear y consultar la base de datos de manera eficiente.

🚀 Cómo Usar.
1. Instale MySQL Workbench 8.0.
2. Importe los scripts SQL.
3. Ejecutar las consultas para validar el diseño.