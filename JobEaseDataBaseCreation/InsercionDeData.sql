-- PASO 1	
USE JobEase

-- PASO 2
INSERT INTO Empresa (IDempresa, nombre, descripcion, CorreoElectronico)
VALUES
  (1, 'Tech Solutions Inc', 'Empresa de desarrollo de software', 'info@techsolutions.com'),
  (2, 'Creative Designs Ltd', 'Agencia de dise�o gr�fico', 'contacto@creativedesigns.com'),
  (3, 'HealthCare Innovations', 'Empresa de tecnolog�a m�dica', 'contact@healthcareinnovations.com'),
  (4, 'Green Energy Solutions', 'Consultor�a en energ�as renovables', 'info@greenenergy.com'),
  (5, 'Food Express', 'Servicio de entrega de alimentos', 'support@foodexpress.com'),
  (6, 'Education Plus', 'Plataforma educativa en l�nea', 'info@educationplus.com'),
  (7, 'Logistics Pro', 'Empresa de log�stica internacional', 'contact@logisticspro.com'),
  (8, 'Tech Starters', 'Incubadora de startups tecnol�gicos', 'info@techstarters.com'),
  (9, 'Real Estate Solutions', 'Consultor�a inmobiliaria', 'contact@realestate.com'),
  (10, 'Financial Insights', 'Consultor�a financiera', 'support@financialinsights.com');

INSERT INTO Trabajador (IDtrabajador, nombre, segundoNombre, apellidoPaterno, apellidoMaterno, FechaNacimiento, correoElectronico)
VALUES
  (1, 'Juan', 'Carlos', 'Gonz�lez', 'P�rez', '1990-05-15', 'juan.gonzalez@email.com'),
  (2, 'Mar�a', 'Isabel', 'Mart�nez', 'L�pez', '1988-10-22', 'maria.martinez@email.com'),
  (3, 'Alejandro', NULL, 'Rodr�guez', 'S�nchez', '1995-03-30', 'alejandro.rodriguez@email.com'),
  (4, 'Laura', 'Patricia', 'G�mez', 'D�az', '1992-07-12', 'laura.gomez@email.com'),
  (5, 'Roberto', NULL, 'Hern�ndez', 'Ram�rez', '1987-12-18', 'roberto.hernandez@email.com'),
  (6, 'Ana', 'Carolina', 'Ruiz', 'Torres', '1993-09-25', 'ana.ruiz@email.com'),
  (7, 'Javier', 'Antonio', 'Flores', 'Vargas', '1985-04-08', 'javier.flores@email.com'),
  (8, 'Paula', NULL, 'Jim�nez', 'Garc�a', '1994-06-05', 'paula.jimenez@email.com'),
  (9, 'Daniel', 'Andr�s', 'P�rez', 'Moreno', '1991-01-20', 'daniel.perez@email.com'),
  (10, 'Silvia', 'Elena', 'Dominguez', 'Mendoza', '1989-11-03', 'silvia.dominguez@email.com');

INSERT INTO Curriculum (IDcurriculum, IDtrabajador)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (6, 6),
  (7, 7),
  (8, 8),
  (9, 9),
  (10, 10);

INSERT INTO Educacion (IDeducacion, IDcurriculum, NombreCentroEstudios)
VALUES
  (1, 1, 'Universidad Nacional Aut�noma de M�xico'),
  (2, 2, 'Universidad Complutense de Madrid'),
  (3, 3, 'Tecnol�gico de Monterrey'),
  (4, 4, 'Universidad de Buenos Aires'),
  (5, 5, 'University of California, Berkeley'),
  (6, 6, 'Universidad de Sevilla'),
  (7, 7, 'Universidad Aut�noma de Barcelona'),
  (8, 8, 'Universidad de Salamanca'),
  (9, 9, 'Instituto Polit�cnico Nacional'),
  (10, 10, 'University of Oxford');

-- Supongamos que las certificaciones son binarios (solo indicar presencia)
INSERT INTO Certificacion (IDcertificaciones, IDcurriculum, Certificacion)
VALUES
  (1, 1, 0x),
  (2, 2, 0x),
  (3, 3, 0x),
  (4, 4, 0x),
  (5, 5, 0x),
  (6, 6, 0x),
  (7, 7, 0x),
  (8, 8, 0x),
  (9, 9, 0x),
  (10, 10, 0x);

