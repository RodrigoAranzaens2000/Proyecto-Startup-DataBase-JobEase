USE JobEase

-- Verificación de Referencias

SELECT * FROM Trabajador;
SELECT * FROM Postulacion;
SELECT * FROM OfertaLaboral;
SELECT * FROM Empresa;
SELECT * FROM Curriculum;
SELECT * FROM Educacion;
SELECT * FROM Certificacion;
SELECT * FROM Skill;
SELECT * FROM Idioma;
SELECT * FROM InteresLaboral;
SELECT * FROM TipoTelefono;
SELECT * FROM TelefonoTrabajador;
SELECT * FROM CategoriaOferta;
SELECT * FROM Estado;

SELECT * FROM Requisito;

SELECT * FROM ResultadoEntrevista;
SELECT * FROM Entrevista;
SELECT * FROM TelefonoEmpresa;
SELECT * FROM AnexoTelefono;
SELECT * FROM DireccionEmpresa;


-- Consulta 1: Esta función devuelve una tabla con los trabajadores que poseen una habilidad específica.

DROP FUNCTION fn_TrabajadoresPorHabilidad

CREATE FUNCTION fn_TrabajadoresPorHabilidad (@Habilidad VARCHAR(50))
RETURNS TABLE
AS
RETURN
(
    SELECT T.IDtrabajador, T.nombre, T.apellidoPaterno, T.apellidoMaterno
    FROM Trabajador T
    JOIN Curriculum C ON T.IDtrabajador = C.IDtrabajador
    JOIN Skill S ON C.IDcurriculum = S.IDcurriculum
    WHERE S.Skills LIKE '%' + @Habilidad + '%'
);

SELECT * 
FROM fn_TrabajadoresPorHabilidad('Java');




-- Consulta 2 : Función de Tabla de Varias Instrucciones - Ofertas laborales activas por empresa

DROP FUNCTION fn_OfertasLaboralesActivasPorEmpresa
CREATE FUNCTION fn_OfertasLaboralesActivasPorEmpresa (@IDempresa INT)
RETURNS @OfertasActivas TABLE
(
    IDofertaLaboral INT,
    Titulo VARCHAR(255),
    Descripcion VARCHAR(255),
    FechaDePublicacion DATE
)
AS
BEGIN
    INSERT INTO @OfertasActivas
    SELECT O.IDofertaLaboral, O.Titulo, O.Descripcion, O.FechaDePublicacion
    FROM OfertaLaboral O
    JOIN Estado E ON O.IDofertaLaboral = E.IDestado
    WHERE O.IDempresa = @IDempresa
      AND E.EstadoSolicitud NOT IN ('Cancelada', 'Finalizada');
    RETURN;
END;

SELECT * 
FROM fn_OfertasLaboralesActivasPorEmpresa(1);




-- Consulta 3 : Esta función en línea devuelve todas las postulaciones realizadas por un trabajador específico.

DROP Function fn_PostulacionesPorTrabajador
CREATE FUNCTION fn_PostulacionesPorTrabajador (@IDtrabajador INT)
RETURNS TABLE
AS
RETURN
(
    SELECT P.IDpostulacion, P.IDoferta, O.Titulo, P.FechaPostulacion
    FROM Postulacion P
    JOIN OfertaLaboral O ON P.IDoferta = O.IDofertaLaboral
    WHERE P.IDtrabajador = @IDtrabajador
);

SELECT * FROM fn_PostulacionesPorTrabajador(1);




-- Consulta 4: Esta función de tabla en línea muestra todos los trabajadores que han sido entrevistados para una oferta laboral específica.

DROP FUNCTION 
CREATE FUNCTION fn_TrabajadoresEntrevistados (@IDoferta INT)
RETURNS TABLE
AS
RETURN
(
    SELECT DISTINCT E.IDtrabajador, T.nombre, T.apellidoPaterno, T.apellidoMaterno
    FROM Entrevista E
    JOIN Trabajador T ON E.IDtrabajador = T.IDtrabajador
    WHERE E.IDofertaLaboral = @IDoferta
);

SELECT * FROM fn_TrabajadoresEntrevistados(1);





