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
	(3, 'Practicante', '');
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

-- Dumping data for table hhrr.cat_isr_percentage: ~0 rows (approximately)
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
	(1, 'Tipo I', '19:00:00', '21:00:00', 0.25, 'Art 330: Recargo sobre el salario de la jornada diurna cuando se efectúe en el período diurno.'),
	(2, 'Tipo II', '21:00:00', '23:59:59', 0.50, 'Art 330: Recargo sobre el salario de la jornada diurna cuando se efectúe en el período nocturno.'),
	(3, 'Tipo III', '23:59:59', '05:00:00', 0.75, 'Art 330: Recargo sobre el salario de la jornada nocturna cuando la jornada extraordinaria sea prolongación de aquélla.'),
	(4, 'Tipo IV', '00:01:00', '23:59:59', 1.00, 'Art. 340: Recargo si se trabajare durante los días de descanso o los días feriados o de fiesta nacio');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table hhrr.cat_payroll_type: ~3 rows (approximately)
/*!40000 ALTER TABLE `cat_payroll_type` DISABLE KEYS */;
INSERT INTO `cat_payroll_type` (`id`, `name`, `description`, `howMany`, `status`) VALUES
	(1, 'Sueldos y Salarios', 'Sueldos y Salarios', 24, 1),
	(2, 'Aguinaldo', 'Decimo Tercer mes', 1, 1),
	(3, 'Bono', 'Bonificacion anual', 1, 1);
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
	(1, 'Diurna', '05:00:00', '19:00:00', '19:00:00', 16, 'Art 269'),
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Tabla maestra de la empresa';

-- Dumping data for table hhrr.main_company: ~2 rows (approximately)
/*!40000 ALTER TABLE `main_company` DISABLE KEYS */;
INSERT INTO `main_company` (`id`, `mipymeTypeId`, `economicBranchId`, `legalFormId`, `shortName`, `longName`, `foundationDate`, `commercialRegiterCertificate`, `phone`, `address`, `city`, `departmentId`, `postalCode`, `mission`, `vision`, `profile`, `logo`, `ip`, `legalRepName`, `legalRepIdCard`, `legalRepPhone`, `contactName`, `contactDesignation`, `contactPhone`, `contactEmail`) VALUES
	(1, 1, 1, 5, 'CENTEC', NULL, '2017-05-30', '', '', '', '', 8, '', '', '', '', 'logo-dark.png', '', '', '', '0', '', '', '', ''),
	(2, 1, 1, 7, 'Lufergo', NULL, '2017-05-30', '', '', '', '', 8, '', '', '', '', '', '', '', '', '0', '', '', '', '');
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

-- Dumping data for table hhrr.main_company_structure: ~4 rows (approximately)
/*!40000 ALTER TABLE `main_company_structure` DISABLE KEYS */;
INSERT INTO `main_company_structure` (`companyId`, `unitId`, `parentUnitId`, `headJobId`, `headId`) VALUES
	(1, 1, 1, 1, 29),
	(1, 5, 1, 3, 31),
	(1, 4, 1, 5, 4),
	(1, 6, 4, 7, 3);
/*!40000 ALTER TABLE `main_company_structure` ENABLE KEYS */;

-- Dumping structure for table hhrr.main_employee
DROP TABLE IF EXISTS `main_employee`;
CREATE TABLE IF NOT EXISTS `main_employee` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador unico del empleado',
  `companyUnit` tinyint(3) unsigned NOT NULL COMMENT 'Unidad a la que está asignado el empleado (segun el organigrama)',
  `academicLevel` tinyint(3) unsigned NOT NULL COMMENT 'Nivel académico',
  `profession` tinyint(3) unsigned NOT NULL COMMENT 'Identificador de la profesión',
  `job` tinyint(3) unsigned NOT NULL COMMENT 'Identificador del puesto',
  `type` tinyint(3) unsigned NOT NULL COMMENT 'Tipo de empleado',
  `firstName` varchar(40) NOT NULL COMMENT 'Nombres',
  `lastName` varchar(40) NOT NULL COMMENT 'Apellidos',
  `dob` date NOT NULL COMMENT 'Fecha de nacimiento',
  `gender` tinyint(1) unsigned NOT NULL COMMENT 'Género',
  `bloodType` varchar(3) NOT NULL COMMENT 'Tipo de sangre',
  `nationality` varchar(40) NOT NULL COMMENT 'Nacionalidad',
  `idCard` varchar(13) NOT NULL COMMENT 'Número de tarjeta de identidad',
  `maritalStatus` varchar(20) NOT NULL COMMENT 'Estado civil',
  `joined` date NOT NULL COMMENT 'Fecha en que ingresó a la empresa',
  `address` varchar(150) NOT NULL COMMENT 'Dirección exacta',
  `city` varchar(50) NOT NULL COMMENT 'Ciudad',
  `departmentId` tinyint(3) unsigned NOT NULL COMMENT 'Departamento',
  `homePhone` varchar(8) NOT NULL COMMENT 'Número telefónico de la casa',
  `officePhone` varchar(8) NOT NULL COMMENT 'Número telefónico de la oficina',
  `mobilePhone` varchar(8) NOT NULL COMMENT 'Número telefónico de celular',
  `email` varchar(100) NOT NULL COMMENT 'Correo electronico',
  `salary` decimal(8,2) unsigned NOT NULL COMMENT 'Salario actual',
  `shift` tinyint(3) unsigned NOT NULL COMMENT 'Jornada laboral',
  `creationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `management` (`companyUnit`),
  KEY `academic_level` (`academicLevel`),
  KEY `profession` (`profession`),
  KEY `job` (`job`),
  KEY `created_by` (`createdBy`),
  KEY `department` (`departmentId`),
  KEY `employee_type` (`type`),
  KEY `FK_main_employee_cat_working_hours` (`shift`),
  CONSTRAINT `FK_main_employee_cat_academic_level` FOREIGN KEY (`academicLevel`) REFERENCES `cat_ademic_level` (`id`),
  CONSTRAINT `FK_main_employee_cat_company_unit` FOREIGN KEY (`companyUnit`) REFERENCES `cat_company_unit` (`id`),
  CONSTRAINT `FK_main_employee_cat_job` FOREIGN KEY (`job`) REFERENCES `cat_job` (`id`),
  CONSTRAINT `FK_main_employee_cat_profession` FOREIGN KEY (`profession`) REFERENCES `cat_profession` (`id`),
  CONSTRAINT `FK_main_employee_cat_working_hours` FOREIGN KEY (`shift`) REFERENCES `cat_working_hours` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='Tabla maestra de empleados.';

-- Dumping data for table hhrr.main_employee: ~56 rows (approximately)
/*!40000 ALTER TABLE `main_employee` DISABLE KEYS */;
INSERT INTO `main_employee` (`id`, `companyUnit`, `academicLevel`, `profession`, `job`, `type`, `firstName`, `lastName`, `dob`, `gender`, `bloodType`, `nationality`, `idCard`, `maritalStatus`, `joined`, `address`, `city`, `departmentId`, `homePhone`, `officePhone`, `mobilePhone`, `email`, `salary`, `shift`, `creationDate`, `createdBy`) VALUES
	(1, 6, 2, 1, 10, 0, 'Dennis Dassaeth Gonzales Mendoza', '', '1989-01-09', 1, '', '', '0801198902214', '0', '2014-02-03', 'Prados Universitarios, Bloque E, casa 6118.', '', 8, '22570069', '0', '32290345', 'dgonzales@hngsystems.com', 11000.00, 1, '2017-06-22 11:41:58', 0),
	(2, 6, 1, 1, 10, 0, 'Oscar Noe Sevilla Urbina', '', '1990-12-21', 1, '', '', '1519199000006', '0', '2013-01-02', 'Col. San Jose de la Peña', '', 8, '0', '0', '96095496', 'osevilla@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(3, 6, 1, 1, 10, 0, 'Edwin David Zambrano Banegas', '', '1986-02-12', 1, '', '', '0801198603962', '0', '2013-01-01', 'Res. Villas de Concepción', '', 8, '0', '0', '33944024', 'ezambrano@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(4, 4, 1, 1, 5, 0, 'Hector Alberto Berrios Rodriguez', '', '1969-05-12', 1, '', '', '0801196903367', '1', '2010-08-07', 'Residencial plaza, bloque 33, casa 3108.', '', 8, '22286173', '0', '99372193', 'hberrios@hngsystems.com', 45000.00, 1, '2017-06-22 11:41:58', 0),
	(5, 6, 1, 1, 10, 0, 'Katherynne Melissa Hidalgo Aguilar', '', '1991-05-09', 2, '', '', '0601199101689', '0', '2013-11-16', 'Barrio Sabana Grande', '', 8, '0', '0', '98496166', 'khidalgo@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(6, 6, 1, 1, 10, 0, 'Vany Jetsibelh Castillo Guillen', '', '1986-05-14', 2, '', '', '1201198600461', '0', '2010-01-07', 'Col. las colinas, bloque RR, casa 1915.', '', 8, '0', '0', '98641568', 'vcastillo@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(7, 6, 1, 1, 10, 0, 'Leonardo Antonio Vijil Scalici', '', '1990-01-24', 1, '', '', '0801199014267', '0', '2014-06-16', 'Col. Kennedy, 4ta Entrada, casa 3810, bloque 1.', '', 8, '22304507', '0', '87355440', 'lvijil@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(8, 6, 1, 1, 10, 0, 'Kenny Joseph Cooper Aleman', '', '1989-07-20', 1, '', '', '0801198902104', '0', '2012-01-01', 'Col. san Jose de la Peña, zona D, bloque 7A', '', 8, '0', '0', '96714867', 'kcooper@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(9, 6, 1, 1, 10, 0, 'Denis Oswaldo Jiron Rodriguez', '', '1983-07-13', 1, '', '', '0801198312047', '0', '2012-03-01', 'Col. Hato de Enmedio, sector 7, bloque 103, casa 5119', '', 8, '22551706', '0', '31781323', 'djiron@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(10, 6, 1, 1, 10, 0, 'Victor Alejandro Escober Zuniga', '', '1986-01-28', 1, '', '', '0819198600200', '0', '2012-10-08', 'Col. centro america oeste, zona 1 bloque H casa 4526', '', 8, '22274620', '0', '31875519', 'vescober@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(11, 6, 1, 1, 10, 0, 'Luisa Azucena Giron Gradiz', '', '1968-02-12', 2, '', '', '0615196800569', '1', '2012-04-09', 'Col. Kennedy, casa 3505, grupo 18, bloque 22, zona 2', '', 8, '22280971', '0', '98730062', 'lgiron@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(12, 6, 1, 1, 10, 0, 'Yadira Paola Avila Herrera', '', '1986-07-22', 2, '', '', '0801198613859', '0', '2012-06-04', 'Col. Centro américa oeste, zona 4, bloque z', '', 8, '22273540', '0', '96257601', 'yavila@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(13, 6, 1, 1, 10, 0, 'Kelly Pamela Perez Caceres', '', '1984-04-12', 2, '', '', '0801198421680', '1', '2011-11-23', 'Linaca, Tatumbla, atrás del Kínder Caridad de Ardon.', '', 8, '0', '0', '96928115', 'kperez@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(14, 6, 1, 1, 10, 0, 'Danny Alberto Solorzano Rivera', '', '1986-07-15', 1, '', '', '0801198620461', '0', '2012-05-09', 'Residencial Agua Dulce, Col. Las Hadas', '', 8, '0', '0', '97605500', 'dsolorzano@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(15, 6, 1, 1, 10, 0, 'Ana Sofia Quintero Zapata', '', '1990-04-10', 2, '', '', '0801199005403', '0', '2012-06-25', 'Colonia Centro América Oeste, Bloque CC, casa 1316, Zona 1.', '', 8, '22271408', '0', '98272925', 'aquintero@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(16, 6, 1, 1, 10, 0, 'Guillermo Bustillo Alvarado', '', '1989-08-10', 1, '', '', '0801198916369', '0', '2012-12-01', 'Col Centro America Oeste, Zona 1, bloque E, casa 1417.', '', 8, '22274920', '0', '97203639', 'gbustillo@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(17, 6, 1, 1, 10, 0, 'Dario Alberto Castro Martinez', '', '1989-03-08', 1, '', '', '0801198920345', '0', '2012-05-07', 'Residencial Centro América, 4ta etapa, calle 37', '', 8, '22273540', '0', '31817003', 'dcastro@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(18, 6, 1, 1, 10, 0, 'Olga Leticia Martinez Varela', '', '1988-03-31', 2, '', '', '0801198801929', '0', '2012-03-06', 'Col. Bella Vista, 8 y 9 calle, 12 ave, casa 916.', '', 8, '22234427', '0', '33191947', 'omartinez@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(19, 6, 1, 1, 10, 0, 'Amy Larissa Gallardo Alvarez', '', '1984-07-24', 2, '', '', '0801198405040', '0', '2011-06-16', 'Col. Bella Oriente, Bloque H, casa 8, Apto No 1', '', 8, '0', '0', '33760250', 'agallardo@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(20, 6, 1, 1, 10, 0, 'Julio Alejandro Castro Raudales', '', '1987-08-13', 1, '', '', '0501198710584', '0', '2011-03-17', 'Colonia Kennedy, Boca calle, escuela Oswaldo.', '', 8, '22285788', '0', '97011785', 'jcastro@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(21, 6, 1, 1, 10, 0, 'Wilfredo Estrada Matamoros', '', '1983-02-14', 1, '', '', '0801198305570', '0', '2011-10-20', 'Col. Venezuela, sector C, Bloque 21, lote 16.', '', 8, '22250360', '0', '98113809', 'westrada@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(22, 6, 1, 1, 10, 0, 'Amy Alizbeth Diaz Caceres', '', '1990-03-13', 2, '', '', '0801199015349', '0', '2012-04-10', 'CENTEC', '', 8, '22233744', '0', '98913980', 'adiaz@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(23, 6, 1, 1, 10, 0, 'Merlyn Carolina Palma Hernandez', '', '1981-03-02', 1, '', '', '0801198126270', '0', '2010-04-07', 'Residencial Villas del Real, bloque D, casa 7', '', 8, '22339318', '0', '95153204', 'mpalma@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(24, 6, 1, 1, 10, 0, 'Fernando Velasquez Marquez', '', '1980-04-15', 1, '', '', '0801198018149', '0', '2006-09-26', 'Col Bella Oriente, bloque L, casa 17.', '', 8, '22551956', '0', '99044777', 'fvelasquez@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(25, 6, 1, 1, 10, 0, 'Claudio Jose Turcios Cerrato', '', '1974-02-14', 1, '', '', '0801197408138', '1', '2009-03-09', 'CENTEC', '', 8, '22304306', '0', '99014179', 'cturcios@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(26, 6, 1, 1, 10, 0, 'Wendy Carolina Gonzalez Sierra', '', '1983-09-21', 2, '', '', '0801198307630', '0', '2009-03-01', 'Col. Brisas del norte, bloque J, casa 10.', '', 8, '22017176', '0', '97366376', 'wgonzales@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(27, 6, 1, 1, 10, 0, 'David Eduardo Sanchez Aguilar', '', '1985-04-16', 1, '', '', '0801198519044', '0', '2012-08-06', 'Col. hato de Enmedio, Sector 7, bloque 103, casa 5115', '', 8, '0', '0', '32928085', 'dsanchez@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(28, 5, 1, 1, 10, 0, 'Gabriela Mariel Henriquez Oyuela', '', '1981-05-19', 1, '', '', '0801198102890', '0', '2012-01-01', 'Col. lomas del Toncontin, casa 1704, bloque 44', '', 8, '22344330', '0', '99802498', 'ghenriquez@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(29, 1, 2, 1, 1, 0, 'Juan Carlos Mercado', '', '1968-07-15', 1, '', '', '0801196806435', '1', '2011-01-01', 'Colonia Miraflores Sur, Avenida Santa Cristina, Calle 21, bloque 4 casa 1610', '', 8, '22324016', '0', '0', 'jmercado@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(30, 5, 1, 1, 10, 0, 'Vanessa Carolina Varela Pineda', '', '1986-07-15', 2, '', '', '0318198600333', '1', '2012-02-21', 'Col. Victor F Ardon, bloque F, casa 3822', '', 8, '22303915', '0', '32963124', 'vvarela@hngsystems.com', 14000.00, 1, '2017-06-22 11:41:58', 0),
	(31, 5, 2, 12, 3, 0, 'Gabriel Reinaldo Osorio Velasquez', '', '1973-07-18', 1, '', '', '0801197300747', '1', '2014-07-24', 'Colonia Monte Verde, 1ª Av 2ª Calle Casa #14', '', 8, '22324016', '0', '0', 'gosorio@lufergo.com', 45000.00, 1, '2017-06-22 11:41:58', 0),
	(32, 6, 1, 1, 10, 0, 'Jorge Alberto Ávila Sevilla', '', '1990-09-06', 1, '', '', '0801199019001', '0', '2014-10-01', 'Col. Sagastume No 2, calle principal, casa no 7', '', 8, '0', '0', '95706121', 'javila@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(33, 6, 1, 1, 10, 0, 'Alex Francisco Espinal Oyuela', '', '1990-05-20', 1, '', '', '0801199010220', '0', '2014-10-01', 'Cerrro Grande zona 4 bloque 37 casa 3207', '', 8, '22240579', '0', '99505590', 'aespinal@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(34, 6, 1, 1, 10, 0, 'Ana Hisamar Sorto Caceres', '', '1990-09-24', 2, '', '', '0801199023937', '0', '2014-08-20', 'Residencial Suyapita contiguo Hospital Maria', '', 8, '0', '0', '95730914', 'asorto@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(35, 6, 1, 1, 10, 0, 'Keidy Sarahi Rodriguez Duron', '', '1991-07-22', 2, '', '', '0801199115017', '0', '2015-01-15', 'col. modesto rodas alvarado, casa 3621', '', 8, '22344817', '0', '88655195', 'krodriguez@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(36, 6, 1, 1, 10, 0, 'Ana Marcela Lanza Sandres', '', '1991-08-01', 2, '', '', '0801199102323', '0', '2015-01-15', 'Barrio la Cudarilla, Santa Lucia.', '', 8, '27790417', '0', '31909930', 'alanza@hngsystems.com', 15000.00, 3, '2017-06-22 11:41:58', 0),
	(37, 6, 1, 1, 10, 0, 'Hugo Renan Rodriguez Garmendia', '', '1982-01-10', 1, '', '', '0801198210240', '0', '2014-12-01', 'Res. Roble Oeste, V etapa, bloque K casa 6', '', 8, '22348380', '0', '95172277', 'hugorenanrod@gmail.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(38, 6, 1, 1, 10, 0, 'Sergio Mauricio Canales Verde', '', '1987-05-08', 1, '', '', '0801198707988', '0', '2015-05-04', 'Col Santa Maria, bloque 26, Casa 41.', '', 8, '22708172', '0', '33792372', 'scanales@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(39, 6, 1, 1, 10, 0, 'Bryan Orlando Peña Mejia', '', '1989-06-23', 1, '', '', '0801198912973', '0', '2015-12-01', 'Col. El Sitio, 2da etapa, bloque 36, casa #90', '', 8, '22709339', '0', '97459699', 'bpena@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(40, 6, 1, 1, 10, 0, 'Jennyffer Carolina Mejia Meza', '', '1992-05-14', 2, '', '', '0801199210588', '0', '2015-12-01', 'Col. El Sitio, 2da etapa, bloque 36, casa #1816', '', 8, '22709551', '0', '94300006', 'jmejia@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(41, 6, 1, 1, 10, 0, 'Ingrid Aracely Nuñez Gomez', '', '1989-09-06', 2, '', '', '0703198904588', '0', '2015-11-16', 'Res. Bella Oriente, frente a Villas del Sol', '', 8, '0', '0', '95741764', 'inuñez@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(42, 6, 1, 1, 10, 0, 'Javier Ernesto Saravia Sosa', '', '1987-03-28', 1, '', '', '0801198705966', '0', '2016-08-16', 'Villa Adela, Costado Sur del Estado Mayor Conjunto, entre 4 y 5 avenida, 15 calle', '', 8, '22201140', '0', '88709340', 'jsaravia@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(43, 6, 1, 1, 10, 0, 'Ingrid Lizeth Menjivar Bustillo', '', '1990-08-05', 2, '', '', '0801199102002', '0', '2016-08-16', 'Barrio Concepción, 6 calle, 8 avenida comayaguela casa 602', '', 8, '22201644', '0', '95588792', 'imenjivar@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(44, 6, 1, 1, 10, 0, 'Luis Fernando Carbajal Carbajal', '', '1989-06-27', 1, '', '', '0611198900680', '0', '2015-08-16', 'Col.Cerro Grande, zona #4, bloque #40, lote F', '', 8, '22241725', '0', '98355053', 'lcarbajal@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(45, 6, 1, 1, 10, 0, 'Eva Daniela Cardona Rosales', '', '1990-09-15', 2, '', '', '1518199000180', '0', '2016-09-01', 'Col. Las Colinas frente a Auto Escuela Tropical', '', 8, '0', '0', '94633803', 'ecardona@hngsystems.com', 11500.00, 1, '2017-06-22 11:41:58', 0),
	(46, 6, 1, 1, 10, 0, 'Brian Enrique Barahona Zeron', '', '1993-01-21', 1, '', '', '0818199300028', '0', '2016-09-01', 'Santa Ana Fco. Morazan Km 21 media cuadra de la gasolinera TEXACO', '', 8, '22131035', '0', '98322306', 'bbarahona@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(47, 6, 1, 1, 10, 0, 'Arelis Yadira Matamoros Guzman', '', '1990-03-12', 2, '', '', '0801199005964', '0', '2016-09-01', 'Aldea Santa Rosa, carretera al sur Km. 11 contiguo al centro de salud', '', 8, '0', '0', '95071445', 'amatamoros@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(48, 6, 1, 1, 10, 0, 'Leonardo Fabian Medina Espinoza', '', '1990-02-19', 1, '', '', '0801199006523', '0', '2015-04-27', 'Col. Brisas de Olancho, Casa 1, Bloque A, Sector 2', '', 8, '22236826', '0', '32920485', 'lmedina@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(49, 6, 1, 1, 10, 0, 'Erick Roberto Rápalo Garcia', '', '1992-09-16', 1, '', '', '0801199219550', '0', '2016-03-28', 'Tegucigalpa, Col. Los Pinos, Sector F', '', 8, '0', '0', '89882132', 'erapalo@hngsystems.com', 12000.00, 1, '2017-06-22 11:41:58', 0),
	(50, 6, 1, 1, 10, 0, 'Jonie Esteban Miralda Cruz', '', '1991-09-30', 1, '', '', '0801199119714', '0', '2016-04-01', 'Col. Smith #1, calle principal, peatonal 7 casa #602 color rosado fusia. Comayaguela M.D.C', '', 8, '2233944', '0', '95069826', 'jmiralda@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(51, 6, 1, 1, 10, 0, 'Alejandra Gabriela Gonzales Flores', '', '1992-04-03', 2, '', '', '0801199207416', '0', '2016-10-24', 'Col. villeda morales', '', 8, '22297613', '0', '98088944', 'agonzales@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(52, 6, 1, 1, 10, 0, 'David Josué Vasquez Aguilar', '', '1995-03-05', 1, '', '', '0801199508700', '0', '2016-12-13', 'col la esperanza calle dipílto casa c200', '', 8, '22211827', '0', '96071481', 'dvasquez@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(53, 6, 1, 1, 10, 0, 'Oscar David Maradiaga Cárdenas', '', '1993-03-19', 1, '', '', '0801199305745', '0', '2017-01-03', 'Col. villa nueva sector 6 casa #5319', '', 8, '22283581', '0', '95720677', 'omaradiaga@hngsystems.com', 0.00, 1, '2017-06-22 11:41:58', 0),
	(54, 6, 1, 1, 10, 0, 'Claudia Yolanda Zuniga Ruiz', '', '1969-12-02', 2, '', '', '0801196908897', '1', '2017-01-03', 'Residencial Zarahemla, Bloque E, casa 25', '', 8, '22217190', '0', '96665026', 'czuniga@hngsystems', 20000.00, 1, '2017-06-22 11:41:58', 0),
	(55, 6, 2, 1, 10, 0, 'Salvador Alberto Flores Aguilar', '', '1971-12-25', 1, 'o+', 'Honduran', '0501197200116', '1', '2016-01-11', 'Col. Bella Oriente', '', 8, '22550886', '0', '95535116', 'sflores@hngsystems.com', 13000.00, 1, '2017-07-14 19:14:56', 0),
	(56, 6, 2, 3, 10, 0, 'Carlos Nahun García Cruz', '', '0000-00-00', 1, 'o+', '', '0801198611168', '0', '2017-07-24', '', '', 0, '', '', '97061674', 'cgarcia@hngsystems.com', 11500.00, 2, '2017-07-24 08:58:12', 0);
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
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8 COMMENT='Detalle de actividades realizadas por horas.';

-- Dumping data for table hhrr.pay_overtime_detail: ~127 rows (approximately)
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
	(129, 96, '2017-08-27', '2017-08-27', '23:59:00', '2017-08-27 18:14:36', '06:59:00', '0000-00-00 00:00:00', '7 hrs.');
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
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COMMENT='Almacena la solicitud de horas extras.';

-- Dumping data for table hhrr.pay_overtime_request: ~71 rows (approximately)
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
	(38, 55, '2017-08-01', '2017-08-01 11:14:00', '19:00:00', 4, 'Sal', 'Normal', 'Yey!', b'1', 'Autorizada', 1, '2017-08-03 03:12:21', NULL, '2017-08-23 03:26:04', '0000-00-00', 'a\nAutorizada para Pago'),
	(39, 45, '2017-08-01', '2017-08-01 14:33:35', '19:00:00', 4, 'SalV', 'Normal', 'Trabajo Extra, deberia llevar interna en el campo class.', b'1', 'Pendiente', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', ''),
	(45, 36, '2017-08-01', '2017-08-01 21:44:54', '19:00:00', 3, 'Salvador Alberto Flores Aguilar', 'Ventana', 'Ventana', b'1', 'Rechazada', 1, '2017-08-24 03:33:17', 0, '0000-00-00 00:00:00', '0000-00-00', 'A'),
	(46, 45, '2017-08-02', '2017-08-02 14:36:27', '19:00:00', 4, 'Salvador Alberto Flores Aguilar', 'Ventana', 'Ventana a las 7 pm solicitada por Sal', b'1', 'Pendiente', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', ''),
	(52, 55, '2017-08-03', '2017-08-03 21:02:15', '19:00:00', 4, '4', 'Interna', '4', b'1', 'Pendiente', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', ''),
	(53, 55, '2017-08-04', '2017-08-04 11:25:16', '21:00:00', 3, 'Sal', 'Interna', 'Pruebas del modulo', b'1', 'Autorizada', 1, '2017-08-04 11:26:08', NULL, '2017-08-23 03:29:57', '0000-00-00', 'pruebas del modulo\nAutorizada para Pago'),
	(54, 36, '2017-08-05', '2017-08-05 08:53:27', '19:00:00', 4, 'Sal', 'Interna', 'TE', b'1', 'Autorizada', 1, '2017-08-07 09:57:25', NULL, '2017-08-23 03:30:42', '0000-00-00', 'Avances con el BP para 2morrow!\nAuto'),
	(55, 1, '2017-08-05', '2017-08-05 08:54:15', '20:00:00', 4, 'Sal', 'Normal', 'N', b'1', 'Rechazada', 1, '2017-08-07 10:38:10', 0, '0000-00-00 00:00:00', '0000-00-00', NULL),
	(56, 54, '2017-08-05', '2017-08-05 08:56:22', '19:00:00', 3, 'Sal', 'Interna', 'TE', b'1', 'Autorizada', 1, '2017-08-07 10:37:21', NULL, '2017-08-23 03:32:14', '0000-00-00', 'A'),
	(57, 30, '2017-08-05', '2017-08-05 16:58:05', '19:00:00', 4, 'JC', 'Interna', 'Probar el modulo de HHEE', b'1', 'Autorizada', 1, '2017-08-05 04:59:30', NULL, '2017-08-23 03:33:08', '0000-00-00', 'Listo para ingresar detalle'),
	(58, 45, '2017-08-05', '2017-08-05 18:32:30', '19:00:00', 4, 'Jc', 'Interna', 'Pilas', b'1', 'Pendiente', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', ''),
	(59, 55, '2017-08-06', '2017-08-06 18:36:37', '19:00:00', 4, 'Salvador Alberto Flores Aguilar', 'Interna', 'En casa', b'1', 'Cerrada', NULL, NULL, NULL, NULL, '0000-00-00', 'A'),
	(60, 56, '2017-08-06', '2017-08-06 20:02:12', '22:00:00', 4, 'Salv', 'Normal', 'Urgente!', b'1', 'Cerrada', 1, '2017-08-24 03:32:43', 0, '0000-00-00 00:00:00', '0000-00-00', 'Rechada hoy 7 de agosto,\nApr el mismo día a las 10:55am\nAutorizada 23-Ago'),
	(61, 55, '2017-08-07', '2017-08-07 19:32:53', '19:00:00', 4, 'Me', 'Normal', 'Normales el 7-ago', b'1', 'Pendiente', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', ''),
	(75, 55, '2017-08-17', '2017-08-17 00:05:26', '19:00:00', 4, 'Sal', 'Interna', 'Sal', b'1', 'Pendiente', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', ''),
	(76, 45, '2017-08-17', '2017-08-17 01:04:43', '19:00:00', 4, 'Sal', 'Interna', 'Extra', b'1', 'Pendiente', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', ''),
	(77, 54, '2017-08-18', '2017-08-18 15:58:27', '19:00:00', 4, 'Sal', 'Interna', 'Papa probar calculo', b'1', 'Cerrada', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', 'Ok'),
	(78, 30, '2017-08-18', '2017-08-18 16:03:18', '19:00:00', 4, 'Sal', 'Interna', 'Prueba', b'1', 'Cerrada', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', 'A'),
	(79, 1, '2017-08-18', '2017-08-18 16:03:52', '19:00:00', 4, 'Sal', 'Interna', 'Prueba', b'1', 'Pendiente', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', ''),
	(80, 36, '2017-08-18', '2017-08-18 16:04:27', '05:00:00', 4, 'Salvador Alberto Flores Aguilar', 'Interna', 'Prueba', b'1', 'Cerrada', NULL, NULL, NULL, NULL, '0000-00-00', ''),
	(81, 45, '2017-08-18', '2017-08-18 16:30:34', '19:00:00', 4, 'Sal', 'Interna', 'Prueba', b'1', 'Pendiente', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', ''),
	(82, 45, '2017-08-23', '2017-08-23 00:04:18', '19:00:00', 4, 'Alex', 'Normal', 'Mejoras a la BD', b'1', 'Pendiente', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', ''),
	(83, 56, '2017-08-23', '2017-08-23 00:06:47', '22:00:00', 4, 'Prueba con otra Jornada', 'Normal', 'Prueba de Jornada Nocturna', b'1', 'Aprobada', 1, '2017-08-23 08:37:55', 0, '0000-00-00 00:00:00', '0000-00-00', ''),
	(84, 54, '2017-08-23', '2017-08-23 00:07:58', '19:00:00', 4, 'hberrios', 'Normal', 'Avance', b'1', 'Autorizada', 18, '2017-08-24 09:41:54', 13, '2017-08-24 09:51:17', '0000-00-00', 'Para probar el sistema\nAutorizo el pago'),
	(85, 1, '2017-08-23', '2017-08-23 00:08:44', '19:00:00', 4, 'Sal', 'Interna', 'Work hard.', b'1', 'Pendiente', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', ''),
	(86, 54, '2017-08-24', '2017-08-24 09:38:20', '19:00:00', 4, 'Gabriel', 'Interna', 'Avanzar con el proyecto', b'1', 'Autorizada', 18, '2017-08-24 09:42:25', 1, '2017-08-25 04:49:50', '0000-00-00', 'Seunda aprobada para meter datos...'),
	(87, 55, '2017-08-24', '2017-08-24 14:38:08', '19:00:00', 4, 'S', 'Normal', 'A', b'1', 'Cerrada', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', 'Listo para meter datos.'),
	(88, 55, '2017-08-25', '2017-08-25 17:40:40', '19:00:00', 4, 'Salvador Alberto Flores Aguilar', 'Interna', 'Prueba de fecha anterior', b'1', 'Cerrada', 0, '0000-00-00 00:00:00', 0, NULL, '0000-00-00', 'Aprobada'),
	(89, 55, '2017-08-26', '2017-08-26 05:41:55', '19:00:00', 4, 'Salvador Alberto Flores Aguilar', 'Interna', 'Prueba de nueva ventana Modal', b'1', 'Pendiente', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', ''),
	(90, 54, '2017-08-26', '2017-08-26 18:49:18', '19:00:00', 4, 'Salvador Alberto Flores Aguilar', 'Interna', 'Prueba del modulo de HHEE', b'1', 'Pendiente', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', ''),
	(91, 49, '2017-08-26', '2017-08-26 20:35:18', '19:00:00', 4, 'IP', 'Interna', 'Avanzar con proyecto IP', b'1', 'Cerrada', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', 'Confirmado con La Jefa en el IP'),
	(92, 49, '2017-08-27', '2017-08-27 11:13:22', '19:00:00', 4, 'IP', 'Interna', 'Avanzar con proyecto IP', b'1', 'Cerrada', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', 'Confirmado con La Jefa en el IP'),
	(93, 55, '2017-08-27', '2017-08-27 14:03:37', '19:00:00', 4, 'Emilio', 'Interna', 'Avanzar con proyecto IP', b'1', 'Pendiente', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', ''),
	(94, 30, '2017-08-27', '2017-08-27 16:33:09', '19:00:00', 4, 'gosorio', 'Interna', 'Pruebas con el modulo de HHEE', b'1', 'Cerrada', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', 'Verificada con Gabriel'),
	(95, 56, '2017-08-27', '2017-08-27 17:19:29', '22:00:00', 4, '4', 'Normal', '4', b'1', 'Pendiente', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', ''),
	(96, 54, '2017-08-27', '2017-08-27 17:23:05', '19:00:00', 4, '4', 'Normal', '4', b'1', 'Cerrada', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', 'Verificado con Emilio'),
	(97, 36, '2017-08-27', '2017-08-27 17:24:58', '05:00:00', 4, '4', 'Normal', 'Para probar cierre de modal al enviar la solicitud.', b'1', 'Pendiente', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', ''),
	(98, 1, '2017-08-27', '2017-08-27 17:40:40', '19:00:00', 3, 'Paco', 'Interna', 'Estados Financieros Institucionales', b'1', 'Cerrada', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', 'Confirme por telefono con Paco.'),
	(99, 45, '2017-08-28', '2017-08-28 09:40:40', '19:00:00', 4, 'Paco', 'Normal', 'Hacer estados financieros', b'1', 'Pendiente', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', ''),
	(100, 1, '2017-08-28', '2017-08-28 09:45:44', '19:00:00', 4, 'Paco', 'Normal', 'Hacer E/F', b'1', 'Pendiente', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', ''),
	(101, 54, '2017-08-28', '2017-08-28 09:49:24', '19:00:00', 4, 'Emilio', 'Normal', 'Corregir bug en formulario de ingreso de datos.', b'1', 'Pendiente', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00', ''),
	(102, 31, '2017-08-28', '2017-08-28 09:58:21', '19:00:00', 4, 'JC Mercado', 'Interna', 'Trabajar con Salvador en RRHH', b'1', 'Aprobada', 27, '2017-08-28 10:00:04', 0, '0000-00-00 00:00:00', '0000-00-00', 'Confirmado.');
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
  `userName` smallint(5) unsigned NOT NULL,
  `userPass` smallint(5) unsigned NOT NULL,
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
	(1, 'Administrador', 'admin del sistema', b'1'),
	(2, 'Documentador', 'perfil basico xyz 1', b'1'),
	(3, 'Operador', 'test 123', b'1');
/*!40000 ALTER TABLE `sec_profile` ENABLE KEYS */;

-- Dumping structure for table hhrr.sec_profile_resource
DROP TABLE IF EXISTS `sec_profile_resource`;
CREATE TABLE IF NOT EXISTS `sec_profile_resource` (
  `profileId` tinyint(3) unsigned NOT NULL,
  `resourceId` smallint(5) unsigned NOT NULL,
  KEY `profileId` (`profileId`),
  KEY `resourceId` (`resourceId`),
  CONSTRAINT `FK_sec_profile_resource_sec_profile` FOREIGN KEY (`profileId`) REFERENCES `sec_profile` (`id`),
  CONSTRAINT `FK_sec_profile_resource_sec_resource` FOREIGN KEY (`resourceId`) REFERENCES `sec_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Recursos asignados a cada perfil';