INSERT INTO Skill (IDskill, IDcurriculum, Skills)
VALUES
  (1, 1, 'Java'),
  (2, 2, 'Photoshop'),
  (3, 3, 'JavaScript'),
  (4, 4, 'Econom�a'),
  (5, 5, 'Machine Learning, Deep Learning, NLP'),
  (6, 6, 'Derecho Laboral'),
  (7, 7, 'Log�stica, Gesti�n de Inventarios, Transporte'),
  (8, 8, 'Marketing Digital, SEO, SEM'),
  (9, 9, 'Redes'),
  (10, 10, 'Gesti�n Financiera, Contabilidad, Econom�a'),
  (11, 1, 'SQL'),
  (12, 1, 'Python'),
  (13, 2, 'InDesign'),
  (14, 3, 'React'),
  (15, 4, 'Finanzas'),
  (16, 4, 'Analisis de datos'),
  (17, 4, 'Data Science'),
  (18, 6, 'Derecho Penal'),
  (19, 6, 'Derecho Civil'),
  (20, 9, 'Linux');


INSERT INTO Idioma (IDidioma, IDcurriculum, idioma)
VALUES
  (1, 1, 'Ingl�s'),
  (2, 2, 'Espa�ol'),
  (3, 3, 'Espa�ol'),
  (4, 4, 'Espa�ol'),
  (5, 5, 'Ingl�s'),
  (6, 6, 'Espa�ol'),
  (7, 7, 'Catal�n'),
  (8, 8, 'Espa�ol'),
  (9, 9, 'Espa�ol'),
  (11, 1, 'Franc�s'),
  (12, 1, 'Ingl�s'),
  (13, 2, 'Franc�s'),
  (14, 3, 'Ingl�s'),
  (15, 4, 'Portugues'),
  (16, 4, 'Ingl�s'),
  (17, 4, 'Franc�s'),
  (18, 9, 'Catalan');


INSERT INTO InteresLaboral (IDinteresLaboral, IDcurriculum, Intereses)
VALUES
  (1, 1, 'Desarrollo Web'),
  (2, 2, 'Publicidad'),
  (3, 3, 'Desarrollo de Software'),
  (4, 4, 'An�lisis Financiero'),
  (5, 5, 'Investigaci�n'),
  (6, 6, 'Derecho Corporativo'),
  (7, 7, 'Log�stica Internacional'),
  (8, 8, 'Marketing Digital'),
  (9, 9, 'Seguridad Inform�tica'),
  (10, 10, 'Finanzas'),
  (11, 1, 'Inteligencia Artificial'),
  (12, 2, 'Dise�o Gr�fico'),
  (13, 3, 'Gesti�n de Proyectos'),
  (14, 6, ' Propiedad Intelectual'),
  (15, 6, ' Analisis estadistico'),
  (16, 6, 'Derecho Empresarial');


  INSERT INTO TipoTelefono (IDtipoTelefono, TipoTelefono, Codigo, NumeroTelefono)
VALUES
  (1, 'Oficina', '+52', '1234567890'),
  (2, 'Celular', '+52', '9876543210'),
  (3, 'Emergencia', '+52', '5555555555'),
  (4, 'Personal', '+52', '7777777777'),
  (5, 'Oficina', '+34', '111111111'),
  (6, 'Celular', '+34', '222222222'),
  (7, 'Personal', '+34', '333333333'),
  (8, 'Oficina', '+1', '9999999999'),
  (9, 'Celular', '+1', '8888888888'),
  (10, 'Emergencia', '+1', '7777777777');


INSERT INTO TelefonoTrabajador (IDTelfTrabajador, IDtrabajador, IDtipoTelefono)
VALUES
  (1, 1, 2),  -- Trabajador Juan Gonz�lez, Celular
  (2, 2, 1),  -- Trabajador Mar�a Mart�nez, Oficina
  (3, 3, 2),  -- Trabajador Alejandro Rodr�guez, Celular
  (4, 4, 3),  -- Trabajador Laura G�mez, Emergencia
  (5, 5, 1),  -- Trabajador Roberto Hern�ndez, Oficina
  (6, 6, 2),  -- Trabajador Ana Ruiz, Celular
  (7, 7, 1),  -- Trabajador Javier Flores, Oficina
  (8, 8, 2),  -- Trabajador Paula Jim�nez, Celular
  (9, 9, 1),  -- Trabajador Daniel P�rez, Oficina
  (10, 10, 2);  -- Trabajador Silvia Dom�nguez, Celular


INSERT INTO Estado (IDestado, EstadoSolicitud)
VALUES
  (1, 'Pendiente'),
  (2, 'Aceptada'),
  (3, 'Rechazada'),
  (4, 'En Proceso'),
  (5, 'Finalizada'),
  (6, 'Cancelada'),
  (7, 'En Revisi�n'),
  (8, 'En Espera'),
  (9, 'En Evaluaci�n'),
  (10, 'En Progreso');


