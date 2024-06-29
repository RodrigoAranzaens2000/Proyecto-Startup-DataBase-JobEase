-- PASO 1	
USE JobEase

-- PASO 2
INSERT INTO Empresa (IDempresa, nombre, descripcion, CorreoElectronico)
VALUES
  (1, 'Tech Solutions Inc', 'Empresa de desarrollo de software', 'info@techsolutions.com'),
  (2, 'Creative Designs Ltd', 'Agencia de diseño gráfico', 'contacto@creativedesigns.com'),
  (3, 'HealthCare Innovations', 'Empresa de tecnología médica', 'contact@healthcareinnovations.com'),
  (4, 'Green Energy Solutions', 'Consultoría en energías renovables', 'info@greenenergy.com'),
  (5, 'Food Express', 'Servicio de entrega de alimentos', 'support@foodexpress.com'),
  (6, 'Education Plus', 'Plataforma educativa en línea', 'info@educationplus.com'),
  (7, 'Logistics Pro', 'Empresa de logística internacional', 'contact@logisticspro.com'),
  (8, 'Tech Starters', 'Incubadora de startups tecnológicos', 'info@techstarters.com'),
  (9, 'Real Estate Solutions', 'Consultoría inmobiliaria', 'contact@realestate.com'),
  (10, 'Financial Insights', 'Consultoría financiera', 'support@financialinsights.com');

INSERT INTO Trabajador (IDtrabajador, nombre, segundoNombre, apellidoPaterno, apellidoMaterno, FechaNacimiento, correoElectronico)
VALUES
  (1, 'Juan', 'Carlos', 'González', 'Pérez', '1990-05-15', 'juan.gonzalez@email.com'),
  (2, 'María', 'Isabel', 'Martínez', 'López', '1988-10-22', 'maria.martinez@email.com'),
  (3, 'Alejandro', NULL, 'Rodríguez', 'Sánchez', '1995-03-30', 'alejandro.rodriguez@email.com'),
  (4, 'Laura', 'Patricia', 'Gómez', 'Díaz', '1992-07-12', 'laura.gomez@email.com'),
  (5, 'Roberto', NULL, 'Hernández', 'Ramírez', '1987-12-18', 'roberto.hernandez@email.com'),
  (6, 'Ana', 'Carolina', 'Ruiz', 'Torres', '1993-09-25', 'ana.ruiz@email.com'),
  (7, 'Javier', 'Antonio', 'Flores', 'Vargas', '1985-04-08', 'javier.flores@email.com'),
  (8, 'Paula', NULL, 'Jiménez', 'García', '1994-06-05', 'paula.jimenez@email.com'),
  (9, 'Daniel', 'Andrés', 'Pérez', 'Moreno', '1991-01-20', 'daniel.perez@email.com'),
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
  (1, 1, 'Universidad Nacional Autónoma de México'),
  (2, 2, 'Universidad Complutense de Madrid'),
  (3, 3, 'Tecnológico de Monterrey'),
  (4, 4, 'Universidad de Buenos Aires'),
  (5, 5, 'University of California, Berkeley'),
  (6, 6, 'Universidad de Sevilla'),
  (7, 7, 'Universidad Autónoma de Barcelona'),
  (8, 8, 'Universidad de Salamanca'),
  (9, 9, 'Instituto Politécnico Nacional'),
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
  (4, 4, 'Economía'),
  (5, 5, 'Machine Learning, Deep Learning, NLP'),
  (6, 6, 'Derecho Laboral'),
  (7, 7, 'Logística, Gestión de Inventarios, Transporte'),
  (8, 8, 'Marketing Digital, SEO, SEM'),
  (9, 9, 'Redes'),
  (10, 10, 'Gestión Financiera, Contabilidad, Economía'),
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
  (1, 1, 'Inglés'),
  (2, 2, 'Español'),
  (3, 3, 'Español'),
  (4, 4, 'Español'),
  (5, 5, 'Inglés'),
  (6, 6, 'Español'),
  (7, 7, 'Catalán'),
  (8, 8, 'Español'),
  (9, 9, 'Español'),
  (11, 1, 'Francés'),
  (12, 1, 'Inglés'),
  (13, 2, 'Francés'),
  (14, 3, 'Inglés'),
  (15, 4, 'Portugues'),
  (16, 4, 'Inglés'),
  (17, 4, 'Francés'),
  (18, 9, 'Catalan');


