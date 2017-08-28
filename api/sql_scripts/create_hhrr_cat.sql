-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.19-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for hhrr
CREATE DATABASE IF NOT EXISTS `hhrr` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `hhrr`;

-- Dumping structure for table hhrr.cat_ademic_level
CREATE TABLE IF NOT EXISTS `cat_ademic_level` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador del nivel académico',
  `name` varchar(25) NOT NULL COMMENT 'Nombre utilizado en formualrios y reportes',
  `description` varchar(100) DEFAULT NULL COMMENT 'Detalles o información adicional sobre el nivel académico',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Catálogo de niveles académicos';

-- Dumping data for table hhrr.cat_ademic_level: ~6 rows (approximately)
/*!40000 ALTER TABLE `cat_ademic_level` DISABLE KEYS */;
INSERT INTO `cat_ademic_level` (`id`, `name`, `description`) VALUES
	(1, 'Bachiller', ''),
	(2, 'Licenciatura', ''),
	(3, 'Master', ''),
	(4, 'Doctorado', ''),
	(5, 'Certificado', ''),
	(6, 'Diploma', '');
/*!40000 ALTER TABLE `cat_ademic_level` ENABLE KEYS */;

-- Dumping structure for table hhrr.cat_adjustment
CREATE TABLE IF NOT EXISTS `cat_adjustment` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador unico del tipo de ajuste.',
  `name` varchar(25) NOT NULL COMMENT 'Nombre que se usará en los formularios.',
  `description` varchar(100) DEFAULT NULL COMMENT 'Breve explicación sobre el tipo de ajuste.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Catalogo de ajustes';

-- Dumping data for table hhrr.cat_adjustment: ~2 rows (approximately)
/*!40000 ALTER TABLE `cat_adjustment` DISABLE KEYS */;
INSERT INTO `cat_adjustment` (`id`, `name`, `description`) VALUES
	(1, 'Ihss', 'Ajuste del Seguro Social'),
	(2, 'Otro', 'Otro ajuste');
/*!40000 ALTER TABLE `cat_adjustment` ENABLE KEYS */;

-- Dumping structure for table hhrr.cat_bonus
CREATE TABLE IF NOT EXISTS `cat_bonus` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador del bono.',
  `name` varchar(25) NOT NULL COMMENT 'Nombre que se usará en los formularios y la planilla.',
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Catálogo de bonos';

-- Dumping data for table hhrr.cat_bonus: ~2 rows (approximately)
/*!40000 ALTER TABLE `cat_bonus` DISABLE KEYS */;
INSERT INTO `cat_bonus` (`id`, `name`, `description`) VALUES
	(1, 'Bono anual', 'Bono anual de permanencia'),
	(2, 'Bono educativo', 'Bono por ley para empleados que ganan menos de dos salarios mínimos');
/*!40000 ALTER TABLE `cat_bonus` ENABLE KEYS */;

-- Dumping structure for table hhrr.cat_company_unit
CREATE TABLE IF NOT EXISTS `cat_company_unit` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la unidad.',
  `name` varchar(50) NOT NULL COMMENT 'Nombre de la unidad/departamento.',
  `description` varchar(200) DEFAULT NULL COMMENT 'Descripción de la unidad/departamento',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Catálogo de Unidades/Departamentos';

-- Dumping data for table hhrr.cat_company_unit: ~7 rows (approximately)
/*!40000 ALTER TABLE `cat_company_unit` DISABLE KEYS */;
INSERT INTO `cat_company_unit` (`id`, `name`, `description`) VALUES
	(1, 'Gerencia General', ''),
	(3, 'Gerencia Financiera', ''),
	(4, 'Gerencia de Operaciones', ''),
	(5, 'Gerencia Administrativa', ''),
	(6, 'Departamento de Desarrollo', ''),
	(7, 'Departamento de Servicios', ''),
	(8, 'Departamento de Ventas', '');
/*!40000 ALTER TABLE `cat_company_unit` ENABLE KEYS */;

-- Dumping structure for table hhrr.cat_contract_type
CREATE TABLE IF NOT EXISTS `cat_contract_type` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL COMMENT 'Nombre descriptivo del tipo de contrato.',
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Tipos de Contratos';

-- Dumping data for table hhrr.cat_contract_type: ~3 rows (approximately)
/*!40000 ALTER TABLE `cat_contract_type` DISABLE KEYS */;
INSERT INTO `cat_contract_type` (`id`, `name`, `description`) VALUES
	(1, 'Permanente', ''),
	(2, 'Temporal', ''),
	(3, 'Practicante', '');
/*!40000 ALTER TABLE `cat_contract_type` ENABLE KEYS */;

-- Dumping structure for table hhrr.cat_date_format
CREATE TABLE IF NOT EXISTS `cat_date_format` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT 'Nombre',
  `format` varchar(100) NOT NULL COMMENT 'Formato',
  `description` varchar(100) NOT NULL COMMENT 'Ejemplo descriptivo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Catálogo con los diferentes formatos de fecha.';

