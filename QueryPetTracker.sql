--Creacion de tablas del modelo de datos--
CREATE TABLE tblUsuarios (
id_U INT PRIMARY KEY IDENTITY (1,1)
, Nombre VARCHAR (20) NOT NULL
, Apellido VARCHAR (20) NOT NULL
, UsuarioCarga VARCHAR (20)
)

CREATE TABLE tblMascotas(
id_M INT PRIMARY KEY IDENTITY (1,1)
, id_U INT
, Nombre VARCHAR(20) NOT NULL 
, Edad TINYINT 
, Nombre_Tutor VARCHAR (20) NOT NULL
, Apellido_Tutor VARCHAR (20) NOT NULL
)

CREATE TABLE tblActividades(
id_A INT PRIMARY KEY IDENTITY (1,1)
, NombreActividad VARCHAR(20)
)
-- Notar que en las tablas tipo no lookup, es necesario crear 'foreign keys' para relacionarla con las tipo lookup--
-- Mas adelante se crearan las relaciones--
CREATE TABLE tblHorarioPaseos (
id_hp INT PRIMARY KEY IDENTITY (1,1)
, HorarioPaseo VARCHAR (10)
)

CREATE TABLE tblPaseos (
id_M INT
, id_A INT
, id_hp INT
, Nombre_Mascota VARCHAR(20) NOT NULL 
, HorarioPaseo VARCHAR(10)
, InicioPaseo DATETIME
, FinPaseo DATETIME
)

CREATE TABLE tblHeces (
id_M INT
, id_A INT
, id_th INT
, Nombre_Mascota VARCHAR(20) NOT NULL 
, TipoHeces VARCHAR (20)
, ColorHeces VARCHAR (20)
)

CREATE TABLE tblTipoHeces (
id_th INT PRIMARY KEY IDENTITY (1,1)
, TipoHeces VARCHAR (20)
)

CREATE TABLE tblComida (
id_M INT
, id_A INT
, Nombre_Comida VARCHAR(20) 
, Marca VARCHAR (20)
, Sabor VARCHAR (20)
, FechaCompa DATE
, Precio SMALLMONEY
)

CREATE TABLE tblConsultaVeterinario (
id_M INT
, id_A INT
, Nombre_Mascota VARCHAR (20)
, Clinica VARCHAR (20)
, FechaConsulta DATE
, MotivoConsulta VARCHAR (200)
, Diagnostico_Tratamiento VARCHAR (200)
)

CREATE TABLE tblDesparasitacion (
id_M INT
, id_A INT
, FechaDesparasitacion DATE
, ProductoDesparasitacion VARCHAR (40)
)

CREATE TABLE tblVacunas (
id_M INT
, id_A INT
, id_v INT
, Nombre_Mascota VARCHAR (20)
,NombreVacuna VARCHAR (30)
, FechaVacuna DATE
)

CREATE TABLE tblNombresVacuna (
id_v INT PRIMARY KEY IDENTITY (1,1)
, NombreVacuna VARCHAR (30)
)

-- Completamos las tablas lookup--
-- La Tabla de Mascotas sera rellenada en la app --
INSERT INTO [dbo].[tblActividades]
VALUES ('Paseos')
, ('Heces')
, ('Comida')
, ('Consulta Veterinario')
, ('Desparasitacion')
, ('Vacunas')

INSERT INTO [dbo].[tblHorarioPaseos]
VALUES ('AM')
, ('Tarde')
, ('Noche')

INSERT INTO [dbo].[tblTipoHeces]
VALUES ('Diarrea')
, ('Pastosa')
, ('Firme')

INSERT INTO [dbo].[tblNombresVacuna]
VALUES ('Tripefelina')
, ('Octuple/Sextuple')
, ('Antirrabica')

-- Creamos Relaciones las relaciones del sistema de datos--
-- Los ON DELETE/UPDATE CASCADE son para que los cambios se propagen automaticamente --
-- Para eliminar un CONSTRAINT: ALTER TABLE '' DROP CONSTRAINT '' --

-- Usuarios y Mascotas--
ALTER TABLE [dbo].[tblMascotas]
 ADD CONSTRAINT FK_Mascotas_Usuarios FOREIGN KEY (id_U)
 REFERENCES tblUsuarios (id_U)
  ON DELETE CASCADE
  ON UPDATE CASCADE
  GO

