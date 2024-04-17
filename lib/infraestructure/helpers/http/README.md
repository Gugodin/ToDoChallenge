
Este Helper busca ser generico para que cualquier desarrollador
que intente realizar una peticion http con el paquete `http` pueda
realizarlo de una forma mas comoda y simple.

La clase `http_helper` es la que estará encargada de ser utilizada por el usuario para que este solo tenga que decidir que tipo de peticion hará y para que servicio o API lo mandará, de igual forma podra mandar sus respectivos datos.

La clase `http_base` como lo dice, es practicamente la base, que se enfoca en una funcion en donde todas los tipos de petición que puede realizar `http_helper` recide, esta funcion compilará toda la informacion necesaria para poder realizar una petición, notificará si la peticion fue exitosa o no por medio del try y catch que se ejecuta (Esto se aclara por si se te hace raro ver que te dio un error y la aplicacion no se te atora, es recomendable que actives el modo debug para poder verlo).

Este helper es dependiente de los siguientes paquetes:
    - http *
    - internet_connection_checker *
    - flutter_secure_storage 
    (Este sirve en dado caso que se necesite autenticacion por token)

