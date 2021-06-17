# Band Names App

Esta aplicación móvil presenta la implementación de una aplicación hecha en Flutter que implementa sockets para la comunicación directa con el servidor.

## Cómo usar

Paso 1:

Tener el sdk de Flutter, este proyecto ha sido creado con Flutter en su versión `2.2.2` y Dart `2.13.3`.

Paso 2:

Clonar el repositorio del proyecto con el siguiente comando

```
git clone https://github.com/bryanAguilar001/bandnames-socket-app.git
```

Paso 3:

En la raíz del proyecto ejecute el siguiente comando en la consola para obtener las dependencias necesarias:

```
flutter pub get
```

## Qué aprendí

- Comunicación en tiempo real con un servidor mediante sockets
- Escuchar y emitir eventos con sockets desde Flutter
- Uso de gráficos estadísticos
- Manejo del estado de la aplicación mediante Provider
- Mostrar status del servidor en la aplicaicón (conectando, en linea, desconectado)
- Dissmisable (widget para eliminar elementos con un deslizamiento)

## Características

- Detección del estado del servidor (online / offline)
- Obtener listado de objetos desde el servidor en tiempo real con sockets
- Agregar un nuevo objeto a la lista desde la aplicación
- Modificar el contador de un objeto de la lista
- Gráfico de pastel en base a los contadores de cada uno de los objetos de la lista

## Librerías & Paquetes usados

* `socket_io_client: ^1.0.1`: cliente para la comunicación con sockets
* `provider: ^5.0.0`: manejo de estado de la aplicación
* `pie_chart: ^5.0.0`: gráfico de pastel

# Autor

El código fuente de esta aplicación esta escrito por Bryan Aguilar (Desarrollador de Eitecknologia)

- Sitio web - [bryanaguilar](https://bryanaguilar.gatsbyjs.io/)
- GitHub - [bryanAguilar001](https://github.com/bryanAguilar001)
- LinkeIn - [bryanaguilar6174](https://www.linkedin.com/in/bryanaguilar6174)
- Email - [bryan.aguilar6174@gmail.com](mailto:bryan.aguilar6174@gmail.com)

## Band Names App

<br>
<table>
  <tr>
    <td>Main Screen</td>
    <td>Add new</td>
  </tr>
  <tr>
    <td align="center" valign="center"><img src="https://github.com/bryanAguilar001/bandnames-socket-app/blob/main/media/home.png?raw=true" width="70%"></td>
    <td align="center" valign="center"><img src="https://github.com/bryanAguilar001/bandnames-socket-app/blob/main/media/add.png?raw=true" width="70%"></td>
  </tr>
 </table>
<br>


A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
