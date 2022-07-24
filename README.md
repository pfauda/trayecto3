<img align="right" width="145" src="https://lh3.googleusercontent.com/p/AF1QipPWZQfa087JiVjutpUTVEGRnh6W214Wjm439gKQ=w1080-h608-p-no-v0">

# <br><sup><b>Proyecto: </b>Retención de usuarios de la Plataforma Digital</sup>

El objetivo de este proyecto es generar un modelo predictivo-probabilístico de aquellos usuarios que potencialmente puedan abandonar el uso de la plataforma digital. Para generar este análisis se toman las siguientes fuentes de datos:

- Archivo de Usuarios de la plataforma.
- Archivos de Crosseling de productos por cliente.
- Archivos de Transacciones efectuadas por el cliente. (Monetarias y No Monetarias por separado).
- Archivos provenientes de GESTAR (Tickets registrados e ingresados por los distintos medios. Call Center, Presencial, Facebbok, etc.)
- Archivo proveniente del Turnero. (Turnos otorgados para atención en sucursal o virtual)

Para generar el estudio primero primero se generó un cuaderno que realiza la curación de los archivos de datos mencionados anteriormente. Proceso consiste en normalizar los tipos de datos de las distintas fuentes y en alguno casos someterlos a un primer filtro los cuales se pueden ver detalladamente en cada uno de los cuadernos.

La lista de cuadernos es la siguiente

- [Curacion.ipynb](Notebooks/Curacion.ipynb) Este cuaderno procesa cada uno de los archivos mencionadas anteriormente y los normaliza generando nuevos archivos con tipos da datos uniformes y que se puedan procesar más convenientemente por los procesos posteriores. En algunos casos se les aplica algunos filtros mínimos dejando de lado los registros que no pertenezcan a usuarios de la plataforma digital o que pertenezcan a registraciones de empresas. (Por el tamaño de los archivos solo se puede ejecutar localmente).
- [Consolidacion.ipynb](Notebooks/Consolidacion.ipynb) Este cuaderno se encarga de tomar cada uno de los archivos generados por el proceso anterior y generar un archivo de salida `Crosseling_ampliado_YYYYMM.parquet` con los datos del archivo normalizado `Crosseling_YYYYMM.parquet` sumándole los datos de los restantes archivos normalizados. La forma en que se compone el archivo se puede ver en forma detallada en el cuaderno. Este archivo es resultado de un proceso iterativo del análisis y perfilado de cada uno de los archivos y variables con lo cual puede ir variando a través del tiempo conforme se vaya refinando y avanzando en el análisis. Tentativamente es el que se utilizará para generar el modelo predictivo.
- [Cohort.ipynb](Notebooks/Cohort.ipynb) Este cuaderno realiza un análisis de retención de los usuarios de plataforma digital.
- [Descriptivas_general.ipynb](Notebooks/Descriptivas_general.ipynb) Este cuaderno es un borrador de medidas descriptivas de los archivos de usuarios y crosseling.
- Los cuadernos que comienzan con el nombre Profiling realizan un perfilado rápido con la libreria pandas_profiling de cada uno de los archivos individuales con el objetivo de determinar cuáles variables son más relevantes y cuales puede convenir no tener en consideración con el objeto de no incorporar al modelo variables correlacionadas entre si de un mismo orgien de datos.
  - [Profiling_Usuarios.ipynb](Notebooks/Profiling_Usuarios.ipynb)
  - [Profiling_Crosseling.ipynb](Notebooks/Profiling_Crosseling.ipynb)
  - [Profiling_Detalle_Trx_Monetarias.ipynb](Notebooks/Profiling_Detalle_Trx_Monetarias.ipynb) (Solo se puede ejecutar localmente ya que por tamaño del archivo no se pueden subir a *`Google Drive`*)
  - [Profiling_Detalle_Trx_NoMonetarias.ipynb](Notebooks/Profiling_Detalle_Trx_NoMonetarias.ipynb) (Solo se puede ejecutar localmente ya que por tamaño del archivo no se pueden subir a *`Google Drive`*)
  - [Profiling_Sum_Trx_Monetarias.ipynb](Notebooks/Profiling_Sum_Trx_Monetarias.ipynb)
  - [Profiling_Sum_Trx_NoMonetarias.ipynb](Notebooks/Profiling_Sum_Trx_NoMonetarias.ipynb)
  - [Profiling_Gestar.ipynb](Notebooks/Profiling_Gestar.ipynb)
  - [Profiling_Turnero.ipynb](Notebooks/Profiling_Turnero.ipynb)

Como consideración general se decidió que los archivos de salida a subirse a *`Google Drive`* se graben en formato `parquet` ya que hacen un mucho mejor aprovechamiento del espacio y con los archivos en formato CSV ya es estaba al limite del almacenamiento disponible.