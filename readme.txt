En primer lugar, renombre todas las columnas con nombres más entendibles y en español, para que cualquier usuario que utilice este archivo pueda tener mayor entendimiento de los datos con los que se trabaja. 
Después, controle el tipo de datos de cada columna: datos como codigo_cliente, codigo_venta, codigo_producto, decidí asignarles un tipo de dato de texto. Lo mismo con el campo telefono_cliente, ya que aunque sean numeros no son campos para realizar calculos (no vamos a sumar telefonos). 
Los campos de fecha_alta, fecha_venta les asigne tipo de dato DATE, para poder segmentar cronologicamente el analisis de datos.

Para eliminar duplicados, utilice la función "eliminar duplicados" en el menu de "quitar filas". Luego, para cada columna, asigne un significado a los valores NULL. 

Para separar los datos del cliente de los de la transaccion, definí que todos los datos del cliente son dependientes del atributo CODIGO_cLIENTE, por lo que ese atributo seria su PK en la tabla dimension clientes y conecta con la tabla de ventas como FK. 