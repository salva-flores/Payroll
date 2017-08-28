/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

USE `hhrr`;

-- Dumping structure for table hhrr.sec_logins
DROP TABLE IF EXISTS `sec_logins`;
CREATE TABLE IF NOT EXISTS `sec_logins` (
  `id` smallint(5) unsigned NOT NULL COMMENT 'Identificador del usuario.',
  `userName` smallint(5) unsigned NOT NULL,
  `userPass` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='better not say what it is.';

-- Dumping data for table hhrr.sec_logins: ~0 rows (approximately)
/*!40000 ALTER TABLE `sec_logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `sec_logins` ENABLE KEYS */;

-- Dumping structure for table hhrr.sec_profiles
DROP TABLE IF EXISTS `sec_profiles`;
CREATE TABLE IF NOT EXISTS `sec_profiles` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(15) DEFAULT NULL,
  `description` varchar(50) NOT NULL,
  `state` bit NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table hhrr.sec_profiles: ~4 rows (approximately)
/*!40000 ALTER TABLE `sec_profiles` DISABLE KEYS */;
INSERT INTO `sec_profiles` (`id`, `name`, `description`, `state`) VALUES
	(1, 'Administrador', 'admin del sistema', 1),
	(2, 'Documentador', 'perfil basico xyz 1', 1),
	(3, 'Operador', 'test 123', 1);
/*!40000 ALTER TABLE `sec_profiles` ENABLE KEYS */;

-- Dumping structure for table hhrr.sec_profiles_resource
DROP TABLE IF EXISTS `sec_profiles_resource`;
CREATE TABLE IF NOT EXISTS `sec_profiles_resource` (
  `idperfil` smallint(5) unsigned NOT NULL,
  `idrecurso` smallint(5) unsigned NOT NULL,
  KEY `idperfile` (`idperfil`),
  KEY `idrecurso` (`idrecurso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table hhrr.sec_profiles_resource: ~40 rows (approximately)
/*!40000 ALTER TABLE `sec_profiles_resource` DISABLE KEYS */;
-- INSERT INTO `sec_profiles_resource` (`idperfil`, `idrecurso`) VALUES
-- 	(1, 9),
-- 	(1, 10),
-- 	(1, 11),
-- 	(1, 12),
-- 	(1, 13),
-- 	(1, 14),
-- 	(1, 15),
-- 	(1, 19),
-- 	(1, 20),
-- 	(1, 21),
-- 	(1, 28),
-- 	(1, 29),
-- 	(1, 30),
-- 	(1, 31),
-- 	(1, 33),
-- 	(1, 34),
-- 	(1, 35),
-- 	(2, 14),
-- 	(2, 19),
-- 	(2, 20),
-- 	(2, 21),
-- 	(3, 21),
-- 	(3, 29),
-- 	(7, 9),
-- 	(7, 10),
-- 	(7, 11),
-- 	(7, 12),
-- 	(7, 13),
-- 	(7, 14),
-- 	(7, 15),
-- 	(7, 19),
-- 	(7, 20),
-- 	(7, 21),
-- 	(7, 28),
-- 	(7, 29),
-- 	(7, 30),
-- 	(7, 31),
-- 	(7, 33),
-- 	(7, 34),
-- 	(7, 35);
/*!40000 ALTER TABLE `sec_profiles_resource` ENABLE KEYS */;

-- Dumping structure for table hhrr.sec_resource
DROP TABLE IF EXISTS `sec_resource`;
CREATE TABLE IF NOT EXISTS `sec_resource` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `idType` smallint(5) unsigned NOT NULL,
  `object` varchar(200) NOT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idType` (`idType`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- Dumping data for table hhrr.sec_resource: ~21 rows (approximately)
/*!40000 ALTER TABLE `sec_resource` DISABLE KEYS */;
INSERT INTO `sec_resource` (`id`, `name`, `description`, `idType`, `Object`, `icon`, `state`) VALUES
	(1, 'Usuarios', 'registrod e usuario', 1, '#!/Usuario', '', 'app.security.users'),
	(2, 'Ajustes', 'catalogo ajustes', 4, '#!/CatalogoAjustes', '', 'app.cat.ajustes'),
	(3, 'Bonos', 'catalogo de bonos', 4, '#!/CatalogoBonos', '', 'app.404'),
	(4, 'Deducciones', 'Catalogo de deducciones', 4, '#!/Deducciones', '', 'app.500'),
	(5, 'Generacion de Planillas', 'Generacion de Planillas', 2, '#!/PlanillaEmpleados', '', 'app.pay.payroll'),
	(6, 'Deducciones', 'Deducciones por Empleado', 3, '#!/DeduccionesEmpleado', '', 'app.assign.deduction'),
	(7, 'Calcular el ISR', 'Calcular el ISR', 2, '#!/CalculoISR', 'glyphicon-book', 'app.pay.isr'),
	(8, 'Bono', 'Asignacion de Bonos', 3, '#!/AsignacionBonos', 'glyphicon-book', 'app.404'),
	(9, 'Ajustes', 'Registro de Ajustes', 3, '#!/RegistroAjustes', '', 'app.404'),
	(10, 'Horas Extras', 'Registro de Horas Extras', 3, '#!/OvertimeReport', '', 'app.assign.overtime'),
	(11, 'Perfiles', 'Catalogo de Perfiles', 1, '#!/Perfil', '', 'app.security.profiles'),
	(12, 'Horas extras', 'Horas extras', 4, '#!/CatalogoHorasExtras', '', 'app.500'),
	(13, 'Jornadas de trabajo', 'Jornadas de trabajo', 4, '#!/JornadaTrabajo', '', 'app.404'),
	(14, 'Tipos de planilla', 'Tipos de planilla', 4, '#!/TipoPlanilla', '', 'app.500'),
	(15, 'Recursos', 'Catalogo de recursos del sistema', 5, '#!/Recurso', '', 'app.conf.resources'),
	(16, 'Parametros', 'Parametros', 5, '#!/Parametros', '', 'app.conf.parameters'),
	(17, 'Menus', 'Menus', 5, '#!/Usuario', NULL, 'app.conf.sidebar'),
	(18, 'Login', 'Login screen', 1, '/', 'fa fa-sign-out', 'login'),
	(19, 'Empleados', 'Empleados', 4, '', NULL, 'app.cat.employees'),
	(20, 'Empresas', 'Empresas', 4, '', NULL, 'app.cat.companies'),
	(21, 'Niveles Academicos', 'Niveles academicos', 4, '', NULL, 'app.cat.acedemic');
/*!40000 ALTER TABLE `sec_resource` ENABLE KEYS */;

-- Dumping structure for table hhrr.sec_resourcetype
DROP TABLE IF EXISTS `sec_resourcetype`;
CREATE TABLE IF NOT EXISTS `sec_resourcetype` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `icon` varchar(50) NOT NULL COMMENT 'Icono que se usará en el menu',
  `state` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table hhrr.sec_resourcetype: ~5 rows (approximately)
/*!40000 ALTER TABLE `sec_resourcetype` DISABLE KEYS */;
INSERT INTO `sec_resourcetype` (`id`, `name`, `description`, `icon`, `state`) VALUES
	(1, 'Seguridad', '', 'fa fa-unlock-alt', 'app.security'),
	(2, 'Planillas', '', 'fa fa-money', 'app.pay'),
	(3, 'Registro', '', 'fa fa-pencil', 'app.assign'),
	(4, 'Catalogos', '', 'fa fa-folder-open-o', 'app.cat'),
	(5, 'Configuracion', '', 'fa fa-cogs', 'app.conf');
/*!40000 ALTER TABLE `sec_resourcetype` ENABLE KEYS */;

-- Dumping structure for table hhrr.sec_user
DROP TABLE IF EXISTS `sec_user`;
CREATE TABLE IF NOT EXISTS `sec_user` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(15) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `profileId` smallint(5) unsigned NOT NULL,
  `phone` int(8) NOT NULL,
  `employeeId` smallint(5) unsigned NOT NULL COMMENT 'Identificador del empleado',
  `state` bit NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`login`),
  KEY `profileId` (`profileId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table hhrr.sec_user: ~4 rows (approximately)
/*!40000 ALTER TABLE `sec_user` DISABLE KEYS */;
INSERT INTO `sec_user` (`id`, `login`, `firstName`, `lastName`, `email`, `password`, `profileId`, `phone`, `employeeId`, `state`) VALUES
	(1, 'root', '', '', 'root@hngsystems', '6c760e4df6dd36483ae22e244c22d6ce', 7, 123, 0, 1),
	(2, 'usuario', '', '', 'user@user.user', '1e27217870dc7dc66113c85505f179fb', 3, 12345678, 0, 1),
	(3, 'admin', '', '', 'admin@admin.com', '0847d7bbf3c41a20fe8b21795cb29e9f', 1, 99999999, 0, 1);
/*!40000 ALTER TABLE `sec_user` ENABLE KEYS */;

-- Dumping structure for table hhrr.sec_user_company
DROP TABLE IF EXISTS `sec_user_company`;
CREATE TABLE IF NOT EXISTS `sec_user_company` (
  `id` smallint(5) unsigned NOT NULL,
  `userId` smallint(5) unsigned NOT NULL,
  `companyId` smallint(5) unsigned NOT NULL,
  `roleId` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `companyId` (`companyId`),
  KEY `roleId` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla intermedia para asignar la relacion entre el usuario y la empresa.';

-- Dumping data for table hhrr.sec_user_company: ~0 rows (approximately)
/*!40000 ALTER TABLE `sec_user_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `sec_user_company` ENABLE KEYS */;