INSERT INTO InteresLaboral (IDinteresLaboral, IDcurriculum, Intereses)
VALUES
  (1, 1, 'Desarrollo Web'),
  (2, 2, 'Publicidad'),
  (3, 3, 'Desarrollo de Software'),
  (4, 4, 'Análisis Financiero'),
  (5, 5, 'Investigación'),
  (6, 6, 'Derecho Corporativo'),
  (7, 7, 'Logística Internacional'),
  (8, 8, 'Marketing Digital'),
  (9, 9, 'Seguridad Informática'),
  (10, 10, 'Finanzas'),
  (11, 1, 'Inteligencia Artificial'),
  (12, 2, 'Diseño Gráfico'),
  (13, 3, 'Gestión de Proyectos'),
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
  (1, 1, 2),  -- Trabajador Juan González, Celular
  (2, 2, 1),  -- Trabajador María Martínez, Oficina
  (3, 3, 2),  -- Trabajador Alejandro Rodríguez, Celular
  (4, 4, 3),  -- Trabajador Laura Gómez, Emergencia
  (5, 5, 1),  -- Trabajador Roberto Hernández, Oficina
  (6, 6, 2),  -- Trabajador Ana Ruiz, Celular
  (7, 7, 1),  -- Trabajador Javier Flores, Oficina
  (8, 8, 2),  -- Trabajador Paula Jiménez, Celular
  (9, 9, 1),  -- Trabajador Daniel Pérez, Oficina
  (10, 10, 2);  -- Trabajador Silvia Domínguez, Celular


INSERT INTO Estado (IDestado, EstadoSolicitud)
VALUES
  (1, 'Pendiente'),
  (2, 'Aceptada'),
  (3, 'Rechazada'),
  (4, 'En Proceso'),
  (5, 'Finalizada'),
  (6, 'Cancelada'),
  (7, 'En Revisión'),
  (8, 'En Espera'),
  (9, 'En Evaluación'),
  (10, 'En Progreso');


INSERT INTO OfertaLaboral (IDofertaLaboral, IDempresa, Titulo, Descripcion, FechaDePublicacion)
VALUES
  (1, 1, 'Desarrollador Full Stack', 'Desarrollo de aplicaciones web full stack utilizando tecnologías modernas', '2023-01-15'),
  (2, 2, 'Diseñador Gráfico Senior', 'Diseño y creación de contenido visual para campañas publicitarias', '2023-02-20'),
  (3, 3, 'Analista Financiero Principal', 'Análisis financiero detallado y gestión de inversiones', '2023-03-10'),
  (4, 4, 'Ingeniero de Software', 'Desarrollo y mantenimiento de sistemas y aplicaciones empresariales', '2023-04-05'),
  (5, 5, 'Gerente de Logística Internacional', 'Gestión de operaciones logísticas a nivel global', '2023-05-12'),
  (6, 6, 'Especialista en Marketing Digital', 'Estrategias de marketing digital y generación de leads', '2023-06-18'),
  (7, 7, 'Abogado Corporativo', 'Asesoramiento legal a empresas y gestión de contratos corporativos', '2023-07-25'),
  (8, 8, 'Especialista en Seguridad Informática', 'Protección de sistemas y datos contra amenazas cibernéticas', '2023-08-30'),
  (9, 9, 'Profesor de Matemáticas', 'Docencia y formación académica en matemáticas avanzadas', '2023-09-08'),
  (10, 10, 'Consultor Financiero Senior', 'Asesoramiento financiero estratégico para clientes corporativos', '2023-10-15'),
  (11, 2, 'Analista senioe', 'Docencia y formación académica en matemáticas avanzadas', '2023-09-08'),
  (12, 2, 'Profesor de ingles', 'Docencia y formación académica en matemáticas avanzadas', '2023-09-01'),
  (13, 9, 'Gerente proyectos', 'Docencia y formación académica en matemáticas avanzadas', '2023-09-11'),
  (14, 9, 'Data scientist', 'Docencia y formación académica en matemáticas avanzadas', '2023-09-12'),
  (15, 3, 'CEO', 'Docencia y formación académica en matemáticas avanzadas', '2023-11-06'),
  (16, 3, 'Profesor de Lengua', 'Docencia y formación académica en matemáticas avanzadas', '2023-10-07');

