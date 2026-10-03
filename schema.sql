-- =====================================================
-- Control de pagos de estudiantes
-- Pega todo este archivo en el SQL Editor de Neon y ejecútalo.
-- Es seguro ejecutarlo más de una vez (no duplica datos).
-- =====================================================

CREATE TABLE IF NOT EXISTS estudiantes (
  id          INTEGER      PRIMARY KEY,           -- N.º de la lista original
  nombre      VARCHAR(150) NOT NULL,
  pagado      BOOLEAN,                            -- TRUE = pagó, FALSE = no ha pagado, NULL = sin marcar
  actualizado TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_estudiantes_pagado ON estudiantes (pagado);

INSERT INTO estudiantes (id, nombre) VALUES
  (1, 'Salome Muñoz Ateortúa'),
  (2, 'Jose David Beltran'),
  (3, 'Isabella Cano Bernal'),
  (4, 'Maria Jose Bonilla Alvarez'),
  (5, 'Marías Cardona Cañas'),
  (6, 'Valeria Méndez Cañas'),
  (7, 'Salome Restrepo Cano'),
  (8, 'Alison Manuela Cardona Saldarriaga'),
  (9, 'Manuela Cardona'),
  (10, 'Samuel Duque Correa'),
  (11, 'Samuel Echavarria'),
  (12, 'Alejandro Bolivar Echeverri'),
  (13, 'Alex Mauricio Escobar Coutin'),
  (14, 'Juan Esteban Garcia Perez'),
  (15, 'Maria Antonia Garcia López'),
  (16, 'Elizabeth Duarte Giraldo'),
  (17, 'Tomas Lujan Gomez'),
  (18, 'Valentina Aguirre Gómez'),
  (19, 'Jesús David Granada Petro'),
  (20, 'Kelly Jhojana Guevara Jaramillo'),
  (21, 'Jony Andres Hernandez'),
  (22, 'Tomas Agudelo Jimenez'),
  (23, 'Stefania Osorio Lozano'),
  (24, 'Samuel Cardona Lyam'),
  (25, 'Valentina Sierra Mesa'),
  (26, 'Samuel Aron Montañez Sánchez'),
  (27, 'Nicol Gamboa Morante'),
  (28, 'Sebastian Alexs Moreno Jaramillo'),
  (29, 'Tomás Martinez Tangarife'),
  (30, 'Edwars Torres'),
  (31, 'Salome González Valencia'),
  (32, 'Dylan Ramirez Vanegas'),
  (33, 'Katherinn Alarcón Vélez'),
  (34, 'Samuel Díaz Sánchez')
ON CONFLICT (id) DO NOTHING;

-- Verificación
-- SELECT * FROM estudiantes ORDER BY id;
