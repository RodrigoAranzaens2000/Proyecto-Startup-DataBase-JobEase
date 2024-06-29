-- PASO 1
Create DATABASE JobEase

-- PASO 2
USE JobEase

-- PASO 3
CREATE TABLE AnexoTelefono
(
  IDAnexoTelefono INT          NOT NULL,
  IDTelefono      INT          NOT NULL,
  NombreDeAnexo   VARCHAR(100) NOT NULL,
  numeroDeAnexo   VARCHAR(10)  NOT NULL,
  CONSTRAINT PK_AnexoTelefono PRIMARY KEY (IDAnexoTelefono)
)
GO

CREATE TABLE CategoriaOferta
(
  IDcategoriaOferta INT          NOT NULL,
  IDofertaLaboral   INT          NOT NULL,
  nombre            VARCHAR(100) NOT NULL,
  Descripcion       VARCHAR(255),
  CONSTRAINT PK_CategoriaOferta PRIMARY KEY (IDcategoriaOferta)
)
GO

CREATE TABLE Certificacion
(
  IDcertificaciones INT   NOT NULL,
  IDcurriculum      INT   NOT NULL,
  Certificacion     image,
  CONSTRAINT PK_Certificacion PRIMARY KEY (IDcertificaciones)
)
GO

CREATE TABLE Curriculum
(
  IDcurriculum INT NOT NULL,
  IDtrabajador INT NOT NULL,
  CONSTRAINT PK_Curriculum PRIMARY KEY (IDcurriculum)
)
GO

CREATE TABLE direccionEmpresa
(
  IDdireccionEmpresa INT          NOT NULL,
  IDempresa          INT          NOT NULL,
  direccion          VARCHAR(255) NOT NULL,
  numero             INT         ,
  oficina            VARCHAR(10) ,
  CONSTRAINT PK_direccionEmpresa PRIMARY KEY (IDdireccionEmpresa)
)
GO

CREATE TABLE Educacion
(
  IDeducacion          INT          NOT NULL,
  IDcurriculum         INT          NOT NULL,
  NombreCentroEstudios VARCHAR(100),
  CONSTRAINT PK_Educacion PRIMARY KEY (IDeducacion)
)
GO

CREATE TABLE Empresa
(
  IDempresa         INT          NOT NULL,
  nombre            VARCHAR(60)  NOT NULL,
  descripcion       VARCHAR(255),
  CorreoElectronico VARCHAR(100),
  CONSTRAINT PK_Empresa PRIMARY KEY (IDempresa)
)
GO

CREATE TABLE Entrevista
(
  IDEntrevista          INT  NOT NULL,
  IDofertaLaboral       INT  NOT NULL,
  IDtrabajador          INT  NOT NULL,
  IDResultadoEntrevista INT  NOT NULL,
  FechaEntrevista       DATE,
  CONSTRAINT PK_Entrevista PRIMARY KEY (IDEntrevista)
)
GO

CREATE TABLE Estado
(
  IDestado        INT         NOT NULL,
  EstadoSolicitud VARCHAR(50),
  CONSTRAINT PK_Estado PRIMARY KEY (IDestado)
)
GO

CREATE TABLE idioma
(
  IDidioma     INT         NOT NULL,
  IDcurriculum INT         NOT NULL,
  idioma       VARCHAR(50),
  CONSTRAINT PK_idioma PRIMARY KEY (IDidioma)
)
GO

CREATE TABLE InteresLaboral
(
  IDinteresLaboral INT          NOT NULL,
  IDcurriculum     INT          NOT NULL,
  Intereses        VARCHAR(255),
  CONSTRAINT PK_InteresLaboral PRIMARY KEY (IDinteresLaboral)
)
GO

CREATE TABLE OfertaLaboral
(
  IDofertaLaboral    INT          NOT NULL,
  IDempresa          INT          NOT NULL,
  Titulo             VARCHAR(255),
  Descripcion        VARCHAR(255),
  FechaDePublicacion DATE        ,
  CONSTRAINT PK_OfertaLaboral PRIMARY KEY (IDofertaLaboral)
)
GO

CREATE TABLE Postulacion
(
  IDpostulacion    INT  NOT NULL,
  IDtrabajador     INT  NOT NULL,
  IDoferta         INT  NOT NULL,
  IDestado         INT  NOT NULL,
  FechaPostulacion DATE,
  CONSTRAINT PK_Postulacion PRIMARY KEY (IDpostulacion)
)
GO

CREATE TABLE Requisito
(
  IDrequisito INT          NOT NULL,
  IDoferta    INT          NOT NULL,
  requisito   VARCHAR(255),
  CONSTRAINT PK_Requisito PRIMARY KEY (IDrequisito)
)
GO

CREATE TABLE ResultadoEntrevista
(
  IDResultadoEntrevista INT         NOT NULL,
  Resultado             VARCHAR(50),
  CONSTRAINT PK_ResultadoEntrevista PRIMARY KEY (IDResultadoEntrevista)
)
GO

CREATE TABLE Skill
(
  IDskill      INT         NOT NULL,
  IDcurriculum INT         NOT NULL,
  Skills       VARCHAR(50),
  CONSTRAINT PK_Skill PRIMARY KEY (IDskill)
)
GO

CREATE TABLE TelefonoEmpresa
(
  IDTelfEmpresa  INT          NOT NULL,
  IDempresa      INT          NOT NULL,
  numeroTelefono VARCHAR(100),
  CONSTRAINT PK_TelefonoEmpresa PRIMARY KEY (IDTelfEmpresa)
)
GO

CREATE TABLE TelefonoTrabajador
(
  IDTelfTrabajador INT NOT NULL,
  IDtrabajador     INT NOT NULL,
  IDtipoTelefono   INT NOT NULL,
  CONSTRAINT PK_TelefonoTrabajador PRIMARY KEY (IDTelfTrabajador)
)
GO