INSERT INTO CategoriaOferta (IDcategoriaOferta, IDofertaLaboral, nombre, Descripcion)
VALUES
  (1, 1, 'Desarrollo Web', 'Posiciones relacionadas con el desarrollo de aplicaciones web'),
  (2, 2, 'Diseño Gráfico', 'Posiciones relacionadas con la creación de contenido visual'),
  (3, 3, 'Analista Financiero', 'Posiciones relacionadas con el análisis y gestión financiera'),
  (4, 4, 'Ingeniería de Software', 'Posiciones relacionadas con la ingeniería de software y sistemas'),
  (5, 5, 'Logística Internacional', 'Posiciones relacionadas con la gestión de la cadena de suministro global'),
  (6, 6, 'Marketing Digital', 'Posiciones relacionadas con estrategias de marketing online'),
  (7, 7, 'Derecho Corporativo', 'Posiciones relacionadas con asesoramiento legal a empresas'),
  (8, 8, 'Seguridad Informática', 'Posiciones relacionadas con la protección de sistemas y datos'),
  (9, 9, 'Educación', 'Posiciones relacionadas con la enseñanza y formación académica'),
  (10, 10, 'Consultoría Financiera', 'Posiciones relacionadas con consultoría en gestión financiera');

INSERT INTO Requisito (IDrequisito, IDoferta, requisito)
VALUES
  (1, 1, 'Experiencia mínima de 3 años en desarrollo web'),
  (2, 2, 'Dominio avanzado de Adobe Creative Suite'),
  (3, 3, 'Título universitario en Finanzas, Economía o carrera afín'),
  (4, 4, 'Conocimiento profundo de Java y frameworks asociados'),
  (5, 5, 'Experiencia previa en gestión de logística internacional'),
  (6, 6, 'Certificación en Google Ads y SEO'),
  (7, 7, 'Licenciatura en Derecho y experiencia en derecho corporativo'),
  (8, 8, 'Conocimiento en ciberseguridad y experiencia en auditorías'),
  (9, 9, 'Grado en Matemáticas y experiencia en docencia'),
  (10, 10, 'Máster en Finanzas o equivalente y experiencia en consultoría financiera');


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
  (1, 1, 'Recepción', '100'),
  (2, 2, 'Ventas', '101'),
  (3, 3, 'Soporte', '102'),
  (4, 4, 'Recursos Humanos', '103'),
  (5, 5, 'Administración', '104'),
  (6, 6, 'Marketing', '105'),
  (7, 7, 'Logística', '106'),
  (8, 8, 'Innovación', '107'),
  (9, 9, 'Consultoría', '108'),
  (10, 10, 'Finanzas', '109');


INSERT INTO DireccionEmpresa (IDdireccionEmpresa, IDempresa, direccion, numero, oficina)
VALUES
  (1, 1, 'Avenida Reforma', 100, '1A'),
  (2, 2, 'Calle Mayor', 50, '2B'),
  (3, 3, 'Avenida Insurgentes', 200, '3C'),
  (4, 4, 'Calle 13', 150, '4D'),
  (5, 5, 'Boulevard de los Héroes', 300, '5E'),
  (6, 6, 'Avenida Las Palmas', 400, '6F'),
  (7, 7, 'Calle Principal', 500, '7G'),
  (8, 8, 'Avenida Central', 600, '8H'),
  (9, 9, 'Calle Segunda', 700, '9I'),
  (10, 10, 'Avenida del Parque', 800, '10J');
