CREATE TABLE clientes (
id_cliente INT NOT NULL IDENTITY (1,1) PRIMARY KEY, 
nombre VARCHAR(100),
perfil_bio TEXT,
fecha_registro DATE);

CREATE TABLE productos (
id_producto INT NOT NULL IDENTITY (1,1) PRIMARY KEY, 
descripcion VARCHAR(255),
precio DECIMAL (10,2),
esta_activo TINYINT); 