-- Consulta 5 : Esta función de tabla de varias instrucciones muestra los idiomas que un trabajador domina según su currículum.

DROP FUNCTION fn_IdiomasDominadosPorTrabajador
CREATE FUNCTION fn_IdiomasDominadosPorTrabajador (@IDtrabajador INT)
RETURNS TABLE
AS
RETURN
(
    SELECT I.idioma
    FROM idioma I
    WHERE I.IDcurriculum = (SELECT IDcurriculum FROM Curriculum WHERE IDtrabajador = @IDtrabajador)
);

SELECT * FROM fn_IdiomasDominadosPorTrabajador(1);





-- Consulta 6: Esta función de tabla en línea muestra las certificaciones obtenidas por un trabajador específico.

DROP FUNCTION fn_CertificacionesPorTrabajador
CREATE FUNCTION fn_CertificacionesPorTrabajador (@IDtrabajador INT)
RETURNS TABLE
AS
RETURN
(
    SELECT C.Certificacion
    FROM Certificacion C
    JOIN Curriculum Cur ON C.IDcurriculum = Cur.IDcurriculum
    WHERE Cur.IDtrabajador = @IDtrabajador
);

SELECT * FROM fn_CertificacionesPorTrabajador(1);





-- Consulta 7: Este stored procedure actualizará el estado de una postulación y, opcionalmente, eliminará la postulación si el nuevo estado es "Rechazado".
-- Utilizaremos transacciones para asegurar la integridad de los datos y revertir los cambios en caso de error

DROP PROCEDURE sp_ActualizarEstadoPostulacion
CREATE PROCEDURE sp_ActualizarEstadoPostulacion
    @IDpostulacion INT,
    @NuevoEstado INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Actualizar el estado de la postulación
        UPDATE Postulacion
        SET IDestado = @NuevoEstado
        WHERE IDpostulacion = @IDpostulacion;

        -- Si el nuevo estado es "Rechazado", eliminar la postulación
        IF @NuevoEstado = (SELECT IDestado FROM Estado WHERE EstadoSolicitud = 'Rechazado')
        BEGIN
            DELETE FROM Postulacion
            WHERE IDpostulacion = @IDpostulacion;
        END

        -- Confirmar la transacción
        COMMIT;
        PRINT '¡Transacción completada exitosamente!';

    END TRY
    BEGIN CATCH
        -- Si hay un error, revertir la transacción
        ROLLBACK;
        PRINT '¡Se produjo un error! La transacción ha sido revertida.';
        THROW;
    END CATCH
END;

EXEC sp_ActualizarEstadoPostulacion @IDpostulacion = 1, @NuevoEstado = 3;





-- Consulta 8 : Este sp registra una nueva oferta laboral en la base de datos, asegurando que se inserten correctamente los datos relacionados en varias tablas y 
-- utilizando transacciones para mantener la consistencia de los datos.

DROP PROCEDURE Sp_RegistrarNuevaOfertaLaboral
CREATE PROCEDURE sp_RegistrarNuevaOfertaLaboral
    @IDempresa INT,
    @Titulo VARCHAR(255),
    @Descripcion VARCHAR(255),
    @FechaDePublicacion DATE,
    @Categorias VARCHAR(500)  -- Categorías separadas por comas
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Insertar nueva oferta laboral
        DECLARE @IDoferta INT;
        INSERT INTO OfertaLaboral (IDempresa, Titulo, Descripcion, FechaDePublicacion)
        VALUES (@IDempresa, @Titulo, @Descripcion, @FechaDePublicacion);

        SET @IDoferta = SCOPE_IDENTITY();

        -- Insertar categorías de oferta laboral
        INSERT INTO CategoriaOferta (IDofertaLaboral, nombre)
        SELECT @IDoferta, value
        FROM STRING_SPLIT(@Categorias, ',');

        -- Confirmar la transacción
        COMMIT;
        PRINT '¡Nueva oferta laboral registrada correctamente!';

    END TRY
    BEGIN CATCH
        -- Si hay un error, revertir la transacción
        ROLLBACK;
        PRINT '¡Error al registrar la oferta laboral! La transacción ha sido revertida.';
        THROW;
    END CATCH
