INSERT INTO tipoDocumento (sigla, nombre) VALUES
('CC', 'Cedula de Ciudadania'),
('TI', 'Tarjeta de Identidad'),
('CE', 'Cedula de Extranjeria'),
('PPT', 'Permiso por Proteccion Temporal'),
('PA', 'Pasaporte');

INSERT INTO ViaAdministracion (nombre) VALUES
('Oral'),
('Intramuscular'),
('Intravenosa'),
('Inhalada'),
('Topica');

INSERT INTO tipoMedicamento (nombre) VALUES
('Analgesico'),
('Antibiotico'),
('Antihistaminico'),
('Antiinflamatorio'),
('Antialergico'),
('Suplemento');

INSERT INTO Usuario
(nombre_usuario, apellido_usuario, numero_documento, correo, telefono, fecha_nacimiento, rol, contraseña, tipoDocumento_idtipoDoc)
VALUES
('Carlos','Perez','1001','carlos.perez@gmail.com','3001111111','1990-05-10','Paciente','123',1),
('Ana','Gomez','1002','ana.gomez@gmail.com','3002222222','1988-02-20','Administrador','123',1),
('Luis','Rodriguez','1003','luis.rodriguez@gmail.com','3003333333','1995-09-15','Cuidador','123',1),
('Maria','Lopez','1004','maria.lopez@gmail.com','3004444444','1992-03-30','Paciente','123',1),
('Pedro','Ramirez','1005','pedro.ramirez@gmail.com','3005555555','1987-11-05','Paciente','123',1),
('Laura','Torres','1006','laura.torres@gmail.com','3006666666','1999-07-18','Cuidador','123',1),
('Jorge','Martinez','1007','jorge.martinez@gmail.com','3007777777','1986-01-09','Paciente','123',1),
('Sofia','Castro','1008','sofia.castro@gmail.com','3008888888','1993-06-12','Paciente','123',1),
('Daniel','Vargas','1009','daniel.vargas@gmail.com','3009999999','1998-10-25','Paciente','123',1),
('Camila','Rojas','1010','camila.rojas@gmail.com','3010000000','2000-04-01','Paciente','123',1),
('Andres','Diaz','1011','andres.diaz@gmail.com','3011111111','1994-03-03','Paciente','123',1),
('Valentina','Morales','1012','valentina.morales@gmail.com','3012222222','1997-08-22','Paciente','123',1),
('Sebastian','Navarro','1013','sebastian.navarro@gmail.com','3013333333','1996-07-11','Paciente','123',1),
('Natalia','Ruiz','1014','natalia.ruiz@gmail.com','3014444444','1991-02-02','Paciente','123',1),
('Miguel','Herrera','1015','miguel.herrera@gmail.com','3015555555','1989-06-14','Cuidador','123',1),
('Paula','Mendoza','1016','paula.mendoza@gmail.com','3016666666','1995-01-01','Paciente','123',1),
('Ricardo','Silva','1017','ricardo.silva@gmail.com','3017777777','1985-12-21','Administrador','123',1),
('Diana','Cortes','1018','diana.cortes@gmail.com','3018888888','1993-09-09','Paciente','123',1),
('Felipe','Ortega','1019','felipe.ortega@gmail.com','3019999999','1990-08-18','Cuidador','123',1),
('Luisa','Guerrero','1020','luisa.guerrero@gmail.com','3020000000','1998-04-27','Administrador','123',1);


INSERT INTO Paciente
(estatura, peso, tipo_sangre, dieta, tipo_paciente, tipo_alergia, nombre_alergia, Usuario_Id_Usuario)
VALUES
(1.70,70,'O+','Baja en sal','Frecuente','Ninguna',NULL,1),
(1.65,60,'A+','Normal','Ocasional','Alimentaria','Mani',4),
(1.80,85,'B+','Baja en azucar','Cronico','Farmacologica','Penicilina',5),
(1.72,68,'AB+','Vegetariana','Frecuente','Ambiental','Polen',7),
(1.60,55,'O-','Normal','Ocasional','Ninguna',NULL,8),
(1.75,78,'A-','Baja en grasa','Frecuente','Alimentaria','Mariscos',9),
(1.69,73,'O+','Normal','Frecuente','Ninguna',NULL,10),
(1.82,90,'B-','Baja en sal','Cronico','Farmacologica','Ibuprofeno',11),
(1.66,59,'A+','Vegetariana','Ocasional','Ambiental','Polvo',12),
(1.71,76,'AB-','Normal','Frecuente','Ninguna',NULL,13),
(1.68,70,'O+','Baja en azucar','Frecuente','Alimentaria','Leche',14),
(1.74,80,'A-','Normal','Cronico','Farmacologica','Aspirina',16);


