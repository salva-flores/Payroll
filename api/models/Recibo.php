<?php
use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Resultset\Simple as Resultset;

class Recibo extends Model
{
    public function Rec($fecha, $tipo, $empleado) {
      //      1. devolver el registro del detalle de la Planilla
        $sql = "SELECT
            p.idplanilla,
            p.fechapago,
            pd.idempleado,
            e.nombre,
            cp.nombre AS Puesto,
            pd.salario,
            pd.bruto,
            i.valor as Ingreso,
            d.valor as Deduccion

            FROM rrhh_planilladetalle pd

            LEFT JOIN rrhh_planilla p ON pd.idplanilla=p.idplanilla 
            LEFT JOIN rrhh_empleado e ON pd.idempleado=e.idempleado
            LEFT JOIN rrhh_catpuesto cp ON e.idpuesto=cp.Idpuesto
            LEFT JOIN rrhh_detalledeingresos i ON pd.idplanilladetalle=i.idplanilladetalle
            LEFT JOIN rrhh_detallededucciones d ON pd.idplanilladetalle=d.idplanilladetalle
            WHERE p.fechapago=$fecha AND p.idtipoplanilla='$tipo' AND pd.idempleado='$empleado'";
        $Recibo = new Recibo();
        return new Resultset(null, $Recibo, $Recibo->getReadConnection()->query($sql));
    }
}
 