-- Dumping data for table hhrr.sec_profile_resource: ~27 rows (approximately)
/*!40000 ALTER TABLE `sec_profile_resource` DISABLE KEYS */;
INSERT INTO `sec_profile_resource` (`profileId`, `resourceId`) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(1, 4),
	(1, 5),
	(1, 6),
	(1, 7),
	(1, 8),
	(1, 9),
	(1, 10),
	(1, 11),
	(1, 12),
	(1, 13),
	(1, 14),
	(1, 15),
	(1, 16),
	(1, 17),
	(1, 18),
	(1, 19),
	(1, 20),
	(1, 21),
	(2, 1),
	(2, 5),
	(2, 12),
	(3, 12),
	(3, 10),
	(2, 10),
	(1, 22);
/*!40000 ALTER TABLE `sec_profile_resource` ENABLE KEYS */;

-- Dumping structure for table hhrr.sec_resource
DROP TABLE IF EXISTS `sec_resource`;
CREATE TABLE IF NOT EXISTS `sec_resource` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `typeId` smallint(5) unsigned DEFAULT NULL,
  `description` varchar(100) NOT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL COMMENT 'estado. AngularJs $state',
  `inMenu` bit(1) DEFAULT NULL COMMENT 'Se mustra en el sidebar',
  PRIMARY KEY (`id`),
  KEY `idType` (`typeId`),
  CONSTRAINT `FK_sec_resource_sec_resourcetype` FOREIGN KEY (`typeId`) REFERENCES `sec_resource_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='Recursos - Objetos o formularios ';

-- Dumping data for table hhrr.sec_resource: ~22 rows (approximately)
/*!40000 ALTER TABLE `sec_resource` DISABLE KEYS */;
INSERT INTO `sec_resource` (`id`, `name`, `typeId`, `description`, `icon`, `state`, `inMenu`) VALUES
	(1, 'Usuarios', 1, 'registrod e usuario', '', 'app.sec.users', b'1'),
	(2, 'Ajustes', 4, 'catalogo ajustes', '', 'app.cat.ajustes', b'1'),
	(3, 'Charts', 6, 'Graficos de Indicadores', '', 'app.charts', b'0'),
	(4, 'Deducciones', 4, 'Catalogo de deducciones', '', 'err.404', b'0'),
	(5, 'Generacion de Planillas', 2, 'Generacion de Planillas', '', 'app.pay.payroll', b'1'),
	(6, 'Deducciones', 3, 'Deducciones por Empleado', '', 'app.assign.deduction', b'1'),
	(7, 'Calcular el ISR', 2, 'Calcular el ISR', 'glyphicon-book', 'app.pay.isr', b'0'),
	(8, 'Aprobación', 6, 'Aprobación de Solicitudes', 'glyphicon-book', 'app.over.approve', b'1'),
	(9, 'Autorización', 6, 'Autorizacion de Planilla', '', 'app.over.authorize', b'0'),
	(10, 'Ingresar Detalle', 6, 'Ingresar detalle de actividades', '', 'app.over.detail', b'0'),
	(11, 'Perfiles', 1, 'Catalogo de Perfiles', '', 'app.sec.profiles', b'1'),
	(12, 'Solicitud', 6, 'Solicitud de Horas Extras', '', 'app.over.request', b'1'),
	(13, 'Planilla', 6, 'Calcular Planilla de Horas Extras', '', 'app.over.payroll', b'1'),
	(14, 'Tipos de planilla', 4, 'Tipos de planilla', '', 'err.404', b'0'),
	(15, 'Recursos', 5, 'Catalogo de recursos del sistema', '', 'app.conf.resources', b'1'),
	(16, 'Parametros', 5, 'Parametros', '', 'app.conf.parameters', b'1'),
	(17, 'Menus', 5, 'Menus', NULL, 'app.conf.sidebar', b'1'),
	(18, 'Login', 1, 'Login screen', 'fa fa-sign-out', 'login', b'0'),
	(19, 'Empleados', 4, 'Empleados', NULL, 'app.cat.employees', b'1'),
	(20, 'Empresas', 4, 'Empresas', NULL, 'app.cat.companies', b'1'),
	(21, 'Niveles Academicos', 4, 'Niveles academicos', NULL, 'app.cat.acedemic', b'1'),
	(22, 'lockscreen', NULL, 'lockscreen', NULL, 'user.lockscreen', b'0');
/*!40000 ALTER TABLE `sec_resource` ENABLE KEYS */;

-- Dumping structure for table hhrr.sec_resource_type
DROP TABLE IF EXISTS `sec_resource_type`;
CREATE TABLE IF NOT EXISTS `sec_resource_type` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `icon` varchar(50) NOT NULL COMMENT 'Icono que se usará en el menu',
  `state` varchar(50) NOT NULL COMMENT 'se utiliza asignar los recursos al menu',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Tipos de recurso - Menu principal.';

-- Dumping data for table hhrr.sec_resource_type: ~6 rows (approximately)
/*!40000 ALTER TABLE `sec_resource_type` DISABLE KEYS */;
INSERT INTO `sec_resource_type` (`id`, `name`, `description`, `icon`, `state`) VALUES
	(1, 'Seguridad', '', 'fa fa-unlock-alt', 'app.security'),
	(2, 'Planillas', '', 'fa fa-money', 'app.pay'),
	(3, 'Registro', '', 'fa fa-pencil', 'app.assign'),
	(4, 'Catalogos', '', 'fa fa-folder-open-o', 'app.cat'),
	(5, 'Configuracion', '', 'fa fa-cogs', 'app.conf'),
	(6, 'Horas Extras', 'Módulo de Horas Extras', 'fa fa-clock-o', 'app.over');
/*!40000 ALTER TABLE `sec_resource_type` ENABLE KEYS */;

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
  CONSTRAINT `FK_sec_user_main_employee` FOREIGN KEY (`employeeId`) REFERENCES `main_employee` (`id`),
  CONSTRAINT `FK_sec_user_sec_profile` FOREIGN KEY (`profileId`) REFERENCES `sec_profile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- Dumping data for table hhrr.sec_user: ~11 rows (approximately)
