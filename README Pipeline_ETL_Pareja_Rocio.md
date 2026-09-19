# DOCUMENTACION PRE-ENTREGA 6: Pipeline ETL Completo: de datos crudos a modelo confiable en Power BI 

## Tabla Dim_Clientes:
 -	**Se eliminaron los duplicados, ya que no puede haber valores repetidos en la PK (id_cliente) de la tabla Dim_Clientes**
    #"Duplicados quitados" = Table.Distinct(#"Tipo cambiado", {"id_cliente"}),
 	
 - **Se reemplazaron valores NULL en mail y ciudad:**
    // **Mail: se estableció una regla para los registros nulos en el campo [mail] siguiendo el patron presente en los correos registrados, por lo que si detecta algun registro sin valor automaticamente lo va a completar con el primer nombre de la columna "nombre_cliente" y "@mail.com".**  
   #"Eliminar Null email"=Table.ReplaceValue(#"Duplicados quitados",each [email],each if [email]=null then Text.Lower(Text.Trim(Text.BeforeDelimiter([nombre_cliente]," ")))&"@mail.com" else [email], Replacer.ReplaceValue,{"email"}),

    // **Se reemplazaron los registros null en el campo [ciudad] por "Sin especificar", para evitar que en los analisis e informes se visualice como "(en blanco)".**
    #"Null ciudad"=Table.ReplaceValue(#"Eliminar Null email",null, "Sin especificar", Replacer.ReplaceValue, {"ciudad"} ),

 - **Se corrigieron y estandarizaron los tipos de datos para cada columna**
    #"Tipo cambiado1" = Table.TransformColumnTypes(#"Null ciudad",{{"email", type text}, {"ciudad", type text}, {"fecha_registro", type date}, {"id_cliente", Int64.Type}, {"nombre_cliente", type text}, {"pais", type text}, {"segmento", type text}})

 - Se renombró la tabla a Dim_Clientes

## Tabla Dim_Productos
- 	**Se eliminaron los duplicados, ya que no puede haber valores repetidos en la PK (id_producto) de la tabla**
        #"Duplicados quitados" = Table.Distinct(#"Tipo cambiado", {"id_producto"}),

-   **Se reemplazaron valores NULL en categorias y precio:**
    // **Reemplazo de valores Null en campo categoria, teniendo en cuenta la información de la tabla dim_categorias "Laptop" --> Categoria "Computación"**
        #"Categoria reemplazada" = Table.ReplaceValue(#"Duplicados quitados",null,"Computación",Replacer.ReplaceValue,{"categoria"}),

    // **Reemplazo de valor Null por el precio unitario registrado en fact_ventas para las operaciones de venta que involucran a ese id_producto.**
        #"Valor reemplazado" = Table.ReplaceValue(#"Categoria reemplazada",null,130,Replacer.ReplaceValue,{"precio"}),

- **Se corrigieron y estandarizaron los tipos de datos para cada columna**
        #"Tipo cambiado1" = Table.TransformColumnTypes(#"Valor reemplazado",{{"costo", type number}, {"precio", type number}, {"id_producto", Int64.Type}, {"nombre_producto", type text}, {"categoria", type text}, {"subcategoria", type text}, {"stock", Int64.Type}, {"activo", Int64.Type}})

## Tabla Fact_Ventas
-  **Se corrigieron y estandarizaron los tipos de datos para cada columna**
    #"Tipo cambiado1" = Table.TransformColumnTypes(#"Columnas con nombre cambiado",{{"descuento", type number}, {"id_venta", Int64.Type}, {"fecha_venta", type date}, {"id_cliente", Int64.Type}, {"id_producto", Int64.Type}, {"cantidad", Int64.Type}, {"precio_unitario", type number}, {"total_venta", type number}, {"canal", type text}, {"nombre_producto", type text}, {"categoria", type text}})
   
- **Se combinaron las tablas Fact_Ventas y Dim_Producto a traves de la funcion "combinar consultas" y el campo "id_producto". Luego se expandió la columna combinada para incluir en la tabla Fact_Ventas los campos "nombre_producto" y "categoria".**
    #"Consultas combinadas" = Table.NestedJoin(#"Cambio tipo de dato", {"id_producto"}, Dim_Productos, {"id_producto"}, "Dim_Productos", JoinKind.LeftOuter),
    #"Datos productos" = Table.ExpandTableColumn(#"Consultas combinadas", "Dim_Productos", {"nombre_producto", "categoria"}, {"Dim_Productos.nombre_producto", "Dim_Productos.categoria"}),
    #"Columnas con nombre cambiado" = Table.RenameColumns(#"Datos productos",{{"Dim_Productos.nombre_producto", "nombre_producto"}, {"Dim_Productos.categoria", "categoria"}}),

## Tabla Dim_Categorias
- **Se corrigieron y estandarizaron los tipos de datos para cada columna**
  #"Tipo cambiado" = Table.TransformColumnTypes(#"Encabezados promovidos",{{"id_categoria", Int64.Type}, {"nombre_categoria", type text}, {"descripcion", type text}})

- Finalmente se cargaron y actualizaron los datos, sin ningun error y con 11 clientes, 12 productos, 50 ventas y 4 categorias 



