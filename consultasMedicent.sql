use Medicent;


--------- CONSULTAS -----------

------- muestra los usuarios
SELECT * FROM Usuario;

------- muestra los pacientes 
SELECT * FROM Paciente;

------ muestra los cuidadores 
SELECT * FROM Cuidador;

-------- cantidad de pacientes ------
SELECT COUNT(*) AS total_pacientes
FROM Paciente;

------- nombres que inician por C 
SELECT * FROM Usuario 
WHERE nombre_usuario like 'C%';

------- nombres terminados en L 
SELECT * FROM Usuario 
WHERE nombre_usuario like '%L';

------ promedio de peso de los pacientes ----
SELECT AVG(peso) AS promedio_peso 
FROM Paciente;

------- medicamentos que estan proximos a vencer 
SELECT nombreMedicamento, fecha_vencimiento
FROM Medicamento
WHERE fecha_vencimiento <= DATE_ADD(CURDATE(), INTERVAL 30 DAY);

--------- medicamentos registrados 
SELECT nombreMedicamento, concentracion, unidad_concentracion
FROM Medicamento;


---------- JOINS -----------

---------- pacientes con su informacion personal 
SELECT 
U.nombre_usuario,
U.apellido_usuario,
U.correo,
P.tipo_sangre,
P.peso,
P.estatura
FROM Paciente P
JOIN Usuario U 
ON P.Usuario_Id_Usuario = U.Id_Usuario;

--------- Medicamentos con su tipo y vía de administración
SELECT 
M.nombreMedicamento,
T.nombre AS tipo_medicamento,
V.nombre AS via_administracion
FROM Medicamento M
JOIN tipoMedicamento T 
ON M.Id_tipoMedicamento = T.Id_tipoMedicamento
JOIN ViaAdministracion V 
ON M.Id_ViaAdministracion = V.Id_ViaAdministracion;

----------- tratamientos con el nombre del paciente 
SELECT
T.Id_Tratamiento,
U.nombre_usuario,
U.apellido_usuario,
T.fecha_inicio,
T.fecha_finalizacion
FROM Tratamiento T
JOIN Usuario U
ON T.Usuario_Id_Usuario = U.Id_Usuario;

--------- medicamentos que tiene cada tratamiento
SELECT
U.nombre_usuario,
U.apellido_usuario,
M.nombreMedicamento,
TM.dosis,
TM.horario
FROM Tratamiento_Medicamento TM
JOIN Medicamento M
ON TM.Medicamento_Id = M.Id_Medicamento
JOIN Tratamiento T
ON TM.Tratamiento_Id = T.Id_Tratamiento
JOIN Usuario U
ON T.Usuario_Id_Usuario = U.Id_Usuario;

---------- subconsultas --------------

------- pacientes que tienen tratamiento 
SELECT nombre_usuario, apellido_usuario
FROM Usuario
WHERE Id_Usuario IN (
    SELECT Usuario_Id_Usuario
    FROM Tratamiento
);

------ medicamentos que estan en el inventario
SELECT nombreMedicamento
FROM Medicamento
WHERE Id_Medicamento IN (
    SELECT Medicamento_Id_Medicamento
    FROM Inventario
);

--------- pacientes con alergias 
SELECT nombre_usuario, apellido_usuario
FROM Usuario
WHERE Id_Usuario IN (
    SELECT Usuario_Id_Usuario
    FROM Paciente
    WHERE tipo_alergia != 'Ninguna'
);


------------ pacientes con tratamientos activos
SELECT 
U.nombre_usuario,
U.apellido_usuario,
T.fecha_inicio,
T.fecha_finalizacion
FROM Usuario U
JOIN Tratamiento T
ON U.Id_Usuario = T.Usuario_Id_Usuario
WHERE U.Id_Usuario IN (
    SELECT Usuario_Id_Usuario
    FROM Paciente
);

------- medicamentos usados en tratamientos 
SELECT nombreMedicamento
FROM Medicamento
WHERE Id_Medicamento IN (
    SELECT Medicamento_Id
    FROM Tratamiento_Medicamento
);

------- pacientes con alergias registradas 
SELECT 
U.nombre_usuario,
U.apellido_usuario,
P.tipo_alergia,
P.nombre_alergia
FROM Paciente P
JOIN Usuario U
ON P.Usuario_Id_Usuario = U.Id_Usuario
WHERE P.tipo_alergia != 'Ninguna';

---------- alertas con nombres de usuario
SELECT 
U.nombre_usuario,
U.apellido_usuario,
A.tipo_alerta,
A.fecha_alerta
FROM Alerta A
JOIN Usuario U
ON A.Usuario_Id = U.Id_Usuario;

------ inventario total por medicamento
SELECT 
M.nombreMedicamento,
SUM(I.cantidad) AS total_stock
FROM Inventario I
JOIN Medicamento M
ON I.Medicamento_Id_Medicamento = M.Id_Medicamento
GROUP BY M.nombreMedicamento;