INSERT INTO cuidador (Usuario_Id_Usuario) VALUES
(3),
(6),
(15),
(19),
(2);


INSERT INTO Medicamento
(nombreMedicamento, concentracion, unidad_concentracion, frecuenciaDiaria, fecha_vencimiento, Id_tipoMedicamento, Id_ViaAdministracion)
VALUES
('Acetaminofen',500,'mg',3,'2027-03-10',1,1),
('Ibuprofeno',400,'mg',3,'2027-05-20',4,1),
('Amoxicilina',500,'mg',2,'2026-10-10',2,1),
('Loratadina',10,'mg',1,'2027-01-15',3,1),
('Diclofenaco',50,'mg',2,'2026-12-01',4,1),
('Cetirizina',10,'mg',1,'2027-04-18',3,1),
('Omeprazol',20,'mg',1,'2027-06-10',6,1),
('Naproxeno',250,'mg',2,'2026-11-20',4,1),
('Metformina',850,'mg',2,'2027-07-12',6,1),
('Azitromicina',500,'mg',1,'2027-02-14',2,1),
('Insulina',100,'ml',2,'2026-09-01',6,2),
('Paracetamol',500,'mg',3,'2027-08-10',1,1),
('Prednisona',20,'mg',1,'2026-12-20',4,1),
('Clorfenamina',4,'mg',2,'2027-01-01',3,1),
('Salbutamol',100,'ml',3,'2027-09-10',3,4);


INSERT INTO Inventario
(tipo_cantidad, cantidad, tipo_movimiento, Medicamento_Id_Medicamento)
VALUES
('Unidades',100,'Entrada',1),
('Unidades',120,'Entrada',2),
('Unidades',90,'Entrada',3),
('Unidades',80,'Entrada',4),
('Unidades',70,'Entrada',5),
('Unidades',60,'Entrada',6),
('Unidades',50,'Entrada',7),
('Unidades',40,'Entrada',8),
('Unidades',100,'Entrada',9),
('Unidades',30,'Entrada',10),
('Mililitros',200,'Entrada',11),
('Unidades',110,'Entrada',12),
('Unidades',75,'Entrada',13),
('Unidades',65,'Entrada',14),
('Mililitros',150,'Entrada',15);


INSERT INTO Tratamiento
(fecha_inicio, fecha_finalizacion, Usuario_Id_Usuario)
VALUES
('2025-01-01','2025-01-10',1),
('2025-02-01','2025-02-15',4),
('2025-03-01','2025-03-20',5),
('2025-03-10','2025-03-25',7),
('2025-04-01','2025-04-10',8),
('2025-04-05','2025-04-18',9),
('2025-05-01','2025-05-15',10),
('2025-05-10','2025-05-25',11),
('2025-06-01','2025-06-12',12),
('2025-06-10','2025-06-20',13);


INSERT INTO Tratamiento_Medicamento
(Tratamiento_Id, Medicamento_Id, dosis, horario)
VALUES
(1,1,'500 mg','Cada 8 horas'),
(2,2,'400 mg','Cada 8 horas'),
(3,3,'500 mg','Cada 12 horas'),
(4,4,'10 mg','Cada 24 horas'),
(5,5,'50 mg','Cada 12 horas'),
(6,6,'10 mg','Cada 24 horas'),
(7,7,'20 mg','Cada 24 horas'),
(8,8,'250 mg','Cada 12 horas'),
(9,9,'850 mg','Cada 12 horas'),
(10,10,'500 mg','Cada 24 horas');


INSERT INTO Adherencia
(porcentaje_adherencia, Tratamiento_Id_Tratamiento)
VALUES
(95,1),
(88,2),
(90,3),
(85,4),
(92,5);


INSERT INTO Alerta
(tipo_alerta, Usuario_Id)
VALUES
('Medicamento vencido',1),
('Recordatorio de dosis',4),
('Baja adherencia',5),
('Stock bajo',2);