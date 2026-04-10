use medicent
DELIMITER //
-- registro de movimiento de inventario -- 
CREATE PROCEDURE sp_RegistrarMovimientoInventario(
    IN p_medicamento_id INT,
    IN p_cantidad FLOAT,
    IN p_tipo_movimiento ENUM('Entrada', 'Salida'),
    IN p_tipo_cantidad ENUM('Unidades', 'Gramos', 'Mililitros')
)
BEGIN
    INSERT INTO Inventario (
        Medicamento_Id_Medicamento, 
        cantidad, 
        tipo_movimiento, 
        tipo_cantidad, 
        fecha_actualizacion
    )
    VALUES (p_medicamento_id, p_cantidad, p_tipo_movimiento, p_tipo_cantidad, NOW());
END //

DELIMITER ;

DELIMITER //

-- actualizacion de contraseñas -- 
CREATE PROCEDURE sp_ActualizarPassword(
    IN p_usuario_id INT,
    IN p_nueva_password VARCHAR(255)
)
BEGIN
    UPDATE Usuario 
    SET contraseña = p_nueva_password 
    WHERE Id_Usuario = p_usuario_id;
END //

DELIMITER ;

-- Reporte de Pacientes con Tratamientos Activos --
DELIMITER //

CREATE PROCEDURE sp_ListarPacientesEnTratamiento()
BEGIN
    SELECT 
        U.nombre_usuario, 
        U.apellido_usuario, 
        T.fecha_inicio, 
        T.fecha_finalizacion,
        P.tipo_paciente
    FROM Usuario U
    JOIN Paciente P ON U.Id_Usuario = P.Usuario_Id_Usuario
    JOIN Tratamiento T ON U.Id_Usuario = T.Usuario_Id_Usuario
    ORDER BY T.fecha_inicio DESC;
END //

DELIMITER ;

CALL sp_RegistrarMovimientoInventario(1, 50, 'Entrada', 'Unidades');
select*from Inventario
order by fecha_actualizacion desc
limit 1;