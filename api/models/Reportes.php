<?php
use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Resultset\Simple as Resultset;

class Reportes extends Model {
    public static function Planilla($fecha, $tipo) {
		$sql = "SELECT
            p.idplanilla,
            p.fechapago,
            pd.idempleado,
            e.nombre,
            cp.nombre AS Puesto,
            pd.salario,
            pd.bruto,
            i.Tot_Ing,
            d.Tot_Ded

            FROM rrhh_planilladetalle pd

            LEFT JOIN rrhh_planilla p ON pd.idplanilla=p.idplanilla 
            LEFT JOIN rrhh_empleado e ON pd.idempleado=e.idempleado
            LEFT JOIN rrhh_catpuesto cp ON e.idpuesto=cp.Idpuesto
            LEFT JOIN (SELECT idplanilladetalle, sum(valor) as Tot_Ing FROM rrhh_detalledeingresos GROUP BY idplanilladetalle) i ON pd.idplanilladetalle=i.idplanilladetalle
            LEFT JOIN (SELECT idplanilladetalle, sum(valor) as Tot_Ded FROM rrhh_detallededucciones GROUP BY idplanilladetalle) d ON pd.idplanilladetalle=d.idplanilladetalle
            WHERE p.fechapago=$fecha AND p.idtipoplanilla='$tipo' ";
		$Ireporte = new Reportes();
		return new Resultset(null, $Ireporte, $Ireporte->getReadConnection()->query($sql));
	   }

    public static function Recibo($fecha, $tipo, $empleado) {
        $sql = "SELECT
            p.idplanilla,
            p.fechapago,
            pd.idempleado,
            e.nombre,
            cp.nombre AS Puesto,
            pd.salario,
            pd.bruto,
            i.valor as Ingreso,
            cd.nombre as Nom_Ded,
            d.valor as Deduccion

            FROM rrhh_planilladetalle pd

            LEFT JOIN rrhh_planilla p ON pd.idplanilla=p.idplanilla 
            LEFT JOIN rrhh_empleado e ON pd.idempleado=e.idempleado
            LEFT JOIN rrhh_catpuesto cp ON e.idpuesto=cp.Idpuesto
            LEFT JOIN rrhh_detalledeingresos i ON pd.idplanilladetalle=i.idplanilladetalle
            LEFT JOIN rrhh_detallededucciones d ON pd.idplanilladetalle=d.idplanilladetalle
            LEFT JOIN rrhh_deducciones cd ON d.iddeduccionempleado=cd.iddeduccion
            WHERE p.fechapago=$fecha AND p.idtipoplanilla='$tipo' AND pd.idempleado='$empleado'";
        $Recibo = new Reportes();
        return new Resultset(null, $Recibo, $Recibo->getReadConnection()->query($sql));
        }

    public static function RecIng($fecha, $tipo, $empleado) {
        $sql = "SELECT
          p.idplanilla,
          p.fechapago,
          pd.idempleado,
          e.nombre,
          cp.nombre AS Puesto,
          pd.salario,
          pd.bruto,
          i.description As Descripcion,
          i.valor as Ingreso
          
          FROM rrhh_planilladetalle pd

          LEFT JOIN rrhh_planilla p ON pd.idplanilla=p.idplanilla 
          LEFT JOIN rrhh_empleado e ON pd.idempleado=e.idempleado
          LEFT JOIN rrhh_catpuesto cp ON e.idpuesto=cp.Idpuesto
          LEFT JOIN rrhh_detalledeingresos i ON pd.idplanilladetalle=i.idplanilladetalle
          WHERE p.fechapago=$fecha AND p.idtipoplanilla='$tipo' AND pd.idempleado='$empleado'";
        $Ingresos = new Reportes();
        return new Resultset(null, $Ingresos, $Ingresos->getReadConnection()->query($sql));
        }

    public static function RecDed($fecha, $tipo, $empleado) {
        $sql = "SELECT
          p.idplanilla,
          p.fechapago,
          pd.idempleado,
          e.nombre,
          cp.nombre AS Puesto,
          pd.salario,
          pd.bruto,
          d.description As Descripcion,
          d.valor as Deduccion
          
          FROM rrhh_planilladetalle pd

          LEFT JOIN rrhh_planilla p ON pd.idplanilla=p.idplanilla 
          LEFT JOIN rrhh_empleado e ON pd.idempleado=e.idempleado
          LEFT JOIN rrhh_catpuesto cp ON e.idpuesto=cp.Idpuesto
          LEFT JOIN rrhh_detallededucciones d ON pd.idplanilladetalle=d.idplanilladetalle
          WHERE p.fechapago=$fecha AND p.idtipoplanilla='$tipo' AND pd.idempleado='$empleado'";
        $Deducciones = new Reportes();
        return new Resultset(null, $Deducciones, $Deducciones->getReadConnection()->query($sql));
        }
}