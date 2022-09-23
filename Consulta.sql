--A. Mostrar los datos de los autores que tengan más de un libro publicado

SELECT A.IdAutor, A.Nombre, A.Nacionalidad FROM Autor A
INNER JOIN LibAut L
ON A.IdAutor = L.IdAutor
GROUP BY A.IdAutor, A.Nombre, A.Nacionalidad
HAVING COUNT(A.IdAutor) > 1

--B. Mostrar los nombre y edad de los estudiantes

SELECT Nombre, Edad FROM Estudiante

/* C. Mostrar: Titulo, editorial, autor, fecha de préstamo, 
nombre y carrera de los estudiantes con libros prestados y 
la fecha del préstamo siendo la fecha un valor alfanumérico */

SELECT L.Titulo, L.Editorial, A.Nombre, P.FechaPrestamo, E.Nombre, E.Carrera FROM Autor A
INNER JOIN LibAut LA
ON A.IdAutor = LA.IdAutor
INNER JOIN Libro L
ON LA.IdLibro = L.IdLibro
INNER JOIN Prestamo P
ON L.IdLibro = P.IdLibro
INNER JOIN Estudiante E
ON P.IdLector = E.IdLector
WHERE P.Devuelto = 1

/*D. Crear un Procedimiento Almacenado que muestre los libros 
de un determinado Autor que se especifique si esta prestado y 
a quien. */
GO

CREATE OR ALTER PROCEDURE LibroDeterminado 
@Autor VARCHAR(40) = NULL
AS
BEGIN
	SELECT A.Nombre, A.Nacionalidad, L.Titulo, L.Editorial, L.Area, P.Devuelto, E.Nombre FROM Autor A
	INNER JOIN LibAut LA
	ON A.IdAutor = LA.IdAutor
	INNER JOIN Libro L 
	ON LA.IdLibro = L.IdLibro
	INNER JOIN Prestamo P
	ON L.IdLibro = P.IdLibro
	INNER JOIN Estudiante E
	ON P.IdLector = E.IdLector
	WHERE A.Nombre = @Autor
END

EXEC LibroDeterminado 'Liz Bella'