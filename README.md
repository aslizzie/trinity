### Hub de libros - Trinity

#### Diana Lizeth Alcala Sandoval

Para este sprint, creé un hub de entretenimiento al cual llamé "trinity" que cuenta con un catálogo de libros, los usuarios que accedan al hub podrán ver un listado de los libros con su respectiva información, también cuenta con funcionalidades como: agregar un nuevo libro, borrar un libro, realizar búsquedas de libros, además de poder agregar un libro a favoritos y también eliminarlo de favoritos.

---

##### Requerimientos técnicos

El proyecto está realizado con Visual Basic 6 y además cuenta con una base de datos SQL.

---

##### Uso del proyecto

Para poder hacer uso del proyecto es necesario descargar el proyecto en nuestro equipo local o bien, clonarlo con el siguiente comando:

`https://github.com/aslizzie/trinity.git`

Después es necesario crear la base de datos que utilizará nuestro proyecto, para ello he adjunto un archivo SQL llamado "dump.sql" en la carpeta dump.

![Markdown logo](/documentation/dump-sql.png)

---

##### Proyecto

A continuación, se muestran capturas de pantalla del proyecto y una breve explicación de lo que se presenta en cada captura.

###### Vista de login

![Markdown logo](/documentation/login.png)
En esta captura se muestra el login del proyecto.

###### Vista principal para rol de admin

![Markdown logo](/documentation/main-admin.png)
En esta captura se muestra la vista principal del administrador donde se puede ver que tiene diferentes funcionalidades como buscar, agregar y eliminar un libro.

###### Vista para agregar un libro

![Markdown logo](/documentation/main-add-book.png)
En esta captura se muestra la vista donde se pueden agregar libros.

###### Mensaje después de agregar un libro

![Markdown logo](/documentation/main-add-book-message.png)
En esta captura se muestra el mensaje que le aparece al usuario después de agregar un libro nuevo.

###### Mensaje para eliminar un libro

![Markdown logo](/documentation/main-delete-book-message.png)
En esta captura se muestra el mensaje que le aparece al usuario antes de eliminar un libro.

###### Mensaje después eliminar un libro

![Markdown logo](/documentation/main-deleted-book-message.png)
En esta captura se muestra el mensaje que le aparece al usuario después de eliminar un libro.

###### Búsqueda de un libro

![Markdown logo](/documentation/main-search.png)
En esta captura se muestra el resultado de una búsqueda de un libro.

###### Vista principal para rol de usuario normal

![Markdown logo](/documentation/user-main.png)
En esta captura se muestra la vista principal de un usuario normal donde se puede ver que tiene diferentes funcionalidades como agregar un libro a favoritos, ver todos los favoritos del usuario y también buscar un libro.

###### Vista principal para rol de usuario normal

![Markdown logo](/documentation/user-search-fav.png)
En esta captura se muestra el resultado de una búsqueda de un libro.

###### Búsqueda de un libro

![Markdown logo](/documentation/user-search-fav.png)
En esta captura se muestra el resultado de una búsqueda de un libro.

###### Vista de favoritos de un usuario

![Markdown logo](/documentation/user-favorites.png)
En esta captura se muestra la vista de los favoritos de un usuario.

###### Mensaje para eliminar un libro de favoritos

![Markdown logo](/documentation/user-delete-book-message.png)
En esta captura se muestra el mensaje que le aparece al usuario antes de eliminar un libro de favoritos.

###### Mensaje después de eliminar un libro de favoritos

![Markdown logo](/documentation/user-deleted-book-message.png)
En esta captura se muestra el mensaje que le aparece al usuario después de eliminar un libro de favoritos.

---

##### Proceso para realizar el proyecto

Para llevar a cabo este sprint lo primero que realice fue el diseño y la normalización de mi base de datos, el diagrama se muestra a continuación:
![Markdown logo](/documentation/trinity.png)

Luego de hacer el diagrama comencé con la creación de mi base de datos en SQL usando un sistema de gestión de base de datos. Despues estuve leyendo documentación comencé con el desarrollo de mi proyecto.

---

##### Sprint review

| ¿Qué salió bien?                                                                                                                            | ¿Qué puedo hacer diferente?                                                                                                                                                                                                    | ¿Qué no salió bien?                                                                                                                                                                            |
| ------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Lo que considero que salió bien fue que logré realizar las funcionalidades básicas del proyecto con una interfaz agradable para el usuario. | Lo que considero que podría hacer diferente es seguir leyendo documentación para continuar aprendiendo sobre Visual Basic 6 para poder generar una mejorar interfaz para el usuario, además de incluir funcionalidades extras. | Lo que considero que no salió bien en este sprint es que no pude completar del todo los requisitos que se pidieron en el backlog porque aún no entiendo del todo como funciona Visual Basic 6. |
