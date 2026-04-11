CREATE DATABASE IF NOT EXISTS Medicent
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE Medicent;

CREATE TABLE tipoDocumento (
    idtipoDocumento INT PRIMARY KEY AUTO_INCREMENT, -- Nombre ajustado a la imagen
    nombre ENUM('Cédula de Ciudadanía', 'Tarjeta de Identidad', 'Cédula de Extranjería', 'Pasaporte') NOT NULL
) ENGINE=InnoDB;


CREATE TABLE Usuario (
    Id_Usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre_usuario VARCHAR(100) NOT NULL,
    apellido_usuario VARCHAR(100) NOT NULL,
    numero_documento VARCHAR(45) UNIQUE NOT NULL,
    correo VARCHAR(100) UNIQUE,
    telefono VARCHAR(15),
    fecha_nacimiento DATE,
    rol ENUM('Administrador','Paciente','Cuidador') NOT NULL,
    contraseña VARCHAR(255) NOT NULL,
    tipoDocumento_idtipoDoc INT,

    CONSTRAINT chk_email_format 
    CHECK (correo LIKE '%@%.%'),

    CONSTRAINT fk_user_tipoDoc 
    FOREIGN KEY (tipoDocumento_idtipoDoc)
    REFERENCES tipoDocumento(idtipoDocumento)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TRIGGER tr_encriptar_clave 
BEFORE INSERT ON Usuario 
FOR EACH ROW 
SET NEW.contraseña = SHA2(NEW.contraseña, 256);

CREATE TABLE Paciente (
    Id_Paciente INT PRIMARY KEY AUTO_INCREMENT,
    estatura FLOAT,
    peso FLOAT,
    tipo_sangre ENUM('A+','A-','B+','B-','AB+','AB-','O+','O-'),
    dieta VARCHAR(100),

    tipo_paciente ENUM('Frecuente','Ocasional','Cronico'),

    tipo_alergia ENUM(
        'Farmacologica',
        'Alimentaria',
        'Ambiental',
        'Ninguna'
    ),

    nombre_alergia VARCHAR(100),

    Usuario_Id_Usuario INT UNIQUE,

    CONSTRAINT fk_paciente_user
    FOREIGN KEY (Usuario_Id_Usuario)
    REFERENCES Usuario(Id_Usuario)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE cuidador (
    Id_cuidador INT PRIMARY KEY AUTO_INCREMENT,

    Usuario_Id_Usuario INT UNIQUE,

    CONSTRAINT fk_cuidador_user
    FOREIGN KEY (Usuario_Id_Usuario)
    REFERENCES Usuario(Id_Usuario)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE tipoMedicamento (
    Id_tipoMedicamento INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE ViaAdministracion (
    Id_ViaAdministracion INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Medicamento (
    Id_Medicamento INT PRIMARY KEY AUTO_INCREMENT,

    nombreMedicamento VARCHAR(100) NOT NULL,

    concentracion DECIMAL(10,2),
    unidad_concentracion VARCHAR(20),

    frecuenciaDiaria INT,

    fecha_vencimiento DATE,

    Id_tipoMedicamento INT,
    Id_ViaAdministracion INT,

    CONSTRAINT fk_med_tipo
    FOREIGN KEY (Id_tipoMedicamento)
    REFERENCES tipoMedicamento(Id_tipoMedicamento),

    CONSTRAINT fk_med_via
    FOREIGN KEY (Id_ViaAdministracion)
    REFERENCES ViaAdministracion(Id_ViaAdministracion)

) ENGINE=InnoDB;

CREATE TABLE Inventario (
    Id_Inventario INT PRIMARY KEY AUTO_INCREMENT,

    fecha_actualizacion DATETIME DEFAULT CURRENT_TIMESTAMP,

    tipo_cantidad ENUM(
        'Unidades',
        'Gramos',
        'Mililitros'
    ),

    cantidad FLOAT,

    tipo_movimiento ENUM(
        'Entrada',
        'Salida'
    ),

    Medicamento_Id_Medicamento INT,

    CONSTRAINT fk_inv_med
    FOREIGN KEY (Medicamento_Id_Medicamento)
    REFERENCES Medicamento(Id_Medicamento)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Tratamiento (
    Id_Tratamiento INT PRIMARY KEY AUTO_INCREMENT,

    fecha_inicio DATE,
    fecha_finalizacion DATE,

    Usuario_Id_Usuario INT,

    CONSTRAINT fk_trat_user
    FOREIGN KEY (Usuario_Id_Usuario)
    REFERENCES Usuario(Id_Usuario)
    ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Tratamiento_Medicamento (

    Id INT AUTO_INCREMENT PRIMARY KEY,

    Tratamiento_Id INT,
    Medicamento_Id INT,

    dosis VARCHAR(50),
    horario VARCHAR(50),

    CONSTRAINT fk_tm_trat
    FOREIGN KEY (Tratamiento_Id)
    REFERENCES Tratamiento(Id_Tratamiento)
    ON DELETE CASCADE,

    CONSTRAINT fk_tm_med
    FOREIGN KEY (Medicamento_Id)
    REFERENCES Medicamento(Id_Medicamento)
    ON DELETE CASCADE

) ENGINE=InnoDB;

CREATE TABLE Adherencia (
    Id_Adherencia INT PRIMARY KEY AUTO_INCREMENT,

    fecha_generacion DATETIME DEFAULT CURRENT_TIMESTAMP,

    porcentaje_adherencia FLOAT,

    Tratamiento_Id_Tratamiento INT,

    CONSTRAINT fk_adh_trat
    FOREIGN KEY (Tratamiento_Id_Tratamiento)
    REFERENCES Tratamiento(Id_Tratamiento)
    ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Alerta (
    Id_Alerta INT PRIMARY KEY AUTO_INCREMENT,

    fecha_alerta DATETIME DEFAULT CURRENT_TIMESTAMP,

    tipo_alerta VARCHAR(50),

    Usuario_Id INT,

    CONSTRAINT fk_alert_user
    FOREIGN KEY (Usuario_Id)
    REFERENCES Usuario(Id_Usuario)
    ON DELETE CASCADE
) ENGINE=InnoDB;

