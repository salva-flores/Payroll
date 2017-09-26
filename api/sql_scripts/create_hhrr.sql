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
DROP DATABASE IF EXISTS `hhrr`;
CREATE DATABASE IF NOT EXISTS `hhrr` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `hhrr`;

-- Dumping structure for table hhrr.cat_ademic_level
DROP TABLE IF EXISTS `cat_ademic_level`;
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
DROP TABLE IF EXISTS `cat_adjustment`;
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
DROP TABLE IF EXISTS `cat_bonus`;
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
DROP TABLE IF EXISTS `cat_company_unit`;
CREATE TABLE IF NOT EXISTS `cat_company_unit` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la unidad.',
  `name` varchar(50) NOT NULL COMMENT 'Nombre de la unidad/departamento.',
  `description` varchar(200) DEFAULT NULL COMMENT 'Descripción de la unidad/departamento',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Catálogo de Unidades/Departamentos';

-- Dumping data for table hhrr.cat_company_unit: ~8 rows (approximately)
/*!40000 ALTER TABLE `cat_company_unit` DISABLE KEYS */;
INSERT INTO `cat_company_unit` (`id`, `name`, `description`) VALUES
	(1, 'Gerencia General', ''),
	(2, 'Sub-Gerencia', ''),
	(3, 'Gerencia Financiera', ''),
	(4, 'Gerencia de Operaciones', ''),
	(5, 'Gerencia Administrativa', ''),
	(6, 'Desarrollo', ''),
	(7, 'Servicios', ''),
	(8, 'Ventas', '');
/*!40000 ALTER TABLE `cat_company_unit` ENABLE KEYS */;

-- Dumping structure for table hhrr.cat_contract_type
DROP TABLE IF EXISTS `cat_contract_type`;
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
	(3, 'Otro', '');
/*!40000 ALTER TABLE `cat_contract_type` ENABLE KEYS */;

-- Dumping structure for table hhrr.cat_date_format
DROP TABLE IF EXISTS `cat_date_format`;
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
DROP TABLE IF EXISTS `cat_deduction`;
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
DROP TABLE IF EXISTS `cat_deduction_type`;
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
DROP TABLE IF EXISTS `cat_department`;
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
DROP TABLE IF EXISTS `cat_economic_branch`;
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
DROP TABLE IF EXISTS `cat_employee_category`;
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
DROP TABLE IF EXISTS `cat_equipment_brand`;
CREATE TABLE IF NOT EXISTS `cat_equipment_brand` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catálogo de marcas de equipo.';

-- Dumping data for table hhrr.cat_equipment_brand: ~0 rows (approximately)
/*!40000 ALTER TABLE `cat_equipment_brand` DISABLE KEYS */;
/*!40000 ALTER TABLE `cat_equipment_brand` ENABLE KEYS */;

-- Dumping structure for table hhrr.cat_equipment_category
DROP TABLE IF EXISTS `cat_equipment_category`;
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
DROP TABLE IF EXISTS `cat_holiday`;
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
DROP TABLE IF EXISTS `cat_ihss`;
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
DROP TABLE IF EXISTS `cat_income`;
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
DROP TABLE IF EXISTS `cat_isr_deductible`;
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
DROP TABLE IF EXISTS `cat_isr_percentage`;
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
DROP TABLE IF EXISTS `cat_job`;
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
	(2, 'Sub-Gerente', '', '', ''),
	(3, 'Gerente Financiero/Admin', '', '', ''),
	(4, 'Asistente Administrativo', '', '', ''),
	(5, 'Gerente de Operaciones', '', '', ''),
	(6, 'Arquitecto', '', '', ''),
	(7, 'Coordinador', '', '', ''),
	(8, 'Analista', '', '', ''),
	(9, 'Programador Sr.', '', '', ''),
	(10, 'Programador Jr.', '', '', '');
/*!40000 ALTER TABLE `cat_job` ENABLE KEYS */;

-- Dumping structure for table hhrr.cat_job_type
DROP TABLE IF EXISTS `cat_job_type`;
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
DROP TABLE IF EXISTS `cat_law_deduction`;
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
DROP TABLE IF EXISTS `cat_leave_type`;
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
DROP TABLE IF EXISTS `cat_legal_form`;
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
DROP TABLE IF EXISTS `cat_mipyme`;
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
DROP TABLE IF EXISTS `cat_overtime`;
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
	(1, '25%', '17:00:00', '19:00:00', 0.25, 'Art 330: Recargo sobre el salario de la jornada diurna cuando se efectúe en el período diurno.'),
	(2, '50%', '19:00:00', '21:00:00', 0.50, 'Art 330: Recargo sobre el salario de la jornada diurna cuando se efectúe en el período nocturno.'),
	(3, '75%', '21:00:00', '05:00:00', 0.75, 'Art 330: Recargo sobre el salario de la jornada nocturna cuando la jornada extraordinaria sea prolongación de aquélla.'),
	(4, 'Doble', '00:01:00', '23:59:59', 1.00, 'Art. 340: Recargo si se trabajare durante los días de descanso o los días feriados o de fiesta nacio');
/*!40000 ALTER TABLE `cat_overtime` ENABLE KEYS */;

-- Dumping structure for table hhrr.cat_payroll
DROP TABLE IF EXISTS `cat_payroll`;
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
DROP TABLE IF EXISTS `cat_payroll_detail_deduction`;
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
DROP TABLE IF EXISTS `cat_payroll_detail_general`;
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
DROP TABLE IF EXISTS `cat_payroll_detail_income`;
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
DROP TABLE IF EXISTS `cat_payroll_type`;
CREATE TABLE IF NOT EXISTS `cat_payroll_type` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) CHARACTER SET utf8 NOT NULL,
  `description` varchar(100) CHARACTER SET utf8 NOT NULL,
  `howMany` tinyint(3) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tipos de Planilla';

-- Dumping data for table hhrr.cat_payroll_type: ~4 rows (approximately)
/*!40000 ALTER TABLE `cat_payroll_type` DISABLE KEYS */;
INSERT INTO `cat_payroll_type` (`id`, `name`, `description`, `howMany`, `status`) VALUES
	(1, 'Sueldos y Salarios', 'Sueldos y Salarios', 24, 1),
	(2, 'Horas Extras', 'Horas Extras', 12, 1),
	(3, 'Aguinaldo', 'Decimo Tercer mes', 1, 1),
	(4, 'Bono', 'Bonificacion anual', 1, 1);
/*!40000 ALTER TABLE `cat_payroll_type` ENABLE KEYS */;

-- Dumping structure for table hhrr.cat_profession
DROP TABLE IF EXISTS `cat_profession`;
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
DROP TABLE IF EXISTS `cat_skill`;
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
DROP TABLE IF EXISTS `cat_status`;
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
DROP TABLE IF EXISTS `cat_vacation`;
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
DROP TABLE IF EXISTS `cat_working_hours`;
CREATE TABLE IF NOT EXISTS `cat_working_hours` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador del tipo de hora extra',
  `name` varchar(50) NOT NULL COMMENT 'Nombre utilizado en formularios y reportes',
  `start` time NOT NULL COMMENT 'Hora en que inicia',
  `end` time NOT NULL COMMENT 'Hora en que finaliza',
  `overtimeStart` time NOT NULL COMMENT 'Hora de inicio permitida para solicitar horas extras',
  `maxOverPerWeek` tinyint(3) unsigned NOT NULL COMMENT 'Maximo de horas extras permitidas a la semana',
  `description` varchar(125) NOT NULL COMMENT 'Descripción',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='Catálogo de Jornadas laborales';

-- Dumping data for table hhrr.cat_working_hours: ~3 rows (approximately)
/*!40000 ALTER TABLE `cat_working_hours` DISABLE KEYS */;
INSERT INTO `cat_working_hours` (`id`, `name`, `start`, `end`, `overtimeStart`, `maxOverPerWeek`, `description`) VALUES
	(1, 'Diurna', '05:00:00', '19:00:00', '17:00:00', 16, 'Art 269'),
	(2, 'Mixta', '15:00:00', '22:00:00', '22:00:00', 16, 'Art 269'),
	(3, 'Nocturna', '19:00:00', '05:00:00', '05:00:00', 16, 'Art 269');
/*!40000 ALTER TABLE `cat_working_hours` ENABLE KEYS */;

-- Dumping structure for table hhrr.email_confirmations
DROP TABLE IF EXISTS `email_confirmations`;
CREATE TABLE IF NOT EXISTS `email_confirmations` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` tinyint(3) unsigned NOT NULL,
  `code` char(32) NOT NULL,
  `createdAt` int(10) unsigned NOT NULL,
  `modifiedAt` int(10) unsigned DEFAULT NULL,
  `confirmed` char(1) DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table hhrr.email_confirmations: ~0 rows (approximately)
/*!40000 ALTER TABLE `email_confirmations` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_confirmations` ENABLE KEYS */;