END;


EXEC sp_RegistrarNuevaOfertaLaboral 
    @IDempresa = 1,
    @Titulo = 'Desarrollador Full Stack',
    @Descripcion = 'Buscamos un desarrollador con experiencia en tecnologías frontend y backend.',
    @FechaDePublicacion = '2024-06-25',
    @Categorias = 'Desarrollo Web,Programación,Frontend,Backend';




-- Consulta 9: Este stored procedure devuelve detalles de todas las entrevistas realizadas por un trabajador específico, 
-- incluyendo la información de la oferta laboral y el resultado de la entrevista.


DROP PROCEDURE sp_ObtenerDetallesEntrevistasPorTrabajador
CREATE PROCEDURE sp_ObtenerDetallesEntrevistasPorTrabajador
    @IDtrabajador INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT E.IDEntrevista, O.Titulo AS TituloOferta, E.FechaEntrevista, RE.Resultado
    FROM Entrevista E
    JOIN OfertaLaboral O ON E.IDofertaLaboral = O.IDofertaLaboral
    JOIN ResultadoEntrevista RE ON E.IDResultadoEntrevista = RE.IDResultadoEntrevista
    WHERE E.IDtrabajador = @IDtrabajador;
END;


EXEC sp_ObtenerDetallesEntrevistasPorTrabajador @IDtrabajador = 1;




-- Consulta 10:  análisis de la evolución temporal de las postulaciones y contrataciones, junto con un sistema de puntuación para los trabajadores basado en su desempeño. 


