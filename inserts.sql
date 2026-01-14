-- =========================
-- CLIENTE (30)
-- =========================
INSERT INTO svarela.Cliente
(tipo_identificacion, identificacion, nombre, apellido, telefono, email, fecha_nacimiento, creado_en)
VALUES
('CEDULA','2000000001','Juan','Gómez','099900001','juan.gomez@mail.com','1990-01-12','2024-01-02'),
('CEDULA','2000000002','María','Fernández','099900002','maria.fernandez@mail.com','1991-02-18','2024-01-04'),
('CEDULA','2000000003','Carlos','Pereyra','099900003','carlos.pereyra@mail.com','1988-03-25','2024-01-06'),
('CEDULA','2000000004','Ana','Martínez','099900004','ana.martinez@mail.com','1992-04-10','2024-01-08'),
('CEDULA','2000000005','Luis','Rodríguez','099900005','luis.rodriguez@mail.com','1989-05-19','2024-01-10'),
('CEDULA','2000000006','Sofía','López','099900006','sofia.lopez@mail.com','1994-06-22','2024-01-12'),
('CEDULA','2000000007','Diego','Acosta','099900007','diego.acosta@mail.com','1990-07-08','2024-01-14'),
('CEDULA','2000000008','Valeria','Suárez','099900008','valeria.suarez@mail.com','1995-08-17','2024-01-16'),
('CEDULA','2000000009','Martín','Ríos','099900009','martin.rios@mail.com','1987-09-03','2024-01-18'),
('CEDULA','2000000010','Lucía','Navarro','099900010','lucia.navarro@mail.com','1992-10-26','2024-01-20'),

('CEDULA','2000000011','Federico','Herrera','099900011','federico.herrera@mail.com','1991-11-12','2024-02-01'),
('CEDULA','2000000012','Camila','Vega','099900012','camila.vega@mail.com','1993-12-05','2024-02-03'),
('CEDULA','2000000013','Pablo','Molina','099900013','pablo.molina@mail.com','1988-01-27','2024-02-05'),
('CEDULA','2000000014','Florencia','Cabrera','099900014','florencia.cabrera@mail.com','1995-02-14','2024-02-07'),
('CEDULA','2000000015','Ricardo','Benítez','099900015','ricardo.benitez@mail.com','1990-03-09','2024-02-09'),
('CEDULA','2000000016','Paula','Silva','099900016','paula.silva@mail.com','1989-04-26','2024-02-11'),
('CEDULA','2000000017','Julián','Ortega','099900017','julian.ortega@mail.com','1994-05-15','2024-02-13'),
('CEDULA','2000000018','Agustina','Morales','099900018','agustina.morales@mail.com','1991-06-22','2024-02-15'),
('CEDULA','2000000019','Nicolás','Paz','099900019','nicolas.paz@mail.com','1987-07-07','2024-02-17'),
('CEDULA','2000000020','Carla','Ibarra','099900020','carla.ibarra@mail.com','1993-08-19','2024-02-19'),

('CEDULA','2000000021','Esteban','Luna','099900021','esteban.luna@mail.com','1990-09-01','2024-03-01'),
('CEDULA','2000000022','Rocío','Farias','099900022','rocio.farias@mail.com','1992-10-12','2024-03-03'),
('CEDULA','2000000023','Gonzalo','Medina','099900023','gonzalo.medina@mail.com','1989-11-29','2024-03-05'),
('CEDULA','2000000024','Natalia','Quiroga','099900024','natalia.quiroga@mail.com','1996-12-17','2024-03-07'),
('CEDULA','2000000025','Hernán','Sosa','099900025','hernan.sosa@mail.com','1985-01-06','2024-03-09'),
('CEDULA','2000000026','Milagros','Roldán','099900026','milagros.roldan@mail.com','1991-02-15','2024-03-11'),
('CEDULA','2000000027','Tomás','Correa','099900027','tomas.correa@mail.com','1994-03-18','2024-03-13'),
('CEDULA','2000000028','Julieta','Peralta','099900028','julieta.peralta@mail.com','1990-04-22','2024-03-15'),
('CEDULA','2000000029','Bruno','Giménez','099900029','bruno.gimenez@mail.com','1992-05-30','2024-03-17'),
('CEDULA','2000000030','Micaela','Domínguez','099900030','micaela.dominguez@mail.com','1988-06-11','2024-03-19');

-- =========================
-- MEMBRESIA
-- =========================
INSERT INTO svarela.Membresia (tipo, precio, duracion_meses) VALUES
('Mensual',40,1),
('Trimestral',110,3),
('Semestral',200,6),
('Anual',360,12);

-- =========================
-- ENTRENADOR (8)
-- =========================
INSERT INTO svarela.Entrenador (nombre, especialidad, telefono) VALUES
('Marcos López','Musculación','099800001'),
('Luciana Pérez','Cardio','099800002'),
('Cristian Álvarez','CrossFit','099800003'),
('Valentina Romero','Yoga','099800004'),
('Sebastián Torres','Funcional','099800005'),
('Camila Fernández','Pilates','099800006'),
('Federico Núñez','HIIT','099800007'),
('Agostina Bravo','Zumba','099800008');

-- =========================
-- INSCRIPCION (60)
-- =========================
INSERT INTO svarela.Inscripcion
(id_cliente, id_membresia, fecha_inicio, fecha_fin, estado, creado_en)
SELECT
  (g % 30) + 1,
  (g % 4) + 1,
  DATE '2024-01-01' + (g * 2),
  DATE '2024-01-01' + (g * 2) + INTERVAL '30 days',
  'ACTIVA',
  DATE '2024-01-01' + (g * 2)
FROM generate_series(1,60) g;

-- =========================
-- PAGO (80)
-- =========================
INSERT INTO svarela.Pago
(id_inscripcion, fecha_pago, monto, metodo_pago, creado_en)
SELECT
  (g % 60) + 1,
  DATE '2024-01-01' + (g * 2),
  CASE
    WHEN g % 4 = 1 THEN 40
    WHEN g % 4 = 2 THEN 110
    WHEN g % 4 = 3 THEN 200
    ELSE 360
  END,
  CASE
    WHEN g % 3 = 0 THEN 'EFECTIVO'
    WHEN g % 3 = 1 THEN 'TRANSFERENCIA'
    ELSE 'TARJETA'
  END,
  DATE '2024-01-01' + (g * 2)
FROM generate_series(1,80) g;

-- =========================
-- CLASE (12)
-- =========================
INSERT INTO svarela.Clase
(nombre, horario, id_entrenador, cupo_maximo) VALUES
('CrossFit','06:00',3,25),
('Yoga','08:00',4,20),
('HIIT','09:00',7,30),
('Pilates','10:00',6,20),
('Zumba','18:00',8,35),
('Funcional','19:00',5,25),
('Musculación','20:00',1,30),
('Cardio','07:00',2,20),
('Movilidad','11:00',3,15),
('Core','17:00',5,20),
('Stretching','16:00',4,15),
('Personal','21:00',1,10);
