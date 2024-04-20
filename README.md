# todoapp

Aplicación como actividad para demostracion de conocimientos en Flutter.

# Para poder correr la aplicación sigue los siguientes pasos #

Como se esta utilizando codigo auto generado de flutter de los paquetes
    - auto_route
    - riverpod

    SI tienes errores por parte de `presentation/providers` ejecuta el
    siguiente comando para generar el codigo autogenerado:

        `flutter packages pub run build_runner build`

# Dispositivos probados
    -Iphone 15 plus
    -Iphone 11
# Arquitectura
Este proyecto esta basado en la arquitectura CLEAN - ARQUITECTURE por lo cual
las carpetas estan separadas de la siguiente forma:

    - app/ -> Apartado en donde esta la aplicacion en una sola clase.

    - config/ -> Apartado en donde se alojan todo lo que tenga que ver
                con diseño de la aplicación, constantes, URLs, assets,etc.

    - domain/ -> Apartado en donde se definen los modelos y las abstracciones
                de los casos de uso. (Explicación mas a fondo dentro de los
                archivos) 

    - infraestructure/ -> Apartado en donde ya se implementan las abstracciones
                          colocadas en domain.(Explicación mas a fondo dentro de los archivos)

    - presentation/ -> Apartado en donde estan alojadas las pantallas, widgets
                        y providers que se utilizaran en la aplicacion.(Explicación mas a fondo dentro de los archivos)

# Archivos de barril
De igual forma se busca tener las minimas importaciones posibles en un widget o clase, por lo que se utilizan archivos de barril en las carpetas para mejorar la organización.

# Definicion de reglas
Para cuando un widget o pagina tenga mas de 2 o 3 subwigets, es mejor crear archivos aparte en una carpeta que se llame `nombre del widget` y ahi alojarlos para mejor organización.

# Paquetes
Se utilizaron los siguientes paquetes:
    auto_route: ^8.0.3 -> Para las rutas de la app.
    
    internet_connection_checker: ^1.0.0+1 -> Verificacion de conexión a internet.
    
    http: ^1.2.1 -> Realizacion de peticiones http.
    
    flutter_riverpod: ^2.5.1 -> Gestor de estado
    
    riverpod_annotation: ^2.3.5 -> El gestor de estado como es auto generado ocupa un paquete extra.
    
    bot_toast: ^4.1.3 -> Para notificaciones al usuario.

    lutter_localizations: -> Para cambiar el idioma del datePicker
Comunicacion con el programador -> javiergutierrezesp@hotmail.com