-- Dumping structure for table hhrr.main_company
DROP TABLE IF EXISTS `main_company`;
CREATE TABLE IF NOT EXISTS `main_company` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador unico de la empresa',
  `mipymeTypeId` tinyint(3) unsigned NOT NULL COMMENT 'Identificador del tipo de empresa ',
  `economicBranchId` tinyint(3) unsigned NOT NULL COMMENT 'Rama económica de la empresa',
  `legalFormId` tinyint(3) unsigned NOT NULL COMMENT 'Razón social de la empresa',
  `shortName` varchar(25) NOT NULL COMMENT 'Nombre corto o siglas',
  `longName` varchar(100) DEFAULT NULL COMMENT 'Nombre completo, segun la razón social o escritura',
  `foundationDate` date NOT NULL COMMENT 'Fecha de fundación',
  `commercialRegiterCertificate` varchar(100) NOT NULL COMMENT 'Ruta y nombre del archivo del registro mercantil',
  `phone` varchar(8) NOT NULL COMMENT 'Numero de teléfono de la empresa',
  `address` varchar(200) NOT NULL COMMENT 'Dirección física de la empresa',
  `city` varchar(50) NOT NULL COMMENT 'Ciudad donde se ubica la empresa',
  `departmentId` tinyint(3) unsigned NOT NULL COMMENT 'Departamento donde se ubica la empresa',
  `postalCode` varchar(5) NOT NULL COMMENT 'Código postal',
  `mission` varchar(100) NOT NULL COMMENT 'Misión',
  `vision` varchar(100) NOT NULL COMMENT 'Visión',
  `profile` varchar(100) NOT NULL COMMENT 'Perfil',
  `logo` varchar(100) NOT NULL COMMENT 'Ruta y nombre del archivo del logo de la empresa',
  `ip` varchar(50) NOT NULL COMMENT 'Dirección ip donde esta instalado el sistema',
  `legalRepName` varchar(50) NOT NULL COMMENT 'Nombre del representante legal de la empresa',
  `legalRepIdCard` varchar(13) NOT NULL COMMENT 'Número de identidad del representante legal',
  `legalRepPhone` varchar(8) NOT NULL COMMENT 'Número telefónico del representante legal',
  `contactName` varchar(25) NOT NULL COMMENT 'Nombre de la persona contacto',
  `contactDesignation` varchar(25) NOT NULL COMMENT 'Título usado para designar al contacto (Lic. Sr. Sra. otro)',
  `contactPhone` varchar(8) NOT NULL COMMENT 'Número telefónico del contacto',
  `contactEmail` varchar(50) NOT NULL COMMENT 'Correo electrónico del contacto',
  PRIMARY KEY (`id`),
  KEY `economic_branch` (`economicBranchId`),
  KEY `type` (`mipymeTypeId`),
  KEY `legal_form` (`legalFormId`),
  KEY `FK_main_company_cat_departments` (`departmentId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Tabla maestra de la empresa';

-- Dumping data for table hhrr.main_company: ~1 rows (approximately)
/*!40000 ALTER TABLE `main_company` DISABLE KEYS */;
INSERT INTO `main_company` (`id`, `mipymeTypeId`, `economicBranchId`, `legalFormId`, `shortName`, `longName`, `foundationDate`, `commercialRegiterCertificate`, `phone`, `address`, `city`, `departmentId`, `postalCode`, `mission`, `vision`, `profile`, `logo`, `ip`, `legalRepName`, `legalRepIdCard`, `legalRepPhone`, `contactName`, `contactDesignation`, `contactPhone`, `contactEmail`) VALUES
	(1, 1, 1, 5, 'CENTEC', NULL, '2017-05-30', '', '', '', '', 8, '', '', '', '', 'logo-dark.png', '', '', '', '0', '', '', '', '');
/*!40000 ALTER TABLE `main_company` ENABLE KEYS */;

-- Dumping structure for table hhrr.main_company_structure
DROP TABLE IF EXISTS `main_company_structure`;
CREATE TABLE IF NOT EXISTS `main_company_structure` (
  `companyId` tinyint(3) unsigned NOT NULL COMMENT 'Identificador de la empresa.',
  `unitId` tinyint(3) unsigned NOT NULL COMMENT 'Identificador de la unidad/departamento.',
  `parentUnitId` tinyint(3) unsigned NOT NULL COMMENT 'Identificador de la unidad de la cual depende jerarquicamente.',
  `headJobId` tinyint(3) unsigned NOT NULL COMMENT 'Identifica al empleado que es jefe del departamento',
  `headId` smallint(5) unsigned NOT NULL COMMENT 'Identifica al empleado que es jefe del departamento',
  KEY `companyId` (`companyId`),
  KEY `unitId` (`unitId`),
  KEY `parentId` (`parentUnitId`),
  KEY `headId` (`headId`),
  CONSTRAINT `FK_main_company_structure_cat_company_unit` FOREIGN KEY (`unitId`) REFERENCES `cat_company_unit` (`id`),
  CONSTRAINT `FK_main_company_structure_cat_company_unit_2` FOREIGN KEY (`parentUnitId`) REFERENCES `cat_company_unit` (`id`),
  CONSTRAINT `FK_main_company_structure_main_company` FOREIGN KEY (`companyId`) REFERENCES `main_company` (`id`),
  CONSTRAINT `FK_main_company_structure_main_employee` FOREIGN KEY (`headId`) REFERENCES `main_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Para almacenar la estructura organiza de las empresas -organigramas-.';

-- Dumping data for table hhrr.main_company_structure: ~3 rows (approximately)
/*!40000 ALTER TABLE `main_company_structure` DISABLE KEYS */;
INSERT INTO `main_company_structure` (`companyId`, `unitId`, `parentUnitId`, `headJobId`, `headId`) VALUES
	(1, 1, 1, 1, 1),
	(1, 5, 1, 3, 2),
	(1, 4, 1, 5, 3);
/*!40000 ALTER TABLE `main_company_structure` ENABLE KEYS */;

-- Dumping structure for table hhrr.main_employee
DROP TABLE IF EXISTS `main_employee`;
CREATE TABLE IF NOT EXISTS `main_employee` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador unico del empleado',
  `companyUnit` tinyint(3) unsigned NOT NULL COMMENT 'Unidad a la que está asignado el empleado (segun el organigrama)',
  `academicLevel` tinyint(3) unsigned DEFAULT NULL COMMENT 'Nivel académico',
  `profession` tinyint(3) unsigned DEFAULT NULL COMMENT 'Identificador de la profesión',
  `job` tinyint(3) unsigned DEFAULT NULL COMMENT 'Identificador del puesto',
  `type` tinyint(3) unsigned DEFAULT NULL COMMENT 'Tipo de empleado',
  `firstName` varchar(40) NOT NULL COMMENT 'Nombres',
  `lastName` varchar(40) NOT NULL COMMENT 'Apellidos',
  `dob` date DEFAULT NULL COMMENT 'Fecha de nacimiento',
  `gender` tinyint(1) unsigned DEFAULT NULL COMMENT 'Género',
  `bloodType` varchar(3) DEFAULT NULL COMMENT 'Tipo de sangre',
  `nationality` varchar(40) DEFAULT NULL COMMENT 'Nacionalidad',
  `idCard` varchar(13) DEFAULT NULL COMMENT 'Número de tarjeta de identidad',
  `maritalStatus` varchar(20) DEFAULT NULL COMMENT 'Estado civil',
  `joined` date DEFAULT NULL COMMENT 'Fecha en que ingresó a la empresa',
  `address` varchar(150) DEFAULT NULL COMMENT 'Dirección exacta',
  `city` varchar(50) DEFAULT NULL COMMENT 'Ciudad',
  `departmentId` tinyint(3) unsigned DEFAULT NULL COMMENT 'Departamento',
  `homePhone` varchar(8) DEFAULT NULL COMMENT 'Número telefónico de la casa',
  `officePhone` varchar(8) DEFAULT NULL COMMENT 'Número telefónico de la oficina',
  `mobilePhone` varchar(8) NOT NULL COMMENT 'Número telefónico de celular',
  `email` varchar(100) NOT NULL COMMENT 'Correo electronico',
  `salary` decimal(8,2) unsigned NOT NULL COMMENT 'Salario actual',
  `shift` tinyint(3) unsigned DEFAULT NULL COMMENT 'Jornada laboral',
  `creationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` tinyint(3) unsigned DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `profession` (`profession`),
  KEY `job` (`job`),
  KEY `department` (`departmentId`),
  KEY `companyUnit` (`companyUnit`),
  KEY `academicLevel` (`academicLevel`),
  KEY `createdBy` (`createdBy`),
  KEY `type` (`type`),
  KEY `shift` (`shift`),
  CONSTRAINT `FK_main_employee_cat_academic_level` FOREIGN KEY (`academicLevel`) REFERENCES `cat_ademic_level` (`id`),
  CONSTRAINT `FK_main_employee_cat_company_unit` FOREIGN KEY (`companyUnit`) REFERENCES `cat_company_unit` (`id`),
  CONSTRAINT `FK_main_employee_cat_job` FOREIGN KEY (`job`) REFERENCES `cat_job` (`id`),
  CONSTRAINT `FK_main_employee_cat_profession` FOREIGN KEY (`profession`) REFERENCES `cat_profession` (`id`),
  CONSTRAINT `FK_main_employee_cat_working_hours` FOREIGN KEY (`shift`) REFERENCES `cat_working_hours` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='Tabla maestra de empleados.';

-- Dumping data for table hhrr.main_employee: ~57 rows (approximately)
/*!40000 ALTER TABLE `main_employee` DISABLE KEYS */;
INSERT INTO `main_employee` (`id`, `companyUnit`, `academicLevel`, `profession`, `job`, `type`, `firstName`, `lastName`, `dob`, `gender`, `bloodType`, `nationality`, `idCard`, `maritalStatus`, `joined`, `address`, `city`, `departmentId`, `homePhone`, `officePhone`, `mobilePhone`, `email`, `salary`, `shift`, `creationDate`, `createdBy`, `state`) VALUES
	(1, 1, 2, 1, 1, 0, 'Juan Carlos Mercado', '', '1968-07-15', 1, '', '', '0801196806435', '1', '2011-01-01', 'Colonia Miraflores Sur, Avenida Santa Cristina, Calle 21, bloque 4 casa 1610', '', 8, '22324016', '0', '0', 'jmercado@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(2, 5, 2, 12, 3, 0, 'Gabriel Reinaldo Osorio Velasquez', '', '1973-07-18', 1, '', '', '0801197300747', '1', '2014-07-24', 'Colonia Monte Verde, 1ª Av 2ª Calle Casa #14', '', 8, '22324016', '0', '0', 'gosorio@lufergo.com', 45000.00, 1, '2017-06-22 11:41:58', 0, 0),
	(3, 4, 3, 3, 5, 0, 'Hector Alberto Berrios Rodriguez', '', '1969-05-12', 1, '', '', '0801196903367', '1', '2010-08-07', 'Residencial plaza, bloque 33, casa 3108.', '', 8, '22286173', '0', '99372193', 'hberrios@hngsystems.com', 45000.00, 1, '2017-06-22 11:41:58', 0, 0),
	(4, 5, 2, 4, 4, 0, 'Vanessa Carolina Varela Pineda', '', '1986-07-15', 2, '', '', '0318198600333', '1', '2012-02-21', 'Col. Victor F Ardon, bloque F, casa 3822', '', 8, '22303915', '0', '32963124', 'vvarela@hngsystems.com', 14000.00, 1, '2017-06-22 11:41:58', 0, 0),
	(5, 6, 2, 1, 10, 0, 'Dennis Dassaeth Gonzales Mendoza', '', '1989-01-09', 1, '', '', '0801198902214', '0', '2014-02-03', 'Prados Universitarios, Bloque E, casa 6118.', '', 8, '22570069', '0', '32290345', 'dgonzales@hngsystems.com', 11000.00, 1, '2017-06-22 11:41:58', 0, 0),
	(6, 6, 1, 1, 10, 0, 'Oscar Noe Sevilla Urbina', '', '1990-12-21', 1, '', '', '1519199000006', '0', '2013-01-02', 'Col. San Jose de la Peña', '', 8, '0', '0', '96095496', 'osevilla@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(7, 6, 1, 1, 10, 0, 'Edwin David Zambrano Banegas', '', '1986-02-12', 1, '', '', '0801198603962', '0', '2013-01-01', 'Res. Villas de Concepción', '', 8, '0', '0', '33944024', 'ezambrano@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(8, 6, 1, 1, 10, 0, 'Katherynne Melissa Hidalgo Aguilar', '', '1991-05-09', 2, '', '', '0601199101689', '0', '2013-11-16', 'Barrio Sabana Grande', '', 8, '0', '0', '98496166', 'khidalgo@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(9, 6, 1, 1, 10, 0, 'Vany Jetsibelh Castillo Guillen', '', '1986-05-14', 2, '', '', '1201198600461', '0', '2010-01-07', 'Col. las colinas, bloque RR, casa 1915.', '', 8, '0', '0', '98641568', 'vcastillo@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(10, 6, 1, 1, 10, 0, 'Leonardo Antonio Vijil Scalici', '', '1990-01-24', 1, '', '', '0801199014267', '0', '2014-06-16', 'Col. Kennedy, 4ta Entrada, casa 3810, bloque 1.', '', 8, '22304507', '0', '87355440', 'lvijil@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(11, 6, 1, 1, 10, 0, 'Kenny Joseph Cooper Aleman', '', '1989-07-20', 1, '', '', '0801198902104', '0', '2012-01-01', 'Col. san Jose de la Peña, zona D, bloque 7A', '', 8, '0', '0', '96714867', 'kcooper@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(12, 6, 1, 1, 10, 0, 'Denis Oswaldo Jiron Rodriguez', '', '1983-07-13', 1, '', '', '0801198312047', '0', '2012-03-01', 'Col. Hato de Enmedio, sector 7, bloque 103, casa 5119', '', 8, '22551706', '0', '31781323', 'djiron@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(13, 6, 1, 1, 10, 0, 'Victor Alejandro Escober Zuniga', '', '1986-01-28', 1, '', '', '0819198600200', '0', '2012-10-08', 'Col. centro america oeste, zona 1 bloque H casa 4526', '', 8, '22274620', '0', '31875519', 'vescober@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(14, 6, 1, 1, 10, 0, 'Luisa Azucena Giron Gradiz', '', '1968-02-12', 2, '', '', '0615196800569', '1', '2012-04-09', 'Col. Kennedy, casa 3505, grupo 18, bloque 22, zona 2', '', 8, '22280971', '0', '98730062', 'lgiron@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(15, 6, 1, 1, 10, 0, 'Yadira Paola Avila Herrera', '', '1986-07-22', 2, '', '', '0801198613859', '0', '2012-06-04', 'Col. Centro américa oeste, zona 4, bloque z', '', 8, '22273540', '0', '96257601', 'yavila@hngsystems.com', 30000.00, 1, '2017-06-22 11:41:58', 0, 0),
	(16, 6, 1, 1, 10, 0, 'Kelly Pamela Perez Caceres', '', '1984-04-12', 2, '', '', '0801198421680', '1', '2011-11-23', 'Linaca, Tatumbla, atrás del Kínder Caridad de Ardon.', '', 8, '0', '0', '96928115', 'kperez@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(17, 6, 1, 1, 10, 0, 'Danny Alberto Solorzano Rivera', '', '1986-07-15', 1, '', '', '0801198620461', '0', '2012-05-09', 'Residencial Agua Dulce, Col. Las Hadas', '', 8, '0', '0', '97605500', 'dsolorzano@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(18, 6, 1, 1, 10, 0, 'Ana Sofia Quintero Zapata', '', '1990-04-10', 2, '', '', '0801199005403', '0', '2012-06-25', 'Colonia Centro América Oeste, Bloque CC, casa 1316, Zona 1.', '', 8, '22271408', '0', '98272925', 'aquintero@hngsystems.com', 25000.00, 1, '2017-06-22 11:41:58', 0, 0),
	(19, 6, 1, 1, 10, 0, 'Guillermo Bustillo Alvarado', '', '1989-08-10', 1, '', '', '0801198916369', '0', '2012-12-01', 'Col Centro America Oeste, Zona 1, bloque E, casa 1417.', '', 8, '22274920', '0', '97203639', 'gbustillo@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(20, 6, 1, 1, 10, 0, 'Dario Alberto Castro Martinez', '', '1989-03-08', 1, '', '', '0801198920345', '0', '2012-05-07', 'Residencial Centro América, 4ta etapa, calle 37', '', 8, '22273540', '0', '31817003', 'dcastro@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(21, 6, 1, 1, 10, 0, 'Olga Leticia Martinez Varela', '', '1988-03-31', 2, '', '', '0801198801929', '0', '2012-03-06', 'Col. Bella Vista, 8 y 9 calle, 12 ave, casa 916.', '', 8, '22234427', '0', '33191947', 'omartinez@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(22, 6, 1, 1, 10, 0, 'Amy Larissa Gallardo Alvarez', '', '1984-07-24', 2, '', '', '0801198405040', '0', '2011-06-16', 'Col. Bella Oriente, Bloque H, casa 8, Apto No 1', '', 8, '0', '0', '33760250', 'agallardo@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(23, 6, 1, 1, 10, 0, 'Julio Alejandro Castro Raudales', '', '1987-08-13', 1, '', '', '0501198710584', '0', '2011-03-17', 'Colonia Kennedy, Boca calle, escuela Oswaldo.', '', 8, '22285788', '0', '97011785', 'jcastro@hngsystems.com', 12000.00, 1, '2017-06-22 11:41:58', 0, 0),
	(24, 6, 1, 1, 10, 0, 'Wilfredo Estrada Matamoros', '', '1983-02-14', 1, '', '', '0801198305570', '0', '2011-10-20', 'Col. Venezuela, sector C, Bloque 21, lote 16.', '', 8, '22250360', '0', '98113809', 'westrada@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(25, 6, 1, 1, 10, 0, 'Amy Alizbeth Diaz Caceres', '', '1990-03-13', 2, '', '', '0801199015349', '0', '2012-04-10', 'CENTEC', '', 8, '22233744', '0', '98913980', 'adiaz@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(26, 6, 1, 1, 10, 0, 'Merlyn Carolina Palma Hernandez', '', '1981-03-02', 1, '', '', '0801198126270', '0', '2010-04-07', 'Residencial Villas del Real, bloque D, casa 7', '', 8, '22339318', '0', '95153204', 'mpalma@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(27, 6, 1, 1, 10, 0, 'Fernando Velasquez Marquez', '', '1980-04-15', 1, '', '', '0801198018149', '0', '2006-09-26', 'Col Bella Oriente, bloque L, casa 17.', '', 8, '22551956', '0', '99044777', 'fvelasquez@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(28, 6, 1, 1, 10, 0, 'Claudio Jose Turcios Cerrato', '', '1974-02-14', 1, '', '', '0801197408138', '1', '2009-03-09', 'CENTEC', '', 8, '22304306', '0', '99014179', 'cturcios@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(29, 6, 1, 1, 10, 0, 'Wendy Carolina Gonzalez Sierra', '', '1983-09-21', 2, '', '', '0801198307630', '0', '2009-03-01', 'Col. Brisas del norte, bloque J, casa 10.', '', 8, '22017176', '0', '97366376', 'wgonzales@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(30, 6, 1, 1, 10, 0, 'David Eduardo Sanchez Aguilar', '', '1985-04-16', 1, '', '', '0801198519044', '0', '2012-08-06', 'Col. hato de Enmedio, Sector 7, bloque 103, casa 5115', '', 8, '0', '0', '32928085', 'dsanchez@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(31, 5, 1, 1, 10, 0, 'Gabriela Mariel Henriquez Oyuela', '', '1981-05-19', 1, '', '', '0801198102890', '0', '2012-01-01', 'Col. lomas del Toncontin, casa 1704, bloque 44', '', 8, '22344330', '0', '99802498', 'ghenriquez@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(32, 6, 1, 1, 10, 0, 'Jorge Alberto Ávila Sevilla', '', '1990-09-06', 1, '', '', '0801199019001', '0', '2014-10-01', 'Col. Sagastume No 2, calle principal, casa no 7', '', 8, '0', '0', '95706121', 'javila@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(33, 6, 1, 1, 10, 0, 'Alex Francisco Espinal Oyuela', '', '1990-05-20', 1, '', '', '0801199010220', '0', '2014-10-01', 'Cerrro Grande zona 4 bloque 37 casa 3207', '', 8, '22240579', '0', '99505590', 'aespinal@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(34, 6, 1, 1, 10, 0, 'Ana Hisamar Sorto Caceres', '', '1990-09-24', 2, '', '', '0801199023937', '0', '2014-08-20', 'Residencial Suyapita contiguo Hospital Maria', '', 8, '0', '0', '95730914', 'asorto@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(35, 6, 1, 1, 10, 0, 'Keidy Sarahi Rodriguez Duron', '', '1991-07-22', 2, '', '', '0801199115017', '0', '2015-01-15', 'col. modesto rodas alvarado, casa 3621', '', 8, '22344817', '0', '88655195', 'krodriguez@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(36, 6, 1, 1, 10, 0, 'Ana Marcela Lanza Sandres', '', '1991-08-01', 2, '', '', '0801199102323', '0', '2015-01-15', 'Barrio la Cudarilla, Santa Lucia.', '', 8, '27790417', '0', '31909930', 'alanza@hngsystems.com', 15000.00, 3, '2017-06-22 11:41:58', 0, 0),
	(37, 6, 1, 1, 10, 0, 'Hugo Renan Rodriguez Garmendia', '', '1982-01-10', 1, '', '', '0801198210240', '0', '2014-12-01', 'Res. Roble Oeste, V etapa, bloque K casa 6', '', 8, '22348380', '0', '95172277', 'hugorenanrod@gmail.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(38, 6, 1, 1, 10, 0, 'Sergio Mauricio Canales Verde', '', '1987-05-08', 1, '', '', '0801198707988', '0', '2015-05-04', 'Col Santa Maria, bloque 26, Casa 41.', '', 8, '22708172', '0', '33792372', 'scanales@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(39, 6, 1, 1, 10, 0, 'Bryan Orlando Peña Mejia', '', '1989-06-23', 1, '', '', '0801198912973', '0', '2015-12-01', 'Col. El Sitio, 2da etapa, bloque 36, casa #90', '', 8, '22709339', '0', '97459699', 'bpena@hngsystems.com', 14000.00, 1, '2017-06-22 11:41:58', 0, 0),
	(40, 6, 1, 1, 10, 0, 'Jennyffer Carolina Mejia Meza', '', '1992-05-14', 2, '', '', '0801199210588', '0', '2015-12-01', 'Col. El Sitio, 2da etapa, bloque 36, casa #1816', '', 8, '22709551', '0', '94300006', 'jmejia@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(41, 6, 1, 1, 10, 0, 'Ingrid Aracely Nuñez Gomez', '', '1989-09-06', 2, '', '', '0703198904588', '0', '2015-11-16', 'Res. Bella Oriente, frente a Villas del Sol', '', 8, '0', '0', '95741764', 'inuñez@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(42, 6, 1, 1, 10, 0, 'Javier Ernesto Saravia Sosa', '', '1987-03-28', 1, '', '', '0801198705966', '0', '2016-08-16', 'Villa Adela, Costado Sur del Estado Mayor Conjunto, entre 4 y 5 avenida, 15 calle', '', 8, '22201140', '0', '88709340', 'jsaravia@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(43, 6, 1, 1, 10, 0, 'Ingrid Lizeth Menjivar Bustillo', '', '1990-08-05', 2, '', '', '0801199102002', '0', '2016-08-16', 'Barrio Concepción, 6 calle, 8 avenida comayaguela casa 602', '', 8, '22201644', '0', '95588792', 'imenjivar@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(44, 6, 1, 1, 10, 0, 'Luis Fernando Carbajal Carbajal', '', '1989-06-27', 1, '', '', '0611198900680', '0', '2015-08-16', 'Col.Cerro Grande, zona #4, bloque #40, lote F', '', 8, '22241725', '0', '98355053', 'lcarbajal@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(45, 6, 1, 1, 10, 0, 'Eva Daniela Cardona Rosales', '', '1990-09-15', 2, '', '', '1518199000180', '0', '2016-09-01', 'Col. Las Colinas frente a Auto Escuela Tropical', '', 8, '0', '0', '94633803', 'ecardona@hngsystems.com', 11500.00, 1, '2017-06-22 11:41:58', 0, 0),
	(46, 6, 1, 1, 10, 0, 'Brian Enrique Barahona Zeron', '', '1993-01-21', 1, '', '', '0818199300028', '0', '2016-09-01', 'Santa Ana Fco. Morazan Km 21 media cuadra de la gasolinera TEXACO', '', 8, '22131035', '0', '98322306', 'bbarahona@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(47, 6, 1, 1, 10, 0, 'Arelis Yadira Matamoros Guzman', '', '1990-03-12', 2, '', '', '0801199005964', '0', '2016-09-01', 'Aldea Santa Rosa, carretera al sur Km. 11 contiguo al centro de salud', '', 8, '0', '0', '95071445', 'amatamoros@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(48, 6, 1, 1, 10, 0, 'Leonardo Fabian Medina Espinoza', '', '1990-02-19', 1, '', '', '0801199006523', '0', '2015-04-27', 'Col. Brisas de Olancho, Casa 1, Bloque A, Sector 2', '', 8, '22236826', '0', '32920485', 'lmedina@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(49, 6, 1, 1, 10, 0, 'Erick Roberto Rápalo Garcia', '', '1992-09-16', 1, '', '', '0801199219550', '0', '2016-03-28', 'Tegucigalpa, Col. Los Pinos, Sector F', '', 8, '0', '0', '89882132', 'erapalo@hngsystems.com', 12000.00, 1, '2017-06-22 11:41:58', 0, 0),
	(50, 6, 1, 1, 10, 0, 'Jonie Esteban Miralda Cruz', '', '1991-09-30', 1, '', '', '0801199119714', '0', '2016-04-01', 'Col. Smith #1, calle principal, peatonal 7 casa #602 color rosado fusia. Comayaguela M.D.C', '', 8, '2233944', '0', '95069826', 'jmiralda@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(51, 6, 1, 1, 10, 0, 'Alejandra Gabriela Gonzales Flores', '', '1992-04-03', 2, '', '', '0801199207416', '0', '2016-10-24', 'Col. villeda morales', '', 8, '22297613', '0', '98088944', 'agonzales@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(52, 6, 1, 1, 10, 0, 'David Josué Vasquez Aguilar', '', '1995-03-05', 1, '', '', '0801199508700', '0', '2016-12-13', 'col la esperanza calle dipílto casa c200', '', 8, '22211827', '0', '96071481', 'dvasquez@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(53, 6, 1, 1, 10, 0, 'Oscar David Maradiaga Cárdenas', '', '1993-03-19', 1, '', '', '0801199305745', '0', '2017-01-03', 'Col. villa nueva sector 6 casa #5319', '', 8, '22283581', '0', '95720677', 'omaradiaga@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0, 0),
	(54, 6, 1, 1, 10, 0, 'Claudia Yolanda Zuniga Ruiz', '', '1969-12-02', 2, '', '', '0801196908897', '1', '2017-01-03', 'Residencial Zarahemla, Bloque E, casa 25', '', 8, '22217190', '0', '96665026', 'czuniga@hngsystems', 20000.00, 1, '2017-06-22 11:41:58', 0, 0),
	(55, 6, 2, 1, 10, 0, 'Salvador Alberto Flores Aguilar', '', '1971-12-25', 1, 'o+', 'Honduran', '0501197200116', '1', '2016-01-11', 'Col. Bella Oriente', '', 8, '22550886', '0', '95535116', 'sflores@hngsystems.com', 13000.00, 1, '2017-07-14 19:14:56', 0, 0),
	(56, 6, 2, 3, 10, 0, 'Carlos Nahun García Cruz', '', '0000-00-00', 1, 'o+', '', '0801198611168', '0', '2017-07-24', '', '', 0, '', '', '97061674', 'cgarcia@hngsystems.com', 11500.00, 2, '2017-07-24 08:58:12', 0, 0),
	(64, 1, NULL, NULL, 1, NULL, 'rodavlaS', 'serolF', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '11111111', 'salva_flores@yahoo.com', 90000.00, NULL, '2017-09-23 18:27:09', NULL, NULL);
/*!40000 ALTER TABLE `main_employee` ENABLE KEYS */;

-- Dumping structure for table hhrr.main_employee_contact
DROP TABLE IF EXISTS `main_employee_contact`;
CREATE TABLE IF NOT EXISTS `main_employee_contact` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador del contacto',
  `employeeId` smallint(5) unsigned NOT NULL COMMENT 'Identificador del empleado',
  `contactName` varchar(45) NOT NULL COMMENT 'Nombre de la persona',
  `relationship` varchar(45) NOT NULL COMMENT 'Parentesco o relación',
  `phone` varchar(8) NOT NULL COMMENT 'Teléfono fijo',
  `mobile` varchar(8) NOT NULL COMMENT 'Teléfono móbil',
  `address` varchar(100) NOT NULL COMMENT 'Dirección física del contacto',
  `email` varchar(45) NOT NULL COMMENT 'Correo electrónico',
  PRIMARY KEY (`id`),
  KEY `employee` (`employeeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informacion del contacto de emergencia del empleado.';

-- Dumping data for table hhrr.main_employee_contact: ~0 rows (approximately)
/*!40000 ALTER TABLE `main_employee_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_employee_contact` ENABLE KEYS */;

-- Dumping structure for table hhrr.main_employee_dependant
DROP TABLE IF EXISTS `main_employee_dependant`;
CREATE TABLE IF NOT EXISTS `main_employee_dependant` (
  `id` smallint(5) unsigned NOT NULL,
  `employeeId` smallint(5) unsigned NOT NULL COMMENT 'Identificador del empleado.',
  `name` varchar(50) NOT NULL COMMENT 'Nombre del dependiente.',
  `dob` date NOT NULL COMMENT 'Fecha de nacimiento.',
  `relation` varchar(50) NOT NULL COMMENT 'Relación o parentesco.',
  `insurance` varchar(50) NOT NULL COMMENT 'Campo para guardar información sobre el seguro',
  PRIMARY KEY (`id`),
  KEY `employee` (`employeeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dependientes del empleado';

-- Dumping data for table hhrr.main_employee_dependant: ~0 rows (approximately)
/*!40000 ALTER TABLE `main_employee_dependant` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_employee_dependant` ENABLE KEYS */;

-- Dumping structure for table hhrr.main_employee_isr_history
DROP TABLE IF EXISTS `main_employee_isr_history`;
CREATE TABLE IF NOT EXISTS `main_employee_isr_history` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador',
  `employeeId` smallint(5) unsigned NOT NULL COMMENT 'Identificador del empleado',
  `yearlyIncome` decimal(10,2) unsigned NOT NULL COMMENT 'Ingreso anual',
  `taxDeductible` decimal(10,2) unsigned NOT NULL COMMENT 'Deducible',
  `taxableIncome` decimal(10,2) unsigned NOT NULL COMMENT 'Rango imponible',
  `totalTax` decimal(10,2) unsigned NOT NULL COMMENT 'Total a retener por concepto de impuesto',
  `feesToRetain` tinyint(3) unsigned NOT NULL COMMENT 'Número de cuotas a retener',
  `monthlyFee` decimal(7,2) unsigned NOT NULL COMMENT 'Valor de la cuota del mes',
  `retainedAmount` decimal(10,2) unsigned NOT NULL COMMENT 'Valor retenido',
  `feeAdjustment` decimal(7,2) unsigned NOT NULL COMMENT 'Valor por ajuste de retención',
  PRIMARY KEY (`id`),
  KEY `employee` (`employeeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Historial de retenciones del impuesto sobre la renta.\r\nHay que revisar... pay_payroll_detail_deductions deberia contener un registro si se le hace la deduccion al empleado.\r\nAqui faltaria la fecha de la deduccion.';

-- Dumping data for table hhrr.main_employee_isr_history: ~0 rows (approximately)
/*!40000 ALTER TABLE `main_employee_isr_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_employee_isr_history` ENABLE KEYS */;

-- Dumping structure for table hhrr.main_employee_job_history
DROP TABLE IF EXISTS `main_employee_job_history`;
CREATE TABLE IF NOT EXISTS `main_employee_job_history` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador del historial',
  `employeeId` smallint(5) unsigned DEFAULT NULL COMMENT 'Identificador del empleado',
  `companyUnitId` tinyint(3) unsigned DEFAULT NULL COMMENT 'Departamento',
  `jobId` tinyint(3) unsigned DEFAULT NULL COMMENT 'Identificador del puesto',
  `movementDescription` varchar(200) NOT NULL COMMENT 'Descripción del puesto y actividades realizadas, asi como motivo del cambio',
  `fromDate` date NOT NULL COMMENT 'Fecha de inicio en ese puesto',
  `toDate` date NOT NULL COMMENT 'Fecha hasta que ocupó ese puesto',
  `salary` decimal(7,2) NOT NULL COMMENT 'Salario asignado',
  `isActive` bit(1) NOT NULL COMMENT 'Indica si está activo',
  PRIMARY KEY (`id`),
  KEY `employee` (`employeeId`),
  KEY `job` (`jobId`),
  KEY `company_unit` (`companyUnitId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Historial del empleado';

-- Dumping data for table hhrr.main_employee_job_history: ~0 rows (approximately)
/*!40000 ALTER TABLE `main_employee_job_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_employee_job_history` ENABLE KEYS */;

-- Dumping structure for table hhrr.main_employee_salary_detail
DROP TABLE IF EXISTS `main_employee_salary_detail`;
CREATE TABLE IF NOT EXISTS `main_employee_salary_detail` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador unico del detalle',
  `employeeId` smallint(5) unsigned DEFAULT NULL COMMENT 'Identificador del empleado.',
  `salary` decimal(8,2) unsigned NOT NULL COMMENT 'Salario',
  `bankName` varchar(100) NOT NULL COMMENT 'Nombre del banco donde se hace el depósito',
  `accountHolderName` varchar(100) NOT NULL COMMENT 'Nombre del cuentahabiente, usado en la cuenta bancaria',
  `bankAccountNumber` varchar(50) NOT NULL COMMENT 'Identificador de la cuenta bancaria',
  `isActive` bit(1) NOT NULL COMMENT 'Identifica si la cuenta está activa',
  PRIMARY KEY (`id`),
  KEY `employee` (`employeeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Detalles del salario del empleado, contiene la informacion de la cuenta bancaria para efectos de pago electrónico';

-- Dumping data for table hhrr.main_employee_salary_detail: ~0 rows (approximately)
/*!40000 ALTER TABLE `main_employee_salary_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_employee_salary_detail` ENABLE KEYS */;

-- Dumping structure for table hhrr.main_equipment
DROP TABLE IF EXISTS `main_equipment`;
CREATE TABLE IF NOT EXISTS `main_equipment` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `brandId` tinyint(3) unsigned NOT NULL COMMENT 'Marca',
  `categoryId` tinyint(3) unsigned NOT NULL COMMENT 'Categoría',
  `name` varchar(50) NOT NULL COMMENT 'Nombre descriptivo',
  `model` varchar(50) NOT NULL COMMENT 'Modelo',
  `serial` varchar(50) NOT NULL COMMENT 'Número de serie',
  `description` varchar(200) NOT NULL COMMENT 'Descripción',
  `price` decimal(8,2) unsigned NOT NULL COMMENT 'Precio',
  `status` tinyint(3) unsigned NOT NULL COMMENT 'Indica el estado del equipo',
  PRIMARY KEY (`id`),
  KEY `brand` (`brandId`),
  KEY `category` (`categoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Equipo de computo.';

-- Dumping data for table hhrr.main_equipment: ~0 rows (approximately)
/*!40000 ALTER TABLE `main_equipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_equipment` ENABLE KEYS */;

-- Dumping structure for table hhrr.main_equipment_assigned
DROP TABLE IF EXISTS `main_equipment_assigned`;
CREATE TABLE IF NOT EXISTS `main_equipment_assigned` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `employeeId` smallint(5) unsigned NOT NULL,
  `equipmentId` smallint(5) unsigned NOT NULL,
  `dateAssigned` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `assignedBy` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employee` (`employeeId`),
  KEY `equipment` (`equipmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Asignación de equipo a empleados';

-- Dumping data for table hhrr.main_equipment_assigned: ~0 rows (approximately)
/*!40000 ALTER TABLE `main_equipment_assigned` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_equipment_assigned` ENABLE KEYS */;

-- Dumping structure for table hhrr.pay_advance_request
DROP TABLE IF EXISTS `pay_advance_request`;
CREATE TABLE IF NOT EXISTS `pay_advance_request` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la solicitud de adelanto',
  `employeeId` smallint(5) unsigned NOT NULL COMMENT 'Identificador del empleado',
  `date` date NOT NULL COMMENT 'Fecha de la solicitud',
  `amount` decimal(7,2) NOT NULL COMMENT 'Cantidad solicitada',
  `reason` varchar(100) NOT NULL COMMENT 'Razón de la solicitud (explicación)',
  `authorizedBy` smallint(5) unsigned NOT NULL COMMENT 'Identificador del empleado que autoriza, normalmente es el jefe del empleado o el gerente.',
  `authorizationDate` datetime NOT NULL COMMENT 'Fecha en que se autoriza la solicitud',
  `status` tinyint(3) unsigned NOT NULL COMMENT 'Estado',
  `observations` varchar(100) DEFAULT NULL COMMENT 'Observaciones',
  PRIMARY KEY (`id`),
  KEY `employee` (`employeeId`),
  KEY `authorized_by` (`authorizedBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Solicitudes de anticipo salarial';

-- Dumping data for table hhrr.pay_advance_request: ~0 rows (approximately)
/*!40000 ALTER TABLE `pay_advance_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_advance_request` ENABLE KEYS */;

-- Dumping structure for table hhrr.pay_emp_adjustment
DROP TABLE IF EXISTS `pay_emp_adjustment`;
CREATE TABLE IF NOT EXISTS `pay_emp_adjustment` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador del ajuste.',
  `payrollId` smallint(5) unsigned NOT NULL COMMENT 'Identificador de la planilla en la cual se hace el ajuste en pay_payroll_header',
  `employeeId` smallint(5) unsigned NOT NULL COMMENT 'Identificador del empleado al que se hace el ajuste.',
  `typeId` tinyint(3) unsigned NOT NULL COMMENT 'Identificador del tipo de ajuste. Relacionado el Catálogo de Ajustes.',
  `amount` decimal(7,2) unsigned NOT NULL COMMENT 'Valor por el cual se hará el ajuste.',
  `date` datetime NOT NULL COMMENT 'Fecha en que se hace el ajuste.',
  `isDebit` bit(1) NOT NULL COMMENT 'Indica si es un débito (un valor que se le deduce al empleado) o un crédito (valor a favor del empleado).',
  `description` varchar(100) NOT NULL COMMENT 'Descripcion explicativa de la razón del ajuste.',
  `isPending` bit(1) NOT NULL COMMENT 'Identifica si el ajuste ha sido aplicado o todavía no.',
  PRIMARY KEY (`id`),
  KEY `employee` (`employeeId`),
  KEY `adjustment` (`typeId`),
  KEY `payroll` (`payrollId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Almacena los ajustes que han sido asignados a un empleado.\r\nLos ajustes se asignarán hasta que la planilla haya sido generada.';

-- Dumping data for table hhrr.pay_emp_adjustment: ~0 rows (approximately)
/*!40000 ALTER TABLE `pay_emp_adjustment` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_emp_adjustment` ENABLE KEYS */;

-- Dumping structure for table hhrr.pay_emp_bonus
DROP TABLE IF EXISTS `pay_emp_bonus`;
CREATE TABLE IF NOT EXISTS `pay_emp_bonus` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador del bono asignado.',
  `employeeId` smallint(5) unsigned NOT NULL COMMENT 'Identificador del empleado al que se le asigna el bono.Relacionado con la tabla de empleados.',
  `bonusId` tinyint(3) unsigned NOT NULL COMMENT 'Identificador del tipo de bonificacion, relacionado con el catálogo de bonos.',
  `amount` decimal(7,2) unsigned NOT NULL COMMENT 'Valor que se pagará al empleado por concepto de bonificación.',
  `payDate` date NOT NULL COMMENT 'Fecha en que se hará el pago de la bonificación.',
  `isPayed` bit(1) NOT NULL COMMENT 'Indica si el bono ya fue pagado o nó.',
  PRIMARY KEY (`id`),
  KEY `employee` (`employeeId`),
  KEY `bonus` (`bonusId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Para guardar los bonos que se asignan a un empleado.';

-- Dumping data for table hhrr.pay_emp_bonus: ~0 rows (approximately)
/*!40000 ALTER TABLE `pay_emp_bonus` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_emp_bonus` ENABLE KEYS */;

-- Dumping structure for table hhrr.pay_emp_deduction
DROP TABLE IF EXISTS `pay_emp_deduction`;
CREATE TABLE IF NOT EXISTS `pay_emp_deduction` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la deduccion asignada.',
  `employeeId` smallint(5) unsigned NOT NULL COMMENT 'Identificador del empleado al cual se le ha asignado la deducción.',
  `deductionId` tinyint(3) unsigned NOT NULL COMMENT 'Identificador de la deduccion, relacionado con el catalogo de deducciones.',
  `amount` decimal(7,2) unsigned NOT NULL COMMENT 'Valor de la cuota que se deducirá en la planilla.',
  `fees` tinyint(3) unsigned NOT NULL COMMENT 'Numero de cuotas que pagará (se deducirán) por planilla.',
  `start` date NOT NULL COMMENT 'Fecha en que se inicia la deducción',
  `totalDebt` decimal(7,2) unsigned NOT NULL COMMENT 'Valor total de la deuda, que tiene que ser el valor de la cuota por el numero de cutoas.',
  `feesPayed` tinyint(3) unsigned NOT NULL COMMENT 'Contador de las cuotas que han sido pagadas (deducidas).',
  `balance` decimal(7,2) NOT NULL COMMENT 'Saldo pendiente para terminar de pagar la deuda.',
  `isFirst` bit(1) NOT NULL COMMENT 'Indica si la deducción se hará en la planilla de la primera quincena.',
  `isSecond` bit(1) NOT NULL COMMENT 'Indica si la deducción se hará en la segunda quincena.',
  `isActive` bit(1) NOT NULL COMMENT 'Indica si la deduccion está activa',
  PRIMARY KEY (`id`),
  KEY `employee` (`employeeId`) USING BTREE,
  KEY `deduction` (`deductionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Para almacenar las deducciones asignadas a un empleado.';

-- Dumping data for table hhrr.pay_emp_deduction: ~0 rows (approximately)
/*!40000 ALTER TABLE `pay_emp_deduction` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_emp_deduction` ENABLE KEYS */;

-- Dumping structure for table hhrr.pay_emp_income
DROP TABLE IF EXISTS `pay_emp_income`;
CREATE TABLE IF NOT EXISTS `pay_emp_income` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador del ingreso asignado.',
  `employeeId` smallint(5) unsigned NOT NULL COMMENT 'Identificador del empleado al cual se le ha asignado el ingreso.',
  `incomeId` tinyint(3) unsigned NOT NULL COMMENT 'Identificador del concepto de ingreso, relacionado con el catalogo de ingresos.',
  `amount` decimal(7,2) unsigned NOT NULL COMMENT 'Valor correspondiente al ingreso.',
  `when` date NOT NULL COMMENT 'Fecha en que se aplica el ingreso.',
  `isActive` bit(1) NOT NULL COMMENT 'Indica si está activo',
  PRIMARY KEY (`id`),
  KEY `employee` (`employeeId`) USING BTREE,
  KEY `deduction` (`incomeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='Para almacenar los ingresos asignados a un empleado.';

-- Dumping data for table hhrr.pay_emp_income: ~0 rows (approximately)
/*!40000 ALTER TABLE `pay_emp_income` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_emp_income` ENABLE KEYS */;

-- Dumping structure for table hhrr.pay_leave_request
DROP TABLE IF EXISTS `pay_leave_request`;
CREATE TABLE IF NOT EXISTS `pay_leave_request` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la solicitud de permiso',
  `employeeId` smallint(5) unsigned NOT NULL COMMENT 'Identificador del empleado',
  `leaveTypeId` smallint(5) unsigned NOT NULL COMMENT 'Identificador del tipo de permiso',
  `requestDate` date NOT NULL COMMENT 'Fecha de la solicitus',
  `fromDate` date NOT NULL COMMENT 'Fecha de inicio del permiso',
  `toDate` date NOT NULL COMMENT 'Fecha de finalización del permiso',
  `reason` varchar(100) NOT NULL COMMENT 'Expliación de la razón del permiso',
  `aprovedBy` smallint(5) unsigned NOT NULL COMMENT 'Identificador del empleado que aprueba el permiso (jefe)',
  `aprovalDate` date NOT NULL COMMENT 'Fecha en se aprueba el permiso',
  `authorizedBy` smallint(5) unsigned NOT NULL COMMENT 'Identificador del empleado que autoriza (Gerente)',
  `authorizationDate` date NOT NULL COMMENT 'Fecha en que autoriza el permiso',
  `observations` varchar(100) NOT NULL COMMENT 'Observaciones',
  `status` tinyint(3) unsigned NOT NULL COMMENT 'Estado',
  PRIMARY KEY (`id`),
  KEY `employee` (`employeeId`),
  KEY `aproved_by` (`aprovedBy`),
  KEY `leave_type` (`leaveTypeId`),
  KEY `authorized_by` (`authorizedBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Solicitudes de permisos y vacaciones\r\n';

-- Dumping data for table hhrr.pay_leave_request: ~0 rows (approximately)
/*!40000 ALTER TABLE `pay_leave_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_leave_request` ENABLE KEYS */;

-- Dumping structure for table hhrr.pay_overtime_detail
DROP TABLE IF EXISTS `pay_overtime_detail`;
CREATE TABLE IF NOT EXISTS `pay_overtime_detail` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro de horas extras.',
  `requestId` smallint(5) unsigned NOT NULL COMMENT 'Identifica la solicitud a que pertenece.',
  `entryDate` date NOT NULL COMMENT 'Fecha en que se ingresa el detalle de actividades.',
  `activityDate` date NOT NULL COMMENT 'La fecha en que se realizó la actividad en horario extendido.',
  `startTime` time NOT NULL COMMENT 'Hora en que se inició la actividad.',
  `startTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `endTime` time NOT NULL COMMENT 'Hora en que finalizó la actividad.',
  `endTimeStamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activities` varchar(100) NOT NULL COMMENT 'Descripción de las actividades realizadas en el horario extendido.',
  PRIMARY KEY (`id`),
  KEY `requestId` (`requestId`),
  CONSTRAINT `FK_pay_overtime_detail_pay_overtime_request` FOREIGN KEY (`requestId`) REFERENCES `pay_overtime_request` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8 COMMENT='Detalle de actividades realizadas por horas.';

-- Dumping data for table hhrr.pay_overtime_detail: ~162 rows (approximately)
/*!40000 ALTER TABLE `pay_overtime_detail` DISABLE KEYS */;
INSERT INTO `pay_overtime_detail` (`id`, `requestId`, `entryDate`, `activityDate`, `startTime`, `startTimeStamp`, `endTime`, `endTimeStamp`, `activities`) VALUES
	(3, 38, '2017-08-04', '2017-08-01', '19:00:00', '2017-08-04 14:42:41', '20:00:00', '0000-00-00 00:00:00', '7-8'),
	(4, 38, '2017-08-04', '2017-08-01', '20:00:00', '2017-08-04 14:51:48', '23:00:00', '0000-00-00 00:00:00', '8-11'),
	(5, 5, '2017-08-04', '2017-07-17', '19:00:00', '2017-08-04 16:06:13', '20:00:00', '0000-00-00 00:00:00', '7-8'),
	(6, 5, '2017-08-04', '2017-07-17', '20:00:00', '2017-08-04 16:09:04', '21:00:00', '0000-00-00 00:00:00', '2da act de 8-9'),
	(7, 5, '2017-08-04', '2017-07-17', '21:00:00', '2017-08-04 16:10:09', '23:59:00', '0000-00-00 00:00:00', 'Hasta las 11:59'),
	(8, 1, '2017-08-04', '2017-07-22', '19:00:00', '2017-08-04 16:34:59', '20:00:00', '0000-00-00 00:00:00', '7-8 ingresada el 4-ago a las 4:34pm'),
	(9, 28, '2017-08-04', '2017-07-27', '19:00:00', '2017-08-04 17:47:15', '23:59:00', '0000-00-00 00:00:00', '7-11:59'),
	(10, 16, '2017-08-05', '2017-07-23', '20:00:00', '2017-08-05 16:50:32', '21:00:00', '0000-00-00 00:00:00', 'AAAAA'),
	(11, 16, '2017-08-05', '2017-07-23', '21:00:00', '2017-08-05 16:56:20', '23:59:00', '0000-00-00 00:00:00', 'Probando la VEntana'),
	(12, 57, '2017-08-05', '2017-08-05', '19:00:00', '2017-08-05 17:01:33', '20:00:00', '0000-00-00 00:00:00', 'Conociendo la Lógica'),
	(13, 57, '2017-08-05', '2017-08-05', '20:00:00', '2017-08-05 17:04:00', '21:00:00', '0000-00-00 00:00:00', 'Ingresando datos de prueba'),
	(14, 57, '2017-08-05', '2017-08-05', '21:00:00', '2017-08-05 17:06:16', '23:59:00', '0000-00-00 00:00:00', 'Mas pruebas'),
	(15, 57, '2017-08-05', '2017-08-05', '22:00:00', '2017-08-05 17:08:09', '23:00:00', '0000-00-00 00:00:00', 'asdfasdf'),
	(16, 35, '2017-08-05', '2017-07-29', '19:00:00', '2017-08-05 22:56:33', '23:59:00', '0000-00-00 00:00:00', 'full'),
	(17, 25, '2017-08-05', '2017-07-27', '19:00:00', '2017-08-05 23:02:35', '23:59:00', '0000-00-00 00:00:00', 'Full programming'),
	(18, 53, '2017-08-05', '2017-08-04', '21:00:00', '2017-08-05 23:34:23', '22:00:00', '0000-00-00 00:00:00', 'Prueba'),
	(19, 1, '2017-08-06', '2017-07-22', '20:00:00', '2017-08-06 19:39:23', '22:00:00', '0000-00-00 00:00:00', 'de 8 a 10 pm'),
	(20, 1, '2017-08-06', '2017-07-22', '22:00:00', '2017-08-06 19:49:41', '23:00:00', '0000-00-00 00:00:00', '10-11'),
	(21, 18, '2017-08-06', '2017-07-24', '19:00:00', '2017-08-06 20:19:14', '20:00:00', '0000-00-00 00:00:00', 'Scripts'),
	(22, 18, '2017-08-06', '2017-07-24', '20:00:00', '2017-08-06 21:02:54', '21:00:00', '0000-00-00 00:00:00', 'Restart the server...'),
	(23, 18, '2017-08-06', '2017-07-24', '21:00:00', '2017-08-06 21:03:51', '23:59:00', '0000-00-00 00:00:00', 'Full progra...'),
	(24, 18, '2017-08-06', '2017-07-24', '23:59:00', '2017-08-06 21:05:12', '00:59:00', '0000-00-00 00:00:00', 'Cambio de día...'),
	(25, 18, '2017-08-06', '2017-07-25', '01:00:00', '2017-08-06 21:08:07', '03:00:00', '0000-00-00 00:00:00', 'de 1 a 3 am del 25de julio'),
	(26, 7, '2017-08-06', '2017-07-23', '19:00:00', '2017-08-06 21:57:28', '20:00:00', '0000-00-00 00:00:00', 'Codificando'),
	(27, 24, '2017-08-07', '2017-07-26', '19:00:00', '2017-08-07 11:08:35', '23:59:00', '0000-00-00 00:00:00', 'Toda la noche programando'),
	(28, 3, '2017-08-07', '2017-07-15', '19:00:00', '2017-08-07 11:49:09', '20:00:00', '0000-00-00 00:00:00', 'Primer hora'),
	(29, 3, '2017-08-07', '2017-07-15', '20:00:00', '2017-08-07 11:51:32', '21:00:00', '0000-00-00 00:00:00', '2da hora'),
	(30, 3, '2017-08-07', '2017-07-15', '21:00:00', '2017-08-07 11:53:06', '22:00:00', '0000-00-00 00:00:00', 'Aqui si'),
	(31, 3, '2017-08-07', '2017-07-15', '22:00:00', '2017-08-07 11:57:18', '23:00:00', '0000-00-00 00:00:00', '4to reg'),
	(32, 3, '2017-08-07', '2017-07-15', '00:00:00', '2017-08-07 11:57:35', '20:00:00', '0000-00-00 00:00:00', 'a'),
	(33, 4, '2017-08-07', '2017-07-16', '00:00:00', '2017-08-07 12:01:52', '20:00:00', '0000-00-00 00:00:00', '7-8'),
	(34, 4, '2017-08-07', '2017-07-16', '19:00:00', '2017-08-07 12:02:21', '20:00:00', '0000-00-00 00:00:00', 'a'),
	(35, 4, '2017-08-07', '2017-07-16', '20:00:00', '2017-08-07 12:02:28', '21:00:00', '0000-00-00 00:00:00', 'aaaa'),
	(36, 4, '2017-08-07', '2017-07-16', '18:00:00', '2017-08-07 12:03:22', '19:00:00', '0000-00-00 00:00:00', 'a'),
	(37, 38, '2017-08-08', '2017-08-01', '23:00:00', '2017-08-08 23:32:49', '23:59:00', '0000-00-00 00:00:00', 'Agregue una mas de 11 a 11:59'),
	(38, 6, '2017-08-08', '2017-07-23', '19:00:00', '2017-08-08 23:36:37', '20:00:00', '0000-00-00 00:00:00', '7-8'),
	(39, 25, '2017-08-09', '2017-07-27', '23:59:00', '2017-08-09 06:51:07', '00:59:00', '0000-00-00 00:00:00', 'a'),
	(40, 2, '2017-08-15', '2017-07-22', '19:00:00', '2017-08-15 20:16:44', '23:59:00', '0000-00-00 00:00:00', '1'),
	(41, 2, '2017-08-15', '2017-07-22', '23:59:00', '2017-08-15 20:16:54', '05:00:00', '0000-00-00 00:00:00', '2'),
	(42, 32, '2017-08-15', '2017-07-29', '19:00:00', '2017-08-15 20:18:06', '20:00:00', '0000-00-00 00:00:00', '1'),
	(43, 53, '2017-08-15', '2017-08-04', '22:00:00', '2017-08-15 20:27:43', '23:59:00', '0000-00-00 00:00:00', 'a'),
	(44, 53, '2017-08-15', '2017-08-04', '23:59:00', '2017-08-15 20:28:10', '05:00:00', '0000-00-00 00:00:00', 'a'),
	(45, 31, '2017-08-15', '2017-07-28', '19:00:00', '2017-08-15 21:21:29', '23:59:00', '0000-00-00 00:00:00', 'Viernes'),
	(46, 31, '2017-08-15', '2017-07-28', '23:59:00', '2017-08-15 21:22:21', '06:00:00', '0000-00-00 00:00:00', 'a'),
	(47, 32, '2017-08-18', '2017-07-29', '20:00:00', '2017-08-18 11:11:48', '21:00:00', '0000-00-00 00:00:00', '1 hora'),
	(48, 25, '2017-08-18', '2017-07-28', '00:59:00', '2017-08-18 11:31:39', '05:00:00', '0000-00-00 00:00:00', 'Hasta las 5 Am del 28'),
	(49, 6, '2017-08-18', '2017-07-23', '20:00:00', '2017-08-18 15:19:12', '23:59:00', '0000-00-00 00:00:00', 'Hasta las 12'),
	(50, 6, '2017-08-18', '2017-07-23', '23:59:00', '2017-08-18 15:19:42', '05:30:00', '0000-00-00 00:00:00', 'Hasta las 5:30 supuesyamende del 24 de Julio'),
	(51, 56, '2017-08-18', '2017-08-05', '19:00:00', '2017-08-18 15:21:42', '23:59:00', '0000-00-00 00:00:00', 'Toda la noche'),
	(52, 56, '2017-08-18', '2017-08-05', '23:59:00', '2017-08-18 15:21:54', '06:00:00', '0000-00-00 00:00:00', 'toda la madrugada'),
	(53, 7, '2017-08-18', '2017-07-23', '20:00:00', '2017-08-18 15:23:23', '21:00:00', '0000-00-00 00:00:00', '1'),
	(54, 20, '2017-08-18', '2017-07-24', '19:00:00', '2017-08-18 15:44:59', '20:00:00', '0000-00-00 00:00:00', '1'),
	(55, 20, '2017-08-18', '2017-07-24', '20:00:00', '2017-08-18 15:52:32', '21:00:00', '0000-00-00 00:00:00', '2'),
	(56, 20, '2017-08-18', '2017-07-24', '21:00:00', '2017-08-18 15:52:48', '22:00:00', '0000-00-00 00:00:00', '3'),
	(57, 20, '2017-08-18', '2017-07-24', '22:00:00', '2017-08-18 15:54:11', '23:00:00', '0000-00-00 00:00:00', 'q'),
	(58, 7, '2017-08-18', '2017-07-23', '21:00:00', '2017-08-18 15:54:46', '23:59:00', '0000-00-00 00:00:00', 'a'),
	(59, 28, '2017-08-21', '2017-07-27', '23:59:00', '2017-08-21 16:43:46', '06:00:00', '0000-00-00 00:00:00', 'Siguiente día.'),
	(60, 26, '2017-08-22', '2017-07-27', '19:00:00', '2017-08-22 11:02:40', '23:59:00', '0000-00-00 00:00:00', '1'),
	(61, 33, '2017-08-22', '2017-07-29', '19:00:00', '2017-08-22 11:02:56', '23:59:00', '0000-00-00 00:00:00', '1'),
	(62, 33, '2017-08-22', '2017-07-29', '23:59:00', '2017-08-22 11:03:01', '06:59:00', '0000-00-00 00:00:00', '2'),
	(63, 60, '2017-08-22', '2017-08-06', '22:00:00', '2017-08-22 11:03:31', '23:00:00', '0000-00-00 00:00:00', '1'),
	(64, 60, '2017-08-22', '2017-08-06', '23:00:00', '2017-08-22 11:03:33', '00:00:00', '0000-00-00 00:00:00', '2'),
	(65, 60, '2017-08-22', '2017-08-07', '00:00:00', '2017-08-22 11:03:36', '01:00:00', '0000-00-00 00:00:00', '3'),
	(66, 60, '2017-08-22', '2017-08-07', '01:00:00', '2017-08-22 11:03:38', '02:00:00', '0000-00-00 00:00:00', '4'),
	(67, 60, '2017-08-22', '2017-08-07', '02:00:00', '2017-08-22 11:03:48', '03:00:00', '0000-00-00 00:00:00', '5'),
	(68, 60, '2017-08-22', '2017-08-07', '03:00:00', '2017-08-22 11:03:50', '04:00:00', '0000-00-00 00:00:00', '6'),
	(69, 60, '2017-08-22', '2017-08-07', '04:00:00', '2017-08-22 11:03:54', '05:00:00', '0000-00-00 00:00:00', '7'),
	(70, 60, '2017-08-22', '2017-08-07', '05:00:00', '2017-08-22 11:04:00', '06:00:00', '0000-00-00 00:00:00', '8'),
	(71, 54, '2017-08-22', '2017-08-05', '19:00:00', '2017-08-22 11:04:49', '20:00:00', '0000-00-00 00:00:00', '1'),
	(72, 54, '2017-08-22', '2017-08-05', '20:00:00', '2017-08-22 11:04:53', '21:00:00', '0000-00-00 00:00:00', '2'),
	(73, 54, '2017-08-22', '2017-08-05', '21:00:00', '2017-08-22 11:04:54', '22:00:00', '0000-00-00 00:00:00', '3'),
	(74, 54, '2017-08-22', '2017-08-05', '22:00:00', '2017-08-22 11:04:56', '23:00:00', '0000-00-00 00:00:00', '4'),
	(75, 35, '2017-08-22', '2017-07-29', '23:59:00', '2017-08-22 11:05:51', '06:59:00', '0000-00-00 00:00:00', '2'),
	(76, 23, '2017-08-22', '2017-07-25', '19:00:00', '2017-08-22 21:31:46', '23:59:00', '0000-00-00 00:00:00', '5 hr'),
	(77, 23, '2017-08-22', '2017-07-25', '23:59:00', '2017-08-22 21:32:01', '07:00:00', '0000-00-00 00:00:00', '7hrs'),
	(78, 77, '2017-08-22', '2017-08-18', '19:00:00', '2017-08-22 21:33:32', '23:59:00', '0000-00-00 00:00:00', '5hrs'),
	(79, 77, '2017-08-22', '2017-08-18', '23:59:00', '2017-08-22 21:33:39', '06:59:00', '0000-00-00 00:00:00', '6'),
	(80, 30, '2017-08-22', '2017-07-27', '19:00:00', '2017-08-22 21:44:12', '23:59:00', '0000-00-00 00:00:00', '5'),
	(81, 34, '2017-08-22', '2017-07-29', '19:00:00', '2017-08-22 21:44:25', '23:59:00', '0000-00-00 00:00:00', 'a'),
	(82, 37, '2017-08-22', '2017-07-30', '19:00:00', '2017-08-22 22:16:37', '23:59:00', '0000-00-00 00:00:00', '5hrs'),
	(83, 29, '2017-08-23', '2017-07-27', '19:00:00', '2017-08-23 15:38:43', '23:59:00', '0000-00-00 00:00:00', '5'),
	(84, 84, '2017-08-24', '2017-08-23', '19:00:00', '2017-08-24 09:44:19', '20:00:00', '0000-00-00 00:00:00', 'Lei el blueprint.'),
	(85, 84, '2017-08-24', '2017-08-23', '20:00:00', '2017-08-24 09:45:30', '23:30:00', '0000-00-00 00:00:00', 'Codifique parte de la API'),
	(86, 84, '2017-08-24', '2017-08-23', '23:30:00', '2017-08-24 09:46:23', '06:00:00', '0000-00-00 00:00:00', 'Continué codificando.'),
	(87, 86, '2017-08-24', '2017-08-24', '19:00:00', '2017-08-24 09:47:31', '23:59:00', '0000-00-00 00:00:00', '1 er actividad'),
	(88, 86, '2017-08-24', '2017-08-24', '23:59:00', '2017-08-24 09:47:43', '05:00:00', '0000-00-00 00:00:00', 'segunda actividad'),
	(89, 36, '2017-08-26', '2017-07-30', '19:00:00', '2017-08-26 17:05:18', '23:59:00', '0000-00-00 00:00:00', 'Prueba nueva'),
	(90, 36, '2017-08-26', '2017-07-30', '23:59:00', '2017-08-26 17:05:49', '05:59:00', '0000-00-00 00:00:00', 'Fase dos 6 horas'),
	(91, 17, '2017-08-26', '2017-07-23', '19:00:00', '2017-08-26 17:06:45', '20:00:00', '0000-00-00 00:00:00', '1 horas'),
	(92, 17, '2017-08-26', '2017-07-23', '20:00:00', '2017-08-26 17:07:13', '21:00:00', '0000-00-00 00:00:00', '1 horas, van dos acumuladas'),
	(93, 17, '2017-08-26', '2017-07-23', '21:00:00', '2017-08-26 17:07:23', '22:00:00', '0000-00-00 00:00:00', 'van tres'),
	(94, 59, '2017-08-26', '2017-08-06', '19:00:00', '2017-08-26 17:09:43', '20:00:00', '0000-00-00 00:00:00', '1'),
	(95, 59, '2017-08-26', '2017-08-06', '20:00:00', '2017-08-26 17:09:47', '21:00:00', '0000-00-00 00:00:00', '2'),
	(96, 59, '2017-08-26', '2017-08-06', '21:00:00', '2017-08-26 17:09:49', '22:00:00', '0000-00-00 00:00:00', '3'),
	(97, 59, '2017-08-26', '2017-08-06', '22:00:00', '2017-08-26 17:09:51', '23:00:00', '0000-00-00 00:00:00', '4'),
	(98, 80, '2017-08-26', '2017-08-18', '05:00:00', '2017-08-26 17:12:39', '06:00:00', '0000-00-00 00:00:00', '1'),
	(99, 80, '2017-08-26', '2017-08-18', '06:00:00', '2017-08-26 17:12:43', '07:00:00', '0000-00-00 00:00:00', '2'),
	(100, 80, '2017-08-26', '2017-08-18', '07:00:00', '2017-08-26 17:12:46', '08:00:00', '0000-00-00 00:00:00', '3'),
	(101, 88, '2017-08-26', '2017-08-25', '19:00:00', '2017-08-26 17:18:08', '20:00:00', '0000-00-00 00:00:00', '1'),
	(102, 88, '2017-08-26', '2017-08-25', '20:00:00', '2017-08-26 17:18:13', '21:00:00', '0000-00-00 00:00:00', '2'),
	(103, 88, '2017-08-26', '2017-08-25', '21:00:00', '2017-08-26 17:18:16', '22:00:00', '0000-00-00 00:00:00', '3'),
	(104, 88, '2017-08-26', '2017-08-25', '22:00:00', '2017-08-26 17:18:17', '23:00:00', '0000-00-00 00:00:00', '4'),
	(105, 88, '2017-08-26', '2017-08-25', '23:00:00', '2017-08-26 17:18:19', '00:00:00', '0000-00-00 00:00:00', '5'),
	(106, 88, '2017-08-26', '2017-08-26', '00:00:00', '2017-08-26 17:18:21', '01:00:00', '0000-00-00 00:00:00', '6'),
	(107, 88, '2017-08-26', '2017-08-26', '01:00:00', '2017-08-26 17:18:23', '02:00:00', '0000-00-00 00:00:00', '7'),
	(108, 88, '2017-08-26', '2017-08-26', '02:00:00', '2017-08-26 17:18:25', '03:00:00', '0000-00-00 00:00:00', '8'),
	(109, 88, '2017-08-26', '2017-08-26', '03:00:00', '2017-08-26 17:18:32', '04:00:00', '0000-00-00 00:00:00', '9'),
	(110, 88, '2017-08-26', '2017-08-26', '04:00:00', '2017-08-26 17:18:35', '05:00:00', '0000-00-00 00:00:00', '10'),
	(111, 88, '2017-08-26', '2017-08-26', '05:00:00', '2017-08-26 17:18:38', '06:00:00', '0000-00-00 00:00:00', '11'),
	(112, 22, '2017-08-26', '2017-07-24', '20:00:00', '2017-08-26 17:21:23', '21:00:00', '0000-00-00 00:00:00', '1'),
	(113, 22, '2017-08-26', '2017-07-24', '21:00:00', '2017-08-26 17:21:25', '22:00:00', '0000-00-00 00:00:00', '2'),
	(114, 22, '2017-08-26', '2017-07-24', '22:00:00', '2017-08-26 17:21:27', '23:00:00', '0000-00-00 00:00:00', '3'),
	(115, 87, '2017-08-26', '2017-08-24', '19:00:00', '2017-08-26 17:22:54', '20:00:00', '0000-00-00 00:00:00', '1'),
	(116, 87, '2017-08-26', '2017-08-24', '20:00:00', '2017-08-26 17:22:57', '21:00:00', '0000-00-00 00:00:00', '2'),
	(117, 77, '2017-08-26', '2017-08-19', '06:59:00', '2017-08-26 20:16:38', '07:59:00', '0000-00-00 00:00:00', 'à'),
	(118, 91, '2017-08-27', '2017-08-26', '19:00:00', '2017-08-27 11:10:58', '23:59:00', '0000-00-00 00:00:00', '5 horas cpn la BD'),
	(119, 91, '2017-08-27', '2017-08-26', '23:59:00', '2017-08-27 11:12:06', '00:59:00', '0000-00-00 00:00:00', '1 hora mas'),
	(120, 91, '2017-08-27', '2017-08-27', '00:59:00', '2017-08-27 11:12:53', '06:00:00', '0000-00-00 00:00:00', 'Revisando problemas con el servidor. 5 horas'),
	(121, 78, '2017-08-27', '2017-08-18', '19:00:00', '2017-08-27 15:27:39', '20:00:00', '0000-00-00 00:00:00', '1'),
	(122, 98, '2017-08-27', '2017-08-27', '19:00:00', '2017-08-27 17:46:30', '20:00:00', '0000-00-00 00:00:00', 'balance'),
	(123, 98, '2017-08-27', '2017-08-27', '20:00:00', '2017-08-27 17:46:57', '21:00:00', '0000-00-00 00:00:00', 'estado de resultado'),
	(124, 98, '2017-08-27', '2017-08-27', '21:00:00', '2017-08-27 17:47:12', '22:00:00', '0000-00-00 00:00:00', 'flujo de efectivo'),
	(125, 98, '2017-08-27', '2017-08-27', '22:00:00', '2017-08-27 17:51:15', '23:00:00', '0000-00-00 00:00:00', 'estado de patrimonio'),
	(126, 94, '2017-08-27', '2017-08-27', '19:00:00', '2017-08-27 18:09:18', '23:59:00', '0000-00-00 00:00:00', 'Listo'),
	(127, 92, '2017-08-27', '2017-08-27', '19:00:00', '2017-08-27 18:12:35', '23:59:00', '0000-00-00 00:00:00', '5 horas'),
	(128, 96, '2017-08-27', '2017-08-27', '19:00:00', '2017-08-27 18:14:17', '23:59:00', '0000-00-00 00:00:00', '5 h'),
	(129, 96, '2017-08-27', '2017-08-27', '23:59:00', '2017-08-27 18:14:36', '06:59:00', '0000-00-00 00:00:00', '7 hrs.'),
	(130, 103, '2017-06-05', '2017-06-05', '21:00:00', '2017-06-05 17:05:26', '23:59:00', '0000-00-00 00:00:00', 'testing'),
	(131, 103, '2017-06-05', '2017-06-05', '23:59:00', '2017-06-05 17:05:40', '02:30:00', '0000-00-00 00:00:00', 'testing'),
	(132, 83, '2017-09-01', '2017-08-23', '22:00:00', '2017-09-01 10:11:12', '23:00:00', '0000-00-00 00:00:00', '1'),
	(133, 104, '2017-09-01', '2017-09-01', '19:00:00', '2017-09-01 11:45:17', '23:59:00', '0000-00-00 00:00:00', '5 hrs'),
	(134, 104, '2017-09-01', '2017-09-01', '23:59:00', '2017-09-01 11:45:44', '06:00:00', '0000-00-00 00:00:00', '6 horas mas.'),
	(135, 39, '2017-09-01', '2017-08-01', '19:00:00', '2017-09-01 13:18:57', '23:59:00', '0000-00-00 00:00:00', 'T'),
	(136, 46, '2017-09-01', '2017-08-02', '19:00:00', '2017-09-01 13:19:18', '20:00:00', '0000-00-00 00:00:00', '1'),
	(137, 46, '2017-09-01', '2017-08-02', '20:00:00', '2017-09-01 13:19:20', '21:00:00', '0000-00-00 00:00:00', '2'),
	(138, 46, '2017-09-01', '2017-08-02', '21:00:00', '2017-09-01 13:19:21', '22:00:00', '0000-00-00 00:00:00', '3'),
	(139, 46, '2017-09-01', '2017-08-02', '22:00:00', '2017-09-01 13:19:22', '23:00:00', '0000-00-00 00:00:00', '4'),
	(140, 46, '2017-09-01', '2017-08-02', '23:00:00', '2017-09-01 13:19:23', '00:00:00', '0000-00-00 00:00:00', '5'),
	(141, 46, '2017-09-01', '2017-08-03', '00:00:00', '2017-09-01 13:19:24', '01:00:00', '0000-00-00 00:00:00', '6'),
	(142, 46, '2017-09-01', '2017-08-03', '01:00:00', '2017-09-01 13:19:25', '02:00:00', '0000-00-00 00:00:00', '7'),
	(143, 46, '2017-09-01', '2017-08-03', '02:00:00', '2017-09-01 13:19:27', '03:00:00', '0000-00-00 00:00:00', '8'),
	(144, 46, '2017-09-01', '2017-08-03', '03:00:00', '2017-09-01 13:19:28', '04:00:00', '0000-00-00 00:00:00', '9'),
	(145, 105, '2017-09-01', '2017-09-01', '21:00:00', '2017-09-01 17:01:10', '23:59:00', '0000-00-00 00:00:00', '3'),
	(146, 105, '2017-09-01', '2017-09-01', '23:59:00', '2017-09-01 17:01:21', '06:00:00', '0000-00-00 00:00:00', '6'),
	(147, 106, '2017-08-01', '2017-08-01', '21:17:00', '2017-09-02 06:11:34', '22:08:00', '0000-00-00 00:00:00', 'Semana de turno'),
	(148, 107, '2017-06-20', '2017-06-20', '21:00:00', '2017-06-20 05:58:09', '23:59:00', '0000-00-00 00:00:00', '3 hrs tipo III'),
	(149, 108, '2017-06-22', '2017-06-11', '19:00:00', '2017-06-22 15:41:59', '23:59:00', '0000-00-00 00:00:00', '5'),
	(150, 108, '2017-06-22', '2017-06-11', '23:59:00', '2017-06-22 15:42:10', '07:00:00', '0000-00-00 00:00:00', '7'),
	(151, 109, '2017-06-22', '2017-06-12', '18:00:00', '2017-06-22 15:58:38', '23:59:00', '0000-00-00 00:00:00', '5'),
	(152, 109, '2017-06-22', '2017-06-12', '23:59:00', '2017-06-22 15:58:48', '03:00:00', '0000-00-00 00:00:00', '4'),
	(153, 110, '2017-06-22', '2017-06-22', '18:00:00', '2017-06-22 15:55:54', '19:00:00', '0000-00-00 00:00:00', '1'),
	(154, 110, '2017-06-22', '2017-06-22', '19:00:00', '2017-06-22 15:56:00', '21:00:00', '0000-00-00 00:00:00', '2'),
	(155, 110, '2017-06-22', '2017-06-22', '21:00:00', '2017-06-22 15:56:06', '23:00:00', '0000-00-00 00:00:00', '2'),
	(156, 111, '2017-09-03', '2017-05-25', '21:00:00', '2017-09-03 16:13:09', '23:59:00', '0000-00-00 00:00:00', '3'),
	(157, 111, '2017-09-03', '2017-05-25', '23:59:00', '2017-09-03 16:13:51', '01:30:00', '0000-00-00 00:00:00', '1.5'),
	(158, 112, '2017-09-03', '2017-05-29', '21:00:00', '2017-09-03 16:14:17', '23:59:00', '0000-00-00 00:00:00', '3'),
	(159, 112, '2017-09-03', '2017-05-29', '23:59:00', '2017-09-03 16:14:38', '04:00:00', '0000-00-00 00:00:00', '4'),
	(160, 113, '2017-09-03', '2017-06-05', '21:00:00', '2017-09-03 16:15:11', '23:59:00', '0000-00-00 00:00:00', '3'),
	(161, 113, '2017-09-03', '2017-06-05', '23:59:00', '2017-09-03 16:15:29', '02:30:00', '0000-00-00 00:00:00', '2.5'),
	(162, 115, '2017-09-04', '2017-06-06', '21:00:00', '2017-09-04 08:05:58', '22:30:00', '0000-00-00 00:00:00', 'T'),
	(163, 116, '2017-09-04', '2017-06-21', '18:00:00', '2017-09-04 08:06:26', '23:59:00', '0000-00-00 00:00:00', 't'),
	(164, 117, '2017-09-04', '2017-06-22', '21:00:00', '2017-09-04 08:06:54', '22:30:00', '0000-00-00 00:00:00', 't');
/*!40000 ALTER TABLE `pay_overtime_detail` ENABLE KEYS */;

-- Dumping structure for table hhrr.pay_overtime_request
DROP TABLE IF EXISTS `pay_overtime_request`;
CREATE TABLE IF NOT EXISTS `pay_overtime_request` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador del reporte de horas extras.',
  `employeeId` smallint(5) unsigned NOT NULL COMMENT 'Identificador del empleado que presenta el reporte.',
  `date` date NOT NULL COMMENT 'Fecha de la solicitud',
  `dateTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp de la fecha para pruebas de compatibilidad y manejo de campos fecha en angularJs',
  `startTime` time NOT NULL DEFAULT '00:00:00' COMMENT 'Hora de inicio de las actividades.',
  `estimatedTime` tinyint(3) unsigned NOT NULL COMMENT 'Tiempo estimado en horas.',
  `requestedBy` varchar(50) NOT NULL COMMENT 'Nombre de la person que solicita el trabajo.',
  `class` enum('Normal','Interna','Ventana') NOT NULL DEFAULT 'Normal' COMMENT 'Para efectos internos de CENTEC, es la clasificacion de las hoas extras.',
  `description` varchar(200) NOT NULL COMMENT 'Descripción de la actividad solicitada.',
  `isOpen` bit(1) NOT NULL COMMENT 'Indica si el reporte ya fue completado, si ya se ingresó el detalle.',
  `state` enum('Pendiente','Aprobada','Cerrada','Rechazada','Devuelta','Autorizada','Pagada') NOT NULL COMMENT 'Indica el estado de la solicitud. Workflow.',
  `decidedBy` smallint(5) unsigned DEFAULT NULL COMMENT 'Identificador del jefe que aprueba las horas extras',
  `decisionDate` timestamp NULL DEFAULT NULL COMMENT 'Fecha en que fue aprobada la solicitud.',
  `authorizedBy` smallint(5) unsigned DEFAULT NULL COMMENT 'Identifica a la persona que autoriza el pago.',
  `authorizationDate` timestamp NULL DEFAULT NULL COMMENT 'Fecha en que autoriza el pago.',
  `payDate` date DEFAULT NULL COMMENT 'Fecha en que se pagarán las horas extras.',
  `observations` varchar(200) DEFAULT NULL COMMENT 'Comentarios y razones de rechazo.',
  PRIMARY KEY (`id`),
  KEY `decidedBy` (`decidedBy`),
  KEY `authorizedBy` (`authorizedBy`),
  KEY `employee` (`employeeId`),
  CONSTRAINT `FK_pay_overtime_request_main_employee` FOREIGN KEY (`employeeId`) REFERENCES `main_employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8 COMMENT='Almacena la solicitud de horas extras.';

-- Dumping data for table hhrr.pay_overtime_request: ~86 rows (approximately)
/*!40000 ALTER TABLE `pay_overtime_request` DISABLE KEYS */;
INSERT INTO `pay_overtime_request` (`id`, `employeeId`, `date`, `dateTimeStamp`, `startTime`, `estimatedTime`, `requestedBy`, `class`, `description`, `isOpen`, `state`, `decidedBy`, `decisionDate`, `authorizedBy`, `authorizationDate`, `payDate`, `observations`) VALUES
	(1, 36, '2017-07-22', '2017-07-29 09:53:21', '19:00:00', 4, 'JC', 'Normal', 'Prueba', b'1', 'Rechazada', 1, '2017-08-17 12:00:24', 0, '0000-00-00 00:00:00', '0000-00-00', 'A R'),
	(2, 55, '2017-07-22', '2017-07-29 09:53:21', '19:00:00', 4, 'JC', 'Normal', 'Prueba', b'1', 'Rechazada', 1, '2017-08-03 03:12:14', 1, '2017-08-22 08:21:17', '0000-00-00', 'a'),
	(3, 55, '2017-07-15', '2017-07-29 09:53:21', '19:00:00', 3, 'a', 'Normal', 'a', b'1', 'Autorizada', 1, '2017-08-03 03:11:35', 1, '2017-08-22 08:34:42', NULL, 'a'),
	(4, 55, '2017-07-16', '2017-07-29 09:53:21', '18:00:00', 2, 'a', 'Normal', 'a', b'1', 'Autorizada', 1, '2017-08-03 03:12:10', 1, '2017-08-23 12:33:46', NULL, 'a\nAutorizada para pago.'),
	(5, 36, '2017-07-17', '2017-07-29 09:53:21', '19:00:00', 4, 'a', 'Interna', 'a', b'1', 'Rechazada', 1, '2017-08-17 12:59:02', 1, '2017-08-22 08:30:43', NULL, 'A\nR today'),
	(6, 55, '2017-07-23', '2017-07-29 09:53:21', '19:00:00', 4, 'JC', 'Normal', 'Prueba para envio de correo', b'1', 'Cerrada', 1, '2017-08-03 03:11:58', 0, '0000-00-00 00:00:00', '0000-00-00', 'a'),
	(7, 54, '2017-07-23', '2017-07-29 09:53:21', '19:00:00', 4, 'JC', 'Interna', 'Prueba de correo', b'1', 'Cerrada', 1, '2017-07-30 08:31:53', 1, '2017-08-22 08:22:42', '0000-00-00', 'A'),
	(16, 30, '2017-07-23', '2017-07-29 09:53:21', '20:00:00', 4, 'g', 'Ventana', 'g', b'1', 'Cerrada', 1, '2017-07-30 08:33:03', 0, '0000-00-00 00:00:00', '0000-00-00', 'A'),
	(17, 1, '2017-07-23', '2017-07-29 09:53:21', '19:00:00', 3, '3', 'Normal', '3', b'1', 'Cerrada', NULL, NULL, NULL, NULL, '0000-00-00', ''),
	(18, 56, '2017-07-24', '2017-07-29 09:53:21', '19:00:00', 4, 'Alejandro Servellon', 'Ventana', 'Ventana de manteninmiento', b'1', 'Autorizada', 1, '2017-07-29 08:14:12', 1, '2017-08-22 08:25:25', '0000-00-00', 'Sal'),
	(19, 55, '2017-07-24', '2017-07-29 09:53:21', '19:00:00', 4, 'JC', 'Normal', 'Prueba', b'1', 'Rechazada', 1, '2017-08-07 08:10:25', 0, '0000-00-00 00:00:00', '0000-00-00', 'Se enfermó.'),
	(20, 54, '2017-07-24', '2017-07-29 09:53:21', '19:00:00', 4, 'Hector Berrios', 'Normal', 'Terminar actividades', b'1', 'Autorizada', 1, '2017-08-07 10:10:03', 13, '2017-08-22 09:36:07', '0000-00-00', 'Act\nAutorizo Yo'),
	(21, 4, '2017-07-24', '2017-07-29 09:53:21', '19:00:00', 4, 'Jc', 'Interna', 'Jc', b'1', 'Rechazada', 13, '2017-07-31 06:13:53', 0, '0000-00-00 00:00:00', '0000-00-00', 'R'),
	(22, 1, '2017-07-24', '2017-07-29 09:53:21', '20:00:00', 4, 'qwe', 'Normal', 'qwer', b'1', 'Cerrada', 0, '0000-00-00 00:00:00', 0, NULL, '0000-00-00', 'Tiene que terminar pronto.'),
	(23, 4, '2017-07-25', '2017-07-29 09:53:21', '19:00:00', 4, 'JC', 'Normal', 'Revision sistema de HHEE', b'1', 'Cerrada', 13, '2017-07-30 07:32:20', 0, '0000-00-00 00:00:00', '0000-00-00', 'A'),
	(24, 55, '2017-07-26', '2017-07-29 09:53:21', '19:00:00', 4, 'JC', 'Normal', 'Prueba', b'1', 'Cerrada', 1, '2017-08-03 03:11:44', 0, '0000-00-00 00:00:00', '0000-00-00', 'a'),
	(25, 45, '2017-07-27', '2017-07-29 09:53:21', '19:00:00', 4, 'Angel', 'Interna', 'Prueba de hoy', b'1', 'Autorizada', 1, '2017-07-30 08:32:54', 1, '2017-08-22 08:26:45', '0000-00-00', 'A'),
	(26, 54, '2017-07-27', '2017-07-29 09:53:21', '19:00:00', 4, 'JC', 'Normal', 'Programming', b'1', 'Cerrada', 1, '2017-07-30 08:33:38', 1, '2017-08-22 08:26:50', '0000-00-00', 'AAAA'),
	(27, 1, '2017-07-27', '2017-07-29 09:53:21', '19:00:00', 4, 'Salvador', 'Normal', 'Programando', b'1', 'Rechazada', 1, '2017-08-07 08:07:04', 0, '0000-00-00 00:00:00', '0000-00-00', 'No se logró confirmar el trabajo.'),
	(28, 36, '2017-07-27', '2017-07-29 09:53:21', '19:00:00', 4, 'Salvador', 'Normal', 'Prueba del sistema', b'1', 'Autorizada', 1, '2017-08-17 12:04:55', 1, '2017-08-22 08:25:47', '0000-00-00', 'A'),
	(29, 55, '2017-07-27', '2017-07-29 09:53:21', '19:00:00', 4, 'JC', 'Normal', 'jC', b'1', 'Cerrada', 1, '2017-08-03 03:12:05', 0, '0000-00-00 00:00:00', '0000-00-00', 'a'),
	(30, 4, '2017-07-27', '2017-07-29 09:53:21', '19:00:00', 2, 'JC', 'Normal', 'Revision de proyectos.', b'1', 'Cerrada', 13, '2017-07-30 06:38:22', 0, '0000-00-00 00:00:00', '0000-00-00', 'a'),
	(31, 55, '2017-07-28', '2017-07-29 09:53:21', '19:00:00', 4, 'JC', 'Normal', 'Pruebas en el modulo de Horas Extras', b'1', 'Cerrada', 1, '2017-08-03 03:11:50', 1, '2017-08-22 08:48:03', '0000-00-00', 'a'),
	(32, 55, '2017-07-29', '2017-07-29 10:40:13', '19:00:00', 4, 'Myself', 'Normal', 'I need to work hard...', b'1', 'Cerrada', 1, '2017-08-03 01:16:52', 0, '0000-00-00 00:00:00', '0000-00-00', 'Aprobada para meter detalle de acts.'),
	(33, 54, '2017-07-29', '2017-07-29 16:21:21', '19:00:00', 4, 'Hector', 'Normal', 'Avanzar con IP', b'1', 'Cerrada', 18, '2017-08-22 09:30:29', 0, '0000-00-00 00:00:00', '0000-00-00', 'A'),
	(34, 4, '2017-07-29', '2017-07-29 16:43:18', '19:00:00', 4, 'JC', 'Normal', 'Prueba de la API', b'1', 'Cerrada', 13, '2017-07-30 06:54:16', 0, '0000-00-00 00:00:00', '0000-00-00', 'AAAAAAAAAA'),
	(35, 45, '2017-07-29', '2017-07-29 19:10:33', '19:00:00', 4, 'SalV', 'Normal', 'Hay que incorporar aqui la clasificación', b'1', 'Cerrada', 18, '2017-07-29 07:12:06', 0, '0000-00-00 00:00:00', '0000-00-00', 'Hay que cambiar el Tipo a la ventana de solicitud'),
	(36, 55, '2017-07-30', '2017-07-30 08:37:49', '19:00:00', 3, 'Jc', 'Normal', 'Jc', b'1', 'Cerrada', NULL, NULL, NULL, NULL, '0000-00-00', 'A'),
	(37, 56, '2017-07-30', '2017-07-30 20:35:22', '19:00:00', 4, 'Hb', 'Normal', 'Hb', b'1', 'Autorizada', 18, '2017-08-25 04:55:13', 0, '0000-00-00 00:00:00', '0000-00-00', 'A'),
	(38, 55, '2017-08-01', '2017-08-01 11:14:00', '19:00:00', 4, 'Sal', 'Normal', 'Yey!', b'1', 'Autorizada', 1, '2017-08-03 03:12:21', 27, '2017-09-02 07:31:20', '0000-00-00', 'a\nAutorizada para Pago'),
	(39, 45, '2017-08-01', '2017-08-01 14:33:35', '19:00:00', 4, 'SalV', 'Normal', 'Trabajo Extra, deberia llevar interna en el campo class.', b'1', 'Cerrada', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', 'T'),
	(45, 36, '2017-08-01', '2017-08-01 21:44:54', '19:00:00', 3, 'Salvador Alberto Flores Aguilar', 'Ventana', 'Ventana', b'1', 'Rechazada', 1, '2017-08-24 03:33:17', 0, '0000-00-00 00:00:00', '0000-00-00', 'A'),
	(46, 45, '2017-08-02', '2017-08-02 14:36:27', '19:00:00', 4, 'Salvador Alberto Flores Aguilar', 'Ventana', 'Ventana a las 7 pm solicitada por Sal', b'1', 'Cerrada', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', 'T'),
	(52, 55, '2017-08-03', '2017-08-03 21:02:15', '19:00:00', 4, '4', 'Interna', '4', b'1', 'Aprobada', 1, '2017-06-20 06:14:05', 0, '0000-00-00 00:00:00', '0000-00-00', 'T'),
	(53, 55, '2017-08-04', '2017-08-04 11:25:16', '21:00:00', 3, 'Sal', 'Interna', 'Pruebas del modulo', b'1', 'Autorizada', 1, '2017-08-04 11:26:08', NULL, '2017-08-23 03:29:57', '0000-00-00', 'pruebas del modulo\nAutorizada para Pago'),
	(54, 36, '2017-08-05', '2017-08-05 08:53:27', '19:00:00', 4, 'Sal', 'Interna', 'TE', b'1', 'Autorizada', 1, '2017-08-07 09:57:25', NULL, '2017-08-23 03:30:42', '0000-00-00', 'Avances con el BP para 2morrow!\nAuto'),
	(55, 1, '2017-08-05', '2017-08-05 08:54:15', '20:00:00', 4, 'Sal', 'Normal', 'N', b'1', 'Rechazada', 1, '2017-08-07 10:38:10', 0, '0000-00-00 00:00:00', '0000-00-00', NULL),
	(56, 54, '2017-08-05', '2017-08-05 08:56:22', '19:00:00', 3, 'Sal', 'Interna', 'TE', b'1', 'Autorizada', 1, '2017-08-07 10:37:21', NULL, '2017-08-23 03:32:14', '0000-00-00', 'A'),
	(57, 30, '2017-08-05', '2017-08-05 16:58:05', '19:00:00', 4, 'JC', 'Interna', 'Probar el modulo de HHEE', b'1', 'Autorizada', 1, '2017-08-05 04:59:30', NULL, '2017-08-23 03:33:08', '0000-00-00', 'Listo para ingresar detalle'),
	(58, 45, '2017-08-05', '2017-08-05 18:32:30', '19:00:00', 4, 'Jc', 'Interna', 'Pilas', b'1', 'Aprobada', 27, '2017-09-01 01:17:47', 0, '0000-00-00 00:00:00', '0000-00-00', 'T'),
	(59, 55, '2017-08-06', '2017-08-06 18:36:37', '19:00:00', 4, 'Salvador Alberto Flores Aguilar', 'Interna', 'En casa', b'1', 'Cerrada', NULL, NULL, NULL, NULL, '0000-00-00', 'A'),
	(60, 56, '2017-08-06', '2017-08-06 20:02:12', '22:00:00', 4, 'Salv', 'Normal', 'Urgente!', b'1', 'Autorizada', 1, '2017-08-24 03:32:43', 13, '2017-09-01 10:58:58', '0000-00-00', 'Rechada hoy 7 de agosto,\nApr el mismo día a las 10:55am\nAutorizada 1-Sep'),
	(61, 55, '2017-08-07', '2017-08-07 19:32:53', '19:00:00', 4, 'Me', 'Normal', 'Normales el 7-ago', b'1', 'Pendiente', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', ''),
	(75, 55, '2017-08-17', '2017-08-17 00:05:26', '19:00:00', 4, 'Sal', 'Interna', 'Sal', b'1', 'Pendiente', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', ''),
	(76, 45, '2017-08-17', '2017-08-17 01:04:43', '19:00:00', 4, 'Sal', 'Interna', 'Extra', b'1', 'Aprobada', 27, '2017-09-01 01:17:56', 0, '0000-00-00 00:00:00', '0000-00-00', 'T'),
	(77, 54, '2017-08-18', '2017-08-18 15:58:27', '19:00:00', 4, 'Sal', 'Interna', 'Papa probar calculo', b'1', 'Cerrada', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', 'Ok'),
	(78, 30, '2017-08-18', '2017-08-18 16:03:18', '19:00:00', 4, 'Sal', 'Interna', 'Prueba', b'1', 'Cerrada', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', 'A'),
	(79, 1, '2017-08-18', '2017-08-18 16:03:52', '19:00:00', 4, 'Sal', 'Interna', 'Prueba', b'1', 'Pendiente', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', ''),
	(80, 36, '2017-08-18', '2017-08-18 16:04:27', '05:00:00', 4, 'Salvador Alberto Flores Aguilar', 'Interna', 'Prueba', b'1', 'Cerrada', NULL, NULL, NULL, NULL, '0000-00-00', ''),
	(81, 45, '2017-08-18', '2017-08-18 16:30:34', '19:00:00', 4, 'Sal', 'Interna', 'Prueba', b'1', 'Pendiente', 27, '2017-09-01 01:18:03', 0, '0000-00-00 00:00:00', '0000-00-00', 'T'),
	(82, 45, '2017-08-23', '2017-08-23 00:04:18', '19:00:00', 4, 'Alex', 'Normal', 'Mejoras a la BD', b'1', 'Pendiente', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', ''),
	(83, 56, '2017-08-23', '2017-08-23 00:06:47', '22:00:00', 4, 'Prueba con otra Jornada', 'Normal', 'Prueba de Jornada Nocturna', b'1', 'Aprobada', 1, '2017-08-23 08:37:55', 0, '0000-00-00 00:00:00', '0000-00-00', ''),
	(84, 54, '2017-08-23', '2017-08-23 00:07:58', '19:00:00', 4, 'hberrios', 'Normal', 'Avance', b'1', 'Autorizada', 18, '2017-08-24 09:41:54', 13, '2017-08-24 09:51:17', '0000-00-00', 'Para probar el sistema\nAutorizo el pago'),
	(85, 1, '2017-08-23', '2017-08-23 00:08:44', '19:00:00', 4, 'Sal', 'Interna', 'Work hard.', b'1', 'Pendiente', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', ''),
	(86, 54, '2017-08-24', '2017-08-24 09:38:20', '19:00:00', 4, 'Gabriel', 'Interna', 'Avanzar con el proyecto', b'1', 'Autorizada', 18, '2017-08-24 09:42:25', 1, '2017-08-25 04:49:50', '0000-00-00', 'Seunda aprobada para meter datos...'),
	(87, 55, '2017-08-24', '2017-08-24 14:38:08', '19:00:00', 4, 'S', 'Normal', 'A', b'1', 'Cerrada', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', 'Listo para meter datos.'),
	(88, 55, '2017-08-25', '2017-08-25 17:40:40', '19:00:00', 4, 'Salvador Alberto Flores Aguilar', 'Interna', 'Prueba de fecha anterior', b'1', 'Cerrada', 0, '0000-00-00 00:00:00', 0, NULL, '0000-00-00', 'Aprobada'),
	(89, 55, '2017-08-26', '2017-08-26 05:41:55', '19:00:00', 4, 'Salvador Alberto Flores Aguilar', 'Interna', 'Prueba de nueva ventana Modal', b'1', 'Pendiente', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', ''),
	(90, 54, '2017-08-26', '2017-08-26 18:49:18', '19:00:00', 4, 'Salvador Alberto Flores Aguilar', 'Interna', 'Prueba del modulo de HHEE', b'1', 'Aprobada', 18, '2017-09-01 11:51:23', 0, '0000-00-00 00:00:00', '0000-00-00', 'A'),
	(91, 49, '2017-08-26', '2017-08-26 20:35:18', '19:00:00', 4, 'IP', 'Interna', 'Avanzar con proyecto IP', b'1', 'Cerrada', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', 'Confirmado con La Jefa en el IP'),
	(92, 49, '2017-08-27', '2017-08-27 11:13:22', '19:00:00', 4, 'IP', 'Interna', 'Avanzar con proyecto IP', b'1', 'Cerrada', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', 'Confirmado con La Jefa en el IP'),
	(93, 55, '2017-08-27', '2017-08-27 14:03:37', '19:00:00', 4, 'Emilio', 'Interna', 'Avanzar con proyecto IP', b'1', 'Pendiente', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', ''),
	(94, 30, '2017-08-27', '2017-08-27 16:33:09', '19:00:00', 4, 'gosorio', 'Interna', 'Pruebas con el modulo de HHEE', b'1', 'Cerrada', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', 'Verificada con Gabriel'),
	(95, 56, '2017-08-27', '2017-08-27 17:19:29', '22:00:00', 4, '4', 'Normal', '4', b'1', 'Pendiente', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', ''),
	(96, 54, '2017-08-27', '2017-08-27 17:23:05', '19:00:00', 4, '4', 'Normal', '4', b'1', 'Cerrada', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', 'Verificado con Emilio'),
	(97, 36, '2017-08-27', '2017-08-27 17:24:58', '05:00:00', 4, '4', 'Normal', 'Para probar cierre de modal al enviar la solicitud.', b'1', 'Aprobada', 1, '2017-06-20 06:12:26', 0, '0000-00-00 00:00:00', '0000-00-00', 'T'),
	(98, 1, '2017-08-27', '2017-08-27 17:40:40', '19:00:00', 3, 'Paco', 'Interna', 'Estados Financieros Institucionales', b'1', 'Cerrada', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', 'Confirme por telefono con Paco.'),
	(99, 45, '2017-08-28', '2017-08-28 09:40:40', '19:00:00', 4, 'Paco', 'Normal', 'Hacer estados financieros', b'1', 'Pendiente', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', ''),
	(100, 1, '2017-08-28', '2017-08-28 09:45:44', '19:00:00', 4, 'Paco', 'Normal', 'Hacer E/F', b'1', 'Pendiente', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', ''),
	(101, 54, '2017-08-28', '2017-08-28 09:49:24', '19:00:00', 4, 'Emilio', 'Normal', 'Corregir bug en formulario de ingreso de datos.', b'1', 'Aprobada', 18, '2017-09-01 11:51:10', 0, '0000-00-00 00:00:00', '0000-00-00', 'A'),
	(102, 31, '2017-08-28', '2017-08-28 09:58:21', '19:00:00', 4, 'JC Mercado', 'Interna', 'Trabajar con Salvador en RRHH', b'1', 'Aprobada', 27, '2017-08-28 10:00:04', 0, '0000-00-00 00:00:00', '0000-00-00', 'Confirmado.'),
	(103, 12, '2017-06-05', '2017-06-05 17:02:03', '19:00:00', 4, 'testing', 'Normal', 'testing', b'1', 'Cerrada', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', ''),
	(104, 54, '2017-09-01', '2017-09-01 11:04:38', '19:00:00', 4, 'testing', 'Interna', 'testing', b'1', 'Cerrada', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', 'testing'),
	(105, 12, '2017-09-01', '2017-09-01 17:00:11', '19:00:00', 4, 'T', 'Interna', 'T', b'1', 'Cerrada', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', 'T'),
	(106, 20, '2017-08-01', '2017-09-02 06:01:47', '19:00:00', 4, 'T', 'Interna', 'T', b'1', 'Cerrada', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', 'T'),
	(107, 12, '2017-06-20', '2017-06-20 05:55:00', '19:00:00', 4, 'T', 'Normal', 'T', b'1', 'Cerrada', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', 'T'),
	(108, 49, '2017-06-11', '2017-06-11 15:38:19', '17:00:00', 4, 'T', 'Interna', 'T', b'1', 'Cerrada', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', 'T'),
	(109, 49, '2017-06-12', '2017-06-12 15:39:54', '17:00:00', 4, 'T', 'Interna', 'T', b'1', 'Cerrada', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', 'T'),
	(110, 49, '2017-06-22', '2017-06-22 15:40:29', '17:00:00', 4, 'T', 'Interna', 'T', b'1', 'Cerrada', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', 'T'),
	(111, 15, '2017-05-25', '2017-05-25 16:08:13', '17:00:00', 4, 'T', 'Interna', 'T', b'1', 'Cerrada', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', 't'),
	(112, 15, '2017-05-29', '2017-05-29 16:08:56', '17:00:00', 4, 't', 'Interna', 't', b'1', 'Cerrada', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', 't'),
	(113, 15, '2017-06-05', '2017-06-05 16:09:56', '17:00:00', 4, 't', 'Interna', 't', b'1', 'Cerrada', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', 't'),
	(114, 8, '2017-06-05', '2017-06-05 07:46:43', '17:00:00', 4, 'T', 'Interna', 'T', b'1', 'Pendiente', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', ''),
	(115, 39, '2017-06-06', '2017-06-06 07:57:21', '21:00:00', 4, 'T', 'Interna', 'T', b'1', 'Cerrada', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', 't'),
	(116, 39, '2017-06-21', '2017-06-21 07:59:23', '17:00:00', 4, 'T', 'Interna', 'T', b'1', 'Cerrada', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', 't'),
	(117, 39, '2017-06-22', '2017-06-22 08:00:20', '17:00:00', 4, 'T', 'Interna', 'T', b'1', 'Cerrada', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', 't');
/*!40000 ALTER TABLE `pay_overtime_request` ENABLE KEYS */;

-- Dumping structure for table hhrr.pay_payroll_detail
DROP TABLE IF EXISTS `pay_payroll_detail`;
CREATE TABLE IF NOT EXISTS `pay_payroll_detail` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador del detalle de la planilla.',
  `payrollId` smallint(5) unsigned NOT NULL COMMENT 'Identificador de la planilla.',
  `employeeId` smallint(5) unsigned NOT NULL COMMENT 'Identificador del empleado.',
  `salary` decimal(7,2) unsigned NOT NULL COMMENT 'El salario del empleado.',
  PRIMARY KEY (`id`),
  KEY `employee` (`employeeId`),
  KEY `payroll` (`payrollId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contiene un registro por cada empleado que aparece en una planilla.';

-- Dumping data for table hhrr.pay_payroll_detail: ~0 rows (approximately)
/*!40000 ALTER TABLE `pay_payroll_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_payroll_detail` ENABLE KEYS */;

-- Dumping structure for table hhrr.pay_payroll_detail_deduction
DROP TABLE IF EXISTS `pay_payroll_detail_deduction`;
CREATE TABLE IF NOT EXISTS `pay_payroll_detail_deduction` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la deducción ',
  `detailId` mediumint(8) unsigned NOT NULL COMMENT 'Indica a que detalle de planilla pertenece la deducción.',
  `deductionId` smallint(5) unsigned NOT NULL COMMENT 'identifica la deduccion asignada al empleado, segun pay_emp_deductions',
  `amount` decimal(7,2) unsigned NOT NULL COMMENT 'Valor que se le deduce al empleado.',
  PRIMARY KEY (`id`),
  KEY `detail` (`detailId`),
  KEY `deduction` (`deductionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Almacena un registro por cada deducción que se hace en una planilla determinada.\r\nEsta tabla sirve como un historial de las deducciones hechas y sirve tambien para la generación de los recibos de pago.';

-- Dumping data for table hhrr.pay_payroll_detail_deduction: ~0 rows (approximately)
/*!40000 ALTER TABLE `pay_payroll_detail_deduction` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_payroll_detail_deduction` ENABLE KEYS */;

-- Dumping structure for table hhrr.pay_payroll_detail_income
DROP TABLE IF EXISTS `pay_payroll_detail_income`;
CREATE TABLE IF NOT EXISTS `pay_payroll_detail_income` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador del ingreso.',
  `detailId` mediumint(8) unsigned NOT NULL COMMENT 'Identificador del detalle de planilla en la cual se genera el ingreso.',
  `incomeId` smallint(5) unsigned NOT NULL COMMENT 'Identificador del tipo de ingreso',
  `amount` decimal(7,2) unsigned NOT NULL COMMENT 'Valor que se paga.',
  PRIMARY KEY (`id`),
  KEY `detail` (`detailId`),
  KEY `income` (`incomeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Almacena un registro por cada concepto de ingreso que se hace en una planilla determinada.\nEsta tabla sirve como un historial de los ingresos y sirve tambien para la generación de los recibos de pago.';

-- Dumping data for table hhrr.pay_payroll_detail_income: ~0 rows (approximately)
/*!40000 ALTER TABLE `pay_payroll_detail_income` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_payroll_detail_income` ENABLE KEYS */;

-- Dumping structure for table hhrr.pay_payroll_header
DROP TABLE IF EXISTS `pay_payroll_header`;
CREATE TABLE IF NOT EXISTS `pay_payroll_header` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la planilla.',
  `payrollTypeId` smallint(5) unsigned NOT NULL COMMENT 'Indica el tipo de planilla.',
  `month` tinyint(3) unsigned NOT NULL COMMENT 'Indica el número del mes de la planilla.',
  `fromDate` date NOT NULL COMMENT 'Fecha de inicio del periodo que cubre la planilla.',
  `toDate` date NOT NULL COMMENT 'Fecha final del periodo que cubre la planilla.',
  `payDate` date NOT NULL COMMENT 'Fecha de pago de la planilla.',
  `workflowStatus` tinyint(3) unsigned NOT NULL COMMENT 'Para dar seguimiento al workflow de la planilla. Generada, Aprobada, Autorizada y Pagada.',
  `isPayed` bit(1) NOT NULL COMMENT 'Indica si ya fueron pagadas',
  PRIMARY KEY (`id`),
  KEY `payroll_type` (`payrollTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla del encabezado de una planilla.';

-- Dumping data for table hhrr.pay_payroll_header: ~0 rows (approximately)
/*!40000 ALTER TABLE `pay_payroll_header` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_payroll_header` ENABLE KEYS */;

-- Dumping structure for table hhrr.pay_vacation_request
DROP TABLE IF EXISTS `pay_vacation_request`;
CREATE TABLE IF NOT EXISTS `pay_vacation_request` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la solicitud de permiso',
  `employeeId` smallint(5) unsigned NOT NULL COMMENT 'Identificador del empleado',
  `leaveTypeId` smallint(5) unsigned NOT NULL COMMENT 'Identificador del tipo de permiso',
  `requestDate` date NOT NULL COMMENT 'Fecha de la solicitus',
  `fromDate` date NOT NULL COMMENT 'Fecha de inicio del permiso',
  `toDate` date NOT NULL COMMENT 'Fecha de finalización del permiso',
  `reason` varchar(100) NOT NULL COMMENT 'Expliación de la razón del permiso',
  `aprovedBy` smallint(5) unsigned NOT NULL COMMENT 'Identificador del empleado que aprueba el permiso (jefe)',
  `aprovalDate` date NOT NULL COMMENT 'Fecha en se aprueba el permiso',
  `authorizedBy` smallint(5) unsigned NOT NULL COMMENT 'Identificador del empleado que autoriza (Gerente)',
  `authorizationDate` date NOT NULL COMMENT 'Fecha en que autoriza el permiso',
  `observations` varchar(100) NOT NULL COMMENT 'Observaciones',
  `status` tinyint(3) unsigned NOT NULL COMMENT 'Estado',
  PRIMARY KEY (`id`),
  KEY `employee` (`employeeId`),
  KEY `aproved_by` (`aprovedBy`),
  KEY `leave_type` (`leaveTypeId`),
  KEY `authorized_by` (`authorizedBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='Solicitudes de permisos y vacaciones\r\n';

-- Dumping data for table hhrr.pay_vacation_request: ~0 rows (approximately)
/*!40000 ALTER TABLE `pay_vacation_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_vacation_request` ENABLE KEYS */;

-- Dumping structure for table hhrr.sec_login
DROP TABLE IF EXISTS `sec_login`;
CREATE TABLE IF NOT EXISTS `sec_login` (
  `id` smallint(5) unsigned NOT NULL COMMENT 'Identificador del usuario.',
  `userId` smallint(5) unsigned NOT NULL,
  `password` varchar(200) NOT NULL,
  `passSalt` varchar(128) NOT NULL,
  `mobile` varchar(8) NOT NULL,
  `email` varchar(50) NOT NULL,
  `profile` tinyint(3) unsigned NOT NULL,
  `employee` smallint(5) unsigned DEFAULT NULL,
  `isActive` tinyint(1) unsigned DEFAULT NULL,
  `creation` datetime DEFAULT NULL,
  `failedAttempts` datetime DEFAULT NULL,
  `lastLogin` datetime DEFAULT NULL,
  `lastLockout` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='better not say what it is.';

-- Dumping data for table hhrr.sec_login: ~0 rows (approximately)
/*!40000 ALTER TABLE `sec_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `sec_login` ENABLE KEYS */;

-- Dumping structure for table hhrr.sec_profile
DROP TABLE IF EXISTS `sec_profile`;
CREATE TABLE IF NOT EXISTS `sec_profile` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(15) DEFAULT NULL,
  `description` varchar(100) NOT NULL,
  `isActive` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Perfiles';

-- Dumping data for table hhrr.sec_profile: ~3 rows (approximately)
/*!40000 ALTER TABLE `sec_profile` DISABLE KEYS */;
INSERT INTO `sec_profile` (`id`, `name`, `description`, `isActive`) VALUES
	(1, 'Gerente', 'Todos los privilegios', b'1'),
	(2, 'Administrador', 'Administrador ', b'1'),
	(3, 'Colaborador', 'Empleado normal', b'1');
/*!40000 ALTER TABLE `sec_profile` ENABLE KEYS */;

-- Dumping structure for table hhrr.sec_profile_resource
DROP TABLE IF EXISTS `sec_profile_resource`;
CREATE TABLE IF NOT EXISTS `sec_profile_resource` (
  `profileId` tinyint(3) unsigned NOT NULL,
  `resourceId` smallint(5) unsigned NOT NULL,
  KEY `profileId` (`profileId`),
  KEY `resourceId` (`resourceId`),
  CONSTRAINT `FK_sec_profile_resource_sec_profile` FOREIGN KEY (`profileId`) REFERENCES `sec_profile` (`id`),
  CONSTRAINT `FK_sec_profile_resource_sys_resource` FOREIGN KEY (`resourceId`) REFERENCES `sys_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Recursos asignados a cada perfil';

-- Dumping data for table hhrr.sec_profile_resource: ~60 rows (approximately)
/*!40000 ALTER TABLE `sec_profile_resource` DISABLE KEYS */;
INSERT INTO `sec_profile_resource` (`profileId`, `resourceId`) VALUES
	(1, 20),
	(1, 2),
	(1, 19),
	(1, 12),
	(1, 13),
	(1, 14),
	(1, 15),
	(1, 16),
	(1, 17),
	(1, 18),
	(1, 3),
	(1, 4),
	(1, 5),
	(1, 6),
	(1, 7),
	(1, 8),
	(1, 9),
	(1, 10),
	(1, 11),
	(1, 1),
	(2, 16),
	(2, 3),
	(2, 5),
	(2, 17),
	(2, 8),
	(2, 10),
	(2, 11),
	(2, 1),
	(3, 10),
	(3, 16),
	(1, 21),
	(1, 22),
	(1, 23),
	(1, 24),
	(1, 25),
	(1, 26),
	(1, 27),
	(1, 29),
	(1, 30),
	(1, 31),
	(1, 32),
	(1, 33),
	(1, 34),
	(1, 35),
	(1, 36),
	(1, 37),
	(1, 38),
	(1, 39),
	(1, 40),
	(1, 41),
	(1, 42),
	(1, 43),
	(1, 44),
	(1, 45),
	(2, 13),
	(2, 14),
	(2, 15),
	(2, 20),
	(2, 68),
	(1, 68);
/*!40000 ALTER TABLE `sec_profile_resource` ENABLE KEYS */;

-- Dumping structure for table hhrr.sec_user
DROP TABLE IF EXISTS `sec_user`;
CREATE TABLE IF NOT EXISTS `sec_user` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `userName` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `profileId` tinyint(3) unsigned NOT NULL,
  `employeeId` smallint(5) unsigned DEFAULT NULL,
  `firstName` varchar(20) DEFAULT NULL,
  `lastName` varchar(20) DEFAULT NULL,
  `phone` varchar(8) NOT NULL,
  `avatar` varchar(20) DEFAULT NULL,
  `isActive` bit(1) NOT NULL,
  `changePass` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`userName`),
  KEY `profileId` (`profileId`),
  KEY `FK_sec_user_main_employee` (`employeeId`),
  CONSTRAINT `FK_sec_user_sec_profile` FOREIGN KEY (`profileId`) REFERENCES `sec_profile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- Dumping data for table hhrr.sec_user: ~8 rows (approximately)
/*!40000 ALTER TABLE `sec_user` DISABLE KEYS */;
INSERT INTO `sec_user` (`id`, `userName`, `email`, `password`, `profileId`, `employeeId`, `firstName`, `lastName`, `phone`, `avatar`, `isActive`, `changePass`) VALUES
	(1, 'root', 'salva_flores@yahoo.com', 'cee0887eac15e5ebfd3e7321074d9025', 1, 0, 'root', '', '', 'MyAvatar.png', b'1', NULL),
	(2, 'admin', 'admin@admin.com', '0847d7bbf3c41a20fe8b21795cb29e9f', 2, 1, 'Admin', '', '88888888', 'man.png', b'1', NULL),
	(3, 'jcmercado', 'jmercado@hngsystems.com', '03aad7bfdcccad63ec30eace351ff21b', 1, 1, 'Juan Carlos', 'Mercado', '88888888', 'man.png', b'1', NULL),
	(4, 'gosorio', 'gosorio@lufergo.com', 'a3fee4075b69c2de9cbb165b60ea925f', 1, 2, 'Gabriel', 'Osorio', '22324016', 'man.png', b'1', NULL),
	(5, 'hberrios', 'hberrios@hngsystems.com', '1b9e336dd325c129cadb6165a88c379f', 1, 3, 'Hector', 'Berríos', '99372193', 'man.png', b'1', NULL),
	(6, 'vvarela', 'vvarela@hngsystems.com', 'cfdcc1a7c8b75575575146e8b422dc4d', 2, 4, 'Vanessa', 'Varela', '32963124', 'female.png', b'1', NULL),
	(7, 'czuniga', 'czuniga@hngsystems', '46f89d8f42060cd69a951dc4943de10e', 3, 54, 'Claudia', '', '96665026', 'female.png', b'1', NULL),
	(18, 'rodavlas', 'salva_flores@yahoo.com', '656cc3729afb8f2a64d731a0a0cc1cde', 1, 0, '', '', '95535116', 'man.png', b'1', NULL);
/*!40000 ALTER TABLE `sec_user` ENABLE KEYS */;

-- Dumping structure for table hhrr.sec_user_emp
DROP TABLE IF EXISTS `sec_user_emp`;
CREATE TABLE IF NOT EXISTS `sec_user_emp` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador unico',
  `userId` smallint(5) unsigned NOT NULL COMMENT 'Identificador del usuario',
  `employeeId` smallint(5) unsigned NOT NULL COMMENT 'Identificador del empleado',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `companyId` (`employeeId`),
  CONSTRAINT `FK_sec_user_emp_main_employee` FOREIGN KEY (`employeeId`) REFERENCES `main_employee` (`id`),
  CONSTRAINT `FK_sec_user_emp_sec_user` FOREIGN KEY (`userId`) REFERENCES `sec_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Tabla intermedia para asignar la relacion entre el usuario y el empleado.';

-- Dumping data for table hhrr.sec_user_emp: ~6 rows (approximately)
/*!40000 ALTER TABLE `sec_user_emp` DISABLE KEYS */;
INSERT INTO `sec_user_emp` (`id`, `userId`, `employeeId`) VALUES
	(1, 2, 1),
	(2, 3, 1),
	(3, 4, 2),
	(4, 5, 3),
	(5, 6, 4),
	(6, 7, 54);
/*!40000 ALTER TABLE `sec_user_emp` ENABLE KEYS */;

-- Dumping structure for table hhrr.sys_app
DROP TABLE IF EXISTS `sys_app`;
CREATE TABLE IF NOT EXISTS `sys_app` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `isVisible` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Tabla de Apps del Sistema';

-- Dumping data for table hhrr.sys_app: ~8 rows (approximately)
/*!40000 ALTER TABLE `sys_app` DISABLE KEYS */;
INSERT INTO `sys_app` (`id`, `name`, `icon`, `state`, `isVisible`) VALUES
	(1, 'Configuración', 'fa fa-cogs', 'app.dashboard', 1),
	(2, 'Empresa', 'fa fa-building-o', 'app.dashboard', 1),
	(3, 'Recursos Humanos', 'fa fa-users', 'app.dashboard', 1),
	(4, 'Clientes', 'fa fa-ship', 'app.dashboard', 1),
	(5, 'Inventario', 'fa fa-desktop', 'app.dashboard', 1),
	(6, 'Pedidos', 'fa fa-cart-plus', 'app.dashboard', 1),
	(7, 'Estadísticos', 'fa fa-pie-chart', 'app.dashboard', 1),
	(8, 'Documentación', 'fa fa-file', 'app.dashboard', 1);
/*!40000 ALTER TABLE `sys_app` ENABLE KEYS */;

-- Dumping structure for table hhrr.sys_config
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE IF NOT EXISTS `sys_config` (
  `key` varchar(100) NOT NULL DEFAULT '',
  `value` varchar(512) NOT NULL DEFAULT '',
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Dumping data for table hhrr.sys_config: ~0 rows (approximately)
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;

-- Dumping structure for table hhrr.sys_config_long
DROP TABLE IF EXISTS `sys_config_long`;
CREATE TABLE IF NOT EXISTS `sys_config_long` (
  `id_config` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `cKey` varchar(100) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  `fType` varchar(20) NOT NULL DEFAULT '',
  `fKey` mediumtext,
  `fValue` mediumtext,
  `isEditable` bit(1) NOT NULL DEFAULT b'1',
  `comment` mediumtext,
  `idSeq` smallint(5) unsigned DEFAULT '0',
  PRIMARY KEY (`id_config`),
  KEY `ckey` (`cKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table hhrr.sys_config_long: ~0 rows (approximately)
/*!40000 ALTER TABLE `sys_config_long` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_config_long` ENABLE KEYS */;

-- Dumping structure for table hhrr.sys_general_parameter
DROP TABLE IF EXISTS `sys_general_parameter`;
CREATE TABLE IF NOT EXISTS `sys_general_parameter` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT 'Nombre del parámetro',
  `description` varchar(200) NOT NULL COMMENT 'Descripción del parámetro',
  `value` varchar(200) NOT NULL COMMENT 'Valor',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Dumping data for table hhrr.sys_general_parameter: ~10 rows (approximately)
/*!40000 ALTER TABLE `sys_general_parameter` DISABLE KEYS */;
INSERT INTO `sys_general_parameter` (`id`, `name`, `description`, `value`) VALUES
	(1, 'company_form', 'Forma Jurídica de la empresa', ''),
	(2, 'emp_ihss', 'Porcentaje de cotización al Seguro Social del empleado', '0.25'),
	(3, 'isrTable', 'Indica la tabla de porcentajes a utilizar para el cáclculo del ISR', ''),
	(4, 'key', 'key para encriptacion', 'bcb04b7e103a0cd8b54763051cef08bc55abe029fdebae5e1d417e2ffb2a00a3'),
	(5, 'root', 'root', '1'),
	(6, 'Administrador', 'Perfil del Administrados del Sistema', '1'),
	(7, 'keyToken', 'llave de token', 'example_key'),
	(8, 'Expiration Time', 'Tiempo de expiración del token en segundos ejem: 1800=30min,900=15min,120=2min,60=1min', '30'),
	(9, 'HeaderToken', 'Llave del header del token', 'token'),
	(10, 'overStartTime', 'Hora permitida para el inicio de Horas Extras', '22:00');
/*!40000 ALTER TABLE `sys_general_parameter` ENABLE KEYS */;

-- Dumping structure for table hhrr.sys_log
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE IF NOT EXISTS `sys_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userId` smallint(5) unsigned NOT NULL COMMENT 'Usuario que ejecuta la accion',
  `action` tinyint(3) unsigned NOT NULL COMMENT 'Acción que se ejecuta',
  `userName` varchar(40) DEFAULT NULL COMMENT 'Usuario',
  `actionEnum` set('LOGIN','POST','PUT','DELETE') NOT NULL,
  `table` varchar(50) DEFAULT NULL COMMENT 'Tabla donde se hace el cambio',
  `when` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha y hora en que se ejecuta la acción',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8 COMMENT='Bitácora general del sistema';

-- Dumping data for table hhrr.sys_log: ~169 rows (approximately)
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` (`id`, `userId`, `action`, `userName`, `actionEnum`, `table`, `when`) VALUES
	(1, 3, 1, '::1', 'LOGIN', '', '2017-09-09 17:02:43'),
	(2, 4, 1, '::1', 'LOGIN', '', '2017-09-09 17:10:28'),
	(3, 6, 1, '::1', 'LOGIN', '', '2017-09-09 17:10:49'),
	(4, 4, 1, '::1', 'LOGIN', '', '2017-09-09 17:23:15'),
	(5, 6, 1, '::1', 'LOGIN', '', '2017-09-09 17:23:53'),
	(6, 1, 1, '::1', 'LOGIN', '', '2017-09-09 17:28:58'),
	(7, 4, 1, '::1', 'LOGIN', '', '2017-09-09 17:38:11'),
	(8, 6, 1, '::1', 'LOGIN', '', '2017-09-09 17:46:03'),
	(9, 1, 1, '::1', 'LOGIN', '', '2017-09-09 17:46:40'),
	(10, 1, 1, '::1', 'LOGIN', '', '2017-09-09 18:06:46'),
	(11, 4, 1, '::1', 'LOGIN', '', '2017-09-09 18:06:56'),
	(12, 6, 1, '::1', 'LOGIN', '', '2017-09-09 18:14:35'),
	(13, 5, 1, '::1', 'LOGIN', '', '2017-09-09 18:14:52'),
	(14, 1, 1, '::1', 'LOGIN', '', '2017-09-09 18:15:48'),
	(15, 1, 1, '::1', 'LOGIN', '', '2017-09-09 20:59:38'),
	(16, 1, 1, '::1', 'LOGIN', '', '2017-09-09 21:27:00'),
	(17, 1, 1, '::1', 'LOGIN', '', '2017-09-09 22:30:13'),
	(18, 4, 1, '::1', 'LOGIN', '', '2017-09-09 22:31:14'),
	(19, 1, 1, '::1', 'LOGIN', '', '2017-09-10 00:14:21'),
	(20, 1, 1, '::1', 'LOGIN', '', '2017-09-11 04:22:39'),
	(21, 1, 1, '::1', 'LOGIN', '', '2017-09-11 04:48:23'),
	(22, 1, 1, '::1', 'LOGIN', '', '2017-09-11 05:50:27'),
	(23, 1, 1, '::1', 'LOGIN', '', '2017-09-11 05:50:58'),
	(24, 4, 1, '::1', 'LOGIN', '', '2017-09-11 05:53:59'),
	(25, 4, 1, '::1', 'LOGIN', '', '2017-09-11 06:02:58'),
	(26, 4, 1, '::1', 'LOGIN', '', '2017-09-11 06:04:28'),
	(27, 6, 1, '::1', 'LOGIN', '', '2017-09-11 06:04:54'),
	(28, 6, 1, '::1', 'LOGIN', '', '2017-09-11 06:06:00'),
	(29, 1, 1, '::1', 'LOGIN', '', '2017-09-11 06:31:39'),
	(30, 6, 1, '::1', 'LOGIN', '', '2017-09-11 06:31:49'),
	(31, 1, 1, '::1', 'LOGIN', '', '2017-09-11 06:32:43'),
	(32, 4, 1, '::1', 'LOGIN', '', '2017-09-11 06:35:51'),
	(33, 4, 1, '::1', 'LOGIN', '', '2017-09-11 06:36:35'),
	(34, 1, 1, '::1', 'LOGIN', '', '2017-09-11 06:38:16'),
	(35, 6, 1, '::1', 'LOGIN', '', '2017-09-11 06:38:27'),
	(36, 1, 1, '::1', 'LOGIN', '', '2017-09-11 12:53:04'),
	(37, 4, 1, '::1', 'LOGIN', '', '2017-09-11 13:26:12'),
	(38, 1, 1, '::1', 'LOGIN', '', '2017-09-11 13:33:39'),
	(39, 3, 1, '::1', 'LOGIN', '', '2017-09-11 13:56:58'),
	(40, 1, 1, '::1', 'LOGIN', '', '2017-09-11 14:08:08'),
	(41, 3, 1, '::1', 'LOGIN', '', '2017-09-11 14:18:15'),
	(42, 4, 1, '::1', 'LOGIN', '', '2017-09-11 14:22:17'),
	(43, 1, 1, '::1', 'LOGIN', '', '2017-09-11 14:25:45'),
	(44, 4, 1, '::1', 'LOGIN', '', '2017-09-11 14:27:10'),
	(45, 1, 1, '::1', 'LOGIN', '', '2017-09-11 14:27:47'),
	(46, 3, 1, '::1', 'LOGIN', '', '2017-09-11 14:30:05'),
	(47, 1, 1, '::1', 'LOGIN', '', '2017-09-11 17:35:41'),
	(48, 6, 1, '::1', 'LOGIN', '', '2017-09-11 17:42:01'),
	(49, 6, 1, '::1', 'LOGIN', '', '2017-09-12 07:43:23'),
	(50, 1, 1, '::1', 'LOGIN', '', '2017-09-12 08:04:33'),
	(51, 1, 1, '::1', 'LOGIN', '', '2017-09-12 10:35:11'),
	(52, 1, 1, '::1', 'LOGIN', '', '2017-09-12 11:10:06'),
	(53, 3, 1, '::1', 'LOGIN', '', '2017-09-12 14:39:51'),
	(54, 1, 1, '::1', 'LOGIN', '', '2017-09-12 15:11:40'),
	(55, 3, 1, '::1', 'LOGIN', '', '2017-09-12 16:08:23'),
	(56, 1, 1, '::1', 'LOGIN', '', '2017-09-12 16:27:57'),
	(57, 3, 1, '::1', 'LOGIN', '', '2017-09-12 16:28:21'),
	(58, 4, 1, '::1', 'LOGIN', '', '2017-09-13 04:16:16'),
	(59, 1, 1, '::1', 'LOGIN', '', '2017-09-13 04:36:23'),
	(60, 3, 1, '::1', 'LOGIN', '', '2017-09-13 04:51:31'),
	(61, 3, 1, '::1', 'LOGIN', '', '2017-09-13 05:02:38'),
	(62, 3, 1, '::1', 'LOGIN', '', '2017-09-13 05:02:47'),
	(63, 6, 1, '::1', 'LOGIN', '', '2017-09-13 05:53:56'),
	(64, 2, 1, '::1', 'LOGIN', '', '2017-09-13 05:54:57'),
	(65, 1, 1, '::1', 'LOGIN', '', '2017-09-13 06:00:24'),
	(66, 3, 1, '::1', 'LOGIN', '', '2017-09-13 06:16:30'),
	(67, 4, 1, '::1', 'LOGIN', '', '2017-09-13 10:57:16'),
	(68, 4, 1, '::1', 'LOGIN', '', '2017-09-13 11:00:47'),
	(69, 1, 1, '::1', 'LOGIN', '', '2017-09-13 14:12:01'),
	(70, 1, 1, '::1', 'LOGIN', '', '2017-09-13 14:13:01'),
	(71, 4, 1, '::1', 'LOGIN', '', '2017-09-13 14:21:17'),
	(72, 1, 1, '::1', 'LOGIN', '', '2017-09-13 14:28:26'),
	(73, 1, 1, '::1', 'LOGIN', '', '2017-09-13 14:28:36'),
	(74, 1, 1, '::1', 'LOGIN', '', '2017-09-13 14:28:50'),
	(75, 4, 1, '::1', 'LOGIN', '', '2017-09-13 14:33:25'),
	(76, 4, 1, '::1', 'LOGIN', '', '2017-09-13 14:33:50'),
	(77, 4, 1, '::1', 'LOGIN', '', '2017-09-13 14:34:12'),
	(78, 4, 1, '::1', 'LOGIN', '', '2017-09-13 16:05:43'),
	(79, 4, 1, '::1', 'LOGIN', '', '2017-09-14 08:26:18'),
	(80, 4, 1, '::1', 'LOGIN', '', '2017-09-14 12:39:23'),
	(81, 1, 1, '::1', 'LOGIN', '', '2017-09-14 16:34:46'),
	(82, 1, 1, '::1', 'LOGIN', '', '2017-09-14 16:39:20'),
	(83, 1, 1, '::1', 'LOGIN', '', '2017-09-14 21:04:34'),
	(84, 3, 1, '::1', 'LOGIN', '', '2017-09-14 21:20:16'),
	(85, 4, 1, '::1', 'LOGIN', '', '2017-09-15 07:22:42'),
	(86, 1, 1, '::1', 'LOGIN', '', '2017-09-15 17:24:54'),
	(87, 4, 1, '::1', 'LOGIN', '', '2017-09-15 18:18:49'),
	(88, 3, 1, '::1', 'LOGIN', '', '2017-09-15 18:26:03'),
	(89, 3, 1, '::1', 'LOGIN', '', '2017-09-15 21:15:25'),
	(90, 3, 1, '::1', 'LOGIN', '', '2017-09-15 21:24:17'),
	(91, 4, 1, '::1', 'LOGIN', '', '2017-09-18 08:45:34'),
	(92, 3, 1, '::1', 'LOGIN', '', '2017-09-18 11:05:08'),
	(93, 4, 1, '::1', 'LOGIN', '', '2017-09-18 11:06:18'),
	(94, 4, 1, '::1', 'LOGIN', '', '2017-09-18 11:06:39'),
	(95, 4, 1, '::1', 'LOGIN', '', '2017-09-18 11:07:00'),
	(96, 4, 1, '::1', 'LOGIN', '', '2017-09-18 11:07:22'),
	(97, 1, 1, '::1', 'LOGIN', '', '2017-09-18 17:04:36'),
	(98, 4, 1, '::1', 'LOGIN', '', '2017-09-19 16:58:03'),
	(99, 1, 1, '::1', 'LOGIN', '', '2017-09-20 08:14:46'),
	(100, 4, 1, '::1', 'LOGIN', '', '2017-09-20 08:35:45'),
	(101, 3, 1, '::1', 'LOGIN', '', '2017-09-20 08:39:56'),
	(102, 4, 1, '::1', 'LOGIN', '', '2017-09-20 08:41:58'),
	(103, 4, 1, '::1', 'LOGIN', '', '2017-09-20 08:45:07'),
	(104, 4, 1, '::1', 'LOGIN', '', '2017-09-20 09:47:15'),
	(105, 4, 1, '::1', 'LOGIN', '', '2017-09-20 09:47:22'),
	(106, 4, 1, '::1', 'LOGIN', '', '2017-09-20 09:47:24'),
	(107, 4, 1, '::1', 'LOGIN', '', '2017-09-20 09:50:55'),
	(108, 4, 1, '::1', 'LOGIN', '', '2017-09-20 09:51:07'),
	(109, 4, 1, '::1', 'LOGIN', '', '2017-09-20 09:51:18'),
	(110, 4, 1, '::1', 'LOGIN', '', '2017-09-20 09:55:28'),
	(111, 4, 1, '::1', 'LOGIN', '', '2017-09-20 09:55:56'),
	(112, 4, 1, '::1', 'LOGIN', '', '2017-09-20 10:20:38'),
	(113, 4, 1, '::1', 'LOGIN', '', '2017-09-20 10:23:24'),
	(114, 1, 1, '::1', 'LOGIN', '', '2017-09-20 10:56:13'),
	(115, 1, 1, '::1', 'LOGIN', '', '2017-09-20 11:13:50'),
	(116, 1, 1, '::1', 'LOGIN', '', '2017-09-20 11:45:05'),
	(117, 1, 1, '::1', 'LOGIN', '', '2017-09-20 13:19:43'),
	(118, 1, 1, '::1', 'LOGIN', '', '2017-09-20 13:22:46'),
	(119, 4, 1, '::1', 'LOGIN', '', '2017-09-20 13:57:22'),
	(120, 6, 1, '::1', 'LOGIN', '', '2017-09-20 17:17:42'),
	(121, 1, 1, '::1', 'LOGIN', '', '2017-09-21 11:01:58'),
	(122, 2, 1, '::1', 'LOGIN', '', '2017-09-21 11:07:56'),
	(123, 2, 1, '::1', 'LOGIN', '', '2017-09-21 11:27:39'),
	(124, 7, 1, '::1', 'LOGIN', '', '2017-09-21 15:23:51'),
	(125, 7, 1, '::1', 'LOGIN', '', '2017-09-21 16:01:42'),
	(126, 1, 1, '::1', 'LOGIN', '', '2017-09-21 16:12:56'),
	(127, 4, 1, '::1', 'LOGIN', '', '2017-09-21 16:13:38'),
	(128, 7, 1, '::1', 'LOGIN', '', '2017-09-21 16:37:32'),
	(129, 4, 1, '::1', 'LOGIN', '', '2017-09-21 16:39:12'),
	(130, 1, 1, '::1', 'LOGIN', '', '2017-09-21 17:36:34'),
	(131, 1, 1, '::1', 'LOGIN', '', '2017-09-21 17:39:17'),
	(132, 3, 1, '::1', 'LOGIN', '', '2017-09-21 17:44:09'),
	(133, 3, 1, '::1', 'LOGIN', '', '2017-09-22 04:44:20'),
	(134, 3, 1, '::1', 'LOGIN', '', '2017-09-22 09:14:53'),
	(135, 3, 1, '::1', 'LOGIN', '', '2017-09-22 09:39:41'),
	(136, 4, 1, '::1', 'LOGIN', '', '2017-09-22 09:54:11'),
	(137, 1, 1, '::1', 'LOGIN', '', '2017-09-22 10:21:30'),
	(138, 4, 1, '::1', 'LOGIN', '', '2017-09-22 10:33:53'),
	(139, 1, 1, '::1', 'LOGIN', '', '2017-09-22 11:55:28'),
	(140, 4, 1, '::1', 'LOGIN', '', '2017-09-22 19:59:19'),
	(141, 1, 1, '::1', 'LOGIN', '', '2017-09-23 08:39:09'),
	(142, 1, 1, '::1', 'LOGIN', '', '2017-09-23 08:43:55'),
	(143, 1, 1, '::1', 'LOGIN', '', '2017-09-23 08:48:21'),
	(144, 2, 1, '::1', 'LOGIN', '', '2017-09-23 08:51:12'),
	(145, 2, 2, '::1', 'POST', 'MainEmployee', '2017-09-23 10:27:37'),
	(146, 18, 1, '::1', 'LOGIN', '', '2017-09-23 10:52:59'),
	(147, 3, 1, '::1', 'LOGIN', '', '2017-09-23 11:27:31'),
	(148, 4, 1, '::1', 'LOGIN', '', '2017-09-23 11:27:48'),
	(149, 4, 1, '::1', 'LOGIN', '', '2017-09-23 17:34:02'),
	(150, 4, 2, '::1', 'POST', 'MainEmployee', '2017-09-23 18:15:38'),
	(151, 4, 2, '::1', 'POST', 'MainEmployee', '2017-09-23 18:16:50'),
	(152, 4, 2, '::1', 'POST', 'MainEmployee', '2017-09-23 18:24:40'),
	(153, 4, 2, '::1', 'POST', 'MainEmployee', '2017-09-23 18:27:09'),
	(154, 1, 1, '::1', 'LOGIN', '', '2017-09-24 09:25:15'),
	(155, 1, 1, '::1', 'LOGIN', '', '2017-09-25 08:08:41'),
	(156, 1, 1, '::1', 'LOGIN', '', '2017-09-25 12:46:11'),
	(157, 2, 1, '::1', 'LOGIN', '', '2017-09-25 15:02:19'),
	(158, 2, 1, '::1', 'LOGIN', '', '2017-09-25 15:20:58'),
	(159, 2, 1, '::1', 'LOGIN', '', '2017-09-25 15:55:10'),
	(160, 1, 1, '::1', 'LOGIN', '', '2017-09-25 22:03:04'),
	(161, 4, 1, '::1', 'LOGIN', '', '2017-09-25 22:03:36'),
	(162, 3, 1, '::1', 'LOGIN', '', '2017-09-26 08:04:27'),
	(163, 4, 1, '::1', 'LOGIN', '', '2017-09-26 08:32:17'),
	(164, 2, 1, '::1', 'LOGIN', '', '2017-09-26 08:38:29'),
	(165, 1, 1, '::1', 'LOGIN', '', '2017-09-26 09:02:59'),
	(166, 4, 1, '::1', 'LOGIN', '', '2017-09-26 09:04:30'),
	(167, 1, 1, '::1', 'LOGIN', '', '2017-09-26 09:55:40'),
	(168, 3, 1, '::1', 'LOGIN', '', '2017-09-26 10:03:11'),
	(169, 3, 1, '::1', 'LOGIN', '', '2017-09-26 10:44:51');
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;

-- Dumping structure for table hhrr.sys_module
DROP TABLE IF EXISTS `sys_module`;
CREATE TABLE IF NOT EXISTS `sys_module` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `app` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `icon` varchar(50) NOT NULL COMMENT 'Icono que se usará en el menu',
  `state` varchar(50) NOT NULL COMMENT 'se utiliza asignar los recursos al menu',
  `isVisible` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app` (`app`),
  CONSTRAINT `FK_sys_module_sys_app` FOREIGN KEY (`app`) REFERENCES `sys_app` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='Módulos que integran el Menu principal.';

-- Dumping data for table hhrr.sys_module: ~13 rows (approximately)
/*!40000 ALTER TABLE `sys_module` DISABLE KEYS */;
INSERT INTO `sys_module` (`id`, `app`, `name`, `description`, `icon`, `state`, `isVisible`) VALUES
	(1, 1, 'Configuración', '', 'fa fa-cogs', 'con', 1),
	(2, 1, 'Seguridad', '', 'fa fa-key', 'sec', 1),
	(3, 1, 'Catálogos', '', 'fa fa-book', 'cat', 1),
	(4, 2, 'Empresa', '', 'fa fa-building', 'org', 1),
	(5, 3, 'Empleados', '', 'fa fa-users', 'emp', 1),
	(6, 3, 'Planillas', '', 'fa fa-dollar', 'pay', 1),
	(7, 3, 'Reportes', '', 'fa fa-print', 'rep', 1),
	(8, 3, 'Indicadores', '', 'fa fa-line-chart', 'ind', 1),
	(9, 3, 'Reclutamiento', '', 'fa fa-user-plus', 'rec', 1),
	(10, 3, 'Asistencia', '', 'fa fa-clock-o', 'att', 1),
	(11, 3, 'Capacitaciones', '', 'fa fa-train', 'tra', 1),
	(12, 3, 'Evaluación del Desempeño', '', 'fa fa-level-up', 'eva', 1),
	(13, 4, 'Clientes', '', 'fa fa-users', 'cli', 1);
/*!40000 ALTER TABLE `sys_module` ENABLE KEYS */;

-- Dumping structure for table hhrr.sys_resource
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE IF NOT EXISTS `sys_resource` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `module` smallint(5) unsigned DEFAULT NULL,
  `description` varchar(100) NOT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL COMMENT 'estado. AngularJs $state',
  `inMenu` bit(1) DEFAULT NULL COMMENT 'Se mustra en el sidebar',
  PRIMARY KEY (`id`),
  KEY `module` (`module`),
  CONSTRAINT `` FOREIGN KEY (`module`) REFERENCES `sys_module` (`id`),
  CONSTRAINT `FK_sys_resource_sys_module` FOREIGN KEY (`module`) REFERENCES `sys_module` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COMMENT='Recursos - Objetos o formularios ';

-- Dumping data for table hhrr.sys_resource: ~88 rows (approximately)
/*!40000 ALTER TABLE `sys_resource` DISABLE KEYS */;
INSERT INTO `sys_resource` (`id`, `name`, `module`, `description`, `icon`, `state`, `inMenu`) VALUES
	(1, 'Usuarios', 2, 'Registro de Usuarios del Sistema', '', 'app.sec.users', b'1'),
	(2, 'Ajustes', 6, 'catalogo ajustes', '', 'pay.adjustments', b'0'),
	(3, 'De Horas Extras', 8, 'Graficos de Indicadores de HHEE', '', 'app.charts', b'1'),
	(4, 'Deducciones', 6, 'Catalogo de deducciones', '', 'pay.deductions', b'0'),
	(5, 'Generacion de Planillas', 6, 'Generacion de Planillas', '', 'pay.payroll', b'1'),
	(6, 'Deducciones a Empleados', 6, 'Deducciones por Empleado', '', 'pay.employee.deduction', b'0'),
	(7, 'ISR - Retención', 6, 'Calcular el ISR', 'glyphicon-book', 'pay.isr', b'0'),
	(8, 'HHEE - Aprobación', 6, 'Aprobación de Solicitudes', 'glyphicon-book', 'pay.over.approve', b'1'),
	(9, 'Perfiles', 2, 'Catalogo de Perfiles', '', 'app.sec.profiles', b'0'),
	(10, 'HHEE - Solicitud', 6, 'Solicitud de Horas Extras', '', 'pay.over.request', b'1'),
	(11, 'HHEE - Planilla', 6, 'Calcular Planilla de Horas Extras', '', 'pay.over.payroll', b'1'),
	(12, 'Tipos de planilla', 3, 'Tipos de planilla', '', 'cat.payroll.type', b'0'),
	(13, 'General', 1, 'Catalogo de recursos del sistema', '', 'con.general', b'1'),
	(14, 'Módulos', 1, 'Módulos Instalados', '', 'app.con.modules', b'1'),
	(15, 'Recursos', 1, 'Recursos del Sistema', NULL, 'con.resources', b'1'),
	(16, 'Login', 2, 'Login screen', '', 'login', b'1'),
	(17, 'Empleados', 5, 'Empleados', NULL, 'app.cat.employees', b'1'),
	(18, 'Empresas', 4, 'Empresas', NULL, 'org.companies', b'0'),
	(19, 'Niveles Academicos', 3, 'Niveles academicos', NULL, 'cat.acemic.level', b'0'),
	(20, 'Bloquear Sistema', 2, 'lockscreen', NULL, 'session.lockscreen', b'1'),
	(21, 'Contratos', 5, '', NULL, 'emp.contracts', b'0'),
	(22, 'Sueldos y Salarios', 6, '', NULL, 'pay.salary', b'0'),
	(23, 'Recibos', 6, '', NULL, 'pay.receipts', b'0'),
	(24, 'Bonificaciones', 6, '', NULL, 'pay.bonus', b'0'),
	(25, 'Comisiones', 6, '', NULL, 'pay.commissions', b'0'),
	(26, 'Reembolsos', 6, 'Reembolsos', NULL, 'pay.reimbursements', b'0'),
	(27, 'Anticipos', 6, 'Anticipos', NULL, 'pay.advances', b'0'),
	(28, 'Préstamos', 6, 'Préstamos', NULL, 'pay.loans', b'0'),
	(29, 'Seguros', 6, 'Seguros', NULL, 'pay.insurance', b'0'),
	(30, 'AFP', 6, 'AFP', NULL, 'pay.afp', b'0'),
	(31, 'Asignación de Equipo', 5, '', NULL, 'emp.assign.equipment', b'0'),
	(32, 'Transferencias', 5, '', NULL, 'emp.transfers', b'0'),
	(33, 'Promociones', 5, '', NULL, 'emp.promotions', b'0'),
	(34, 'Logros', 5, '', NULL, 'emp.achievements', b'0'),
	(35, 'Comunicación Interna', 5, '', NULL, 'emp.memos', b'0'),
	(36, 'Renuncias', 5, '', NULL, 'emp.quit', b'0'),
	(37, 'Cancelación', 5, '', NULL, 'emp.cancel', b'0'),
	(38, 'Viajes', 5, '', NULL, 'emp.trips', b'0'),
	(39, 'Unidades o Departamentos', 4, '', NULL, 'org.units', b'0'),
	(40, 'Config de le Empresa', 4, '', NULL, 'org.company', b'0'),
	(41, 'Clientes', 4, '', NULL, 'org.clients', b'0'),
	(42, 'Proyectos', 4, '', NULL, 'org.projects', b'0'),
	(43, 'Políticas', 4, '', NULL, 'org.policies', b'0'),
	(44, 'Anuncios', 4, '', NULL, 'org.announcements', b'0'),
	(45, 'Noticias', 4, '', NULL, 'org.news', b'0'),
	(46, 'Bitácora', 2, 'Ver la Bitácora del Sistema', NULL, 'app.sec.log', b'0'),
	(47, 'Catálogos', 1, 'Catálogos del Sistema', NULL, 'app.con.catalogues', b'1'),
	(48, 'Licenciamiento', 1, 'Tipo de licencia del producto', NULL, 'con.license', b'1'),
	(49, 'Ajustes', 3, 'Ajustes', NULL, 'cat.adjustments', b'0'),
	(50, 'Bonificaciones', 3, 'Bonificaciones', NULL, 'cat.bonus', b'0'),
	(51, 'Unidades/Departamentos', 3, 'Unidades o Departamentos', NULL, 'cat.units', b'0'),
	(52, 'Tipos de Contratos', 3, 'Tipos de Contratos', NULL, 'cat.contract.type', b'0'),
	(53, 'Deducciones', 3, 'Deducciones Empresariales', NULL, 'cat.deductions', b'0'),
	(54, 'Departamentos', 3, 'Departamentos del país', NULL, 'cat.departments', b'0'),
	(55, 'Ramas Económicas', 3, 'Ramas Económicas', NULL, 'cat.economic.branch', b'0'),
	(56, 'Categorías de Empleado', 3, '', NULL, 'cat.employee.category', b'0'),
	(57, 'Marcas de Equipo', 3, '', NULL, 'cat.equipment.brand', b'0'),
	(58, 'Categorías de Equipo', 3, '', NULL, 'cat.equipment.category', b'0'),
	(59, 'Días Feriados', 3, '', NULL, 'cat.holiday', b'0'),
	(60, 'IHSS', 3, 'Parámetros del Seguro Social', NULL, 'cat.ihss', b'0'),
	(61, 'Ingresos', 3, 'Conceptos de Ingreso', NULL, 'cat.incomes', b'0'),
	(62, 'ISR', 3, '', NULL, 'cat.isr', b'0'),
	(63, 'Puestos', 3, '', NULL, 'cat.jobs', b'0'),
	(64, 'Tipos de Trabajos', 3, '', NULL, 'cat.job.type', b'0'),
	(65, 'Permisos', 3, '', NULL, 'cat.leave.type', b'0'),
	(66, 'Formas Legales o Jurídicas', 3, '', NULL, 'cat.legal.form', b'0'),
	(67, 'Tipos de Empresas (MIPYME)', 3, '', NULL, 'cat.mipyme', b'0'),
	(68, 'Horas Extras', 3, '', NULL, 'cat.overtime', b'1'),
	(69, 'Planillas', 3, '', NULL, 'cat.payrolls', b'0'),
	(70, 'INFOP', 3, '', NULL, 'cat.infop', b'0'),
	(71, 'Profesiones', 3, '', NULL, 'cat.professions', b'0'),
	(72, 'Destrezas y Habilidades', 3, '', NULL, 'cat.skills', b'0'),
	(73, 'Vacaciones', 3, '', NULL, 'cat.vacations', b'0'),
	(74, 'Jornadas Laborales', 3, '', NULL, 'cat.working.hours', b'0'),
	(75, 'Tipos de Empleados', 3, '', NULL, 'cat.employee.type', b'0'),
	(76, 'Turnos', 3, '', NULL, 'cat.shifts', b'0'),
	(77, 'Horarios', 3, '', NULL, 'cat.schedules', b'0'),
	(78, 'Seguros', 3, '', NULL, 'cat.insurance', b'0'),
	(79, 'Fondos de Pension', 3, '', NULL, 'cat.afp', b'0'),
	(80, 'Políticas Empresariales', 3, '', NULL, 'cat.policies', b'0'),
	(81, 'Licitaciones', 4, '', NULL, 'org.bids', b'0'),
	(82, 'Asignacion de Trabajo', 5, '', NULL, 'emp.assign.task', b'0'),
	(83, 'Constancias', 5, '', NULL, 'emp.certificates', b'0'),
	(84, 'Viáticos', 6, '', NULL, 'pay.perdiem', b'0'),
	(85, 'IHSS', 6, '', NULL, 'pay.ihss', b'0'),
	(86, 'RAP', 6, '', NULL, 'pay.rap', b'0'),
	(87, 'INFOP', 6, '', NULL, 'pay.infop', b'0'),
	(88, 'Registro de Cliente', 13, 'Registro de Clientes', NULL, 'app.dashboard', b'1');
/*!40000 ALTER TABLE `sys_resource` ENABLE KEYS */;

-- Dumping structure for table hhrr.sys_token_parameter
DROP TABLE IF EXISTS `sys_token_parameter`;
CREATE TABLE IF NOT EXISTS `sys_token_parameter` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `value` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table hhrr.sys_token_parameter: ~3 rows (approximately)
/*!40000 ALTER TABLE `sys_token_parameter` DISABLE KEYS */;
INSERT INTO `sys_token_parameter` (`id`, `name`, `value`, `description`) VALUES
	(1, 'keyToken', 'example_key', 'llave de token'),
	(2, 'Expiration Time', '36000', 'tiempo en segundos ejem: 1800=30min,900=15min,120=2min,60=1min\n'),
	(3, 'HeaderToken', 'token', 'llave del header');
/*!40000 ALTER TABLE `sys_token_parameter` ENABLE KEYS */;

-- Dumping structure for table hhrr.sys_workflow
DROP TABLE IF EXISTS `sys_workflow`;
CREATE TABLE IF NOT EXISTS `sys_workflow` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador del flujo',
  `name` varchar(45) NOT NULL COMMENT 'Nombre del flujo de trabajo',
  `description` varchar(200) NOT NULL COMMENT 'Descripción del flujo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Flujos de trabajo';

-- Dumping data for table hhrr.sys_workflow: ~1 rows (approximately)
/*!40000 ALTER TABLE `sys_workflow` DISABLE KEYS */;
INSERT INTO `sys_workflow` (`id`, `name`, `description`) VALUES
	(1, 'Horas Extras', 'Horas Extras');
/*!40000 ALTER TABLE `sys_workflow` ENABLE KEYS */;

-- Dumping structure for table hhrr.sys_workflow_detail
DROP TABLE IF EXISTS `sys_workflow_detail`;
CREATE TABLE IF NOT EXISTS `sys_workflow_detail` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador unico del proceso',
  `workflow` smallint(5) unsigned NOT NULL COMMENT 'Identificador del flujo de trabajo',
  `name` varchar(45) NOT NULL COMMENT 'Nombre del proceso',
  `sequence` smallint(5) unsigned NOT NULL COMMENT 'Número de orden secuencial',
  `input` varchar(200) NOT NULL COMMENT 'Entradas o insumos requeridos',
  `actors` varchar(200) NOT NULL COMMENT 'Actores involucrados',
  `description` varchar(200) NOT NULL COMMENT 'Descripción del proceso',
  `output` varchar(200) NOT NULL COMMENT 'Salida esperada',
  `isMandatory` tinyint(1) NOT NULL COMMENT 'Indica si el proceso es obligatorio',
  PRIMARY KEY (`id`),
  KEY `workflow` (`workflow`),
  CONSTRAINT `FK_sys_workflow_detail_sys_workflow` FOREIGN KEY (`workflow`) REFERENCES `sys_workflow` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Etapas de los flujos de trabajo';

-- Dumping data for table hhrr.sys_workflow_detail: ~5 rows (approximately)
/*!40000 ALTER TABLE `sys_workflow_detail` DISABLE KEYS */;
INSERT INTO `sys_workflow_detail` (`id`, `workflow`, `name`, `sequence`, `input`, `actors`, `description`, `output`, `isMandatory`) VALUES
	(1, 1, 'Ingresar Solicitud', 1, 'Haber recibido una orden', 'Empleado', '', '', 1),
	(2, 1, 'Aprobar Solicitud', 2, 'Solicitud', 'Jefe del Empleado', '', '', 0),
	(3, 1, 'Ingresar Detalle de Actividades', 3, 'Solicitud Aprobada', 'Empleado', '', '', 1),
	(4, 1, 'Autorizar Solicitud/Detalle', 4, 'Detalle Revisado', 'Jefe del Empleado', '', '', 1),
	(5, 1, 'Calcular Planilla', 5, 'Detalles de Actividades Autorizado', 'Recursos Humanos', '', '', 1);
/*!40000 ALTER TABLE `sys_workflow_detail` ENABLE KEYS */;

-- Dumping structure for view hhrr.view_company_structure
DROP VIEW IF EXISTS `view_company_structure`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `view_company_structure` (
	`companyId` TINYINT(3) UNSIGNED NOT NULL COMMENT 'Identificador de la empresa.',
	`Empresa` VARCHAR(25) NOT NULL COMMENT 'Nombre corto o siglas' COLLATE 'utf8_general_ci',
	`unitId` TINYINT(3) UNSIGNED NOT NULL COMMENT 'Identificador de la unidad/departamento.',
	`Depto` VARCHAR(50) NOT NULL COMMENT 'Nombre de la unidad/departamento.' COLLATE 'utf8_general_ci',
	`parentUnitId` TINYINT(3) UNSIGNED NOT NULL COMMENT 'Identificador de la unidad de la cual depende jerarquicamente.',
	`headJobId` TINYINT(3) UNSIGNED NOT NULL COMMENT 'Identifica al empleado que es jefe del departamento',
	`Puesto` VARCHAR(50) NOT NULL COMMENT 'Nombre del puesto, que se usa en los formularios y reportes.' COLLATE 'utf8_general_ci',
	`headId` SMALLINT(5) UNSIGNED NOT NULL COMMENT 'Identifica al empleado que es jefe del departamento',
	`Jefe` VARCHAR(40) NOT NULL COMMENT 'Nombres' COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for view hhrr.view_kpi
DROP VIEW IF EXISTS `view_kpi`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `view_kpi` (
	`Mes` VARCHAR(9) NULL COLLATE 'utf8mb4_general_ci',
	`Solicitudes` BIGINT(21) NOT NULL,
	`Horas` DECIMAL(25,0) NULL,
	`Pendientes` BIGINT(21) NULL
) ENGINE=MyISAM;

-- Dumping structure for view hhrr.view_log
DROP VIEW IF EXISTS `view_log`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `view_log` (
	`userName` VARCHAR(15) NOT NULL COLLATE 'utf8_general_ci',
	`action` TINYINT(3) UNSIGNED NOT NULL COMMENT 'Acción que se ejecuta',
	`actionEnum` SET('LOGIN','POST','PUT','DELETE') NOT NULL COLLATE 'utf8_general_ci',
	`table` VARCHAR(50) NULL COMMENT 'Tabla donde se hace el cambio' COLLATE 'utf8_general_ci',
	`when` TIMESTAMP NULL COMMENT 'Fecha y hora en que se ejecuta la acción',
	`Ip` VARCHAR(40) NULL COMMENT 'Usuario' COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for view hhrr.view_overtime
DROP VIEW IF EXISTS `view_overtime`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `view_overtime` (
	`curdate()` DATE NOT NULL,
	`Mes` VARCHAR(9) NULL COLLATE 'utf8mb4_general_ci',
	`employeeId` SMALLINT(5) UNSIGNED NOT NULL COMMENT 'Identificador del empleado que presenta el reporte.',
	`Usuario` VARCHAR(15) NOT NULL COLLATE 'utf8_general_ci',
	`Empleado` VARCHAR(40) NOT NULL COMMENT 'Nombres' COLLATE 'utf8_general_ci',
	`Solicitudes` BIGINT(21) NOT NULL,
	`Horas` DECIMAL(25,0) NULL
) ENGINE=MyISAM;

-- Dumping structure for view hhrr.view_users
DROP VIEW IF EXISTS `view_users`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `view_users` (
	`UserId` SMALLINT(5) UNSIGNED NOT NULL COMMENT 'Identificador unico',
	`User` VARCHAR(15) NOT NULL COLLATE 'utf8_general_ci',
	`Profile` VARCHAR(15) NULL COLLATE 'utf8_general_ci',
	`Name` VARCHAR(40) NOT NULL COMMENT 'Nombres' COLLATE 'utf8_general_ci',
	`EmployeeId` SMALLINT(5) UNSIGNED NOT NULL COMMENT 'Identificador unico del empleado'
) ENGINE=MyISAM;

-- Dumping structure for view hhrr.view_company_structure
DROP VIEW IF EXISTS `view_company_structure`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `view_company_structure`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `view_company_structure` AS SELECT cs.companyId, c.shortName as Empresa, cs.unitId, cu.name as Depto, cs.parentUnitId, cs.headJobId, j.name as Puesto, cs.headId, e.firstName as Jefe
FROM main_company_structure cs 
inner join main_company c on cs.companyId = c.id
inner join cat_company_unit cu on cs.unitId = cu.id
inner join cat_job j on cs.headJobId = j.id
inner join main_employee e on cs.headId = e.id ;

-- Dumping structure for view hhrr.view_kpi
DROP VIEW IF EXISTS `view_kpi`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `view_kpi`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `view_kpi` AS select MONTHNAME(curdate()) as Mes, count(*) as Solicitudes, sum(r.estimatedTime) as Horas, 
(select count(*)
from pay_overtime_request r
where MONTH(r.dateTimeStamp)=month(curdate()) and r.state='Pendiente') as Pendientes
from pay_overtime_request r
where MONTH(r.dateTimeStamp)=month(curdate()) ;

-- Dumping structure for view hhrr.view_log
DROP VIEW IF EXISTS `view_log`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `view_log`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `view_log` AS select u.userName , l.action, l.actionEnum, l.table, l.when, l.userName as Ip  
from sys_log l
inner join sec_user u on l.userId = u.id 
order by l.when ;

-- Dumping structure for view hhrr.view_overtime
DROP VIEW IF EXISTS `view_overtime`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `view_overtime`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `view_overtime` AS select curdate(), monthname(curdate()) as Mes, r.employeeId, u.userName as Usuario, e.firstName as Empleado, count(r.estimatedTime) as Solicitudes, sum(r.estimatedTime) as Horas
from pay_overtime_request r
inner join main_employee e on r.employeeId=e.id
inner join sec_user u on r.employeeId=u.employeeId
where MONTH(r.dateTimeStamp)=month(curdate())
group by r.employeeId ;

-- Dumping structure for view hhrr.view_users
DROP VIEW IF EXISTS `view_users`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `view_users`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `view_users` AS SELECT ue.id as UserId, u.userName as User, p.name as Profile, m.firstName as Name, m.id as EmployeeId
FROM main_employee m
INNER JOIN sec_user_emp ue ON m.id = ue.employeeId
inner join sec_user u on ue.userId = u.id 
inner join sec_profile p on u.profileId = p.id  
order by u.id asc ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