CREATE TABLE TipoTelefono
(
  IDtipoTelefono INT          NOT NULL,
  TipoTelefono   VARCHAR(100),
  Codigo         VARCHAR(10) ,
  NumeroTelefono VARCHAR(20) ,
  CONSTRAINT PK_TipoTelefono PRIMARY KEY (IDtipoTelefono)
)
GO

CREATE TABLE Trabajador
(
  IDtrabajador      INT          NOT NULL,
  nombre            VARCHAR(60)  NOT NULL,
  segundoNombre     VARCHAR(60) ,
  apellidoPaterno   VARCHAR(60)  NOT NULL,
  apellidoMaterno   VARCHAR(60) ,
  FechaNacimiento   DATE         NOT NULL,
  correoElectronico VARCHAR(100) NOT NULL,
  CONSTRAINT PK_Trabajador PRIMARY KEY (IDtrabajador)
)
GO

ALTER TABLE TelefonoTrabajador
  ADD CONSTRAINT FK_Trabajador_TO_TelefonoTrabajador
    FOREIGN KEY (IDtrabajador)
    REFERENCES Trabajador (IDtrabajador)
GO

ALTER TABLE direccionEmpresa
  ADD CONSTRAINT FK_Empresa_TO_direccionEmpresa
    FOREIGN KEY (IDempresa)
    REFERENCES Empresa (IDempresa)
GO

ALTER TABLE Skill
  ADD CONSTRAINT FK_Curriculum_TO_Skill
    FOREIGN KEY (IDcurriculum)
    REFERENCES Curriculum (IDcurriculum)
GO

ALTER TABLE Certificacion
  ADD CONSTRAINT FK_Curriculum_TO_Certificacion
    FOREIGN KEY (IDcurriculum)
    REFERENCES Curriculum (IDcurriculum)
GO

ALTER TABLE Educacion
  ADD CONSTRAINT FK_Curriculum_TO_Educacion
    FOREIGN KEY (IDcurriculum)
    REFERENCES Curriculum (IDcurriculum)
GO

ALTER TABLE idioma
  ADD CONSTRAINT FK_Curriculum_TO_idioma
    FOREIGN KEY (IDcurriculum)
    REFERENCES Curriculum (IDcurriculum)
GO

ALTER TABLE InteresLaboral
  ADD CONSTRAINT FK_Curriculum_TO_InteresLaboral
    FOREIGN KEY (IDcurriculum)
    REFERENCES Curriculum (IDcurriculum)
GO

ALTER TABLE Requisito
  ADD CONSTRAINT FK_OfertaLaboral_TO_Requisito
    FOREIGN KEY (IDoferta)
    REFERENCES OfertaLaboral (IDofertaLaboral)
GO

ALTER TABLE Postulacion
  ADD CONSTRAINT FK_Trabajador_TO_Postulacion
    FOREIGN KEY (IDtrabajador)
    REFERENCES Trabajador (IDtrabajador)
GO

ALTER TABLE Postulacion
  ADD CONSTRAINT FK_OfertaLaboral_TO_Postulacion
    FOREIGN KEY (IDoferta)
    REFERENCES OfertaLaboral (IDofertaLaboral)
GO

ALTER TABLE TelefonoTrabajador
  ADD CONSTRAINT FK_TipoTelefono_TO_TelefonoTrabajador
    FOREIGN KEY (IDtipoTelefono)
    REFERENCES TipoTelefono (IDtipoTelefono)
GO

ALTER TABLE TelefonoEmpresa
  ADD CONSTRAINT FK_Empresa_TO_TelefonoEmpresa
    FOREIGN KEY (IDempresa)
    REFERENCES Empresa (IDempresa)
GO

ALTER TABLE Curriculum
  ADD CONSTRAINT FK_Trabajador_TO_Curriculum
    FOREIGN KEY (IDtrabajador)
    REFERENCES Trabajador (IDtrabajador)
GO

ALTER TABLE CategoriaOferta
  ADD CONSTRAINT FK_OfertaLaboral_TO_CategoriaOferta
    FOREIGN KEY (IDofertaLaboral)
    REFERENCES OfertaLaboral (IDofertaLaboral)
GO

ALTER TABLE Entrevista
  ADD CONSTRAINT FK_OfertaLaboral_TO_Entrevista
    FOREIGN KEY (IDofertaLaboral)
    REFERENCES OfertaLaboral (IDofertaLaboral)
GO

ALTER TABLE Entrevista
  ADD CONSTRAINT FK_Trabajador_TO_Entrevista
    FOREIGN KEY (IDtrabajador)
    REFERENCES Trabajador (IDtrabajador)
GO

ALTER TABLE Entrevista
  ADD CONSTRAINT FK_ResultadoEntrevista_TO_Entrevista
    FOREIGN KEY (IDResultadoEntrevista)
    REFERENCES ResultadoEntrevista (IDResultadoEntrevista)
GO

ALTER TABLE Postulacion
  ADD CONSTRAINT FK_Estado_TO_Postulacion
    FOREIGN KEY (IDestado)
    REFERENCES Estado (IDestado)
GO

ALTER TABLE OfertaLaboral
  ADD CONSTRAINT FK_Empresa_TO_OfertaLaboral
    FOREIGN KEY (IDempresa)
    REFERENCES Empresa (IDempresa)
GO

ALTER TABLE AnexoTelefono
  ADD CONSTRAINT FK_TelefonoEmpresa_TO_AnexoTelefono
    FOREIGN KEY (IDTelefono)
    REFERENCES TelefonoEmpresa (IDTelfEmpresa)
GO