SELECT 
    t.IDtrabajador,
    CONCAT(t.nombre , ' ' ,t.apellidoPaterno )AS NombreTrabajador,
    (
        SELECT COUNT(DISTINCT s.Skills)
        FROM Skill s
        JOIN Curriculum c ON s.IDcurriculum = c.IDcurriculum
        WHERE c.IDtrabajador = t.IDtrabajador
    ) AS NumeroSkills,
    (
        SELECT COUNT(DISTINCT i.idioma)
        FROM idioma i
        JOIN Curriculum c ON i.IDcurriculum = c.IDcurriculum
        WHERE c.IDtrabajador = t.IDtrabajador
    ) AS NumeroIdiomas,
    (
        SELECT TOP 1 co.nombre
        FROM CategoriaOferta co
        JOIN OfertaLaboral ol ON co.IDofertaLaboral = ol.IDofertaLaboral
        JOIN Postulacion p ON ol.IDofertaLaboral = p.IDoferta
        WHERE p.IDtrabajador = t.IDtrabajador
        GROUP BY co.nombre
        ORDER BY COUNT(*) DESC
    ) AS CategoriaPreferida,
    SUM(CASE WHEN p.IDestado = 2 THEN 1 ELSE 0 END) AS PostulacionesAceptadas,
    SUM(CASE WHEN re.Resultado = 'Aceptado' THEN 1 ELSE 0 END) AS EntrevistasExitosas,
    (
        SELECT STRING_AGG(Mes + ': ' + CAST(Total AS VARCHAR), ', ') --cadena que muestra la distribucion de postulaciones por mes para el año 2023.
        FROM (
            SELECT 
                CASE 
                    WHEN MONTH(p2.FechaPostulacion) = 1 THEN 'Ene'
                    WHEN MONTH(p2.FechaPostulacion) = 2 THEN 'Feb'
                    WHEN MONTH(p2.FechaPostulacion) = 3 THEN 'Mar'
                    WHEN MONTH(p2.FechaPostulacion) = 4 THEN 'Abr'
                    WHEN MONTH(p2.FechaPostulacion) = 5 THEN 'May'
                    WHEN MONTH(p2.FechaPostulacion) = 6 THEN 'Jun'
                    WHEN MONTH(p2.FechaPostulacion) = 7 THEN 'Jul'
                    WHEN MONTH(p2.FechaPostulacion) = 8 THEN 'Ago'
                    WHEN MONTH(p2.FechaPostulacion) = 9 THEN 'Sep'
                    WHEN MONTH(p2.FechaPostulacion) = 10 THEN 'Oct'
                    WHEN MONTH(p2.FechaPostulacion) = 11 THEN 'Nov'
                    WHEN MONTH(p2.FechaPostulacion) = 12 THEN 'Dic'
                END AS Mes,
                COUNT(*) AS Total
            FROM Postulacion p2
            WHERE p2.IDtrabajador = t.IDtrabajador AND YEAR(p2.FechaPostulacion) = 2023
            GROUP BY MONTH(p2.FechaPostulacion)
        ) AS MensualPostulaciones
    ) AS DistribucionMensualPostulaciones,
    AVG(DATEDIFF(DAY, ol.FechaDePublicacion, p.FechaPostulacion)) AS PromedioTiempoRespuesta,
    (
        SELECT TOP 1 e.nombre
        FROM Empresa e
        JOIN OfertaLaboral ol2 ON e.IDempresa = ol2.IDempresa
        JOIN Postulacion p2 ON ol2.IDofertaLaboral = p2.IDoferta
        WHERE p2.IDtrabajador = t.IDtrabajador AND p2.IDestado = 2
        GROUP BY e.IDempresa, e.nombre
        ORDER BY COUNT(*) DESC
    ) AS EmpresaPreferida,
    (
        SUM(CASE WHEN p.IDestado = 2 THEN 1 ELSE 0 END) * 10 +
        SUM(CASE WHEN re.Resultado = 'Aceptado' THEN 1 ELSE 0 END) * 15 +
        COUNT(DISTINCT ol.IDempresa) * 5 +
        (SELECT COUNT(DISTINCT s.Skills) FROM Skill s JOIN Curriculum c ON s.IDcurriculum = c.IDcurriculum WHERE c.IDtrabajador = t.IDtrabajador) * 2 +
        (SELECT COUNT(DISTINCT i.idioma) FROM idioma i JOIN Curriculum c ON i.IDcurriculum = c.IDcurriculum WHERE c.IDtrabajador = t.IDtrabajador) * 3 -
        ISNULL(AVG(DATEDIFF(DAY, ol.FechaDePublicacion, p.FechaPostulacion)), 0)
    ) AS PuntuacionTrabajador,
    ROW_NUMBER() OVER (ORDER BY -- ROW_NUMBER() asigna un numero UNICO secuencial a cada fila dentro de la particion de un conjunto de resultados, comenzando en 1 para la primera fila en cada particion.
        (SUM(CASE WHEN p.IDestado = 2 THEN 1 ELSE 0 END) * 10 + -- OVER (ORDER BY ... DESC):  Especifica como organizar los datos antes de aplicar la funcion de ventana.
         SUM(CASE WHEN re.Resultado = 'Aceptado' THEN 1 ELSE 0 END) * 15 +
         COUNT(DISTINCT ol.IDempresa) * 5 +
         (SELECT COUNT(DISTINCT s.Skills) FROM Skill s JOIN Curriculum c ON s.IDcurriculum = c.IDcurriculum WHERE c.IDtrabajador = t.IDtrabajador) * 2 +
         (SELECT COUNT(DISTINCT i.idioma) FROM idioma i JOIN Curriculum c ON i.IDcurriculum = c.IDcurriculum WHERE c.IDtrabajador = t.IDtrabajador) * 3 -
         ISNULL(AVG(DATEDIFF(DAY, ol.FechaDePublicacion, p.FechaPostulacion)), 0)) DESC
    ) AS RankingTrabajador
FROM 
    Trabajador t
LEFT JOIN Postulacion p ON t.IDtrabajador = p.IDtrabajador
LEFT JOIN OfertaLaboral ol ON p.IDoferta = ol.IDofertaLaboral
LEFT JOIN Entrevista e ON t.IDtrabajador = e.IDtrabajador
LEFT JOIN ResultadoEntrevista re ON e.IDResultadoEntrevista = re.IDResultadoEntrevista
WHERE 
    YEAR(p.FechaPostulacion) = 2023
GROUP BY 
    t.IDtrabajador, t.nombre, t.apellidoPaterno
HAVING 
    COUNT(p.IDpostulacion) > 0
ORDER BY 
    PuntuacionTrabajador DESC