-- Paseos con Mascotas, Actividad y horario paseo--
ALTER TABLE [dbo].[tblPaseos]
 ADD CONSTRAINT FK_Paseos_Mascotas FOREIGN KEY (id_M)
 REFERENCES tblMascotas (id_M)
  ON DELETE CASCADE
  ON UPDATE CASCADE
  GO

ALTER TABLE [dbo].[tblPaseos]
 ADD CONSTRAINT FK_Paseos_Actividad FOREIGN KEY (id_A)
 REFERENCES tblActividades (id_A)
  ON DELETE CASCADE
  ON UPDATE CASCADE
  GO

ALTER TABLE [dbo].[tblPaseos]
 ADD CONSTRAINT FK_Paseos_hp FOREIGN KEY (id_hp)
 REFERENCES tblHorarioPaseos (id_hp)
  ON DELETE CASCADE
  ON UPDATE CASCADE
  GO

-- Heces con Mascotas, Actividad y tipo heces--
ALTER TABLE [dbo].[tblHeces]
 ADD CONSTRAINT FK_Heces_Mascotas FOREIGN KEY (id_M)
 REFERENCES tblMascotas (id_M)
  ON DELETE CASCADE
  ON UPDATE CASCADE
  GO

ALTER TABLE [dbo].[tblHeces]
 ADD CONSTRAINT FK_Heces_Actividad FOREIGN KEY (id_A)
 REFERENCES tblActividades (id_A)
  ON DELETE CASCADE
  ON UPDATE CASCADE
  GO

ALTER TABLE [dbo].[tblHeces]
 ADD CONSTRAINT FK_Heces_th FOREIGN KEY (id_th)
 REFERENCES [dbo].[tblTipoHeces] (id_th)
  ON DELETE CASCADE
  ON UPDATE CASCADE
  GO

-- Comida con Mascotas, Actividad --
ALTER TABLE [dbo].[tblComida]
 ADD CONSTRAINT FK_Comida_Mascotas FOREIGN KEY (id_M)
 REFERENCES tblMascotas (id_M)
  ON DELETE CASCADE
  ON UPDATE CASCADE
  GO

ALTER TABLE [dbo].[tblComida]
 ADD CONSTRAINT FK_Comida_Actividad FOREIGN KEY (id_A)
 REFERENCES tblActividades (id_A)
  ON DELETE CASCADE
  ON UPDATE CASCADE
  GO

-- Consulta Veterinario con Mascotas, Actividad --
ALTER TABLE [dbo].[tblConsultaVeterinario]
 ADD CONSTRAINT FK_ConsultaVet_Mascotas FOREIGN KEY (id_M)
 REFERENCES tblMascotas (id_M)
  ON DELETE CASCADE
  ON UPDATE CASCADE
  GO

ALTER TABLE [dbo].[tblConsultaVeterinario]
 ADD CONSTRAINT FK_ConsultaVet_Actividad FOREIGN KEY (id_A)
 REFERENCES tblActividades (id_A)
  ON DELETE CASCADE
  ON UPDATE CASCADE
  GO

-- Desparasitacion con Mascotas, Actividad --
ALTER TABLE [dbo].[tblDesparasitacion]
 ADD CONSTRAINT FK_Desparasitacion_Mascotas FOREIGN KEY (id_M)
 REFERENCES tblMascotas (id_M)
  ON DELETE CASCADE
  ON UPDATE CASCADE
  GO

ALTER TABLE [dbo].[tblDesparasitacion]
 ADD CONSTRAINT FK_Desparasitacion_Actividad FOREIGN KEY (id_A)
 REFERENCES tblActividades (id_A)
  ON DELETE CASCADE
  ON UPDATE CASCADE
  GO

-- Vacunas con Mascotas, Actividad y horario paseo--
ALTER TABLE [dbo].[tblVacunas]
 ADD CONSTRAINT FK_Vacunas_Mascotas FOREIGN KEY (id_M)
 REFERENCES tblMascotas (id_M)
  ON DELETE CASCADE
  ON UPDATE CASCADE
  GO

ALTER TABLE [dbo].[tblVacunas]
 ADD CONSTRAINT FK_Vacunas_Actividad FOREIGN KEY (id_A)
 REFERENCES tblActividades (id_A)
  ON DELETE CASCADE
  ON UPDATE CASCADE
  GO

ALTER TABLE [dbo].[tblVacunas]
 ADD CONSTRAINT FK_Vacunas_NombreVacunas FOREIGN KEY (id_v)
 REFERENCES [dbo].[tblNombresVacuna] (id_v)
  ON DELETE CASCADE
  ON UPDATE CASCADE
  GO








