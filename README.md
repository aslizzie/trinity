### Hub de libros - Trinity

#### Diana Lizeth Alcala Sandoval

Para este sprint, creé un hub de entretenimiento al cual llamé "trinity" que cuenta con un catálogo de libros, los usuarios que accedan al hub podrán ver un listado de los libros con su respectiva información, también cuenta con funcionalidades como: agregar un nuevo libro, borrar un libro, realizar búsquedas de libros, además de poder agregar un libro a favoritos y también eliminarlo de favoritos.

---

##### Requerimientos técnicos

El proyecto está realizado con Angular 12, también hice uso de Bootstrap y CSS puro, además para este nuevo sprint utilice MySQL para mi base de datos y Node JS junto con Express para mi API.

---

##### Uso del proyecto

Para poder hacer uso del proyecto, es necesario tener instalado NodeJs y Angular (en este caso, la versión 12).
Primero se debe de instalar NodeJs, para instalarlo se puede hacer desde la terminal o bien con un instalador. Como mencioné anteriormente, el proyecto lo desarrollé con Angular 12 por lo tanto debemos instalar NodeJs en su versión 14 o una versión menor a la 16, en mi caso instalé la versión 14.17.6, a continuación adjunto el enlace directo para descargarlo: [NodeJs 14.17.6](https://nodejs.org/en/blog/release/v14.17.6).

NodeJs también nos instalará NPM, como manejador de paquetes, en este caso la versión requerida es la 6.

Después de tener instalado lo anterior, podemos instalar Angular, para esto hay que abrir una terminal y ejecutamos el siguiente comando:
`npm install -g @angular/cli@12`

Luego de esto, es necesario clonar el proyecto en nuestro servidor local con el comando:
`git clone https://github.com/aslizzie/angular-wave.git`

De nuevo haciendo uso de la terminal, nos colocamos en la carpeta del proyecto que acabamos de clonar y ejecutamos el siguiente comando, el cual descargará las dependencias o librerias necesarias para el proyecto:
`npm install`

Una vez que el proyecto este instalado, es necesario instalar y configurar la API para el correcto funcionamiento del proyecto. Para hacer esto, primero hay que clonar el proyecto que contiene la API con el siguiente comando:
`git clone https://github.com/aslizzie/api-wave.git`

(Como recomendación, recomiendo clonar el proyecto que contiene la API en una carpeta diferente a donde se encuentra el proyecto de Angular)

Luego de clonarlo, nos colocamos en la carpeta del proyecto que acabamos de clonar y ejecutamos el siguiente comando, que de igual manera nos descargará las dependencias o librerías que son necesarias para que la API funcione:
`npm install`

Ahora lo que necesitamos es crear la base de datos de donde nuestra API obtendrá los datos, para esto cree una archivo contenido en donde se encuentra un script cargado con información, este archivo se encuentra dentro de la carpeta dump de nuestra API:

![Markdown logo](/documentation/dump_sql.png)

O bien, también se puede obtener en el siguiente enlace:
[https://drive.google.com/file/d/1weVa6KEhJP296Y8cm4GDoI2ly3lYdygF/view?usp=sharing](https://drive.google.com/file/d/1weVa6KEhJP296Y8cm4GDoI2ly3lYdygF/view?usp=sharing).

Despues de crear nuestra base de datos con sus datos correspondientes, es necesario configurar la API, así que en el archivo db.js que se encuentra en la carpeta config dentro de src vamos a configurarla con los datos que corresponden a nuestro servidor local, en este caso se pide el host, user, password y el nombre de la base de datos.

![Markdown logo](/documentation/db_config.png)

Como ultimos pasos y para que nuestro proyecto funcione correctamente necesitamos correr nuestra API con el comando:
`npm run dev`

Y en nuestro proyecto de Angular vamos a ejecutar el comando:
`ng serve`

Y listo! Nuestro proyecto estará funcional!

---

##### Proyecto

A continuación, se muestran capturas de pantalla del proyecto y una breve explicación de lo que se presenta en cada captura.

###### Vista - Movies

![Markdown logo](/documentation/movies.png)
En esta captura se muestra la vista con el listado de películas.

###### Vista - Movie

![Markdown logo](/documentation/movie.png)
En esta captura se muestra la vista con la información de un elemente en específico.

###### Vista - Series

![Markdown logo](/documentation/series.png)
En esta captura se muestra la vista con el listado de series.

###### Vista - Series

![Markdown logo](/documentation/serie.png)
En esta captura se muestra la vista con la información de un elemente en específico.

---

##### Proceso para realizar el proyecto

Para llevar a cabo este sprint lo primero que realice fue el diseño y la normalización de mi base de datos, el diagrama se muestra a continuación:
![Markdown logo](/documentation/bd-diagrama.drawio.png)

Luego de hacer el diagrama comencé con la creación de mi base de datos en SQL usando un sistema de gestión de base de datos. Despues estuve leyendo documentación para realizar mi API con Node JS y Express, una vez que entendí un poco esta parte comencé con el desarrollo de la API igualmente durante el desarrollo estuve consultando la documentación para entender mejor lo que estaba haciendo. Finalmente hice la integración de mi API con el front-end de mi proyecto en Angular.

---

##### Sprint review

| ¿Qué salió bien?                                                                                                                                                                                                           | ¿Qué puedo hacer diferente?                                                                                                                                                                                                                                                                                                                                               | ¿Qué no salió bien?                                                                                                                                                                                                                                                 |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Lo que considero que salió bien fue que logré crear mi API y que mi proyecto en Angular pudiera obtener la información de esa API de manera eficiente lo que significa que mi proyecto ya maneja datos de manera dinámica. | Lo que considero que podría hacer diferente es seguir leyendo documentación para continuar aprendiendo sobre Angular, ya que al momento de querer realizar la autenticación del usuario mediante el uso de la API y la base de datos tuve ciertos problemas, así que para el próximo sprint espero completar ese modulo y agregar más funcionalidades que tengo en mente. | Lo que considero que no salió bien en este sprint es que no pude completar del todo los requisitos que se pidieron en el backlog porque aún no entiendo del todo como funciona Angular y las API´s, también siento que aún me cuesta un poco gestionar mis tiempos. |
