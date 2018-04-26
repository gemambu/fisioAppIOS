# Proyecto Final 
# V KeepCoding Startup Engineering Master
## Proyecto: FisioApp
### Equipo: Project X

## Sinposis
Aplicación móvil pensada para cualquier trabajador autónomo que ofrezca un servicio a domicilio.

La aplicación permite la gestión de las citas que pueda tener el profesional, así como la publicación de productos y/o servicios.

## Tecnologías
- XCode
- Swift


## Librerías externas
- [Alamofire](https://github.com/Alamofire/Alamofire) - Gestión de peticiones HTTP
- [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON) - Manejo de JSON

## Instalación

### Verificar el nombre/IP de tu servicor backend.

El nombre `localhost` no funciona. Por esta razón, debes cambiar el nombre / IP de tus servidores en el fichero:
tuCarpeta/Utils/Paths.swift

Puedes ver un ejemplo aquí:

```
// FIXME: Cambiar ip
// Server
let DEBUG_HTTP_SERVER = "http://your.amazing.ip.here:3000"
let RELEASE_HTTP_SERVER = "http://fisioapp.styleapps.es"
```

Si cambias las rutas de los endpoints, debes cambiar también este fichero.

## Implementación

La aplicación actualmente sólo puede ser usada con el dispositivo en modo 'portrait'.

## Cache

Por el momento, la aplicación necesita conexión con la red para poder acceder y gestionar los datos.

## Citas
- Esta pantalla cuenta de dos secciones:
- Calendario, para una fácil visualización del mes y selección de una fecha en concreto.
- Listado, donde se mostrarán las citas que el profesional pueda tener para la fecha seleccionada.  
Si para dicha fecha no tuviese ninguna cita concertada, el listado se mostrará vacío.

## Detalle Cita
- Al tocar una cita en el listado de citas, se navegará hacia una pantalla donde se muestra un detalle de la misma.
- Los campos mostrados son:
- Nombre cliente
- Dirección del tratamiento
- Precio del producto seleccionado
- Dos switch: Confirmada y Cancelada
- Información extra
- Al principio de la pantalla se muestra una imagen estática de GoogleMaps, con un pin enseñando la ubicación de la cita.  


## Producto/Servicios

- Estas secciones funcionan de igual forma.  
Ambas muestran un listado de productos y/o servicios ofrecidos por el profesional.
- Las celdas muestran el nombre y el precio.  
En caso de ser un producto, también se mostrará una imagen del mismo.
- El usuario dispone de un botón que le permite crear un nuevo producto/servicio.
- - Nota: Queda pendiente la conexión con backend. La implementación está completada, a falta de añadir la lógica a las acciones de los botones.

## Detalle Producto/Servicio
- Al pulsar sobre un producto/servicio se navega a una pantalla detalle del mismo.
- Los campos mostrados son:
- Nombre
- Descripción
- Precio
- Flag si está activo

## Nuevo Producto/Servicio
- Esta ventana se muestra cuando el usuario toca el botón para crear un nuevo producto/servicio.
- Los campos a introducir son:
- Nombre
- Descripción
- Precio
- Imagen (si fuese un producto; pendiente de implementar).
- El usuario dispone de una opción 'Activo'.  
Si esta opción se selecciona, el producto/servicio creado será publicado y visible al público; de lo contrario, el profesional podrá dejar el producto/servicio creado y guardado pero no será visible al público.
