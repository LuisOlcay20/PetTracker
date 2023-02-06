PET TRACKER
Proyecto de la Aplicación con Power Platform, Azure SQL Server, Azure Blob Storage, Azure Devops y Github.

El proyecto consiste en la creación de una aplicación de seguimiento para mascotas, la cual fue construida utilizando Power Platform, que incluye Power Apps, Power Automate y Power BI. La información registrada en la aplicación se almacena en Azure SQL Database y Azure Blob.

Fase 1: Realizada
La fase uno del proyecto fue la creación de las tablas y relaciones de la base de datos en Azure SQL Database, así como también la creación de un repositorio de imágenes en Azure Blob para las mascotas y los exámenes médicos. Luego, se conectó la base de datos con Power Apps, y Power Apps con Github y Azure DevOps para el control de versiones.
La aplicación tipo canvas en Power Apps fue diseñada para que los usuarios registren las diversas actividades de sus mascotas, como paseos, comida, consultas al veterinario, heces, desparasitación y vacunas.
Además, se implementaron procesos automatizados con Power Automate, como el envío de un recordatorio después de tres meses de una desparasitación.

Bonus: Al inicio de la aplicación, se puede observar, entre otros datos, el número de mascotas registradas en el sistema a través de una consulta SQL.

Fase 2: Sin iniciar
Una vez en marcha la aplicación, cuando se tenga la cantidad suficiente de data, se comenzará a representar los datos a través de Power BI dentro de la misma aplicación. Además, a través de consultas SQL se recopilará información relevante sobre las mascotas y sus dueños, como el tiempo promedio de paseo o el promedio de gasto en comida.