/*!40000 ALTER TABLE `sec_user` DISABLE KEYS */;
INSERT INTO `sec_user` (`id`, `userName`, `email`, `password`, `profileId`, `employeeId`, `firstName`, `lastName`, `phone`, `avatar`, `isActive`, `changePass`) VALUES
	(1, 'root', 'sflores@hngsystems.com', '18d95a9364645d678cb8cc2fe357a15a', 1, 55, 'Salvador', 'Flores', '95535116', 'myAvatar.png', b'1', NULL),
	(2, 'usuario', 'user@user.user', '1e27217870dc7dc66113c85505f179fb', 2, 36, 'Usuario', '', '12345678', 'man.png', b'1', NULL),
	(3, 'admin', 'admin@admin.com', '0847d7bbf3c41a20fe8b21795cb29e9f', 3, 45, 'Admin', '', '99999999', 'female.png', b'1', NULL),
	(12, 'dgonzales', 'dgonzales@hngsystems.com', '7dfce549c9e3445333444d69419c25a5', 3, 1, 'Dennis', '', '34343434', 'man.png', b'1', NULL),
	(13, 'jcmercado', 'jmercado@hngsystems.com', '03aad7bfdcccad63ec30eace351ff21b', 1, 29, 'Juan Carlos', 'Mercado', '99999999', 'man.png', b'1', NULL),
	(18, 'hberrios', 'hberrios@hngsystems.com', '1b9e336dd325c129cadb6165a88c379f', 1, 4, 'Hector', 'Berríos', '99372193', 'man.png', b'1', NULL),
	(19, 'vvarela', 'vvarela@hngsystems.com', 'cfdcc1a7c8b75575575146e8b422dc4d', 2, 30, 'Vanessa', 'Varela', '32963124', 'female.png', b'1', NULL),
	(20, 'czuniga', 'czuniga@hngsystems', '46f89d8f42060cd69a951dc4943de10e', 2, 54, 'Claudia', 'Zuniga', '96665026', 'female.png', b'1', NULL),
	(26, 'cgarcia', 'cgarcia@hngsystems.com', '7eb20e9bfb23811b2fa3580947f9fd0a', 3, 56, 'Carlos ', 'García', '97061674', 'man.png', b'1', NULL),
	(27, 'gosorio', 'gosorio@lufergo.com', 'a3fee4075b69c2de9cbb165b60ea925f', 1, 31, 'Gabriel', 'Osorio', '22324016', 'man.png', b'1', NULL),
	(28, 'erapalo', 'erapalo@hngsystems.com', '4dd89226f6603c5f84287fe6a7b20b59', 3, 49, 'Erick Roberto Rápalo', '', '89882132', 'man.png', b'1', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='Tabla intermedia para asignar la relacion entre el usuario y el empleado.';

-- Dumping data for table hhrr.sec_user_emp: ~11 rows (approximately)
/*!40000 ALTER TABLE `sec_user_emp` DISABLE KEYS */;
INSERT INTO `sec_user_emp` (`id`, `userId`, `employeeId`) VALUES
	(1, 1, 55),
	(2, 2, 36),
	(3, 3, 45),
	(6, 12, 1),
	(7, 13, 29),
	(8, 18, 4),
	(9, 19, 30),
	(10, 20, 54),
	(11, 26, 56),
	(12, 27, 31),
	(13, 28, 49);
/*!40000 ALTER TABLE `sec_user_emp` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Dumping data for table hhrr.sys_general_parameter: ~9 rows (approximately)
/*!40000 ALTER TABLE `sys_general_parameter` DISABLE KEYS */;
INSERT INTO `sys_general_parameter` (`id`, `name`, `description`, `value`) VALUES
	(3, 'company_form', 'Forma Jurídica de la empresa', ''),
	(4, 'emp_ihss', 'Porcentaje de cotización al Seguro Social del empleado', '0.25'),
	(6, 'isrTable', 'Indica la tabla de porcentajes a utilizar para el cáclculo del ISR', ''),
	(9, 'key', 'key para encriptacion', 'bcb04b7e103a0cd8b54763051cef08bc55abe029fdebae5e1d417e2ffb2a00a3'),
	(10, 'root', 'usuario del sistema', '1'),
	(11, 'Administrador', 'Perfil del usuario root', '1'),
	(12, 'keyToken', 'llave de token', 'example_key'),
	(13, 'Expiration Time', 'Tiempo de expiración del token en segundos ejem: 1800=30min,900=15min,120=2min,60=1min', '30'),
	(14, 'HeaderToken', 'Llave del header del token', 'token'),
	(15, 'overStartTime', 'Hora permitida para el inicio de Horas Extras', '22:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=1569 DEFAULT CHARSET=utf8 COMMENT='Bitácora general del sistema';

-- Dumping data for table hhrr.sys_log: ~1,568 rows (approximately)
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` (`id`, `userId`, `action`, `userName`, `actionEnum`, `table`, `when`) VALUES
	(1, 3, 1, '', '', '', '2017-07-28 18:22:13'),
	(2, 1, 1, '', '', '', '2017-07-28 18:25:07'),
	(3, 1, 1, '', '', '', '2017-07-28 18:31:35'),
	(4, 3, 1, '', '', '', '2017-07-28 18:40:59'),
	(5, 3, 1, '', '', '', '2017-07-28 18:42:30'),
	(6, 1, 1, '', '', '', '2017-07-28 18:47:57'),
	(7, 1, 1, '', '', '', '2017-07-28 18:55:45'),
	(8, 1, 1, '', '', '', '2017-07-28 18:58:13'),
	(9, 1, 1, '', '', '', '2017-07-28 19:06:46'),
	(10, 1, 1, '', '', '', '2017-07-28 19:08:05'),
	(11, 1, 1, '', '', '', '2017-07-29 05:06:39'),
	(12, 1, 1, '', '', '', '2017-07-29 05:15:30'),
	(13, 1, 1, '', '', '', '2017-07-29 05:27:07'),
	(14, 1, 1, '', '', '', '2017-07-29 05:34:58'),
	(15, 1, 1, '', '', '', '2017-07-29 08:50:29'),
	(16, 1, 1, '', '', '', '2017-07-29 08:56:31'),
	(17, 1, 1, '', '', '', '2017-07-29 09:04:20'),
	(18, 1, 1, '', '', '', '2017-07-29 09:43:22'),
	(19, 1, 1, '', 'LOGIN', '', '2017-07-29 10:30:30'),
	(20, 3, 1, NULL, 'LOGIN', 'Login', '2017-07-29 15:53:43'),
	(21, 2, 1, NULL, 'LOGIN', '', '2017-07-29 15:58:45'),
	(22, 3, 1, NULL, 'LOGIN', '', '2017-07-29 16:05:15'),
	(23, 13, 1, NULL, 'LOGIN', '', '2017-07-29 16:05:26'),
	(24, 20, 1, NULL, 'LOGIN', '', '2017-07-29 16:20:49'),
	(25, 54, 2, NULL, 'POST', 'PayOvertimeRequest', '2017-07-29 16:21:21'),
	(26, 18, 1, NULL, 'LOGIN', '', '2017-07-29 16:42:17'),
	(27, 18, 2, NULL, 'POST', 'payOvertimeRequest', '2017-07-29 16:43:18'),
	(28, 18, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-29 17:28:30'),
	(29, 18, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-29 17:38:48'),
	(30, 18, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-29 17:44:20'),
	(31, 18, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-29 17:52:11'),
	(32, 18, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-29 17:56:22'),
	(33, 18, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-29 17:57:24'),
	(34, 18, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-29 18:03:11'),
	(35, 18, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-29 18:05:54'),
	(36, 18, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-29 18:08:04'),
	(37, 18, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-29 18:12:58'),
	(38, 18, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-29 18:14:12'),
	(39, 13, 1, NULL, 'LOGIN', '', '2017-07-29 18:16:40'),
	(40, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-29 18:17:01'),
	(41, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-29 18:22:49'),
	(42, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-29 18:24:17'),
	(43, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-29 18:26:24'),
	(44, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-29 18:26:54'),
	(45, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-29 18:31:22'),
	(46, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-29 18:37:18'),
	(47, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-29 18:38:11'),
	(48, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-29 18:39:48'),
	(49, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-29 18:40:09'),
	(50, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-29 18:40:34'),
	(51, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-29 18:41:35'),
	(52, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-29 18:41:47'),
	(53, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-29 18:42:00'),
	(54, 3, 1, NULL, 'LOGIN', '', '2017-07-29 19:09:28'),
	(55, 3, 2, NULL, 'POST', 'payOvertimeRequest', '2017-07-29 19:10:33'),
	(56, 18, 1, NULL, 'LOGIN', '', '2017-07-29 19:11:00'),
	(57, 18, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-29 19:12:06'),
	(58, 18, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-29 19:13:10'),
	(59, 1, 1, NULL, 'LOGIN', '', '2017-07-29 19:19:42'),
	(60, 3, 1, NULL, 'LOGIN', '', '2017-07-29 19:58:18'),
	(61, 2, 1, NULL, 'LOGIN', '', '2017-07-29 20:00:45'),
	(62, 18, 1, NULL, 'LOGIN', '', '2017-07-29 20:01:03'),
	(63, 3, 1, NULL, 'LOGIN', '', '2017-07-29 20:01:43'),
	(64, 1, 1, NULL, 'LOGIN', '', '2017-07-29 20:13:57'),
	(65, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-29 20:14:12'),
	(66, 13, 1, NULL, 'LOGIN', '', '2017-07-29 20:17:23'),
	(67, 1, 1, NULL, 'LOGIN', '', '2017-07-29 21:37:35'),
	(68, 1, 1, NULL, 'LOGIN', '', '2017-07-30 06:18:43'),
	(69, 3, 1, NULL, 'LOGIN', '', '2017-07-30 06:28:22'),
	(70, 3, 1, NULL, 'LOGIN', '', '2017-07-30 06:28:40'),
	(71, 1, 1, NULL, 'LOGIN', '', '2017-07-30 06:29:26'),
	(72, 1, 1, NULL, 'LOGIN', '', '2017-07-30 06:51:15'),
	(73, 1, 1, NULL, 'LOGIN', '', '2017-07-30 06:57:25'),
	(74, 1, 2, NULL, 'POST', 'payOvertimeRequest', '2017-07-30 08:37:49'),
	(75, 1, 1, NULL, 'LOGIN', '', '2017-07-30 11:50:43'),
	(76, 1, 1, NULL, 'LOGIN', '', '2017-07-30 12:33:06'),
	(77, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 13:11:45'),
	(78, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 13:12:31'),
	(79, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 13:13:48'),
	(80, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 13:38:28'),
	(81, 13, 1, NULL, 'LOGIN', '', '2017-07-30 16:53:17'),
	(82, 18, 1, NULL, 'LOGIN', '', '2017-07-30 16:56:26'),
	(83, 1, 1, NULL, 'LOGIN', '', '2017-07-30 17:02:57'),
	(84, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:24:18'),
	(85, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:24:37'),
	(86, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:26:41'),
	(87, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:26:52'),
	(88, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:28:49'),
	(89, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:29:12'),
	(90, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:30:58'),
	(91, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:32:07'),
	(92, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:32:28'),
	(93, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:32:49'),
	(94, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:33:00'),
	(95, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:34:49'),
	(96, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:35:02'),
	(97, 18, 1, NULL, 'LOGIN', '', '2017-07-30 18:35:18'),
	(98, 13, 1, NULL, 'LOGIN', '', '2017-07-30 18:35:47'),
	(99, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:35:58'),
	(100, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:36:13'),
	(101, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:36:25'),
	(102, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:37:20'),
	(103, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:37:29'),
	(104, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:37:39'),
	(105, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:37:46'),
	(106, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:37:52'),
	(107, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:38:07'),
	(108, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:38:14'),
	(109, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:38:22'),
	(110, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:41:12'),
	(111, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:42:55'),
	(112, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:43:51'),
	(113, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:44:02'),
	(114, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:44:52'),
	(115, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:48:32'),
	(116, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:50:02'),
	(117, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:50:05'),
	(118, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:50:06'),
	(119, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:50:06'),
	(120, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:50:06'),
	(121, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:50:07'),
	(122, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:50:07'),
	(123, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:50:07'),
	(124, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:50:08'),
	(125, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:50:18'),
	(126, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:51:23'),
	(127, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:52:48'),
	(128, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:54:17'),
	(129, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 18:58:41'),
	(130, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 19:17:48'),
	(131, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 19:31:56'),
	(132, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 19:32:04'),
	(133, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 19:32:21'),
	(134, 13, 1, NULL, 'LOGIN', '', '2017-07-30 19:34:39'),
	(135, 13, 1, NULL, 'LOGIN', '', '2017-07-30 19:34:49'),
	(136, 13, 1, NULL, 'LOGIN', '', '2017-07-30 19:35:05'),
	(137, 13, 1, NULL, 'LOGIN', '', '2017-07-30 19:39:01'),
	(138, 13, 1, NULL, 'LOGIN', '', '2017-07-30 19:39:15'),
	(139, 13, 1, NULL, 'LOGIN', '', '2017-07-30 19:39:31'),
	(140, 13, 1, NULL, 'LOGIN', '', '2017-07-30 19:40:40'),
	(141, 13, 1, NULL, 'LOGIN', '', '2017-07-30 19:40:53'),
	(142, 1, 1, NULL, 'LOGIN', '', '2017-07-30 19:41:11'),
	(143, 1, 1, NULL, 'LOGIN', '', '2017-07-30 19:41:58'),
	(144, 1, 1, NULL, 'LOGIN', '', '2017-07-30 19:43:55'),
	(145, 1, 1, NULL, 'LOGIN', '', '2017-07-30 20:19:12'),
	(146, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 20:31:29'),
	(147, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 20:31:44'),
	(148, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 20:31:53'),
	(149, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 20:32:54'),
	(150, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 20:33:03'),
	(151, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 20:33:31'),
	(152, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 20:33:38'),
	(153, 26, 1, NULL, 'LOGIN', '', '2017-07-30 20:34:49'),
	(154, 26, 2, NULL, 'POST', 'payOvertimeRequest', '2017-07-30 20:35:22'),
	(155, 1, 1, NULL, 'LOGIN', '', '2017-07-30 20:39:05'),
	(156, 18, 1, NULL, 'LOGIN', '', '2017-07-30 20:39:20'),
	(157, 13, 1, NULL, 'LOGIN', '', '2017-07-30 20:39:31'),
	(158, 2, 1, NULL, 'LOGIN', '', '2017-07-30 20:39:43'),
	(159, 3, 1, NULL, 'LOGIN', '', '2017-07-30 20:39:51'),
	(160, 1, 1, NULL, 'LOGIN', '', '2017-07-30 20:40:34'),
	(161, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-30 20:41:40'),
	(162, 1, 1, NULL, 'LOGIN', '', '2017-07-31 05:52:24'),
	(163, 1, 1, NULL, 'LOGIN', '', '2017-07-31 06:06:56'),
	(164, 1, 1, NULL, 'LOGIN', '', '2017-07-31 06:07:11'),
	(165, 1, 1, NULL, 'LOGIN', '', '2017-07-31 06:07:40'),
	(166, 3, 1, NULL, 'LOGIN', '', '2017-07-31 06:07:52'),
	(167, 1, 1, NULL, 'LOGIN', '', '2017-07-31 06:13:10'),
	(168, 13, 1, NULL, 'LOGIN', '', '2017-07-31 06:13:38'),
	(169, 13, 2, NULL, 'PUT', 'pay_overtime_request', '2017-07-31 06:13:53'),
	(170, 3, 1, NULL, 'LOGIN', '', '2017-07-31 06:14:36'),
	(171, 3, 1, NULL, 'LOGIN', '', '2017-07-31 06:15:42'),
	(172, 3, 1, NULL, 'LOGIN', '', '2017-07-31 06:39:29'),
	(173, 3, 1, NULL, 'LOGIN', '', '2017-07-31 06:39:49'),
	(174, 1, 1, NULL, 'LOGIN', '', '2017-07-31 06:44:04'),
	(175, 3, 1, NULL, 'LOGIN', '', '2017-07-31 06:45:15'),
	(176, 3, 1, NULL, 'LOGIN', '', '2017-07-31 06:45:56'),
	(177, 3, 1, NULL, 'LOGIN', '', '2017-07-31 06:46:38'),
	(178, 3, 1, NULL, 'LOGIN', '', '2017-07-31 06:46:54'),
	(179, 3, 1, NULL, 'LOGIN', '', '2017-07-31 06:47:30'),
	(180, 3, 1, NULL, 'LOGIN', '', '2017-07-31 06:47:53'),
	(181, 3, 1, NULL, 'LOGIN', '', '2017-07-31 06:48:09'),
	(182, 3, 1, NULL, 'LOGIN', '', '2017-07-31 08:44:09'),
	(183, 3, 1, NULL, 'LOGIN', '', '2017-07-31 09:03:38'),
	(184, 2, 1, NULL, 'LOGIN', '', '2017-07-31 09:04:01'),
	(185, 3, 1, NULL, 'LOGIN', '', '2017-07-31 09:33:16'),
	(186, 3, 1, NULL, 'LOGIN', '', '2017-07-31 09:34:30'),
	(187, 3, 1, NULL, 'LOGIN', '', '2017-07-31 09:37:34'),
	(188, 3, 1, NULL, 'LOGIN', '', '2017-07-31 09:37:57'),
	(189, 3, 1, NULL, 'LOGIN', '', '2017-07-31 09:40:30'),
	(190, 3, 1, NULL, 'LOGIN', '', '2017-07-31 09:41:34'),
	(191, 3, 1, NULL, 'LOGIN', '', '2017-07-31 09:45:07'),
	(192, 3, 1, NULL, 'LOGIN', '', '2017-07-31 09:48:41'),
	(193, 3, 1, NULL, 'LOGIN', '', '2017-07-31 09:50:17'),
	(194, 3, 1, NULL, 'LOGIN', '', '2017-07-31 09:52:26'),
	(195, 3, 1, NULL, 'LOGIN', '', '2017-07-31 09:54:13'),
	(196, 3, 1, NULL, 'LOGIN', '', '2017-07-31 09:55:36'),
	(197, 3, 1, NULL, 'LOGIN', '', '2017-07-31 09:57:57'),
	(198, 3, 1, NULL, 'LOGIN', '', '2017-07-31 09:58:08'),
	(199, 3, 1, NULL, 'LOGIN', '', '2017-07-31 10:00:06'),
	(200, 3, 1, NULL, 'LOGIN', '', '2017-07-31 10:03:15'),
	(201, 3, 1, NULL, 'LOGIN', '', '2017-07-31 10:17:50'),
	(202, 3, 1, NULL, 'LOGIN', '', '2017-07-31 11:50:51'),
	(203, 1, 1, NULL, 'LOGIN', '', '2017-07-31 11:51:25'),
	(204, 1, 1, NULL, 'LOGIN', '', '2017-07-31 11:52:27'),
	(205, 1, 1, NULL, 'LOGIN', '', '2017-07-31 11:58:27'),
	(206, 3, 1, NULL, 'LOGIN', '', '2017-07-31 11:59:43'),
	(207, 1, 1, NULL, 'LOGIN', '', '2017-07-31 13:27:57'),
	(208, 3, 1, NULL, 'LOGIN', '', '2017-07-31 16:14:55'),
	(209, 1, 1, NULL, 'LOGIN', '', '2017-07-31 19:18:01'),
	(210, 1, 1, NULL, 'LOGIN', '', '2017-08-01 08:52:45'),
	(211, 1, 1, NULL, 'LOGIN', '', '2017-08-01 10:53:49'),
	(212, 1, 2, NULL, 'POST', 'payOvertimeRequest', '2017-08-01 11:14:01'),
	(213, 1, 1, NULL, 'LOGIN', '', '2017-08-01 13:32:20'),
	(214, 3, 1, NULL, 'LOGIN', '', '2017-08-01 14:32:41'),
	(215, 3, 2, NULL, 'POST', 'payOvertimeRequest', '2017-08-01 14:33:36'),
	(216, 2, 1, NULL, 'LOGIN', '', '2017-08-01 14:38:42'),
	(217, 2, 2, NULL, 'POST', 'payOvertimeRequest', '2017-08-01 14:39:10'),
	(218, 1, 1, NULL, 'LOGIN', '', '2017-08-01 15:25:30'),
	(219, 2, 1, NULL, 'LOGIN', '', '2017-08-01 15:55:43'),
	(220, 2, 2, NULL, 'POST', 'payOvertimeRequest', '2017-08-01 15:57:36'),
	(221, 2, 2, NULL, 'POST', 'payOvertimeRequest', '2017-08-01 15:59:46'),
	(222, 2, 2, NULL, 'POST', 'payOvertimeRequest', '2017-08-01 16:19:12'),
	(223, 1, 1, NULL, 'LOGIN', '', '2017-08-01 17:17:06'),
	(224, 1, 1, NULL, 'LOGIN', '', '2017-08-01 18:52:12'),
	(225, 2, 1, NULL, 'LOGIN', '', '2017-08-01 20:45:10'),
	(226, 2, 2, NULL, 'POST', 'payOvertimeRequest', '2017-08-01 21:41:54'),
	(227, 2, 2, NULL, 'POST', 'payOvertimeRequest', '2017-08-01 21:44:55'),
	(228, 1, 1, NULL, 'LOGIN', '', '2017-08-02 03:54:10'),
	(229, 1, 1, NULL, 'LOGIN', '', '2017-08-02 08:06:00'),
	(230, 1, 1, NULL, 'LOGIN', '', '2017-08-02 09:13:27'),
	(231, 1, 1, NULL, 'LOGIN', '', '2017-08-02 09:16:17'),
	(232, 26, 1, NULL, 'LOGIN', '', '2017-08-02 10:34:50'),
	(233, 2, 1, NULL, 'LOGIN', '', '2017-08-02 10:44:30'),
	(234, 1, 1, NULL, 'LOGIN', '', '2017-08-02 13:24:24'),
	(235, 1, 1, NULL, 'LOGIN', '', '2017-08-02 14:05:09'),
	(236, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-02 14:16:58'),
	(237, 3, 1, NULL, 'LOGIN', '', '2017-08-02 14:35:00'),
	(238, 3, 2, NULL, 'POST', 'payOvertimeRequest', '2017-08-02 14:36:28'),
	(239, 1, 1, NULL, 'LOGIN', '', '2017-08-03 13:15:55'),
	(240, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-03 13:16:52'),
	(241, 1, 1, NULL, 'LOGIN', '', '2017-08-03 14:53:48'),
	(242, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-03 15:11:35'),
	(243, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-03 15:11:44'),
	(244, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-03 15:11:50'),
	(245, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-03 15:11:58'),
	(246, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-03 15:12:05'),
	(247, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-03 15:12:10'),
	(248, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-03 15:12:14'),
	(249, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-03 15:12:21'),
	(250, 1, 2, NULL, 'POST', 'payOvertimeRequest', '2017-08-03 15:42:54'),
	(251, 1, 2, NULL, 'POST', 'payOvertimeRequest', '2017-08-03 15:48:11'),
	(252, 1, 2, NULL, 'POST', 'payOvertimeRequest', '2017-08-03 15:50:13'),
	(253, 1, 2, NULL, 'POST', 'payOvertimeRequest', '2017-08-03 15:52:20'),
	(254, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-03 15:53:46'),
	(255, 1, 2, NULL, 'POST', 'payOvertimeRequest', '2017-08-03 16:17:01'),
	(256, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-03 16:24:18'),
	(257, 1, 1, NULL, 'LOGIN', '', '2017-08-03 20:08:21'),
	(258, 1, 2, NULL, 'POST', 'payOvertimeRequest', '2017-08-03 21:02:15'),
	(259, 3, 1, NULL, 'LOGIN', '', '2017-08-03 22:22:35'),
	(260, 1, 1, NULL, 'LOGIN', '', '2017-08-04 09:14:01'),
	(261, 1, 2, NULL, 'POST', 'payOvertimeRequest', '2017-08-04 11:25:16'),
	(262, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-04 11:26:08'),
	(263, 1, 1, NULL, 'LOGIN', '', '2017-08-04 13:16:00'),
	(264, 1, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-04 14:21:40'),
	(265, 1, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-04 14:24:59'),
	(266, 1, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-04 14:27:34'),
	(267, 1, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-04 14:30:40'),
	(268, 1, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-04 14:33:33'),
	(269, 1, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-04 14:41:24'),
	(270, 1, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-04 14:42:41'),
	(271, 1, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-04 14:43:11'),
	(272, 1, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-04 14:51:48'),
	(273, 2, 1, NULL, 'LOGIN', '', '2017-08-04 16:05:49'),
	(274, 2, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-04 16:06:13'),
	(275, 2, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-04 16:09:04'),
	(276, 2, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-04 16:10:09'),
	(277, 2, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-04 16:34:59'),
	(278, 2, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-04 17:47:15'),
	(279, 1, 1, NULL, 'LOGIN', '', '2017-08-04 19:44:58'),
	(280, 2, 1, NULL, 'LOGIN', '', '2017-08-04 21:47:42'),
	(281, 1, 1, NULL, 'LOGIN', '', '2017-08-04 21:53:35'),
	(282, 1, 1, NULL, 'LOGIN', '', '2017-08-05 06:29:24'),
	(283, 2, 1, NULL, 'LOGIN', '', '2017-08-05 08:53:07'),
	(284, 2, 2, NULL, 'POST', 'payOvertimeRequest', '2017-08-05 08:53:27'),
	(285, 12, 1, NULL, 'LOGIN', '', '2017-08-05 08:53:55'),
	(286, 12, 2, NULL, 'POST', 'payOvertimeRequest', '2017-08-05 08:54:15'),
	(287, 1, 1, NULL, 'LOGIN', '', '2017-08-05 08:55:31'),
	(288, 20, 1, NULL, 'LOGIN', '', '2017-08-05 08:55:59'),
	(289, 20, 2, NULL, 'POST', 'payOvertimeRequest', '2017-08-05 08:56:22'),
	(290, 20, 1, NULL, 'LOGIN', '', '2017-08-05 09:39:44'),
	(291, 13, 1, NULL, 'LOGIN', '', '2017-08-05 10:55:24'),
	(292, 1, 1, NULL, 'LOGIN', '', '2017-08-05 14:56:02'),
	(293, 1, 1, NULL, 'LOGIN', '', '2017-08-05 16:49:42'),
	(294, 19, 1, NULL, 'LOGIN', '', '2017-08-05 16:50:08'),
	(295, 19, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-05 16:50:33'),
	(296, 19, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-05 16:56:20'),
	(297, 19, 2, NULL, 'POST', 'payOvertimeRequest', '2017-08-05 16:58:05'),
	(298, 1, 1, NULL, 'LOGIN', '', '2017-08-05 16:58:59'),
	(299, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-05 16:59:30'),
	(300, 19, 1, NULL, 'LOGIN', '', '2017-08-05 17:00:08'),
	(301, 1, 1, NULL, 'LOGIN', '', '2017-08-05 17:00:33'),
	(302, 19, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-05 17:01:34'),
	(303, 19, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-05 17:04:00'),
	(304, 19, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-05 17:06:16'),
	(305, 19, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-05 17:08:09'),
	(306, 3, 1, NULL, 'LOGIN', '', '2017-08-05 17:57:47'),
	(307, 3, 1, NULL, 'LOGIN', '', '2017-08-05 18:30:47'),
	(308, 3, 2, NULL, 'POST', 'payOvertimeRequest', '2017-08-05 18:32:30'),
	(309, 3, 1, NULL, 'LOGIN', '', '2017-08-05 21:56:16'),
	(310, 3, 1, NULL, 'LOGIN', '', '2017-08-05 21:59:30'),
	(311, 1, 1, NULL, 'LOGIN', '', '2017-08-05 22:03:06'),
	(312, 1, 1, NULL, 'LOGIN', '', '2017-08-05 22:24:34'),
	(313, 1, 1, NULL, 'LOGIN', '', '2017-08-05 22:30:22'),
	(314, 3, 1, NULL, 'LOGIN', '', '2017-08-05 22:49:53'),
	(315, 1, 1, NULL, 'LOGIN', '', '2017-08-05 22:53:40'),
	(316, 3, 1, NULL, 'LOGIN', '', '2017-08-05 22:55:17'),
	(317, 3, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-05 22:56:33'),
	(318, 3, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-05 23:02:35'),
	(319, 1, 1, NULL, 'LOGIN', '', '2017-08-05 23:24:58'),
	(320, 1, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-05 23:34:23'),
	(321, 1, 1, NULL, 'LOGIN', '', '2017-08-06 08:57:28'),
	(322, 1, 1, NULL, 'LOGIN', '', '2017-08-06 10:34:27'),
	(323, 1, 1, NULL, 'LOGIN', '', '2017-08-06 14:18:58'),
	(324, 1, 1, NULL, 'LOGIN', '', '2017-08-06 14:21:20'),
	(325, 1, 1, NULL, 'LOGIN', '', '2017-08-06 18:26:43'),
	(326, 1, 2, NULL, 'POST', 'payOvertimeRequest', '2017-08-06 18:36:37'),
	(327, 2, 1, NULL, 'LOGIN', '', '2017-08-06 19:27:20'),
	(328, 2, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-06 19:39:24'),
	(329, 2, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-06 19:49:41'),
	(330, 26, 1, NULL, 'LOGIN', '', '2017-08-06 19:58:27'),
	(331, 26, 2, NULL, 'POST', 'payOvertimeRequest', '2017-08-06 20:02:12'),
	(332, 26, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-06 20:19:14'),
	(333, 26, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-06 21:02:54'),
	(334, 26, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-06 21:03:51'),
	(335, 26, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-06 21:05:12'),
	(336, 26, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-06 21:08:07'),
	(337, 13, 1, NULL, 'LOGIN', '', '2017-08-06 21:26:37'),
	(338, 18, 1, NULL, 'LOGIN', '', '2017-08-06 21:28:10'),
	(339, 20, 1, NULL, 'LOGIN', '', '2017-08-06 21:56:33'),
	(340, 20, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-06 21:57:28'),
	(341, 18, 1, NULL, 'LOGIN', '', '2017-08-06 22:03:51'),
	(342, 1, 1, NULL, 'LOGIN', '', '2017-08-07 08:55:08'),
	(343, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 09:57:25'),
	(344, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 10:00:34'),
	(345, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 10:03:35'),
	(346, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 10:07:56'),
	(347, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 10:07:56'),
	(348, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 10:07:56'),
	(349, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 10:07:57'),
	(350, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 10:07:57'),
	(351, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 10:07:57'),
	(352, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 10:07:57'),
	(353, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 10:07:57'),
	(354, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 10:07:59'),
	(355, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 10:09:12'),
	(356, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 10:09:32'),
	(357, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 10:09:41'),
	(358, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 10:09:53'),
	(359, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 10:09:56'),
	(360, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 10:10:04'),
	(361, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 10:10:26'),
	(362, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 10:11:30'),
	(363, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 10:36:50'),
	(364, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 10:37:21'),
	(365, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 10:38:11'),
	(366, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 10:49:54'),
	(367, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 10:51:22'),
	(368, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 10:51:40'),
	(369, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 10:51:52'),
	(370, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 10:52:14'),
	(371, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 10:54:34'),
	(372, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 10:55:14'),
	(373, 1, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-07 11:08:35'),
	(374, 1, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-07 11:49:10'),
	(375, 1, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-07 11:51:32'),
	(376, 1, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-07 11:53:06'),
	(377, 1, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-07 11:57:18'),
	(378, 1, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-07 11:57:36'),
	(379, 1, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-07 12:01:52'),
	(380, 1, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-07 12:02:21'),
	(381, 1, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-07 12:02:29'),
	(382, 1, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-07 12:03:23'),
	(383, 1, 1, NULL, 'LOGIN', '', '2017-08-07 13:30:16'),
	(384, 1, 1, NULL, 'LOGIN', '', '2017-08-07 17:31:18'),
	(385, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 17:32:50'),
	(386, 1, 1, NULL, 'LOGIN', '', '2017-08-07 19:30:47'),
	(387, 1, 2, NULL, 'POST', 'payOvertimeRequest', '2017-08-07 19:32:54'),
	(388, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 19:46:05'),
	(389, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 19:46:40'),
	(390, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 19:52:21'),
	(391, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 19:53:30'),
	(392, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 19:57:47'),
	(393, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 20:00:01'),
	(394, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 20:02:32'),
	(395, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 20:03:12'),
	(396, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 20:07:04'),
	(397, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 20:09:31'),
	(398, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 20:10:00'),
	(399, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-07 20:10:26'),
	(400, 1, 1, NULL, 'LOGIN', '', '2017-08-08 06:11:11'),
	(401, 1, 1, NULL, 'LOGIN', '', '2017-08-08 08:37:22'),
	(402, 2, 1, NULL, 'LOGIN', '', '2017-08-08 10:58:44'),
	(403, 3, 1, NULL, 'LOGIN', '', '2017-08-08 11:51:46'),
	(404, 3, 1, NULL, 'LOGIN', '', '2017-08-08 11:53:48'),
	(405, 3, 1, NULL, 'LOGIN', '', '2017-08-08 11:53:58'),
	(406, 3, 1, NULL, 'LOGIN', '', '2017-08-08 11:54:08'),
	(407, 1, 1, NULL, 'LOGIN', '', '2017-08-08 16:09:42'),
	(408, 3, 1, NULL, 'LOGIN', '', '2017-08-08 17:36:25'),
	(409, 3, 1, NULL, 'LOGIN', '', '2017-08-08 17:36:42'),
	(410, 3, 1, NULL, 'LOGIN', '', '2017-08-08 17:37:19'),
	(411, 1, 1, NULL, 'LOGIN', '', '2017-08-08 21:48:42'),
	(412, 1, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-08 23:32:49'),
	(413, 1, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-08 23:36:38'),
	(414, 3, 1, NULL, 'LOGIN', '', '2017-08-09 06:50:42'),
	(415, 3, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-09 06:51:07'),
	(416, 3, 1, NULL, 'LOGIN', '', '2017-08-09 06:51:44'),
	(417, 3, 1, NULL, 'LOGIN', '', '2017-08-09 06:52:02'),
	(418, 1, 1, NULL, 'LOGIN', '', '2017-08-09 06:52:56'),
	(419, 1, 1, NULL, 'LOGIN', '', '2017-08-09 06:53:20'),
	(420, 1, 1, NULL, 'LOGIN', '', '2017-08-09 06:53:34'),
	(421, 3, 1, NULL, 'LOGIN', '', '2017-08-09 07:03:49'),
	(422, 3, 1, NULL, 'LOGIN', '', '2017-08-09 07:13:32'),
	(423, 3, 1, NULL, 'LOGIN', '', '2017-08-09 07:14:46'),
	(424, 3, 1, NULL, 'LOGIN', '', '2017-08-09 07:16:49'),
	(425, 3, 1, NULL, 'LOGIN', '', '2017-08-09 07:17:44'),
	(426, 3, 1, NULL, 'LOGIN', '', '2017-08-09 07:19:36'),
	(427, 3, 1, NULL, 'LOGIN', '', '2017-08-09 07:20:14'),
	(428, 3, 1, NULL, 'LOGIN', '', '2017-08-09 07:20:54'),
	(429, 3, 1, NULL, 'LOGIN', '', '2017-08-09 07:31:46'),
	(430, 3, 1, NULL, 'LOGIN', '', '2017-08-09 07:33:32'),
	(431, 3, 1, NULL, 'LOGIN', '', '2017-08-09 07:34:18'),
	(432, 3, 1, NULL, 'LOGIN', '', '2017-08-09 07:35:11'),
	(433, 3, 1, NULL, 'LOGIN', '', '2017-08-09 07:36:33'),
	(434, 3, 1, NULL, 'LOGIN', '', '2017-08-09 07:37:38'),
	(435, 3, 1, NULL, 'LOGIN', '', '2017-08-09 07:38:03'),
	(436, 3, 1, NULL, 'LOGIN', '', '2017-08-09 07:43:07'),
	(437, 1, 1, NULL, 'LOGIN', '', '2017-08-09 07:43:54'),
	(438, 3, 1, NULL, 'LOGIN', '', '2017-08-09 07:45:27'),
	(439, 3, 1, NULL, 'LOGIN', '', '2017-08-09 07:47:26'),
	(440, 13, 1, NULL, 'LOGIN', '', '2017-08-09 09:07:14'),
	(441, 1, 1, NULL, 'LOGIN', '', '2017-08-09 10:30:23'),
	(442, 1, 1, NULL, 'LOGIN', '', '2017-08-09 10:42:30'),
	(443, 1, 1, NULL, 'LOGIN', '', '2017-08-09 10:43:09'),
	(444, 1, 1, NULL, 'LOGIN', '', '2017-08-09 13:07:06'),
	(445, 1, 1, NULL, 'LOGIN', '', '2017-08-09 13:17:41'),
	(446, 2, 1, NULL, 'LOGIN', '', '2017-08-09 13:18:15'),
	(447, 2, 2, NULL, 'POST', 'payOvertimeRequest', '2017-08-09 13:18:49'),
	(448, 12, 1, NULL, 'LOGIN', '', '2017-08-09 13:19:04'),
	(449, 12, 2, NULL, 'POST', 'payOvertimeRequest', '2017-08-09 13:19:26'),
	(450, 3, 1, NULL, 'LOGIN', '', '2017-08-09 13:27:53'),
	(451, 3, 1, NULL, 'LOGIN', '', '2017-08-09 13:28:51'),
	(452, 3, 1, NULL, 'LOGIN', '', '2017-08-09 13:29:00'),
	(453, 3, 1, NULL, 'LOGIN', '', '2017-08-09 13:34:22'),
	(454, 3, 1, NULL, 'LOGIN', '', '2017-08-09 13:34:55'),
	(455, 3, 1, NULL, 'LOGIN', '', '2017-08-09 13:36:17'),
	(456, 3, 1, NULL, 'LOGIN', '', '2017-08-09 13:36:53'),
	(457, 3, 1, NULL, 'LOGIN', '', '2017-08-09 13:38:30'),
	(458, 3, 1, NULL, 'LOGIN', '', '2017-08-09 13:39:07'),
	(459, 3, 1, NULL, 'LOGIN', '', '2017-08-09 13:39:26'),
	(460, 3, 1, NULL, 'LOGIN', '', '2017-08-09 13:43:31'),
	(461, 3, 1, NULL, 'LOGIN', '', '2017-08-09 13:46:37'),
	(462, 3, 1, NULL, 'LOGIN', '', '2017-08-09 13:47:30'),
	(463, 3, 1, NULL, 'LOGIN', '', '2017-08-09 13:47:38'),
	(464, 3, 1, NULL, 'LOGIN', '', '2017-08-09 13:49:05'),
	(465, 3, 1, NULL, 'LOGIN', '', '2017-08-09 13:49:58'),
	(466, 3, 1, NULL, 'LOGIN', '', '2017-08-09 13:52:17'),
	(467, 3, 1, NULL, 'LOGIN', '', '2017-08-09 13:52:51'),
	(468, 3, 1, NULL, 'LOGIN', '', '2017-08-09 13:53:22'),
	(469, 13, 1, NULL, 'LOGIN', '', '2017-08-09 13:53:32'),
	(470, 13, 1, NULL, 'LOGIN', '', '2017-08-09 13:53:45'),
	(471, 13, 1, NULL, 'LOGIN', '', '2017-08-09 13:54:04'),
	(472, 13, 1, NULL, 'LOGIN', '', '2017-08-09 14:00:03'),
	(473, 13, 1, NULL, 'LOGIN', '', '2017-08-09 14:03:39'),
	(474, 1, 1, NULL, 'LOGIN', '', '2017-08-09 14:03:48'),
	(475, 2, 1, NULL, 'LOGIN', '', '2017-08-09 14:05:51'),
	(476, 3, 1, NULL, 'LOGIN', '', '2017-08-09 14:06:18'),
	(477, 1, 1, NULL, 'LOGIN', '', '2017-08-09 14:06:30'),
	(478, 1, 1, NULL, 'LOGIN', '', '2017-08-09 14:06:40'),
	(479, 1, 1, NULL, 'LOGIN', '', '2017-08-09 14:22:05'),
	(480, 2, 1, NULL, 'LOGIN', '', '2017-08-09 14:23:41'),
	(481, 12, 1, NULL, 'LOGIN', '', '2017-08-09 14:26:15'),
	(482, 20, 1, NULL, 'LOGIN', '', '2017-08-09 14:26:49'),
	(483, 20, 2, NULL, 'POST', 'payOvertimeRequest', '2017-08-09 14:27:17'),
	(484, 1, 1, NULL, 'LOGIN', '', '2017-08-09 14:27:26'),
	(485, 19, 1, NULL, 'LOGIN', '', '2017-08-09 14:27:49'),
	(486, 19, 2, NULL, 'POST', 'payOvertimeRequest', '2017-08-09 14:28:04'),
	(487, 1, 1, NULL, 'LOGIN', '', '2017-08-09 14:28:27'),
	(488, 3, 1, NULL, 'LOGIN', '', '2017-08-09 14:28:51'),
	(489, 3, 2, NULL, 'POST', 'payOvertimeRequest', '2017-08-09 14:29:12'),
	(490, 26, 1, NULL, 'LOGIN', '', '2017-08-09 14:29:35'),
	(491, 26, 2, NULL, 'POST', 'payOvertimeRequest', '2017-08-09 14:29:57'),
	(492, 1, 1, NULL, 'LOGIN', '', '2017-08-09 14:30:09'),
	(493, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-09 14:30:39'),
	(494, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-09 14:30:52'),
	(495, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-09 14:31:08'),
	(496, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-09 14:31:28'),
	(497, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-09 14:31:37'),
	(498, 26, 1, NULL, 'LOGIN', '', '2017-08-09 14:32:05'),
	(499, 26, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-09 14:32:20'),
	(500, 26, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-09 15:27:22'),
	(501, 1, 1, NULL, 'LOGIN', '', '2017-08-09 15:32:37'),
	(502, 1, 2, NULL, 'POST', 'payOvertimeRequest', '2017-08-09 15:34:32'),
	(503, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-09 15:34:52'),
	(504, 2, 1, NULL, 'LOGIN', '', '2017-08-09 15:38:25'),
	(505, 2, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-09 15:38:55'),
	(506, 2, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-09 15:42:18'),
	(507, 26, 1, NULL, 'LOGIN', '', '2017-08-09 15:46:50'),
	(508, 3, 1, NULL, 'LOGIN', '', '2017-08-09 15:58:20'),
	(509, 3, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-09 15:58:36'),
	(510, 3, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-09 16:01:35'),
	(511, 1, 1, NULL, 'LOGIN', '', '2017-08-09 16:05:39'),
	(512, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-09 16:06:04'),
	(513, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-09 16:06:16'),
	(514, 19, 1, NULL, 'LOGIN', '', '2017-08-09 16:06:49'),
	(515, 19, 1, NULL, 'LOGIN', '', '2017-08-09 16:17:30'),
	(516, 19, 1, NULL, 'LOGIN', '', '2017-08-09 16:17:51'),
	(517, 19, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-09 16:20:51'),
	(518, 19, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-09 16:23:19'),
	(519, 19, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-09 16:24:21'),
	(520, 19, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-09 16:27:07'),
	(521, 19, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-09 16:28:33'),
	(522, 19, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-09 16:31:30'),
	(523, 19, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-09 16:32:58'),
	(524, 19, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-09 16:36:46'),
	(525, 19, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-09 16:36:59'),
	(526, 19, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-09 16:37:08'),
	(527, 1, 1, NULL, 'LOGIN', '', '2017-08-09 16:43:21'),
	(528, 1, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-09 16:52:50'),
	(529, 1, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-09 16:55:43'),
	(530, 1, 1, NULL, 'LOGIN', '', '2017-08-09 17:31:35'),
	(531, 3, 1, NULL, 'LOGIN', '', '2017-08-09 17:31:55'),
	(532, 20, 1, NULL, 'LOGIN', '', '2017-08-09 17:32:28'),
	(533, 20, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-09 17:32:40'),
	(534, 20, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-09 17:34:43'),
	(535, 20, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-09 17:44:48'),
	(536, 20, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-09 17:45:15'),
	(537, 20, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-09 17:45:22'),
	(538, 20, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-09 19:06:55'),
	(539, 20, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-09 19:23:28'),
	(540, 20, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-09 19:24:01'),
	(541, 20, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-09 19:27:58'),
	(542, 1, 1, NULL, 'LOGIN', '', '2017-08-09 19:34:07'),
	(543, 3, 1, NULL, 'LOGIN', '', '2017-08-09 19:44:26'),
	(544, 3, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-09 20:04:31'),
	(545, 3, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-09 20:05:21'),
	(546, 1, 1, NULL, 'LOGIN', '', '2017-08-09 20:16:35'),
	(547, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-09 21:03:28'),
	(548, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-09 21:03:41'),
	(549, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-09 21:04:04'),
	(550, 2, 1, NULL, 'LOGIN', '', '2017-08-09 21:17:04'),
	(551, 3, 1, NULL, 'LOGIN', '', '2017-08-09 21:18:03'),
	(552, 3, 2, NULL, 'POST', 'payOvertimeRequest', '2017-08-09 21:19:40'),
	(553, 18, 1, NULL, 'LOGIN', '', '2017-08-09 21:20:14'),
	(554, 18, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-09 21:22:22'),
	(555, 3, 1, NULL, 'LOGIN', '', '2017-08-09 21:22:44'),
	(556, 3, 1, NULL, 'LOGIN', '', '2017-08-09 21:23:09'),
	(557, 3, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-09 21:24:00'),
	(558, 3, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-09 21:24:30'),
	(559, 3, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-09 21:25:32'),
	(560, 3, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-09 21:26:01'),
	(561, 3, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-09 21:26:01'),
	(562, 3, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-09 21:26:01'),
	(563, 3, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-09 21:26:02'),
	(564, 3, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-09 21:26:02'),
	(565, 3, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-09 21:26:02'),
	(566, 3, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-09 21:26:02'),
	(567, 3, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-09 21:26:03'),
	(568, 3, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-09 21:26:36'),
	(569, 3, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-09 21:26:36'),
	(570, 13, 1, NULL, 'LOGIN', '', '2017-08-09 21:27:26'),
	(571, 1, 1, NULL, 'LOGIN', '', '2017-08-09 21:32:24'),
	(572, 1, 1, NULL, 'LOGIN', '', '2017-08-09 21:34:06'),
	(573, 1, 1, NULL, 'LOGIN', '', '2017-08-10 05:50:24'),
	(574, 1, 1, NULL, 'LOGIN', '', '2017-08-10 06:11:07'),
	(575, 1, 2, NULL, 'PUT', 'pay_overtime_request', '2017-08-10 06:13:21'),
	(576, 1, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-10 06:33:34'),
	(577, 1, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-10 06:34:00'),
	(578, 1, 2, NULL, 'POST', 'payOvertimeDetail', '2017-08-10 06:35:57'),
	(579, 1, 1, NULL, 'LOGIN', '', '2017-08-10 06:49:07'),
	(580, 1, 1, NULL, 'LOGIN', '', '2017-08-10 06:50:00'),
	(581, 3, 1, NULL, 'LOGIN', '', '2017-08-10 06:53:00'),
	(582, 3, 2, NULL, 'POST', 'payOvertimeRequest', '2017-08-10 06:53:17'),
	(583, 26, 1, NULL, 'LOGIN', '', '2017-08-10 06:53:58'),
	(584, 26, 2, NULL, 'POST', 'payOvertimeRequest', '2017-08-10 06:54:15'),
	(585, 20, 1, NULL, 'LOGIN', '', '2017-08-10 06:54:38'),
	(586, 20, 2, NULL, 'POST', 'payOvertimeRequest', '2017-08-10 06:54:52'),
	(587, 12, 1, NULL, 'LOGIN', '', '2017-08-10 06:55:23'),
	(588, 12, 2, NULL, 'POST', 'payOvertimeRequest', '2017-08-10 06:55:39'),
	(589, 2, 1, NULL, 'LOGIN', '', '2017-08-10 06:55:55'),
	(590, 2, 2, NULL, 'POST', 'payOvertimeRequest', '2017-08-10 06:56:11'),
	(591, 19, 1, NULL, 'LOGIN', '', '2017-08-10 06:56:23'),
	(592, 19, 2, NULL, 'POST', 'payOvertimeRequest', '2017-08-10 06:56:40'),
	(593, 1, 1, NULL, 'LOGIN', '', '2017-08-10 07:08:03'),
	(594, 3, 1, '3', 'LOGIN', '', '2017-08-10 09:05:12'),
	(595, 3, 1, '::1', 'LOGIN', '', '2017-08-10 09:06:16'),
	(596, 3, 1, '::1', 'LOGIN', '', '2017-08-10 09:56:20'),
	(597, 3, 1, '::1', 'LOGIN', '', '2017-08-10 09:56:35'),
	(598, 3, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-10 09:57:46'),
	(599, 3, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-10 10:07:25'),
	(600, 26, 1, '::1', 'LOGIN', '', '2017-08-10 10:24:18'),
	(601, 26, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-10 10:24:33'),
	(602, 26, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-10 10:25:07'),
	(603, 26, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-10 10:26:01'),
	(604, 26, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-10 10:26:13'),
	(605, 26, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-10 10:27:16'),
	(606, 26, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-10 10:28:42'),
	(607, 26, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-10 10:29:16'),
	(608, 26, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-10 10:30:53'),
	(609, 13, 1, '::1', 'LOGIN', '', '2017-08-10 10:32:31'),
	(610, 18, 1, '::1', 'LOGIN', '', '2017-08-10 10:33:00'),
	(611, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-10 10:33:42'),
	(612, 18, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-10 10:35:45'),
	(613, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-10 10:37:03'),
	(614, 18, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-10 10:37:52'),
	(615, 18, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-10 10:39:42'),
	(616, 18, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-10 10:40:22'),
	(617, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-10 10:40:53'),
	(618, 18, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-10 10:41:42'),
	(619, 18, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-10 10:45:01'),
	(620, 18, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-10 10:45:14'),
	(621, 18, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-10 10:48:31'),
	(622, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-10 10:49:01'),
	(623, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-10 10:49:44'),
	(624, 1, 1, '::1', 'LOGIN', '', '2017-08-10 11:16:24'),
	(625, 1, 1, '::1', 'LOGIN', '', '2017-08-10 11:18:10'),
	(626, 3, 1, '::1', 'LOGIN', '', '2017-08-10 11:21:04'),
	(627, 3, 1, '::1', 'LOGIN', '', '2017-08-10 11:23:06'),
	(628, 3, 1, '::1', 'LOGIN', '', '2017-08-10 11:23:59'),
	(629, 3, 1, '::1', 'LOGIN', '', '2017-08-10 11:24:37'),
	(630, 3, 1, '::1', 'LOGIN', '', '2017-08-10 11:26:28'),
	(631, 3, 1, '::1', 'LOGIN', '', '2017-08-10 11:42:45'),
	(632, 3, 1, '::1', 'LOGIN', '', '2017-08-10 11:43:07'),
	(633, 3, 1, '::1', 'LOGIN', '', '2017-08-10 11:44:02'),
	(634, 3, 1, '::1', 'LOGIN', '', '2017-08-10 11:44:29'),
	(635, 3, 1, '::1', 'LOGIN', '', '2017-08-10 11:46:49'),
	(636, 3, 1, '::1', 'LOGIN', '', '2017-08-10 11:47:25'),
	(637, 3, 1, '::1', 'LOGIN', '', '2017-08-10 11:51:31'),
	(638, 3, 1, '::1', 'LOGIN', '', '2017-08-10 11:52:39'),
	(639, 3, 1, '::1', 'LOGIN', '', '2017-08-10 11:57:04'),
	(640, 3, 1, '::1', 'LOGIN', '', '2017-08-10 11:59:37'),
	(641, 3, 1, '::1', 'LOGIN', '', '2017-08-10 12:48:37'),
	(642, 3, 1, '::1', 'LOGIN', '', '2017-08-10 12:52:28'),
	(643, 3, 1, '::1', 'LOGIN', '', '2017-08-10 12:52:52'),
	(644, 3, 1, '::1', 'LOGIN', '', '2017-08-10 12:53:36'),
	(645, 1, 1, '::1', 'LOGIN', '', '2017-08-10 12:54:52'),
	(646, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-10 12:56:55'),
	(647, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-10 14:02:30'),
	(648, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-10 14:53:44'),
	(649, 1, 1, '::1', 'LOGIN', '', '2017-08-10 14:56:20'),
	(650, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-10 15:15:40'),
	(651, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-10 15:24:17'),
	(652, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-10 15:34:46'),
	(653, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-10 15:36:09'),
	(654, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-10 15:36:30'),
	(655, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-10 15:39:21'),
	(656, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-10 15:39:41'),
	(657, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-10 15:43:06'),
	(658, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-10 15:53:42'),
	(659, 1, 1, '::1', 'LOGIN', '', '2017-08-10 17:38:48'),
	(660, 1, 1, '::1', 'LOGIN', '', '2017-08-11 08:29:16'),
	(661, 1, 1, '::1', 'LOGIN', '', '2017-08-11 09:28:26'),
	(662, 1, 1, '::1', 'LOGIN', '', '2017-08-11 09:28:42'),
	(663, 3, 1, '::1', 'LOGIN', '', '2017-08-11 09:51:13'),
	(664, 3, 1, '::1', 'LOGIN', '', '2017-08-11 09:53:36'),
	(665, 1, 1, '::1', 'LOGIN', '', '2017-08-11 09:53:45'),
	(666, 1, 1, '::1', 'LOGIN', '', '2017-08-11 10:29:13'),
	(667, 1, 1, '::1', 'LOGIN', '', '2017-08-11 10:36:15'),
	(668, 1, 1, '::1', 'LOGIN', '', '2017-08-11 10:49:20'),
	(669, 3, 1, '::1', 'LOGIN', '', '2017-08-11 11:11:09'),
	(670, 3, 2, '::1', 'POST', 'payOvertimeRequest', '2017-08-11 11:15:08'),
	(671, 18, 1, '::1', 'LOGIN', '', '2017-08-11 11:16:19'),
	(672, 3, 1, '::1', 'LOGIN', '', '2017-08-11 11:18:18'),
	(673, 1, 1, '::1', 'LOGIN', '', '2017-08-11 11:25:14'),
	(674, 3, 1, '::1', 'LOGIN', '', '2017-08-11 11:25:49'),
	(675, 3, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-11 11:47:19'),
	(676, 3, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-11 12:46:26'),
	(677, 1, 1, '::1', 'LOGIN', '', '2017-08-11 13:45:21'),
	(678, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-11 15:28:23'),
	(679, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-11 15:29:48'),
	(680, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-11 15:42:45'),
	(681, 3, 1, '::1', 'LOGIN', '', '2017-08-11 15:48:39'),
	(682, 3, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-11 16:14:43'),
	(683, 3, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-11 16:15:48'),
	(684, 3, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-11 16:16:15'),
	(685, 13, 1, '::1', 'LOGIN', '', '2017-08-11 16:26:59'),
	(686, 2, 1, '::1', 'LOGIN', '', '2017-08-11 16:33:19'),
	(687, 12, 1, '::1', 'LOGIN', '', '2017-08-11 16:38:32'),
	(688, 3, 1, '::1', 'LOGIN', '', '2017-08-12 11:08:16'),
	(689, 1, 1, '::1', 'LOGIN', '', '2017-08-12 11:27:47'),
	(690, 1, 1, '::1', 'LOGIN', '', '2017-08-12 11:51:40'),
	(691, 1, 1, '::1', 'LOGIN', '', '2017-08-12 11:53:46'),
	(692, 3, 1, '::1', 'LOGIN', '', '2017-08-12 12:00:37'),
	(693, 3, 1, '::1', 'LOGIN', '', '2017-08-12 12:06:05'),
	(694, 1, 1, '::1', 'LOGIN', '', '2017-08-12 13:30:25'),
	(695, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-12 13:33:47'),
	(696, 2, 1, '::1', 'LOGIN', '', '2017-08-12 17:35:05'),
	(697, 2, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-12 17:39:46'),
	(698, 2, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-12 17:40:31'),
	(699, 2, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-12 17:40:51'),
	(700, 2, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-12 18:21:18'),
	(701, 2, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-12 18:22:25'),
	(702, 2, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-12 18:22:35'),
	(703, 2, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-12 18:23:32'),
	(704, 1, 1, '::1', 'LOGIN', '', '2017-08-12 19:35:34'),
	(705, 1, 1, '::1', 'LOGIN', '', '2017-08-12 21:37:04'),
	(706, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-12 21:53:39'),
	(707, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-12 21:54:10'),
	(708, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-12 21:54:50'),
	(709, 1, 1, '::1', 'LOGIN', '', '2017-08-12 23:40:29'),
	(710, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-13 00:09:49'),
	(711, 2, 1, '::1', 'LOGIN', '', '2017-08-13 00:10:08'),
	(712, 3, 1, '::1', 'LOGIN', '', '2017-08-13 00:10:26'),
	(713, 20, 1, '::1', 'LOGIN', '', '2017-08-13 00:10:46'),
	(714, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-13 00:11:35'),
	(715, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-13 00:14:39'),
	(716, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-13 00:18:54'),
	(717, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-13 00:19:20'),
	(718, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-13 00:20:04'),
	(719, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-13 00:23:42'),
	(720, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-13 00:29:27'),
	(721, 1, 1, '::1', 'LOGIN', '', '2017-08-13 07:09:20'),
	(722, 20, 1, '::1', 'LOGIN', '', '2017-08-13 07:12:56'),
	(723, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-13 08:14:29'),
	(724, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-13 08:29:50'),
	(725, 1, 1, '::1', 'LOGIN', '', '2017-08-13 09:20:41'),
	(726, 20, 1, '::1', 'LOGIN', '', '2017-08-13 09:25:01'),
	(727, 20, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-13 11:10:55'),
	(728, 1, 1, '::1', 'LOGIN', '', '2017-08-13 11:33:47'),
	(729, 20, 1, '::1', 'LOGIN', '', '2017-08-13 11:33:59'),
	(730, 20, 1, '::1', 'LOGIN', '', '2017-08-13 16:34:08'),
	(731, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-13 17:55:13'),
	(732, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-13 17:55:26'),
	(733, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-13 18:07:04'),
	(734, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-13 18:08:13'),
	(735, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-13 18:08:36'),
	(736, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-13 18:09:13'),
	(737, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-13 18:23:00'),
	(738, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-13 18:26:32'),
	(739, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-13 18:34:48'),
	(740, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-13 18:40:24'),
	(741, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-13 18:41:17'),
	(742, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-13 18:42:11'),
	(743, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-13 18:45:11'),
	(744, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-13 18:49:52'),
	(745, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-13 18:51:39'),
	(746, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-13 18:52:34'),
	(747, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-13 19:19:38'),
	(748, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-13 19:58:37'),
	(749, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-13 20:06:04'),
	(750, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-13 20:07:03'),
	(751, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-13 20:07:42'),
	(752, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-13 20:07:46'),
	(753, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-13 20:07:48'),
	(754, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-13 20:08:03'),
	(755, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-13 20:08:22'),
	(756, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-13 20:08:24'),
	(757, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-13 20:08:25'),
	(758, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-13 20:08:26'),
	(759, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-13 20:09:35'),
	(760, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-13 20:10:06'),
	(761, 20, 1, '::1', 'LOGIN', '', '2017-08-14 04:10:03'),
	(762, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-14 04:16:48'),
	(763, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-14 05:18:04'),
	(764, 20, 1, '::1', 'LOGIN', '', '2017-08-14 09:01:34'),
	(765, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-14 09:19:15'),
	(766, 20, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 09:20:12'),
	(767, 20, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 09:23:10'),
	(768, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-14 09:26:29'),
	(769, 20, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 09:27:41'),
	(770, 20, 2, '::1', 'POST', 'payOvertimeRequest', '2017-08-14 09:28:24'),
	(771, 18, 1, '::1', 'LOGIN', '', '2017-08-14 09:28:40'),
	(772, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 09:29:59'),
	(773, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 09:30:10'),
	(774, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 09:30:50'),
	(775, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 09:33:28'),
	(776, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 09:33:37'),
	(777, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 09:33:52'),
	(778, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 09:34:07'),
	(779, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 09:34:11'),
	(780, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 09:34:16'),
	(781, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 09:34:21'),
	(782, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 09:34:30'),
	(783, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 09:34:36'),
	(784, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 09:34:43'),
	(785, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 09:34:50'),
	(786, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 09:34:58'),
	(787, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 09:35:04'),
	(788, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 09:35:07'),
	(789, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 09:35:12'),
	(790, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 09:35:14'),
	(791, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 09:35:23'),
	(792, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 09:35:35'),
	(793, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 09:35:51'),
	(794, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 09:35:57'),
	(795, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 09:36:01'),
	(796, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 10:01:56'),
	(797, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 10:02:03'),
	(798, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 10:02:10'),
	(799, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 10:02:28'),
	(800, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 10:03:02'),
	(801, 20, 1, '::1', 'LOGIN', '', '2017-08-14 10:56:37'),
	(802, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-14 10:56:59'),
	(803, 20, 1, '::1', 'LOGIN', '', '2017-08-14 11:14:45'),
	(804, 1, 1, '::1', 'LOGIN', '', '2017-08-14 11:16:02'),
	(805, 1, 1, '::1', 'LOGIN', '', '2017-08-14 11:16:10'),
	(806, 1, 1, '::1', 'LOGIN', '', '2017-08-14 11:20:19'),
	(807, 1, 1, '::1', 'LOGIN', '', '2017-08-14 13:02:49'),
	(808, 1, 1, '::1', 'LOGIN', '', '2017-08-14 13:16:53'),
	(809, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 13:20:40'),
	(810, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 13:20:55'),
	(811, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-14 13:23:53'),
	(812, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-14 13:24:38'),
	(813, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 13:24:48'),
	(814, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-14 13:25:27'),
	(815, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-14 13:25:31'),
	(816, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-14 13:25:35'),
	(817, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-14 13:25:38'),
	(818, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-14 13:25:45'),
	(819, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-14 13:25:55'),
	(820, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-14 13:25:59'),
	(821, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-14 13:26:08'),
	(822, 13, 1, '::1', 'LOGIN', '', '2017-08-14 15:20:17'),
	(823, 13, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 15:22:20'),
	(824, 13, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 15:22:28'),
	(825, 13, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 15:22:34'),
	(826, 13, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 15:22:41'),
	(827, 13, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 15:22:49'),
	(828, 13, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 15:23:02'),
	(829, 19, 1, '::1', 'LOGIN', '', '2017-08-14 15:23:18'),
	(830, 19, 1, '::1', 'LOGIN', '', '2017-08-14 15:23:29'),
	(831, 19, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-14 15:24:05'),
	(832, 19, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 15:24:48'),
	(833, 19, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-14 16:36:43'),
	(834, 19, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-14 16:42:31'),
	(835, 19, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-14 16:45:23'),
	(836, 19, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-14 16:57:32'),
	(837, 19, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 16:57:57'),
	(838, 19, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-14 17:00:15'),
	(839, 18, 1, '::1', 'LOGIN', '', '2017-08-14 17:04:08'),
	(840, 18, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-14 17:04:37'),
	(841, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 17:04:50'),
	(842, 18, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-14 17:06:52'),
	(843, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 17:06:56'),
	(844, 18, 2, '::1', 'POST', 'payOvertimeRequest', '2017-08-14 17:09:59'),
	(845, 18, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-14 17:23:46'),
	(846, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 17:23:56'),
	(847, 3, 1, '::1', 'LOGIN', '', '2017-08-14 17:28:51'),
	(848, 3, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-14 17:29:14'),
	(849, 3, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 17:32:34'),
	(850, 3, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-14 17:40:03'),
	(851, 3, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-14 17:42:05'),
	(852, 1, 1, '::1', 'LOGIN', '', '2017-08-14 18:42:58'),
	(853, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-14 19:02:35'),
	(854, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 19:03:05'),
	(855, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-14 19:04:01'),
	(856, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-14 19:04:11'),
	(857, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-14 19:04:14'),
	(858, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-14 19:04:17'),
	(859, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-14 19:04:41'),
	(860, 1, 1, '::1', 'LOGIN', '', '2017-08-15 08:18:07'),
	(861, 1, 1, '::1', 'LOGIN', '', '2017-08-15 08:36:46'),
	(862, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-15 08:44:33'),
	(863, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-15 08:45:03'),
	(864, 1, 1, '::1', 'LOGIN', '', '2017-08-15 12:51:01'),
	(865, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-15 13:43:40'),
	(866, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-15 13:43:43'),
	(867, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-15 13:43:45'),
	(868, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-15 13:43:51'),
	(869, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-15 13:43:54'),
	(870, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-15 13:44:00'),
	(871, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-15 13:44:02'),
	(872, 1, 2, '::1', 'POST', 'payOvertimeRequest', '2017-08-15 13:46:53'),
	(873, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-15 13:47:11'),
	(874, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-15 13:47:27'),
	(875, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-15 13:47:29'),
	(876, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-15 13:47:31'),
	(877, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-15 13:47:33'),
	(878, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-15 13:47:39'),
	(879, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-15 13:47:43'),
	(880, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-15 13:47:44'),
	(881, 1, 1, '::1', 'LOGIN', '', '2017-08-15 16:51:23'),
	(882, 20, 1, '::1', 'LOGIN', '', '2017-08-15 17:35:10'),
	(883, 20, 2, '::1', 'POST', 'payOvertimeRequest', '2017-08-15 17:35:44'),
	(884, 18, 1, '::1', 'LOGIN', '', '2017-08-15 17:35:56'),
	(885, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-15 17:36:06'),
	(886, 20, 1, '::1', 'LOGIN', '', '2017-08-15 17:36:26'),
	(887, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-15 17:36:34'),
	(888, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-15 17:36:36'),
	(889, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-15 17:36:37'),
	(890, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-15 17:36:43'),
	(891, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-15 17:36:46'),
	(892, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-15 17:36:49'),
	(893, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-15 17:36:52'),
	(894, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-15 17:36:54'),
	(895, 20, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-15 17:36:57'),
	(896, 1, 1, '::1', 'LOGIN', '', '2017-08-15 17:37:09'),
	(897, 1, 1, '::1', 'LOGIN', '', '2017-08-15 18:58:29'),
	(898, 1, 1, '::1', 'LOGIN', '', '2017-08-15 19:13:19'),
	(899, 3, 1, '::1', 'LOGIN', '', '2017-08-15 19:29:24'),
	(900, 3, 2, '::1', 'POST', 'payOvertimeRequest', '2017-08-15 19:29:40'),
	(901, 18, 1, '::1', 'LOGIN', '', '2017-08-15 19:29:58'),
	(902, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-15 19:30:09'),
	(903, 3, 1, '::1', 'LOGIN', '', '2017-08-15 19:30:19'),
	(904, 3, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-15 19:30:36'),
	(905, 3, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-15 19:31:03'),
	(906, 3, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-15 19:31:11'),
	(907, 1, 1, '::1', 'LOGIN', '', '2017-08-15 19:31:25'),
	(908, 1, 1, '::1', 'LOGIN', '', '2017-08-15 19:55:04'),
	(909, 1, 1, '::1', 'LOGIN', '', '2017-08-15 20:00:40'),
	(910, 1, 1, '::1', 'LOGIN', '', '2017-08-15 20:13:01'),
	(911, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-15 20:14:59'),
	(912, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-15 20:15:58'),
	(913, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-15 20:16:44'),
	(914, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-15 20:16:54'),
	(915, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-15 20:16:58'),
	(916, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-15 20:18:07'),
	(917, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-15 20:18:11'),
	(918, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-15 20:27:43'),
	(919, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-15 20:28:10'),
	(920, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-15 20:28:24'),
	(921, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-15 21:21:29'),
	(922, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-15 21:22:21'),
	(923, 1, 1, '::1', 'LOGIN', '', '2017-08-16 06:25:23'),
	(924, 1, 1, '::1', 'LOGIN', '', '2017-08-16 10:05:20'),
	(925, 1, 1, '::1', 'LOGIN', '', '2017-08-16 15:19:04'),
	(926, 1, 1, '::1', 'LOGIN', '', '2017-08-16 15:19:27'),
	(927, 1, 1, '::1', 'LOGIN', '', '2017-08-16 15:21:03'),
	(928, 1, 1, '::1', 'LOGIN', '', '2017-08-16 15:25:33'),
	(929, 1, 1, '::1', 'LOGIN', '', '2017-08-16 15:28:38'),
	(930, 1, 1, '::1', 'LOGIN', '', '2017-08-16 15:30:22'),
	(931, 1, 1, '::1', 'LOGIN', '', '2017-08-16 15:31:14'),
	(932, 1, 1, '::1', 'LOGIN', '', '2017-08-16 15:32:15'),
	(933, 1, 1, '::1', 'LOGIN', '', '2017-08-16 15:37:21'),
	(934, 1, 1, '::1', 'LOGIN', '', '2017-08-16 15:38:24'),
	(935, 1, 1, '::1', 'LOGIN', '', '2017-08-16 15:44:35'),
	(936, 3, 1, '::1', 'LOGIN', '', '2017-08-16 15:45:28'),
	(937, 1, 1, '::1', 'LOGIN', '', '2017-08-16 15:47:04'),
	(938, 1, 1, '::1', 'LOGIN', '', '2017-08-16 15:54:44'),
	(939, 1, 1, '::1', 'LOGIN', '', '2017-08-16 15:57:05'),
	(940, 1, 1, '::1', 'LOGIN', '', '2017-08-16 15:57:45'),
	(941, 3, 1, '::1', 'LOGIN', '', '2017-08-16 15:58:39'),
	(942, 3, 1, '::1', 'LOGIN', '', '2017-08-16 16:06:28'),
	(943, 3, 1, '::1', 'LOGIN', '', '2017-08-16 16:25:01'),
	(944, 3, 1, '::1', 'LOGIN', '', '2017-08-16 16:26:10'),
	(945, 3, 1, '::1', 'LOGIN', '', '2017-08-16 16:48:00'),
	(946, 1, 1, '::1', 'LOGIN', '', '2017-08-16 17:07:35'),
	(947, 3, 1, '::1', 'LOGIN', '', '2017-08-16 19:16:05'),
	(948, 3, 1, '::1', 'LOGIN', '', '2017-08-16 19:17:41'),
	(949, 3, 1, '::1', 'LOGIN', '', '2017-08-16 19:19:38'),
	(950, 3, 1, '::1', 'LOGIN', '', '2017-08-16 19:22:03'),
	(951, 3, 1, '::1', 'LOGIN', '', '2017-08-16 19:22:46'),
	(952, 3, 1, '::1', 'LOGIN', '', '2017-08-16 19:24:17'),
	(953, 3, 1, '::1', 'LOGIN', '', '2017-08-16 19:25:24'),
	(954, 3, 1, '::1', 'LOGIN', '', '2017-08-16 19:27:11'),
	(955, 3, 1, '::1', 'LOGIN', '', '2017-08-16 19:28:37'),
	(956, 3, 1, '::1', 'LOGIN', '', '2017-08-16 19:45:34'),
	(957, 3, 1, '::1', 'LOGIN', '', '2017-08-16 19:46:21'),
	(958, 3, 1, '::1', 'LOGIN', '', '2017-08-16 19:49:36'),
	(959, 3, 1, '::1', 'LOGIN', '', '2017-08-16 19:52:10'),
	(960, 3, 1, '::1', 'LOGIN', '', '2017-08-16 19:57:21'),
	(961, 3, 1, '::1', 'LOGIN', '', '2017-08-16 20:00:37'),
	(962, 3, 1, '::1', 'LOGIN', '', '2017-08-16 20:04:53'),
	(963, 3, 1, '::1', 'LOGIN', '', '2017-08-16 20:05:08'),
	(964, 3, 1, '::1', 'LOGIN', '', '2017-08-16 20:05:14'),
	(965, 3, 1, '::1', 'LOGIN', '', '2017-08-16 20:12:02'),
	(966, 3, 1, '::1', 'LOGIN', '', '2017-08-16 20:12:05'),
	(967, 3, 1, '::1', 'LOGIN', '', '2017-08-16 20:12:08'),
	(968, 3, 1, '::1', 'LOGIN', '', '2017-08-16 20:13:55'),
	(969, 3, 1, '::1', 'LOGIN', '', '2017-08-16 20:17:24'),
	(970, 3, 1, '::1', 'LOGIN', '', '2017-08-16 20:32:52'),
	(971, 3, 1, '::1', 'LOGIN', '', '2017-08-16 20:33:54'),
	(972, 3, 1, '::1', 'LOGIN', '', '2017-08-16 20:38:24'),
	(973, 3, 1, '::1', 'LOGIN', '', '2017-08-16 20:40:43'),
	(974, 3, 1, '::1', 'LOGIN', '', '2017-08-16 20:43:02'),
	(975, 3, 1, '::1', 'LOGIN', '', '2017-08-16 20:45:34'),
	(976, 3, 1, '::1', 'LOGIN', '', '2017-08-16 21:12:09'),
	(977, 3, 1, '::1', 'LOGIN', '', '2017-08-16 21:13:48'),
	(978, 3, 1, '::1', 'LOGIN', '', '2017-08-16 21:18:16'),
	(979, 3, 1, '::1', 'LOGIN', '', '2017-08-16 22:14:32'),
	(980, 3, 1, '::1', 'LOGIN', '', '2017-08-16 22:23:52'),
	(981, 3, 1, '::1', 'LOGIN', '', '2017-08-16 22:24:37'),
	(982, 3, 1, '::1', 'LOGIN', '', '2017-08-16 22:24:47'),
	(983, 1, 1, '::1', 'LOGIN', '', '2017-08-16 22:25:40'),
	(984, 3, 1, '::1', 'LOGIN', '', '2017-08-16 22:52:58'),
	(985, 1, 1, '::1', 'LOGIN', '', '2017-08-16 22:56:39'),
	(986, 3, 1, '::1', 'LOGIN', '', '2017-08-16 22:58:36'),
	(987, 3, 1, '::1', 'LOGIN', '', '2017-08-16 22:59:32'),
	(988, 3, 1, '::1', 'LOGIN', '', '2017-08-16 23:07:43'),
	(989, 3, 1, '::1', 'LOGIN', '', '2017-08-16 23:09:44'),
	(990, 3, 1, '::1', 'LOGIN', '', '2017-08-16 23:10:58'),
	(991, 1, 1, '::1', 'LOGIN', '', '2017-08-16 23:11:10'),
	(992, 3, 1, '::1', 'LOGIN', '', '2017-08-16 23:19:54'),
	(993, 3, 1, '::1', 'LOGIN', '', '2017-08-16 23:20:29'),
	(994, 3, 1, '::1', 'LOGIN', '', '2017-08-16 23:23:07'),
	(995, 3, 1, '::1', 'LOGIN', '', '2017-08-16 23:25:52'),
	(996, 3, 1, '::1', 'LOGIN', '', '2017-08-16 23:35:51'),
	(997, 1, 1, '::1', 'LOGIN', '', '2017-08-16 23:47:07'),
	(998, 1, 1, '::1', 'LOGIN', '', '2017-08-16 23:59:49'),
	(999, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-17 00:00:24'),
	(1000, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-17 00:01:02'),
	(1001, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-17 00:01:45'),
	(1002, 1, 1, '::1', 'LOGIN', '', '2017-08-17 00:03:09'),
	(1003, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-17 00:03:18'),
	(1004, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-17 00:04:12'),
	(1005, 1, 1, '::1', 'LOGIN', '', '2017-08-17 00:04:45'),
	(1006, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-17 00:04:55'),
	(1007, 1, 2, '::1', 'POST', 'payOvertimeRequest', '2017-08-17 00:05:26'),
	(1008, 1, 1, '::1', 'LOGIN', '', '2017-08-17 00:07:29'),
	(1009, 1, 1, '::1', 'LOGIN', '', '2017-08-17 00:08:39'),
	(1010, 1, 1, '::1', 'LOGIN', '', '2017-08-17 00:09:35'),
	(1011, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-17 00:10:11'),
	(1012, 3, 1, '::1', 'LOGIN', '', '2017-08-17 00:11:25'),
	(1013, 3, 1, '::1', 'LOGIN', '', '2017-08-17 00:28:56'),
	(1014, 1, 1, '::1', 'LOGIN', '', '2017-08-17 00:58:52'),
	(1015, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-17 00:59:02'),
	(1016, 3, 1, '::1', 'LOGIN', '', '2017-08-17 01:04:29'),
	(1017, 3, 2, '::1', 'POST', 'payOvertimeRequest', '2017-08-17 01:04:43'),
	(1018, 3, 1, '::1', 'LOGIN', '', '2017-08-17 05:06:40'),
	(1019, 3, 1, '::1', 'LOGIN', '', '2017-08-17 05:13:37'),
	(1020, 1, 1, '::1', 'LOGIN', '', '2017-08-17 05:38:57'),
	(1021, 3, 1, '::1', 'LOGIN', '', '2017-08-17 06:15:35'),
	(1022, 3, 1, '::1', 'LOGIN', '', '2017-08-17 06:29:11'),
	(1023, 3, 1, '::1', 'LOGIN', '', '2017-08-17 06:45:40'),
	(1024, 3, 1, '::1', 'LOGIN', '', '2017-08-17 06:48:45'),
	(1025, 3, 1, '::1', 'LOGIN', '', '2017-08-17 06:48:53'),
	(1026, 3, 1, '::1', 'LOGIN', '', '2017-08-17 08:33:03'),
	(1027, 3, 1, '::1', 'LOGIN', '', '2017-08-17 09:33:46'),
	(1028, 1, 1, '::1', 'LOGIN', '', '2017-08-17 11:36:19'),
	(1029, 1, 1, '::1', 'LOGIN', '', '2017-08-17 11:43:48'),
	(1030, 3, 1, '::1', 'LOGIN', '', '2017-08-17 12:58:30'),
	(1031, 3, 1, '::1', 'LOGIN', '', '2017-08-17 13:02:44'),
	(1032, 3, 1, '::1', 'LOGIN', '', '2017-08-17 13:12:04'),
	(1033, 3, 1, '::1', 'LOGIN', '', '2017-08-17 13:14:57'),
	(1034, 1, 1, '::1', 'LOGIN', '', '2017-08-17 13:35:35'),
	(1035, 1, 1, '::1', 'LOGIN', '', '2017-08-17 13:49:48'),
	(1036, 1, 1, '::1', 'LOGIN', '', '2017-08-17 15:15:58'),
	(1037, 1, 1, '::1', 'LOGIN', '', '2017-08-17 15:43:52'),
	(1038, 1, 1, '::1', 'LOGIN', '', '2017-08-17 16:02:30'),
	(1039, 1, 1, '::1', 'LOGIN', '', '2017-08-17 16:08:21'),
	(1040, 1, 1, '::1', 'LOGIN', '', '2017-08-17 16:14:00'),
	(1041, 1, 1, '::1', 'LOGIN', '', '2017-08-17 16:24:11'),
	(1042, 1, 1, '::1', 'LOGIN', '', '2017-08-17 16:30:55'),
	(1043, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-17 19:41:38'),
	(1044, 1, 1, '::1', 'LOGIN', '', '2017-08-17 20:31:19'),
	(1045, 1, 1, '::1', 'LOGIN', '', '2017-08-17 20:38:06'),
	(1046, 3, 1, '::1', 'LOGIN', '', '2017-08-17 21:57:06'),
	(1047, 3, 1, '::1', 'LOGIN', '', '2017-08-17 22:07:41'),
	(1048, 3, 1, '::1', 'LOGIN', '', '2017-08-17 22:15:52'),
	(1049, 3, 1, '::1', 'LOGIN', '', '2017-08-17 22:22:11'),
	(1050, 3, 1, '::1', 'LOGIN', '', '2017-08-17 22:27:40'),
	(1051, 1, 1, '::1', 'LOGIN', '', '2017-08-17 22:29:55'),
	(1052, 3, 1, '::1', 'LOGIN', '', '2017-08-17 23:03:14'),
	(1053, 1, 1, '::1', 'LOGIN', '', '2017-08-18 08:48:59'),
	(1054, 1, 1, '::1', 'LOGIN', '', '2017-08-18 10:14:41'),
	(1055, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-18 11:11:48'),
	(1056, 3, 1, '::1', 'LOGIN', '', '2017-08-18 11:26:59'),
	(1057, 3, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-18 11:31:39'),
	(1058, 1, 1, '::1', 'LOGIN', '', '2017-08-18 13:31:35'),
	(1059, 1, 1, '::1', 'LOGIN', '', '2017-08-18 13:31:43'),
	(1060, 1, 1, '::1', 'LOGIN', '', '2017-08-18 13:57:58'),
	(1061, 1, 1, '::1', 'LOGIN', '', '2017-08-18 14:19:03'),
	(1062, 1, 1, '::1', 'LOGIN', '', '2017-08-18 14:19:37'),
	(1063, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-18 15:19:12'),
	(1064, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-18 15:19:42'),
	(1065, 20, 1, '::1', 'LOGIN', '', '2017-08-18 15:21:18'),
	(1066, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-18 15:21:42'),
	(1067, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-18 15:21:54'),
	(1068, 20, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-18 15:22:34'),
	(1069, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-18 15:23:23'),
	(1070, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-18 15:44:59'),
	(1071, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-18 15:52:32'),
	(1072, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-18 15:52:48'),
	(1073, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-18 15:54:11'),
	(1074, 20, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-18 15:54:22'),
	(1075, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-18 15:54:46'),
	(1076, 20, 2, '::1', 'POST', 'payOvertimeRequest', '2017-08-18 15:58:27'),
	(1077, 19, 1, '::1', 'LOGIN', '', '2017-08-18 16:03:03'),
	(1078, 19, 2, '::1', 'POST', 'payOvertimeRequest', '2017-08-18 16:03:18'),
	(1079, 12, 1, '::1', 'LOGIN', '', '2017-08-18 16:03:34'),
	(1080, 12, 2, '::1', 'POST', 'payOvertimeRequest', '2017-08-18 16:03:52'),
	(1081, 2, 1, '::1', 'LOGIN', '', '2017-08-18 16:04:13'),
	(1082, 2, 2, '::1', 'POST', 'payOvertimeRequest', '2017-08-18 16:04:27'),
	(1083, 3, 1, '::1', 'LOGIN', '', '2017-08-18 16:29:43'),
	(1084, 3, 2, '::1', 'POST', 'payOvertimeRequest', '2017-08-18 16:30:34'),
	(1085, 1, 1, '::1', 'LOGIN', '', '2017-08-18 19:08:47'),
	(1086, 1, 1, '::1', 'LOGIN', '', '2017-08-18 19:10:40'),
	(1087, 1, 1, '::1', 'LOGIN', '', '2017-08-18 19:14:04'),
	(1088, 1, 1, '::1', 'LOGIN', '', '2017-08-18 19:17:21'),
	(1089, 1, 1, '::1', 'LOGIN', '', '2017-08-18 19:18:01'),
	(1090, 3, 1, '::1', 'LOGIN', '', '2017-08-18 19:18:48'),
	(1091, 3, 1, '::1', 'LOGIN', '', '2017-08-18 19:20:16'),
	(1092, 3, 1, '::1', 'LOGIN', '', '2017-08-18 19:30:00'),
	(1093, 3, 1, '::1', 'LOGIN', '', '2017-08-18 19:38:02'),
	(1094, 3, 1, '::1', 'LOGIN', '', '2017-08-18 21:41:52'),
	(1095, 3, 1, '::1', 'LOGIN', '', '2017-08-19 05:59:37'),
	(1096, 3, 1, '::1', 'LOGIN', '', '2017-08-19 06:01:30'),
	(1097, 1, 1, '::1', 'LOGIN', '', '2017-08-19 06:43:35'),
	(1098, 3, 1, '::1', 'LOGIN', '', '2017-08-19 07:01:38'),
	(1099, 3, 1, '::1', 'LOGIN', '', '2017-08-19 08:27:56'),
	(1100, 1, 1, '::1', 'LOGIN', '', '2017-08-19 08:35:28'),
	(1101, 1, 1, '::1', 'LOGIN', '', '2017-08-19 09:38:25'),
	(1102, 1, 1, '::1', 'LOGIN', '', '2017-08-19 09:46:16'),
	(1103, 1, 1, '::1', 'LOGIN', '', '2017-08-19 09:51:14'),
	(1104, 3, 1, '::1', 'LOGIN', '', '2017-08-19 10:12:00'),
	(1105, 3, 1, '::1', 'LOGIN', '', '2017-08-19 12:07:00'),
	(1106, 1, 1, '::1', 'LOGIN', '', '2017-08-19 12:24:18'),
	(1107, 3, 1, '::1', 'LOGIN', '', '2017-08-19 14:36:32'),
	(1108, 1, 1, '::1', 'LOGIN', '', '2017-08-19 14:41:53'),
	(1109, 1, 1, '::1', 'LOGIN', '', '2017-08-19 17:38:56'),
	(1110, 3, 1, '::1', 'LOGIN', '', '2017-08-19 17:39:19'),
	(1111, 1, 1, '::1', 'LOGIN', '', '2017-08-19 17:40:27'),
	(1112, 1, 1, '::1', 'LOGIN', '', '2017-08-19 17:50:31'),
	(1113, 1, 1, '::1', 'LOGIN', '', '2017-08-19 17:50:43'),
	(1114, 1, 1, '::1', 'LOGIN', '', '2017-08-19 17:55:29'),
	(1115, 1, 1, '::1', 'LOGIN', '', '2017-08-19 18:03:22'),
	(1116, 1, 1, '::1', 'LOGIN', '', '2017-08-20 05:10:15'),
	(1117, 1, 1, '::1', 'LOGIN', '', '2017-08-20 09:25:57'),
	(1118, 1, 1, '::1', 'LOGIN', '', '2017-08-20 09:31:03'),
	(1119, 1, 1, '::1', 'LOGIN', '', '2017-08-20 09:51:19'),
	(1120, 1, 1, '::1', 'LOGIN', '', '2017-08-20 09:57:34'),
	(1121, 3, 1, '::1', 'LOGIN', '', '2017-08-20 10:02:06'),
	(1122, 3, 1, '::1', 'LOGIN', '', '2017-08-20 10:02:24'),
	(1123, 1, 1, '::1', 'LOGIN', '', '2017-08-20 10:02:48'),
	(1124, 1, 1, '::1', 'LOGIN', '', '2017-08-20 10:07:49'),
	(1125, 1, 1, '::1', 'LOGIN', '', '2017-08-20 10:10:44'),
	(1126, 1, 1, '::1', 'LOGIN', '', '2017-08-20 10:12:41'),
	(1127, 1, 1, '::1', 'LOGIN', '', '2017-08-20 10:14:05'),
	(1128, 1, 1, '::1', 'LOGIN', '', '2017-08-20 10:24:00'),
	(1129, 1, 1, '::1', 'LOGIN', '', '2017-08-20 10:40:29'),
	(1130, 1, 1, '::1', 'LOGIN', '', '2017-08-20 10:44:29'),
	(1131, 1, 1, '::1', 'LOGIN', '', '2017-08-20 10:47:23'),
	(1132, 1, 1, '::1', 'LOGIN', '', '2017-08-20 10:47:47'),
	(1133, 1, 1, '::1', 'LOGIN', '', '2017-08-20 12:56:38'),
	(1134, 1, 1, '::1', 'LOGIN', '', '2017-08-20 12:58:03'),
	(1135, 1, 1, '::1', 'LOGIN', '', '2017-08-20 13:08:07'),
	(1136, 1, 1, '::1', 'LOGIN', '', '2017-08-20 13:17:25'),
	(1137, 1, 1, '::1', 'LOGIN', '', '2017-08-20 13:18:29'),
	(1138, 1, 1, '::1', 'LOGIN', '', '2017-08-20 13:28:09'),
	(1139, 3, 1, '::1', 'LOGIN', '', '2017-08-20 13:34:25'),
	(1140, 3, 1, '::1', 'LOGIN', '', '2017-08-20 13:50:24'),
	(1141, 1, 1, '::1', 'LOGIN', '', '2017-08-20 13:51:10'),
	(1142, 1, 1, '::1', 'LOGIN', '', '2017-08-20 14:08:04'),
	(1143, 1, 1, '::1', 'LOGIN', '', '2017-08-20 14:14:04'),
	(1144, 1, 1, '::1', 'LOGIN', '', '2017-08-20 14:23:15'),
	(1145, 1, 1, '::1', 'LOGIN', '', '2017-08-20 16:19:24'),
	(1146, 1, 1, '::1', 'LOGIN', '', '2017-08-20 18:24:19'),
	(1147, 1, 1, '::1', 'LOGIN', '', '2017-08-20 18:28:54'),
	(1148, 1, 1, '::1', 'LOGIN', '', '2017-08-20 18:48:55'),
	(1149, 1, 1, '::1', 'LOGIN', '', '2017-08-20 18:49:07'),
	(1150, 1, 1, '::1', 'LOGIN', '', '2017-08-20 19:58:32'),
	(1151, 1, 1, '::1', 'LOGIN', '', '2017-08-21 09:03:15'),
	(1152, 1, 1, '::1', 'LOGIN', '', '2017-08-21 09:27:42'),
	(1153, 1, 1, '::1', 'LOGIN', '', '2017-08-21 13:34:39'),
	(1154, 1, 1, '::1', 'LOGIN', '', '2017-08-21 15:40:17'),
	(1155, 2, 1, '::1', 'LOGIN', '', '2017-08-21 16:32:18'),
	(1156, 2, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-21 16:43:46'),
	(1157, 2, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-21 16:43:48'),
	(1158, 1, 1, '::1', 'LOGIN', '', '2017-08-21 17:11:01'),
	(1159, 1, 1, '::1', 'LOGIN', '', '2017-08-21 21:11:54'),
	(1160, 1, 1, '::1', 'LOGIN', '', '2017-08-22 06:00:35'),
	(1161, 1, 1, '::1', 'LOGIN', '', '2017-08-22 06:06:18'),
	(1162, 1, 1, '::1', 'LOGIN', '', '2017-08-22 06:30:04'),
	(1163, 1, 1, '::1', 'LOGIN', '', '2017-08-22 07:24:42'),
	(1164, 1, 1, '::1', 'LOGIN', '', '2017-08-22 09:43:17'),
	(1165, 1, 1, '::1', 'LOGIN', '', '2017-08-22 09:44:02'),
	(1166, 1, 1, '::1', 'LOGIN', '', '2017-08-22 09:46:09'),
	(1167, 20, 1, '::1', 'LOGIN', '', '2017-08-22 10:47:03'),
	(1168, 20, 1, '::1', 'LOGIN', '', '2017-08-22 10:52:39'),
	(1169, 20, 1, '::1', 'LOGIN', '', '2017-08-22 11:02:15'),
	(1170, 20, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 11:02:26'),
	(1171, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-22 11:02:40'),
	(1172, 20, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 11:02:44'),
	(1173, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-22 11:02:56'),
	(1174, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-22 11:03:01'),
	(1175, 20, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 11:03:03'),
	(1176, 26, 1, '::1', 'LOGIN', '', '2017-08-22 11:03:19'),
	(1177, 26, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-22 11:03:31'),
	(1178, 26, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-22 11:03:33'),
	(1179, 26, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-22 11:03:36'),
	(1180, 26, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-22 11:03:38'),
	(1181, 26, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-22 11:03:48'),
	(1182, 26, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-22 11:03:51'),
	(1183, 26, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-22 11:03:55'),
	(1184, 26, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-22 11:04:00'),
	(1185, 26, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 11:04:11'),
	(1186, 26, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 11:04:19'),
	(1187, 2, 1, '::1', 'LOGIN', '', '2017-08-22 11:04:39'),
	(1188, 2, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-22 11:04:49'),
	(1189, 2, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-22 11:04:53'),
	(1190, 2, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-22 11:04:55'),
	(1191, 2, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-22 11:04:56'),
	(1192, 2, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 11:04:58'),
	(1193, 2, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 11:05:09'),
	(1194, 3, 1, '::1', 'LOGIN', '', '2017-08-22 11:05:27'),
	(1195, 3, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 11:05:38'),
	(1196, 3, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-22 11:05:51'),
	(1197, 3, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 11:05:56'),
	(1198, 1, 1, '::1', 'LOGIN', '', '2017-08-22 11:06:12'),
	(1199, 1, 1, '::1', 'LOGIN', '', '2017-08-22 11:41:47'),
	(1200, 1, 1, '::1', 'LOGIN', '', '2017-08-22 15:13:34'),
	(1201, 1, 1, '::1', 'LOGIN', '', '2017-08-22 15:19:54'),
	(1202, 1, 1, '::1', 'LOGIN', '', '2017-08-22 15:25:46'),
	(1203, 1, 1, '::1', 'LOGIN', '', '2017-08-22 16:15:05'),
	(1204, 1, 1, '::1', 'LOGIN', '', '2017-08-22 16:20:17'),
	(1205, 1, 1, '::1', 'LOGIN', '', '2017-08-22 20:20:36'),
	(1206, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 20:20:54'),
	(1207, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 20:21:17'),
	(1208, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 20:22:43'),
	(1209, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 20:23:42'),
	(1210, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 20:25:11'),
	(1211, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 20:25:18'),
	(1212, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 20:25:25'),
	(1213, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 20:25:47'),
	(1214, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 20:26:39'),
	(1215, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 20:26:45'),
	(1216, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 20:26:50'),
	(1217, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 20:30:44'),
	(1218, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 20:34:22'),
	(1219, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 20:34:42'),
	(1220, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 20:48:04'),
	(1221, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 21:01:44'),
	(1222, 20, 1, '::1', 'LOGIN', '', '2017-08-22 21:21:57'),
	(1223, 20, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 21:27:47'),
	(1224, 20, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 21:28:03'),
	(1225, 20, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 21:28:09'),
	(1226, 18, 1, '::1', 'LOGIN', '', '2017-08-22 21:29:37'),
	(1227, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 21:30:02'),
	(1228, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 21:30:05'),
	(1229, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 21:30:29'),
	(1230, 18, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-22 21:31:46'),
	(1231, 18, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-22 21:32:01'),
	(1232, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 21:32:09'),
	(1233, 20, 1, '::1', 'LOGIN', '', '2017-08-22 21:33:07'),
	(1234, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-22 21:33:32'),
	(1235, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-22 21:33:39'),
	(1236, 20, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 21:33:40'),
	(1237, 20, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 21:34:13'),
	(1238, 13, 1, '::1', 'LOGIN', '', '2017-08-22 21:34:37'),
	(1239, 13, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 21:35:38'),
	(1240, 13, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 21:36:07'),
	(1241, 20, 1, '::1', 'LOGIN', '', '2017-08-22 21:37:21'),
	(1242, 3, 1, '::1', 'LOGIN', '', '2017-08-22 21:41:46'),
	(1243, 13, 1, '::1', 'LOGIN', '', '2017-08-22 21:42:12'),
	(1244, 13, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 21:43:33'),
	(1245, 18, 1, '::1', 'LOGIN', '', '2017-08-22 21:43:52'),
	(1246, 18, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-22 21:44:13'),
	(1247, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 21:44:14'),
	(1248, 18, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-22 21:44:26'),
	(1249, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 21:44:27'),
	(1250, 18, 1, '::1', 'LOGIN', '', '2017-08-22 21:54:24'),
	(1251, 13, 1, '::1', 'LOGIN', '', '2017-08-22 22:14:26'),
	(1252, 26, 1, '::1', 'LOGIN', '', '2017-08-22 22:16:10'),
	(1253, 26, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-22 22:16:37'),
	(1254, 26, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 22:16:39'),
	(1255, 1, 1, '::1', 'LOGIN', '', '2017-08-22 22:17:13'),
	(1256, 19, 1, '::1', 'LOGIN', '', '2017-08-22 22:19:31'),
	(1257, 19, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 22:19:47'),
	(1258, 19, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 22:20:01'),
	(1259, 1, 1, '::1', 'LOGIN', '', '2017-08-22 22:20:14'),
	(1260, 19, 1, '::1', 'LOGIN', '', '2017-08-22 22:21:42'),
	(1261, 1, 1, '::1', 'LOGIN', '', '2017-08-22 22:22:03'),
	(1262, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 23:01:22'),
	(1263, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 23:01:31'),
	(1264, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 23:01:39'),
	(1265, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-22 23:01:51'),
	(1266, 26, 1, '::1', 'LOGIN', '', '2017-08-22 23:19:42'),
	(1267, 1, 1, '::1', 'LOGIN', '', '2017-08-22 23:20:31'),
	(1268, 1, 1, '::1', 'LOGIN', '', '2017-08-22 23:53:40'),
	(1269, 3, 1, '::1', 'LOGIN', '', '2017-08-23 00:03:54'),
	(1270, 3, 2, '::1', 'POST', 'payOvertimeRequest', '2017-08-23 00:04:18'),
	(1271, 2, 1, '::1', 'LOGIN', '', '2017-08-23 00:04:39'),
	(1272, 26, 1, '::1', 'LOGIN', '', '2017-08-23 00:06:02'),
	(1273, 26, 2, '::1', 'POST', 'payOvertimeRequest', '2017-08-23 00:06:47'),
	(1274, 20, 1, '::1', 'LOGIN', '', '2017-08-23 00:07:30'),
	(1275, 20, 2, '::1', 'POST', 'payOvertimeRequest', '2017-08-23 00:07:58'),
	(1276, 12, 1, '::1', 'LOGIN', '', '2017-08-23 00:08:29'),
	(1277, 12, 2, '::1', 'POST', 'payOvertimeRequest', '2017-08-23 00:08:45'),
	(1278, 1, 1, '::1', 'LOGIN', '', '2017-08-23 00:09:29'),
	(1279, 1, 1, '::1', 'LOGIN', '', '2017-08-23 06:36:07'),
	(1280, 3, 1, '::1', 'LOGIN', '', '2017-08-23 08:36:16'),
	(1281, 1, 1, '::1', 'LOGIN', '', '2017-08-23 08:37:22'),
	(1282, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-23 08:37:45'),
	(1283, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-23 08:37:55'),
	(1284, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-23 12:33:47'),
	(1285, 1, 1, '::1', 'LOGIN', '', '2017-08-23 12:45:17'),
	(1286, 1, 1, '::1', 'LOGIN', '', '2017-08-23 12:50:41'),
	(1287, 1, 1, '::1', 'LOGIN', '', '2017-08-23 12:57:25'),
	(1288, 1, 1, '::1', 'LOGIN', '', '2017-08-23 13:01:00'),
	(1289, 1, 1, '::1', 'LOGIN', '', '2017-08-23 13:20:45'),
	(1290, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-23 15:25:43'),
	(1291, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-23 15:26:04'),
	(1292, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-23 15:29:58'),
	(1293, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-23 15:30:43'),
	(1294, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-23 15:32:14'),
	(1295, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-23 15:33:08'),
	(1296, 1, 1, '::1', 'LOGIN', '', '2017-08-23 15:38:16'),
	(1297, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-23 15:38:43'),
	(1298, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-23 15:38:45'),
	(1299, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-23 15:39:42'),
	(1300, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-23 15:40:40'),
	(1301, 1, 1, '::1', 'LOGIN', '', '2017-08-23 16:45:42'),
	(1302, 1, 1, '::1', 'LOGIN', '', '2017-08-23 16:54:30'),
	(1303, 1, 1, '::1', 'LOGIN', '', '2017-08-23 20:55:37'),
	(1304, 1, 1, '::1', 'LOGIN', '', '2017-08-24 05:49:49'),
	(1305, 1, 1, '::1', 'LOGIN', '', '2017-08-24 08:18:37'),
	(1306, 20, 1, '::1', 'LOGIN', '', '2017-08-24 09:33:55'),
	(1307, 13, 1, '::1', 'LOGIN', '', '2017-08-24 09:34:42'),
	(1308, 20, 1, '::1', 'LOGIN', '', '2017-08-24 09:35:01'),
	(1309, 26, 1, '::1', 'LOGIN', '', '2017-08-24 09:36:33'),
	(1310, 20, 1, '::1', 'LOGIN', '', '2017-08-24 09:37:02'),
	(1311, 20, 2, '::1', 'POST', 'payOvertimeRequest', '2017-08-24 09:38:21'),
	(1312, 18, 1, '::1', 'LOGIN', '', '2017-08-24 09:40:55'),
	(1313, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-24 09:41:55'),
	(1314, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-24 09:42:25'),
	(1315, 20, 1, '::1', 'LOGIN', '', '2017-08-24 09:43:03'),
	(1316, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-24 09:44:19'),
	(1317, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-24 09:45:30'),
	(1318, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-24 09:46:23'),
	(1319, 20, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-24 09:46:40'),
	(1320, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-24 09:47:31'),
	(1321, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-24 09:47:43'),
	(1322, 20, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-24 09:47:47'),
	(1323, 13, 1, '::1', 'LOGIN', '', '2017-08-24 09:48:59'),
	(1324, 13, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-24 09:51:17'),
	(1325, 20, 1, '::1', 'LOGIN', '', '2017-08-24 09:52:55'),
	(1326, 13, 1, '::1', 'LOGIN', '', '2017-08-24 09:53:47'),
	(1327, 13, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-24 09:59:00'),
	(1328, 18, 1, '::1', 'LOGIN', '', '2017-08-24 10:06:02'),
	(1329, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-24 10:06:34'),
	(1330, 20, 1, '::1', 'LOGIN', '', '2017-08-24 10:06:55'),
	(1331, 13, 1, '::1', 'LOGIN', '', '2017-08-24 10:07:31'),
	(1332, 13, 1, '::1', 'LOGIN', '', '2017-08-24 10:14:52'),
	(1333, 18, 1, '::1', 'LOGIN', '', '2017-08-24 10:15:46'),
	(1334, 1, 1, '::1', 'LOGIN', '', '2017-08-24 10:22:24'),
	(1335, 1, 1, '::1', 'LOGIN', '', '2017-08-24 10:28:50'),
	(1336, 1, 1, '::1', 'LOGIN', '', '2017-08-24 10:51:20'),
	(1337, 1, 1, '::1', 'LOGIN', '', '2017-08-24 11:15:42'),
	(1338, 13, 1, '::1', 'LOGIN', '', '2017-08-24 12:48:53'),
	(1339, 1, 1, '::1', 'LOGIN', '', '2017-08-24 14:16:54'),
	(1340, 1, 2, '::1', 'POST', 'payOvertimeRequest', '2017-08-24 14:38:09'),
	(1341, 20, 1, '::1', 'LOGIN', '', '2017-08-24 14:40:11'),
	(1342, 1, 1, '::1', 'LOGIN', '', '2017-08-24 15:31:18'),
	(1343, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-24 15:32:43'),
	(1344, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-24 15:33:18'),
	(1345, 1, 1, '::1', 'LOGIN', '', '2017-08-24 15:42:23'),
	(1346, 1, 1, '::1', 'LOGIN', '', '2017-08-24 19:43:07'),
	(1347, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-24 19:47:20'),
	(1348, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-24 19:59:52'),
	(1349, 1, 1, '::1', 'LOGIN', '', '2017-08-24 20:26:33'),
	(1350, 1, 1, '::1', 'LOGIN', '', '2017-08-24 20:27:37'),
	(1351, 1, 1, '::1', 'LOGIN', '', '2017-08-24 20:28:01'),
	(1352, 1, 1, '::1', 'LOGIN', '', '2017-08-24 20:28:15'),
	(1353, 1, 1, '::1', 'LOGIN', '', '2017-08-24 20:28:56'),
	(1354, 3, 1, '::1', 'LOGIN', '', '2017-08-24 20:29:13'),
	(1355, 3, 1, '::1', 'LOGIN', '', '2017-08-24 20:30:27'),
	(1356, 1, 1, '::1', 'LOGIN', '', '2017-08-24 20:30:48'),
	(1357, 3, 1, '::1', 'LOGIN', '', '2017-08-24 20:40:29'),
	(1358, 1, 1, '::1', 'LOGIN', '', '2017-08-24 20:40:45'),
	(1359, 1, 1, '::1', 'LOGIN', '', '2017-08-24 20:46:45'),
	(1360, 1, 1, '::1', 'LOGIN', '', '2017-08-25 04:16:02'),
	(1361, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-25 04:49:50'),
	(1362, 2, 1, '::1', 'LOGIN', '', '2017-08-25 05:01:04'),
	(1363, 1, 1, '::1', 'LOGIN', '', '2017-08-25 05:12:49'),
	(1364, 1, 1, '::1', 'LOGIN', '', '2017-08-25 05:21:31'),
	(1365, 1, 1, '::1', 'LOGIN', '', '2017-08-25 05:31:05'),
	(1366, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-25 05:42:26'),
	(1367, 1, 1, '::1', 'LOGIN', '', '2017-08-25 09:33:27'),
	(1368, 1, 1, '::1', 'LOGIN', '', '2017-08-25 11:52:13'),
	(1369, 1, 1, '::1', 'LOGIN', '', '2017-08-25 13:46:10'),
	(1370, 1, 1, '::1', 'LOGIN', '', '2017-08-25 13:55:06'),
	(1371, 1, 1, '::1', 'LOGIN', '', '2017-08-25 14:24:52'),
	(1372, 18, 1, '::1', 'LOGIN', '', '2017-08-25 16:53:49'),
	(1373, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-25 16:55:13'),
	(1374, 18, 1, '::1', 'LOGIN', '', '2017-08-25 17:26:07'),
	(1375, 1, 1, '::1', 'LOGIN', '', '2017-08-25 17:29:34'),
	(1376, 1, 2, '::1', 'POST', 'payOvertimeRequest', '2017-08-25 17:40:40'),
	(1377, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-25 17:43:12'),
	(1378, 1, 1, '::1', 'LOGIN', '', '2017-08-26 04:07:19'),
	(1379, 1, 2, '::1', 'POST', 'payOvertimeRequest', '2017-08-26 05:41:55'),
	(1380, 1, 1, '::1', 'LOGIN', '', '2017-08-26 08:19:16'),
	(1381, 1, 1, '::1', 'LOGIN', '', '2017-08-26 08:19:46'),
	(1382, 1, 1, '::1', 'LOGIN', '', '2017-08-26 08:51:48'),
	(1383, 20, 1, '::1', 'LOGIN', '', '2017-08-26 08:52:14'),
	(1384, 1, 1, '::1', 'LOGIN', '', '2017-08-26 09:27:44'),
	(1385, 1, 1, '::1', 'LOGIN', '', '2017-08-26 09:48:28'),
	(1386, 20, 1, '::1', 'LOGIN', '', '2017-08-26 10:02:33'),
	(1387, 26, 1, '::1', 'LOGIN', '', '2017-08-26 11:04:14'),
	(1388, 26, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-26 11:05:01'),
	(1389, 1, 1, '::1', 'LOGIN', '', '2017-08-26 17:02:25'),
	(1390, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-26 17:05:19'),
	(1391, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-26 17:05:49'),
	(1392, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-26 17:05:59'),
	(1393, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-26 17:06:45'),
	(1394, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-26 17:07:13'),
	(1395, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-26 17:07:23'),
	(1396, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-26 17:07:28'),
	(1397, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-26 17:09:10'),
	(1398, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-26 17:09:43'),
	(1399, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-26 17:09:47'),
	(1400, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-26 17:09:49'),
	(1401, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-26 17:09:51'),
	(1402, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-26 17:09:54'),
	(1403, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-26 17:12:39'),
	(1404, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-26 17:12:43'),
	(1405, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-26 17:12:46'),
	(1406, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-26 17:12:51'),
	(1407, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-26 17:18:08'),
	(1408, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-26 17:18:13'),
	(1409, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-26 17:18:16'),
	(1410, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-26 17:18:17'),
	(1411, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-26 17:18:19'),
	(1412, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-26 17:18:21'),
	(1413, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-26 17:18:23'),
	(1414, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-26 17:18:25'),
	(1415, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-26 17:18:33'),
	(1416, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-26 17:18:35'),
	(1417, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-26 17:18:38'),
	(1418, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-26 17:19:02'),
	(1419, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-26 17:21:23'),
	(1420, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-26 17:21:25'),
	(1421, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-26 17:21:27'),
	(1422, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-26 17:21:32'),
	(1423, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-26 17:22:55'),
	(1424, 1, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-26 17:22:57'),
	(1425, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-26 17:22:59'),
	(1426, 20, 1, '::1', 'LOGIN', '', '2017-08-26 18:26:49'),
	(1427, 20, 1, '::1', 'LOGIN', '', '2017-08-26 18:38:29'),
	(1428, 20, 2, '::1', 'POST', 'payOvertimeRequest', '2017-08-26 18:49:18'),
	(1429, 12, 1, '::1', 'LOGIN', '', '2017-08-26 19:07:49'),
	(1430, 18, 1, '::1', 'LOGIN', '', '2017-08-26 19:11:34'),
	(1431, 1, 1, '::1', 'LOGIN', '', '2017-08-26 19:14:01'),
	(1432, 1, 1, '::1', 'LOGIN', '', '2017-08-26 19:26:05'),
	(1433, 20, 1, '::1', 'LOGIN', '', '2017-08-26 19:48:50'),
	(1434, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-26 20:16:38'),
	(1435, 28, 1, '::1', 'LOGIN', '', '2017-08-26 20:34:39'),
	(1436, 28, 2, '::1', 'POST', 'payOvertimeRequest', '2017-08-26 20:35:18'),
	(1437, 18, 1, '::1', 'LOGIN', '', '2017-08-26 20:36:34'),
	(1438, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-26 20:38:15'),
	(1439, 18, 1, '::1', 'LOGIN', '', '2017-08-26 20:44:24'),
	(1440, 18, 1, '::1', 'LOGIN', '', '2017-08-26 21:11:13'),
	(1441, 18, 1, '::1', 'LOGIN', '', '2017-08-26 21:19:11'),
	(1442, 1, 1, '::1', 'LOGIN', '', '2017-08-26 21:19:20'),
	(1443, 1, 1, '::1', 'LOGIN', '', '2017-08-26 21:30:44'),
	(1444, 1, 1, '::1', 'LOGIN', '', '2017-08-27 08:49:41'),
	(1445, 28, 1, '::1', 'LOGIN', '', '2017-08-27 11:08:03'),
	(1446, 28, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-27 11:10:58'),
	(1447, 28, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-27 11:12:06'),
	(1448, 28, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-27 11:12:53'),
	(1449, 28, 2, '::1', 'POST', 'payOvertimeRequest', '2017-08-27 11:13:22'),
	(1450, 28, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-27 11:16:59'),
	(1451, 27, 1, '::1', 'LOGIN', '', '2017-08-27 11:35:47'),
	(1452, 28, 1, '::1', 'LOGIN', '', '2017-08-27 12:07:20'),
	(1453, 28, 1, '::1', 'LOGIN', '', '2017-08-27 13:30:26'),
	(1454, 1, 1, '::1', 'LOGIN', '', '2017-08-27 13:34:44'),
	(1455, 1, 2, '::1', 'POST', 'payOvertimeRequest', '2017-08-27 14:03:37'),
	(1456, 28, 1, '::1', 'LOGIN', '', '2017-08-27 14:08:13'),
	(1457, 1, 1, '::1', 'LOGIN', '', '2017-08-27 14:10:19'),
	(1458, 28, 1, '::1', 'LOGIN', '', '2017-08-27 14:13:54'),
	(1459, 1, 1, '::1', 'LOGIN', '', '2017-08-27 14:27:07'),
	(1460, 1, 1, '::1', 'LOGIN', '', '2017-08-27 14:28:23'),
	(1461, 1, 1, '::1', 'LOGIN', '', '2017-08-27 14:30:13'),
	(1462, 1, 1, '::1', 'LOGIN', '', '2017-08-27 14:35:36'),
	(1463, 1, 1, '::1', 'LOGIN', '', '2017-08-27 14:36:08'),
	(1464, 1, 1, '::1', 'LOGIN', '', '2017-08-27 14:36:59'),
	(1465, 1, 1, '::1', 'LOGIN', '', '2017-08-27 14:38:02'),
	(1466, 1, 1, '::1', 'LOGIN', '', '2017-08-27 14:38:34'),
	(1467, 1, 1, '::1', 'LOGIN', '', '2017-08-27 14:38:57'),
	(1468, 1, 1, '::1', 'LOGIN', '', '2017-08-27 14:39:29'),
	(1469, 1, 1, '::1', 'LOGIN', '', '2017-08-27 14:42:40'),
	(1470, 1, 1, '::1', 'LOGIN', '', '2017-08-27 14:43:55'),
	(1471, 28, 1, '::1', 'LOGIN', '', '2017-08-27 14:44:04'),
	(1472, 1, 1, '::1', 'LOGIN', '', '2017-08-27 14:45:47'),
	(1473, 1, 1, '::1', 'LOGIN', '', '2017-08-27 14:48:03'),
	(1474, 1, 1, '::1', 'LOGIN', '', '2017-08-27 14:48:44'),
	(1475, 1, 1, '::1', 'LOGIN', '', '2017-08-27 14:50:11'),
	(1476, 1, 1, '::1', 'LOGIN', '', '2017-08-27 15:19:14'),
	(1477, 28, 1, '::1', 'LOGIN', '', '2017-08-27 15:20:02'),
	(1478, 1, 1, '::1', 'LOGIN', '', '2017-08-27 15:21:15'),
	(1479, 28, 1, '::1', 'LOGIN', '', '2017-08-27 15:21:32'),
	(1480, 1, 1, '::1', 'LOGIN', '', '2017-08-27 15:22:02'),
	(1481, 19, 1, '::1', 'LOGIN', '', '2017-08-27 15:23:48'),
	(1482, 28, 1, '::1', 'LOGIN', '', '2017-08-27 15:24:25'),
	(1483, 1, 1, '::1', 'LOGIN', '', '2017-08-27 15:25:09'),
	(1484, 19, 1, '::1', 'LOGIN', '', '2017-08-27 15:25:26'),
	(1485, 19, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-27 15:27:39'),
	(1486, 19, 2, '::1', 'POST', 'payOvertimeRequest', '2017-08-27 16:33:09'),
	(1487, 26, 1, '::1', 'LOGIN', '', '2017-08-27 17:19:04'),
	(1488, 26, 2, '::1', 'POST', 'payOvertimeRequest', '2017-08-27 17:19:29'),
	(1489, 1, 1, '::1', 'LOGIN', '', '2017-08-27 17:22:14'),
	(1490, 20, 1, '::1', 'LOGIN', '', '2017-08-27 17:22:56'),
	(1491, 20, 2, '::1', 'POST', 'payOvertimeRequest', '2017-08-27 17:23:06'),
	(1492, 1, 1, '::1', 'LOGIN', '', '2017-08-27 17:23:27'),
	(1493, 2, 1, '::1', 'LOGIN', '', '2017-08-27 17:24:04'),
	(1494, 2, 2, '::1', 'POST', 'payOvertimeRequest', '2017-08-27 17:24:58'),
	(1495, 12, 1, '::1', 'LOGIN', '', '2017-08-27 17:33:45'),
	(1496, 12, 2, '::1', 'POST', 'payOvertimeRequest', '2017-08-27 17:40:40'),
	(1497, 18, 1, '::1', 'LOGIN', '', '2017-08-27 17:44:33'),
	(1498, 18, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-27 17:45:26'),
	(1499, 12, 1, '::1', 'LOGIN', '', '2017-08-27 17:45:53'),
	(1500, 12, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-27 17:46:30'),
	(1501, 12, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-27 17:46:57'),
	(1502, 12, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-27 17:47:13'),
	(1503, 12, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-27 17:51:15'),
	(1504, 12, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-27 17:51:25'),
	(1505, 1, 1, '::1', 'LOGIN', '', '2017-08-27 17:52:25'),
	(1506, 1, 1, '::1', 'LOGIN', '', '2017-08-27 17:52:50'),
	(1507, 1, 1, '::1', 'LOGIN', '', '2017-08-27 18:05:59'),
	(1508, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-27 18:06:52'),
	(1509, 19, 1, '::1', 'LOGIN', '', '2017-08-27 18:07:08'),
	(1510, 19, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-27 18:09:18'),
	(1511, 19, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-27 18:09:42'),
	(1512, 1, 1, '::1', 'LOGIN', '', '2017-08-27 18:11:01'),
	(1513, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-27 18:11:49'),
	(1514, 28, 1, '::1', 'LOGIN', '', '2017-08-27 18:12:06'),
	(1515, 28, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-27 18:12:35'),
	(1516, 28, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-27 18:12:42'),
	(1517, 1, 1, '::1', 'LOGIN', '', '2017-08-27 18:13:01'),
	(1518, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-27 18:13:31'),
	(1519, 1, 1, '::1', 'LOGIN', '', '2017-08-27 18:13:38'),
	(1520, 20, 1, '::1', 'LOGIN', '', '2017-08-27 18:13:58'),
	(1521, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-27 18:14:17'),
	(1522, 20, 2, '::1', 'POST', 'payOvertimeDetail', '2017-08-27 18:14:36'),
	(1523, 20, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-27 18:14:41'),
	(1524, 20, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-27 18:17:12'),
	(1525, 1, 1, '::1', 'LOGIN', '', '2017-08-27 18:21:13'),
	(1526, 1, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-27 18:24:05'),
	(1527, 1, 1, '::1', 'LOGIN', '', '2017-08-27 18:28:53'),
	(1528, 1, 1, '::1', 'LOGIN', '', '2017-08-28 04:34:21'),
	(1529, 1, 1, '::1', 'LOGIN', '', '2017-08-28 06:06:03'),
	(1530, 1, 1, '::1', 'LOGIN', '', '2017-08-28 06:08:10'),
	(1531, 1, 1, '::1', 'LOGIN', '', '2017-08-28 06:09:14'),
	(1532, 1, 1, '::1', 'LOGIN', '', '2017-08-28 06:09:27'),
	(1533, 1, 1, '::1', 'LOGIN', '', '2017-08-28 06:09:35'),
	(1534, 1, 1, '::1', 'LOGIN', '', '2017-08-28 06:17:27'),
	(1535, 1, 1, '::1', 'LOGIN', '', '2017-08-28 06:18:26'),
	(1536, 1, 1, '::1', 'LOGIN', '', '2017-08-28 06:18:39'),
	(1537, 1, 1, '::1', 'LOGIN', '', '2017-08-28 06:28:45'),
	(1538, 3, 1, '::1', 'LOGIN', '', '2017-08-28 06:30:32'),
	(1539, 1, 1, '::1', 'LOGIN', '', '2017-08-28 06:36:05'),
	(1540, 1, 1, '::1', 'LOGIN', '', '2017-08-28 08:32:35'),
	(1541, 1, 1, '::1', 'LOGIN', '', '2017-08-28 08:59:45'),
	(1542, 1, 1, '::1', 'LOGIN', '', '2017-08-28 09:01:37'),
	(1543, 1, 1, '::1', 'LOGIN', '', '2017-08-28 09:02:00'),
	(1544, 19, 1, '::1', 'LOGIN', '', '2017-08-28 09:02:14'),
	(1545, 19, 1, '::1', 'LOGIN', '', '2017-08-28 09:13:56'),
	(1546, 18, 1, '::1', 'LOGIN', '', '2017-08-28 09:15:08'),
	(1547, 18, 1, '::1', 'LOGIN', '', '2017-08-28 09:19:58'),
	(1548, 3, 1, '::1', 'LOGIN', '', '2017-08-28 09:23:38'),
	(1549, 3, 2, '::1', 'POST', 'payOvertimeRequest', '2017-08-28 09:40:40'),
	(1550, 12, 1, '::1', 'LOGIN', '', '2017-08-28 09:45:25'),
	(1551, 12, 2, '::1', 'POST', 'payOvertimeRequest', '2017-08-28 09:45:44'),
	(1552, 20, 1, '::1', 'LOGIN', '', '2017-08-28 09:48:30'),
	(1553, 20, 2, '::1', 'POST', 'payOvertimeRequest', '2017-08-28 09:49:24'),
	(1554, 1, 1, '::1', 'LOGIN', '', '2017-08-28 09:54:22'),
	(1555, 27, 1, '::1', 'LOGIN', '', '2017-08-28 09:54:52'),
	(1556, 27, 2, '::1', 'POST', 'payOvertimeRequest', '2017-08-28 09:58:21'),
	(1557, 27, 2, '::1', 'PUT', 'pay_overtime_request', '2017-08-28 10:00:04'),
	(1558, 27, 1, '::1', 'LOGIN', '', '2017-08-28 10:15:46'),
	(1559, 27, 1, '::1', 'LOGIN', '', '2017-08-28 10:22:40'),
	(1560, 27, 1, '::1', 'LOGIN', '', '2017-08-28 10:50:35'),
	(1561, 27, 1, '::1', 'LOGIN', '', '2017-08-28 11:06:30'),
	(1562, 27, 1, '::1', 'LOGIN', '', '2017-08-28 11:19:31'),
	(1563, 13, 1, '::1', 'LOGIN', '', '2017-08-28 11:23:40'),
	(1564, 3, 1, '::1', 'LOGIN', '', '2017-08-28 11:34:13'),
	(1565, 1, 1, '::1', 'LOGIN', '', '2017-08-28 11:51:23'),
	(1566, 1, 1, '::1', 'LOGIN', '', '2017-08-28 13:30:38'),
	(1567, 1, 1, '::1', 'LOGIN', '', '2017-08-28 13:35:09'),
	(1568, 1, 1, '::1', 'LOGIN', '', '2017-08-28 13:40:19');
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;

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
	(2, 'Expiration Time', '14400', 'tiempo en segundos ejem: 1800=30min,900=15min,120=2min,60=1min\n'),
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

-- Dumping data for table hhrr.sys_workflow: ~0 rows (approximately)
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

-- Dumping data for table hhrr.sys_workflow_detail: ~4 rows (approximately)
/*!40000 ALTER TABLE `sys_workflow_detail` DISABLE KEYS */;
INSERT INTO `sys_workflow_detail` (`id`, `workflow`, `name`, `sequence`, `input`, `actors`, `description`, `output`, `isMandatory`) VALUES
	(1, 1, 'Ingresar Solicitud', 1, 'Haber recibido una orden', 'Empleado', '', '', 1),
	(2, 1, 'Aprobar Solicitud', 2, 'Solicitud', 'Jefe del Empleado', '', '', 0),
	(3, 1, 'Ingresar Detalle de Actividades', 3, 'Solicitud Aprobada', 'Empleado', '', '', 1),
	(4, 1, 'Calcular Planilla', 4, 'Detalles de Actividades', 'Recursos Humanos', '', '', 1),
	(5, 1, 'Autorizar Pago', 5, 'Planilla Revisada', 'Gerente', '', '', 1);
/*!40000 ALTER TABLE `sys_workflow_detail` ENABLE KEYS */;

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