INSERT INTO OfertaLaboral (IDofertaLaboral, IDempresa, Titulo, Descripcion, FechaDePublicacion)
VALUES
  (1, 1, 'Desarrollador Full Stack', 'Desarrollo de aplicaciones web full stack utilizando tecnolog�as modernas', '2023-01-15'),
  (2, 2, 'Dise�ador Gr�fico Senior', 'Dise�o y creaci�n de contenido visual para campa�as publicitarias', '2023-02-20'),
  (3, 3, 'Analista Financiero Principal', 'An�lisis financiero detallado y gesti�n de inversiones', '2023-03-10'),
  (4, 4, 'Ingeniero de Software', 'Desarrollo y mantenimiento de sistemas y aplicaciones empresariales', '2023-04-05'),
  (5, 5, 'Gerente de Log�stica Internacional', 'Gesti�n de operaciones log�sticas a nivel global', '2023-05-12'),
  (6, 6, 'Especialista en Marketing Digital', 'Estrategias de marketing digital y generaci�n de leads', '2023-06-18'),
  (7, 7, 'Abogado Corporativo', 'Asesoramiento legal a empresas y gesti�n de contratos corporativos', '2023-07-25'),
  (8, 8, 'Especialista en Seguridad Inform�tica', 'Protecci�n de sistemas y datos contra amenazas cibern�ticas', '2023-08-30'),
  (9, 9, 'Profesor de Matem�ticas', 'Docencia y formaci�n acad�mica en matem�ticas avanzadas', '2023-09-08'),
  (10, 10, 'Consultor Financiero Senior', 'Asesoramiento financiero estrat�gico para clientes corporativos', '2023-10-15'),
  (11, 2, 'Analista senioe', 'Docencia y formaci�n acad�mica en matem�ticas avanzadas', '2023-09-08'),
  (12, 2, 'Profesor de ingles', 'Docencia y formaci�n acad�mica en matem�ticas avanzadas', '2023-09-01'),
  (13, 9, 'Gerente proyectos', 'Docencia y formaci�n acad�mica en matem�ticas avanzadas', '2023-09-11'),
  (14, 9, 'Data scientist', 'Docencia y formaci�n acad�mica en matem�ticas avanzadas', '2023-09-12'),
  (15, 3, 'CEO', 'Docencia y formaci�n acad�mica en matem�ticas avanzadas', '2023-11-06'),
  (16, 3, 'Profesor de Lengua', 'Docencia y formaci�n acad�mica en matem�ticas avanzadas', '2023-10-07');

INSERT INTO CategoriaOferta (IDcategoriaOferta, IDofertaLaboral, nombre, Descripcion)
VALUES
  (1, 1, 'Desarrollo Web', 'Posiciones relacionadas con el desarrollo de aplicaciones web'),
  (2, 2, 'Dise�o Gr�fico', 'Posiciones relacionadas con la creaci�n de contenido visual'),
  (3, 3, 'Analista Financiero', 'Posiciones relacionadas con el an�lisis y gesti�n financiera'),
  (4, 4, 'Ingenier�a de Software', 'Posiciones relacionadas con la ingenier�a de software y sistemas'),
  (5, 5, 'Log�stica Internacional', 'Posiciones relacionadas con la gesti�n de la cadena de suministro global'),
  (6, 6, 'Marketing Digital', 'Posiciones relacionadas con estrategias de marketing online'),
  (7, 7, 'Derecho Corporativo', 'Posiciones relacionadas con asesoramiento legal a empresas'),
  (8, 8, 'Seguridad Inform�tica', 'Posiciones relacionadas con la protecci�n de sistemas y datos'),
  (9, 9, 'Educaci�n', 'Posiciones relacionadas con la ense�anza y formaci�n acad�mica'),
  (10, 10, 'Consultor�a Financiera', 'Posiciones relacionadas con consultor�a en gesti�n financiera');

INSERT INTO Requisito (IDrequisito, IDoferta, requisito)
VALUES
  (1, 1, 'Experiencia m�nima de 3 a�os en desarrollo web'),
  (2, 2, 'Dominio avanzado de Adobe Creative Suite'),
  (3, 3, 'T�tulo universitario en Finanzas, Econom�a o carrera af�n'),
  (4, 4, 'Conocimiento profundo de Java y frameworks asociados'),
  (5, 5, 'Experiencia previa en gesti�n de log�stica internacional'),
  (6, 6, 'Certificaci�n en Google Ads y SEO'),
  (7, 7, 'Licenciatura en Derecho y experiencia en derecho corporativo'),
  (8, 8, 'Conocimiento en ciberseguridad y experiencia en auditor�as'),
  (9, 9, 'Grado en Matem�ticas y experiencia en docencia'),
  (10, 10, 'M�ster en Finanzas o equivalente y experiencia en consultor�a financiera');


