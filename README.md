# 📊 RetailPro | Sales Performance Analysis

**Data Analytics Project | SQL · Power Query · Power BI**

## 📌 Descripción del proyecto

RetailPro es un proyecto de análisis de datos orientado a investigar las ventas de una empresa retail durante el último trimestre.

El objetivo es transformar los datos comerciales en información útil para identificar los principales factores que afectan el desempeño del negocio, detectar oportunidades de mejora y facilitar la toma de decisiones basada en datos.

El análisis considera la evolución de las ventas y su comportamiento según diferentes dimensiones del negocio, como productos, clientes, regiones, canales comerciales, descuentos y devoluciones.

## 🎯 Objetivos

- Analizar la evolución de las ventas online y detectar variaciones relevantes. 
- Identificar tendencia en el comportamiento de los clientes, en su fidelidad.
- Identificar los productos, clientes, regiones y canales con mayor impacto en los resultados.
- Evaluar el efecto de los descuentos y las devoluciones sobre el desempeño comercial.
- Desarrollar indicadores y visualizaciones que faciliten la interpretación de los resultados.

## 🛠️ Herramientas utilizadas

| Herramienta | Aplicación |
|---|---|
| **SQL Server** | Extracción, consulta y análisis de datos mediante consultas SQL. |
| **Power Query (M)** | Limpieza, transformación y preparación de los datos. |
| **Power BI** | Modelado de datos, creación de medidas DAX y desarrollo de dashboards interactivos. |
| **GitHub** | Versionado, organización y documentación del proyecto. |

## 🔄 Metodología de trabajo

El proyecto sigue un flujo de trabajo de análisis de datos:

1. **Definición de problematica y lineamientos del análisis**: definición de los aspectos del proyecto a evaluar, definición de preguntas y KPIs aplicables al analisis.
2. **Extracción:** obtención de información comercial proveniente de la fuente de facturación.
3. **Preparación:** revisión de la calidad de los datos, tratamiento de valores nulos y estandarización de campos.
4. **Transformación:** limpieza y estructuración de los datos con Power Query y consultas SQL.
5. **Modelado:** organización de la información en tablas de hechos y dimensiones para facilitar el análisis.
6. **Análisis:** construcción de indicadores comerciales y comparación de períodos.
7. **Visualización:** desarrollo de dashboards en Power BI para comunicar los principales hallazgos.

## 🗂️ Modelo de datos

El modelo organiza la información para analizar las ventas desde diferentes perspectivas.

| Tabla | Descripción |
|---|---|
| `hechos_ventas` | Registra las operaciones comerciales y las métricas asociadas a las ventas. |
| `dim_clientes` | Contiene los atributos necesarios para segmentar el análisis por cliente. |
| `dim_productos` | Permite analizar el desempeño comercial por producto. |

Las tablas se relacionan mediante sus identificadores correspondientes, con el objetivo de facilitar el análisis multidimensional.

## 📈 Análisis de negocio

El proyecto busca responder preguntas como:

- ¿Cómo evolucionaron las ventas?
- ¿Qué variaciones se observan respecto de los períodos de comparación?
- ¿Qué productos y clientes explican una mayor proporción de las ventas?
- ¿Qué regiones y canales presentan mejor o peor desempeño?
- ¿Qué impacto tienen los descuentos y las devoluciones en los resultados?

## ▶️ Cómo ejecutar los scripts SQL

### Requisitos previos

- Tener instalado SQL Server.
- Contar con SQL Server Management Studio (SSMS).
- Disponer de los archivos SQL y de los datos necesarios para ejecutar las consultas.

### Pasos de ejecución

**1. Clonar el repositorio**

```bash
git clone https://github.com/RocioP416/Coderhouse-dataanalytics.git
```

**2. Abrir los scripts SQL**

Ingresar a la carpeta del proyecto y abrir los archivos `.sql` desde el cliente de base de datos correspondiente.

**3. Configurar la base de datos**

Verificar el nombre de la base de datos utilizado en los scripts y confirmar que la conexión esté configurada correctamente.

Si el proyecto incluye un script de creación de tablas y carga inicial de datos, ejecutarlo primero.

**4. Ejecutar las consultas**

Ejecutar los scripts en el orden requerido por sus dependencias:

1. Creación de la base de datos y las tablas.
2. Carga o preparación de los datos.
3. Consultas de análisis y extracción de información.

Si los scripts utilizan tablas o bases de datos creadas previamente, estas deben existir antes de ejecutar las consultas dependientes.

**5. Validar los resultados**

Revisar los resultados de las consultas y verificar que los datos obtenidos sean consistentes antes de utilizarlos en Power BI.

> **Nota:** los nombres y el orden exacto de ejecución deben ajustarse a los archivos SQL definitivos incluidos en el repositorio. Los scripts que crean o modifican tablas deben ejecutarse con precaución, especialmente en entornos que contengan datos reales.

## 📁 Estructura del repositorio

La estructura recomendada para organizar los archivos del proyecto es:

```text
Coderhouse-dataanalytics/
│
├── RetailPro/
│   ├── SQL/
│   │   ├── 01_create_database.sql
│   │   ├── 02_data_preparation.sql
│   │   └── 03_business_analysis.sql
│   │
│   ├── PowerBI/
│   │   └── RetailPro_Dashboard.pbix
│   │
│   └── README.md
│
└── README.md
```

Esta estructura es una propuesta de organización. Los nombres deben coincidir con los archivos reales que se incorporen al repositorio.

## 💡 Resultado esperado

El proyecto integra herramientas de análisis de datos para convertir información comercial en indicadores y visualizaciones que permitan comprender el desempeño de las ventas, identificar segmentos críticos y respaldar decisiones de negocio.

## 👩‍💻 Autora

**Rocío Pareja**

Proyecto desarrollado en el marco de la formación en Data Analytics de Coderhouse.

[Ver repositorio en GitHub](https://github.com/RocioP416/Coderhouse-dataanalytics)