-- Dumping data for table hhrr.cat_date_format: ~3 rows (approximately)
/*!40000 ALTER TABLE `cat_date_format` DISABLE KEYS */;
INSERT INTO `cat_date_format` (`id`, `name`, `format`, `description`) VALUES
	(1, 'Corto', 'DD/MM/AAAA', '28/02/2017'),
	(2, 'Mediano', 'DD/MMM/AAAA', '28/FEB/2017'),
	(3, 'Largo', 'MMMM DD,AAAA', 'Febrero 28, 2017');
/*!40000 ALTER TABLE `cat_date_format` ENABLE KEYS */;

-- Dumping structure for table hhrr.cat_deduction
CREATE TABLE IF NOT EXISTS `cat_deduction` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la deducción.',
  `typeId` tinyint(3) unsigned NOT NULL COMMENT 'Identifica el tipo de deducción.',
  `name` varchar(25) NOT NULL COMMENT 'Nombre de la deducción.',
  `description` varchar(100) NOT NULL COMMENT 'Descripción de la deducción.',
  PRIMARY KEY (`id`),
  KEY `type` (`typeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalogo de deducciones';

-- Dumping data for table hhrr.cat_deduction: ~0 rows (approximately)
/*!40000 ALTER TABLE `cat_deduction` DISABLE KEYS */;
/*!40000 ALTER TABLE `cat_deduction` ENABLE KEYS */;

-- Dumping structure for table hhrr.cat_deduction_type
CREATE TABLE IF NOT EXISTS `cat_deduction_type` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador del tipo de deducción.',
  `name` varchar(25) NOT NULL COMMENT 'Nombre del tipo de deducción.',
  `description` varchar(100) NOT NULL COMMENT 'Descripción del tipo de deducción.',
  `isMandatory` bit(1) NOT NULL DEFAULT b'1' COMMENT 'Indica si la deducción es obligatoria.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Catálogo de los tipos de deducciones';

-- Dumping data for table hhrr.cat_deduction_type: ~2 rows (approximately)
/*!40000 ALTER TABLE `cat_deduction_type` DISABLE KEYS */;
INSERT INTO `cat_deduction_type` (`id`, `name`, `description`, `isMandatory`) VALUES
	(1, 'Ley', 'Deducciones segun la Ley de Honduras', b'1'),
	(2, 'Empresarial', 'Deducciones propias de la empresa', b'0');
/*!40000 ALTER TABLE `cat_deduction_type` ENABLE KEYS */;

-- Dumping structure for table hhrr.cat_department
CREATE TABLE IF NOT EXISTS `cat_department` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(2) NOT NULL COMMENT 'Código',
  `name` varchar(50) NOT NULL COMMENT 'Nombre del departamento',
  `postalCode` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='Catálogo de los departamentos de Honduras';

-- Dumping data for table hhrr.cat_department: ~18 rows (approximately)
/*!40000 ALTER TABLE `cat_department` DISABLE KEYS */;
INSERT INTO `cat_department` (`id`, `code`, `name`, `postalCode`) VALUES
	(1, '01', 'Atlántida', '31101'),
	(2, '02', 'Colón', '32101'),
	(3, '03', 'Comayagua', '12101, 12111'),
	(4, '04', 'Copán', '41101, 41202'),
	(5, '05', 'Cortes', '21101, 21102, 21103, 21104, 21301, 21112'),
	(6, '06', 'Choluteca', '51101, 51201'),
	(7, '07', 'El Paraíso', '13101, 13201'),
	(8, '08', 'Francisco Morazán', '11101, 12101'),
	(9, '09', 'Gracias a Dios', '33101'),
	(10, '10', 'Intibucá', '14101, 14201'),
	(11, '11', 'Islas de la Bahía', '34101, 34201, 34301'),
	(12, '12', 'La Paz', '15101, 15201'),
	(13, '13', 'Lempira', '42101, 42201'),
	(14, '14', 'Ocotepeque', '43101, 43201'),
	(15, '15', 'Olancho', '16101, 16201'),
	(16, '16', 'Santa Bárbara', '22101, 22114'),
	(17, '17', 'Valle', '52101, 52102'),
	(18, '18', 'Yoro', '53101');
/*!40000 ALTER TABLE `cat_department` ENABLE KEYS */;

-- Dumping structure for table hhrr.cat_economic_branch
CREATE TABLE IF NOT EXISTS `cat_economic_branch` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la rama económica.',
  `sector` tinyint(1) unsigned NOT NULL COMMENT 'Sector económico.',
  `description` varchar(100) NOT NULL COMMENT 'Nombre completo de la rama economica.',
  PRIMARY KEY (`id`),
  KEY `sector` (`sector`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='Catálogo de ramas económicas según la Clasificación Industrial Internacional Uniforme de todas las Actividades Económicas (OIT).';

-- Dumping data for table hhrr.cat_economic_branch: ~17 rows (approximately)
/*!40000 ALTER TABLE `cat_economic_branch` DISABLE KEYS */;
INSERT INTO `cat_economic_branch` (`id`, `sector`, `description`) VALUES
	(1, 1, 'Agricultura, ganadería, caza, silvicultura'),
	(2, 1, 'Pesca'),
	(3, 2, 'Explotación de minas y canteras'),
	(4, 2, 'Industria manufacturera'),
	(5, 2, 'Suministro de electricidad, gas y agua'),
	(6, 2, 'Construcción'),
	(7, 3, 'Comercio al por mayor y al por menor'),
	(8, 3, 'Hoteles y restaurantes'),
	(9, 3, 'Transporte, almacenamiento y comunicaciones'),
	(10, 3, 'Intermediación financiera'),
	(11, 3, 'Servicios inmobiliarios, empresariales y de alquiler'),
	(12, 3, 'Administración pública, defensa y seguridad social'),
	(13, 3, 'Educación'),
	(14, 3, 'Servicios sociales y de salud'),
	(15, 3, 'Servicios comunitarios, sociales y personales'),
	(16, 3, 'Servicios a los hogares y servicio doméstico'),
	(17, 3, 'Servicio de organizaciones extraterritoriales');
/*!40000 ALTER TABLE `cat_economic_branch` ENABLE KEYS */;

-- Dumping structure for table hhrr.cat_employee_category
CREATE TABLE IF NOT EXISTS `cat_employee_category` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Catálogo de Clasificación Profesional ';

-- Dumping data for table hhrr.cat_employee_category: ~4 rows (approximately)
/*!40000 ALTER TABLE `cat_employee_category` DISABLE KEYS */;
INSERT INTO `cat_employee_category` (`id`, `name`, `description`) VALUES
	(1, 'Trabajador manual', 'Incluye a trabajadores de servicios y vendedores del comercio, productores y trabajadores en la agricultura y pesca, ganaderos; Ocupaciones relativas al transporte, producción artesanal e industrial de tipo textil, confecciones, carpintería, albañilería, fontanería (gasfitería), mecánica, electricidad, área gráfica, química, minera, fundición de metales, producción de alimentos, de bebidas, cerámica, cueros, tabaco; ocupaciones de estriba, carga, almacenaje y bodegaje y ocupaciones de servicios personales y afines.'),
	(2, 'Administrativo', 'Conformado por empleados de oficina, ocupaciones de gestión administrativa, jurídico-legal, de planificación y de informática.'),
	(3, 'Profesionales y técnicos', 'Trabajadores con título universitario o técnico, y/o trabajadores de la educación, científicos e intelectuales.'),
	(4, 'Directivos', 'Ocupaciones de dirección en la administración pública y privada. Jefes, gerentes y administradores generales.');
/*!40000 ALTER TABLE `cat_employee_category` ENABLE KEYS */;

-- Dumping structure for table hhrr.cat_equipment_brand
CREATE TABLE IF NOT EXISTS `cat_equipment_brand` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catálogo de marcas de equipo.';

-- Dumping data for table hhrr.cat_equipment_brand: ~0 rows (approximately)
/*!40000 ALTER TABLE `cat_equipment_brand` DISABLE KEYS */;
/*!40000 ALTER TABLE `cat_equipment_brand` ENABLE KEYS */;

-- Dumping structure for table hhrr.cat_equipment_category
CREATE TABLE IF NOT EXISTS `cat_equipment_category` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catálogo de categorías de equipo.';

-- Dumping data for table hhrr.cat_equipment_category: ~0 rows (approximately)
/*!40000 ALTER TABLE `cat_equipment_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `cat_equipment_category` ENABLE KEYS */;

-- Dumping structure for table hhrr.cat_holiday
CREATE TABLE IF NOT EXISTS `cat_holiday` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador',
  `day` tinyint(1) unsigned NOT NULL COMMENT 'Día ',
  `month` tinyint(1) unsigned NOT NULL COMMENT 'Mes',
  `name` varchar(50) NOT NULL COMMENT 'Nombre del feriado',
  `description` varchar(100) NOT NULL COMMENT 'Descripción',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Catálogo de días feriados segun el código de trabajo de Honduras';

-- Dumping data for table hhrr.cat_holiday: ~8 rows (approximately)
/*!40000 ALTER TABLE `cat_holiday` DISABLE KEYS */;
INSERT INTO `cat_holiday` (`id`, `day`, `month`, `name`, `description`) VALUES
	(1, 1, 1, 'Día de Año Nuevo', ''),
	(2, 14, 4, 'Día de las Américas', ''),
	(3, 1, 5, 'Día del Trabajador', ''),
	(4, 15, 9, 'Día de la Inpendencia', ''),
	(5, 3, 10, 'Día del Soldado', ''),
	(6, 12, 10, 'Día de la Raza', ''),
	(7, 21, 10, 'Día de las Fuerzas Armadas', ''),
	(8, 25, 12, 'Día de Navidad', '');
/*!40000 ALTER TABLE `cat_holiday` ENABLE KEYS */;

-- Dumping structure for table hhrr.cat_ihss
CREATE TABLE IF NOT EXISTS `cat_ihss` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(7) NOT NULL,
  `description` varchar(50) NOT NULL,
  `value` decimal(4,2) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Catálogo de parámetros del Seguro Social.';

-- Dumping data for table hhrr.cat_ihss: ~7 rows (approximately)
/*!40000 ALTER TABLE `cat_ihss` DISABLE KEYS */;
INSERT INTO `cat_ihss` (`id`, `code`, `description`, `value`) VALUES
	(1, 'YEE_EYM', 'Enfermedad y Maternidad Empleado', 2.50),
	(2, 'YEE_IVM', 'Invalidez, Vejez y Muerte Empleado', 1.00),
	(3, 'YEE_RAP', 'Regimen de Aportaciones Privadas Empleado', 5.00),
	(4, 'YER_EYM', 'Enfermedad y Maternidad Patrono', 5.00),
	(5, 'YER_IVM', 'Invalidez, Vejez y Muerte Patrono', 2.00),
	(6, 'YER_RES', 'Reserva Laboral Patrono', 4.00),
	(7, 'YER_RAP', 'Regimen de Aportaciones Privadas Patrono', 1.50);
/*!40000 ALTER TABLE `cat_ihss` ENABLE KEYS */;

-- Dumping structure for table hhrr.cat_income
CREATE TABLE IF NOT EXISTS `cat_income` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador del ingreso',
  `typeId` tinyint(3) unsigned NOT NULL COMMENT 'Identifica el tipo de ingreso',
  `name` varchar(25) NOT NULL COMMENT 'Nombre del ingreso',
  `description` varchar(100) NOT NULL COMMENT 'Descripción del ingreso',
  PRIMARY KEY (`id`),
  KEY `type` (`typeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalogo de ingresos';

-- Dumping data for table hhrr.cat_income: ~0 rows (approximately)
/*!40000 ALTER TABLE `cat_income` DISABLE KEYS */;
/*!40000 ALTER TABLE `cat_income` ENABLE KEYS */;

-- Dumping structure for table hhrr.cat_isr_deductible
CREATE TABLE IF NOT EXISTS `cat_isr_deductible` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador unico del concepto deducible',
  `isrId` tinyint(3) unsigned NOT NULL COMMENT 'Identifica la tabla de porcentajes a que aplica el deducible',
  `concept` varchar(50) NOT NULL COMMENT 'Nombre del deducible',
  `value` decimal(10,2) unsigned DEFAULT NULL COMMENT 'Valor máximo permitido',
  `description` varchar(100) NOT NULL COMMENT 'Descripción del concepto ',
  `fromDate` date NOT NULL COMMENT 'Fecha en que entra en vigencia ',
  `toDate` date DEFAULT NULL COMMENT 'Fecha hasta la cual tiene vigencia. Se actualiza cuando se agrega un nuevo registro',
  PRIMARY KEY (`id`),
  KEY `isr_id` (`isrId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='Catálogo de los gastos deducibles del impuesto sobre la renta';

-- Dumping data for table hhrr.cat_isr_deductible: ~0 rows (approximately)
/*!40000 ALTER TABLE `cat_isr_deductible` DISABLE KEYS */;
/*!40000 ALTER TABLE `cat_isr_deductible` ENABLE KEYS */;

-- Dumping structure for table hhrr.cat_isr_percentage
CREATE TABLE IF NOT EXISTS `cat_isr_percentage` (
  `id` tinyint(3) unsigned NOT NULL COMMENT 'Identificador unico',
  `lowerLlimit1` decimal(10,2) unsigned NOT NULL COMMENT 'Límite inferior primer rango',
  `upperLimit1` decimal(10,2) unsigned NOT NULL COMMENT 'Límite superior primer rango',
  `percent1` decimal(10,2) unsigned NOT NULL COMMENT 'Porcentaje primer rango (excento)',
  `lowerLimit2` decimal(10,2) unsigned NOT NULL COMMENT 'Límite inferior segundo rango',
  `upperLimit2` decimal(10,2) unsigned NOT NULL COMMENT 'Límite superior segundo rango',
  `percent2` decimal(10,2) unsigned NOT NULL COMMENT 'Porcentaje segundo rango',
  `lowerLimit3` decimal(10,2) unsigned NOT NULL COMMENT 'Límite inferior tercer rango',
  `upperLimit3` decimal(10,2) unsigned NOT NULL COMMENT 'Límite superior tercer rango',
  `percent3` decimal(10,2) unsigned NOT NULL COMMENT 'Porcentaje tercer rango',
  `lowerLimit4` decimal(10,2) unsigned NOT NULL COMMENT 'Límite inferior cuarto rango',
  `upperLimit4` decimal(10,2) unsigned NOT NULL COMMENT 'Límite superior cuarto rango',
  `percent4` decimal(10,2) unsigned NOT NULL COMMENT 'Porcentaje cuarto rango',
  `validFrom` date NOT NULL COMMENT 'Fecha en que entra en vigencia la tabla',
  `validTo` date DEFAULT NULL COMMENT 'Fecha en que termina la vigencia de la tabla',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catálogo de los porcentajes progresivos del impuesto sobre la renta';

-- Dumping data for table hhrr.cat_isr_percentage: ~1 rows (approximately)
/*!40000 ALTER TABLE `cat_isr_percentage` DISABLE KEYS */;
INSERT INTO `cat_isr_percentage` (`id`, `lowerLlimit1`, `upperLimit1`, `percent1`, `lowerLimit2`, `upperLimit2`, `percent2`, `lowerLimit3`, `upperLimit3`, `percent3`, `lowerLimit4`, `upperLimit4`, `percent4`, `validFrom`, `validTo`) VALUES
	(0, 0.00, 145667.10, 0.00, 145667.11, 222116.50, 0.15, 222116.51, 516550.00, 0.20, 516550.01, 99999999.99, 0.25, '2017-01-01', '2017-12-31');
/*!40000 ALTER TABLE `cat_isr_percentage` ENABLE KEYS */;

-- Dumping structure for table hhrr.cat_job
CREATE TABLE IF NOT EXISTS `cat_job` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador del Puesto.',
  `name` varchar(50) NOT NULL COMMENT 'Nombre del puesto, que se usa en los formularios y reportes.',
  `responsibilities` varchar(200) NOT NULL COMMENT 'Lista de responsabilidades asignadas para ese puesto.',
  `abilities` varchar(200) NOT NULL COMMENT 'Lista de habilidades requeridas para el puesto.',
  `experience` varchar(50) NOT NULL COMMENT 'Tiempo de experiencia requerido para optar al puesto.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='Catálogo de puestos';

-- Dumping data for table hhrr.cat_job: ~10 rows (approximately)
/*!40000 ALTER TABLE `cat_job` DISABLE KEYS */;
INSERT INTO `cat_job` (`id`, `name`, `responsibilities`, `abilities`, `experience`) VALUES
	(1, 'Gerente General', '', '', ''),
	(2, 'Gerente Financiero', '', '', ''),
	(3, 'Gerente Administrativo', '', '', ''),
	(4, 'Asistente Administrativo', '', '', ''),
	(5, 'Gerente de Operaciones', '', '', ''),
	(6, 'Arquitecto', '', '', ''),
	(7, 'Coordinador', '', '', ''),
	(8, 'Analista', '', '', ''),
	(9, 'Programador Sr.', '', '', ''),
	(10, 'Programador Jr.', '', '', '');
/*!40000 ALTER TABLE `cat_job` ENABLE KEYS */;

-- Dumping structure for table hhrr.cat_job_type
CREATE TABLE IF NOT EXISTS `cat_job_type` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT 'Nombre',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='Catálogo de tipos de trabajo según la división CIUO''08';

-- Dumping data for table hhrr.cat_job_type: ~10 rows (approximately)
/*!40000 ALTER TABLE `cat_job_type` DISABLE KEYS */;
INSERT INTO `cat_job_type` (`id`, `name`) VALUES
	(1, 'Directores y gerentes'),
	(2, 'Profesionales científicos e intelectuales'),
	(3, 'Técnicos y profesionales de nivel medio'),
	(4, 'Personal de apoyo administrativo'),
	(5, 'Trabajadores de los servicios y vendedores de comercios y mercados'),
	(6, 'Agricultores y trabajadores calificados agropecuarios, forestales y pesqueros'),
	(7, 'Oficiales, operarios y artesanos de artes mecánicas y de otros oficios'),
	(8, 'Operadores de instalaciones y máquinas y ensambladores'),
	(9, 'Ocupaciones elementales'),
	(10, 'Ocupaciones militares');
/*!40000 ALTER TABLE `cat_job_type` ENABLE KEYS */;

-- Dumping structure for table hhrr.cat_law_deduction
CREATE TABLE IF NOT EXISTS `cat_law_deduction` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la deducción.',
  `name` varchar(45) NOT NULL COMMENT 'Nombre que se utiliza en los formularios y reportes.',
  `percentage` decimal(4,2) unsigned NOT NULL COMMENT 'Porcentaje que se aplicará sobre el salario.',
  `description` varchar(100) NOT NULL COMMENT 'Breve descripción sobre la deducción, debería indicar la ley que le respalda y si es posible una referencia sobre su cálculo.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Para almacenar las deducciones que son obligatorias segun la ley vigente.';

-- Dumping data for table hhrr.cat_law_deduction: ~0 rows (approximately)
/*!40000 ALTER TABLE `cat_law_deduction` DISABLE KEYS */;
/*!40000 ALTER TABLE `cat_law_deduction` ENABLE KEYS */;

-- Dumping structure for table hhrr.cat_leave_type
CREATE TABLE IF NOT EXISTS `cat_leave_type` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador del tipo de permiso',
  `name` varchar(50) NOT NULL COMMENT 'Nombre del tipo de permiso',
  `description` varchar(100) NOT NULL COMMENT 'Descripción del tipo de permiso',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catálogo de tipos de permisos';

-- Dumping data for table hhrr.cat_leave_type: ~0 rows (approximately)
/*!40000 ALTER TABLE `cat_leave_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `cat_leave_type` ENABLE KEYS */;

-- Dumping structure for table hhrr.cat_legal_form
CREATE TABLE IF NOT EXISTS `cat_legal_form` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador',
  `name` varchar(100) NOT NULL COMMENT 'Nombre o tipo de la forma jurídica',
  `partners` tinyint(3) unsigned NOT NULL COMMENT 'Cantidad mínima de socios',
  `shareCapital` decimal(10,2) unsigned NOT NULL COMMENT 'Capital social requerido ',
  `responsibility` varchar(25) NOT NULL COMMENT 'Responsabilidad',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Catálogo de formas jurídicas según el código de comercio de Honduras.';

-- Dumping data for table hhrr.cat_legal_form: ~8 rows (approximately)
/*!40000 ALTER TABLE `cat_legal_form` DISABLE KEYS */;
INSERT INTO `cat_legal_form` (`id`, `name`, `partners`, `shareCapital`, `responsibility`) VALUES
	(1, 'Comerciante Individual', 1, 5000.00, 'Ilimitada'),
	(2, 'Sociedad en Nombre Colectivo', 2, 0.00, 'Ilimitada'),
	(3, 'Sociedad en Comandita Simple', 2, 5000.00, 'Ilimitada'),
	(4, 'Sociedad de Responsabilidad Limitada', 25, 5000.00, 'Limitada'),
	(5, 'Sociedad Anónima', 2, 25000.00, 'Limitada'),
	(6, 'Sociedad en Comandita por Acciones', 2, 25000.00, 'Limitada'),
	(7, 'Sociedad de Capital Variable', 0, 0.00, ''),
	(8, 'Sociedad Cooperativa', 20, 25000.00, 'Limitada');
/*!40000 ALTER TABLE `cat_legal_form` ENABLE KEYS */;

-- Dumping structure for table hhrr.cat_mipyme
CREATE TABLE IF NOT EXISTS `cat_mipyme` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `minEmployees` smallint(5) unsigned NOT NULL,
  `maxEmployees` smallint(5) unsigned NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Catálogo de tipos de empresa segun\r\nLEY DEL FOMENTO Y DESARROLLO DE LA COMPETITIVIDAD DE LA MICRO, PEQUEÑA Y MEDIANA EMPRESA';

-- Dumping data for table hhrr.cat_mipyme: ~3 rows (approximately)
/*!40000 ALTER TABLE `cat_mipyme` DISABLE KEYS */;
INSERT INTO `cat_mipyme` (`id`, `name`, `minEmployees`, `maxEmployees`, `description`) VALUES
	(1, 'MICRO', 1, 10, 'Unidad económica con un mñinimo de una persona remunerada.'),
	(2, 'PEQUEÑA', 11, 50, ''),
	(3, 'MEDIANA', 51, 150, '');
/*!40000 ALTER TABLE `cat_mipyme` ENABLE KEYS */;

-- Dumping structure for table hhrr.cat_overtime
CREATE TABLE IF NOT EXISTS `cat_overtime` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador del tipo de hora extra',
  `name` varchar(50) NOT NULL COMMENT 'Nombre utilizado en formularios y reportes',
  `start` time NOT NULL COMMENT 'Hora en que inicia',
  `end` time NOT NULL COMMENT 'Hora en que finaliza',
  `percent` decimal(3,2) unsigned NOT NULL COMMENT 'Valor decimal del recargo a pagar: 1.00=100%, 0.25=25%',
  `description` varchar(125) NOT NULL COMMENT 'Descripción',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Catálogo de los tipos de horas extras';

-- Dumping data for table hhrr.cat_overtime: ~4 rows (approximately)
/*!40000 ALTER TABLE `cat_overtime` DISABLE KEYS */;
INSERT INTO `cat_overtime` (`id`, `name`, `start`, `end`, `percent`, `description`) VALUES
	(1, 'Tipo I', '17:00:00', '19:00:00', 0.25, 'Art 330: Recargo sobre el salario de la jornada diurna cuando se efectúe en el período diurno.'),
	(2, 'Tipo II', '19:00:00', '05:00:00', 0.50, 'Art 330: Recargo sobre el salario de la jornada diurna cuando se efectúe en el período nocturno.'),
	(3, 'Tipo III', '19:00:00', '05:00:00', 0.75, 'Art 330: Recargo sobre el salario de la jornada nocturna cuando la jornada extraordinaria sea prolongación de aquélla.'),
	(4, 'Tipo IV', '00:00:00', '24:59:59', 1.00, 'Art. 340: Recargo si se trabajare durante los días de descanso o los días feriados o de fiesta nacio');
/*!40000 ALTER TABLE `cat_overtime` ENABLE KEYS */;

-- Dumping structure for table hhrr.cat_payroll
CREATE TABLE IF NOT EXISTS `cat_payroll` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador del tipo de planilla.',
  `name` varchar(25) NOT NULL COMMENT 'Nombre de la planilla, que aparece en los reportes.',
  `description` varchar(50) NOT NULL COMMENT 'Descripcion del contenido de la planilla, cuando y porque se genera.',
  `timeUnit` tinyint(3) unsigned NOT NULL COMMENT 'Unidad de tiempo para el calculo de la remuneración. (mes, quincena, semana, dia y hora)',
  `yearlyPayments` tinyint(3) unsigned NOT NULL COMMENT 'Cantidad de veces que se paga la planilla durante el año.',
  `status` tinyint(1) unsigned NOT NULL COMMENT 'Para dar trazabilidad a la planilla, indica si ya fue aprobada y si ya fue pagada.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catálogo de los tipos de planillas';

-- Dumping data for table hhrr.cat_payroll: ~0 rows (approximately)
/*!40000 ALTER TABLE `cat_payroll` DISABLE KEYS */;
/*!40000 ALTER TABLE `cat_payroll` ENABLE KEYS */;

-- Dumping structure for table hhrr.cat_payroll_detail_deduction
CREATE TABLE IF NOT EXISTS `cat_payroll_detail_deduction` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador del detalle',
  `payrollId` tinyint(3) unsigned NOT NULL COMMENT 'Identificador de la planilla en cat_payrolls',
  `deductionId` tinyint(3) unsigned NOT NULL COMMENT 'Identificador de la deduccion en cat_deductions',
  PRIMARY KEY (`id`),
  KEY `payroll` (`payrollId`),
  KEY `deduction` (`deductionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='Contiene los conceptos de deducción que se incluiran en la planilla.';

-- Dumping data for table hhrr.cat_payroll_detail_deduction: ~0 rows (approximately)
/*!40000 ALTER TABLE `cat_payroll_detail_deduction` DISABLE KEYS */;
/*!40000 ALTER TABLE `cat_payroll_detail_deduction` ENABLE KEYS */;

-- Dumping structure for table hhrr.cat_payroll_detail_general
CREATE TABLE IF NOT EXISTS `cat_payroll_detail_general` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador del detalle',
  `payrollId` tinyint(3) unsigned NOT NULL COMMENT 'Identificador de la planilla',
  `field` tinyint(3) unsigned NOT NULL COMMENT 'Identificador del campo en la tabla de empleados que debe aparecer en los datos generales',
  PRIMARY KEY (`id`),
  KEY `payroll` (`payrollId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='Contiene los campos que se incluiran como datos generales en el detalle de la planilla.';

-- Dumping data for table hhrr.cat_payroll_detail_general: ~0 rows (approximately)
/*!40000 ALTER TABLE `cat_payroll_detail_general` DISABLE KEYS */;
/*!40000 ALTER TABLE `cat_payroll_detail_general` ENABLE KEYS */;

-- Dumping structure for table hhrr.cat_payroll_detail_income
CREATE TABLE IF NOT EXISTS `cat_payroll_detail_income` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador del detalle',
  `payrollId` tinyint(3) unsigned NOT NULL COMMENT 'Identificador de la planilla',
  `incomeId` tinyint(3) unsigned NOT NULL COMMENT 'Identificador del ingreso',
  PRIMARY KEY (`id`),
  KEY `payroll` (`payrollId`),
  KEY `income` (`incomeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='Contiene los conceptos de ingreso que incluye la planilla.';

-- Dumping data for table hhrr.cat_payroll_detail_income: ~0 rows (approximately)
/*!40000 ALTER TABLE `cat_payroll_detail_income` DISABLE KEYS */;
/*!40000 ALTER TABLE `cat_payroll_detail_income` ENABLE KEYS */;

-- Dumping structure for table hhrr.cat_payroll_type
CREATE TABLE IF NOT EXISTS `cat_payroll_type` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) CHARACTER SET utf8 NOT NULL,
  `description` varchar(100) CHARACTER SET utf8 NOT NULL,
  `howMany` tinyint(3) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table hhrr.cat_payroll_type: ~3 rows (approximately)
/*!40000 ALTER TABLE `cat_payroll_type` DISABLE KEYS */;
INSERT INTO `cat_payroll_type` (`id`, `name`, `description`, `howMany`, `status`) VALUES
	(1, 'Sueldos y Salarios', 'Sueldos y Salarios', 24, 1),
	(2, 'Aguinaldo', 'Decimo Tercer mes', 1, 1),
	(3, 'Bono', 'Bonificacion anual', 1, 1);
/*!40000 ALTER TABLE `cat_payroll_type` ENABLE KEYS */;

-- Dumping structure for table hhrr.cat_profession
CREATE TABLE IF NOT EXISTS `cat_profession` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT 'Nombre de la profesión',
  `description` varchar(100) DEFAULT NULL COMMENT 'Descripción de la profesión',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='Catálogo de profesiones';

-- Dumping data for table hhrr.cat_profession: ~13 rows (approximately)
/*!40000 ALTER TABLE `cat_profession` DISABLE KEYS */;
INSERT INTO `cat_profession` (`id`, `name`, `description`) VALUES
	(1, 'Ingeniero en Sistemas de Información', ''),
	(2, 'Ingeniero en Ciencias de la computacion', ''),
	(3, 'Licenciado en Informatica Administrativa', ''),
	(4, 'Licenciado en Administracion de empresas', ''),
	(5, 'Ingeniero Industrial', ''),
	(6, 'Ingeniero Electrico', ''),
	(7, 'Ingeniero en Electronica', ''),
	(8, 'Licenciado en Banca y Finanzas', ''),
	(9, 'Tecnico en Computacion', ''),
	(10, 'Perito Mercantil y Contador Publico', ''),
	(11, 'Ingeniero en Telecomunicaciones', ''),
	(12, 'Economista', ''),
	(13, 'Licenciado en mercadotecnia', '');
/*!40000 ALTER TABLE `cat_profession` ENABLE KEYS */;

-- Dumping structure for table hhrr.cat_skill
CREATE TABLE IF NOT EXISTS `cat_skill` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT 'Nombre de la habilidad o destreza',
  `description` varchar(200) NOT NULL COMMENT 'Descripción explicativa de la habilidad o destreza.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catálogo de Habilidades y Destrezas.';

-- Dumping data for table hhrr.cat_skill: ~0 rows (approximately)
/*!40000 ALTER TABLE `cat_skill` DISABLE KEYS */;
/*!40000 ALTER TABLE `cat_skill` ENABLE KEYS */;

-- Dumping structure for table hhrr.cat_status
CREATE TABLE IF NOT EXISTS `cat_status` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador del estado.',
  `tabla` varchar(45) NOT NULL COMMENT 'Tabla a la cual pertenecen los estados.',
  `status` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL COMMENT 'Nombre que se usará en los formularios.',
  `description` varchar(100) NOT NULL COMMENT 'Breve explicación sobre el estado.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catálogo de los estados de las distintas tablas.';

-- Dumping data for table hhrr.cat_status: ~0 rows (approximately)
/*!40000 ALTER TABLE `cat_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `cat_status` ENABLE KEYS */;

-- Dumping structure for table hhrr.cat_vacation
CREATE TABLE IF NOT EXISTS `cat_vacation` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `days` tinyint(3) unsigned NOT NULL,
  `condition` tinyint(3) unsigned NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Catálogo de vacaciones por ley.';

-- Dumping data for table hhrr.cat_vacation: ~4 rows (approximately)
/*!40000 ALTER TABLE `cat_vacation` DISABLE KEYS */;
INSERT INTO `cat_vacation` (`id`, `days`, `condition`, `description`) VALUES
	(1, 10, 1, 'Después de un (1) año de servicios continuos diez (10) días laborables, consecutivos'),
	(2, 12, 2, ''),
	(3, 15, 3, ''),
	(4, 20, 4, '');
/*!40000 ALTER TABLE `cat_vacation` ENABLE KEYS */;

-- Dumping structure for table hhrr.cat_working_hours
CREATE TABLE IF NOT EXISTS `cat_working_hours` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador del tipo de hora extra',
  `name` varchar(50) NOT NULL COMMENT 'Nombre utilizado en formularios y reportes',
  `start` time NOT NULL COMMENT 'Hora en que inicia',
  `end` time NOT NULL COMMENT 'Hora en que finaliza',
  `overtimeStart` time NOT NULL COMMENT 'Hora de inicio permitida para solicitar horas extras',
  `maxOverPerWeek` tinyint(3) unsigned NOT NULL COMMENT 'Maximo de horas extras permitidas a la semana',
  `description` varchar(125) NOT NULL COMMENT 'Descripción',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='Catálogo de Jornadas laborales';

-- Dumping data for table hhrr.cat_working_hours: ~3 rows (approximately)
/*!40000 ALTER TABLE `cat_working_hours` DISABLE KEYS */;
INSERT INTO `cat_working_hours` (`id`, `name`, `start`, `end`, `overtimeStart`, `maxOverPerWeek`, `description`) VALUES
	(1, 'Diurna', '05:00:00', '19:00:00', '19:00:00', 16, 'Art 269'),
	(2, 'Mixta', '15:00:00', '22:00:00', '22:00:00', 16, 'Art 269'),
	(3, 'Nocturna', '19:00:00', '05:00:00', '05:00:00', 16, 'Art 269');
/*!40000 ALTER TABLE `cat_working_hours` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