INSERT INTO Postulacion (IDpostulacion, IDtrabajador, IDoferta, IDestado, FechaPostulacion)
VALUES
  (1, 1, 1, 1, '2023-01-20'),
  (2, 2, 2, 2, '2023-02-25'),
  (3, 3, 3, 1, '2023-03-12'),
  (4, 4, 4, 3, '2023-04-18'),
  (5, 5, 5, 1, '2023-05-22'),
  (6, 6, 6, 2, '2023-06-28'),
  (7, 7, 7, 1, '2023-07-30'),
  (8, 8, 8, 2, '2023-08-30'),
  (9, 9, 9, 1, '2023-09-10'),
  (10, 1, 1, 2, '2023-10-18'),
  (11, 1, 1, 2, '2023-08-30'),
  (12, 7, 3, 2, '2023-11-18'),
  (13, 5, 2, 2, '2023-10-18'),
  (14, 5, 3, 2, '2023-03-18'),
  (15, 5, 4, 2, '2023-04-18'),
  (16, 3, 5, 2, '2023-05-18'),
  (17, 3, 3, 2, '2023-07-18'),
  (18, 9, 6, 2, '2023-08-18'),
  (19, 1, 2, 2, '2023-10-18'),
  (20, 5, 3, 2, '2023-03-18'),
  (21, 7, 4, 2, '2023-04-18'),
  (22, 3, 5, 2, '2023-05-18'),
  (23, 9, 3, 2, '2023-07-18');



INSERT INTO ResultadoEntrevista (IDResultadoEntrevista, Resultado)
VALUES
  (1, 'Aceptado'),
  (2, 'Rechazado'),
  (3, 'En Espera'),
  (4, 'Pendiente'),
  (5, 'Cancelado'),
  (6, 'Finalizado'),
  (7, 'Exitoso'),
  (8, 'Negativo'),
  (9, 'Positivo'),
  (10, 'Condicional');


INSERT INTO Entrevista (IDEntrevista, IDofertaLaboral, IDtrabajador, IDResultadoEntrevista, FechaEntrevista)
VALUES
  (1, 1, 1, 1, '2023-01-25'),
  (2, 2, 2, 2, '2023-03-01'),
  (3, 3, 3, 1, '2023-03-20'),
  (4, 4, 4, 3, '2023-04-25'),
  (5, 5, 5, 1, '2023-06-01'),
  (6, 6, 6, 2, '2023-07-10'),
  (7, 7, 7, 1, '2023-08-15'),
  (8, 8, 8, 2, '2023-09-20'),
  (9, 9, 9, 1, '2023-10-05'),
  (10, 10, 10, 2, '2023-11-15');

INSERT INTO TelefonoEmpresa (IDTelfEmpresa, IDempresa, numeroTelefono)
VALUES
  (1, 1, '123-456-7890'),
  (2, 2, '234-567-8901'),
  (3, 3, '345-678-9012'),
  (4, 4, '456-789-0123'),
  (5, 5, '567-890-1234'),
  (6, 6, '678-901-2345'),
  (7, 7, '789-012-3456'),
  (8, 8, '890-123-4567'),
  (9, 9, '901-234-5678'),
  (10, 10, '012-345-6789');


INSERT INTO AnexoTelefono (IDAnexoTelefono, IDTelefono, NombreDeAnexo, numeroDeAnexo)
VALUES
  (1, 1, 'Recepci�n', '100'),
  (2, 2, 'Ventas', '101'),
  (3, 3, 'Soporte', '102'),
  (4, 4, 'Recursos Humanos', '103'),
  (5, 5, 'Administraci�n', '104'),
  (6, 6, 'Marketing', '105'),
  (7, 7, 'Log�stica', '106'),
  (8, 8, 'Innovaci�n', '107'),
  (9, 9, 'Consultor�a', '108'),
  (10, 10, 'Finanzas', '109');


INSERT INTO DireccionEmpresa (IDdireccionEmpresa, IDempresa, direccion, numero, oficina)
VALUES
  (1, 1, 'Avenida Reforma', 100, '1A'),
  (2, 2, 'Calle Mayor', 50, '2B'),
  (3, 3, 'Avenida Insurgentes', 200, '3C'),
  (4, 4, 'Calle 13', 150, '4D'),
  (5, 5, 'Boulevard de los H�roes', 300, '5E'),
  (6, 6, 'Avenida Las Palmas', 400, '6F'),
  (7, 7, 'Calle Principal', 500, '7G'),
  (8, 8, 'Avenida Central', 600, '8H'),
  (9, 9, 'Calle Segunda', 700, '9I'),
  (10, 10, 'Avenida del Parque', 800, '10J');
