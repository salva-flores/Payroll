<?php

class ViewOvertime extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var string
     * @Column(type="string", length=9, nullable=true)
     */
    public $Mes;

    /**
     *
     * @var integer
     * @Column(type="integer", length=5, nullable=false)
     */
    public $employeeId;

    /**
     *
     * @var string
     * @Column(type="string", length=15, nullable=false)
     */
    public $Usuario;

    /**
     *
     * @var string
     * @Column(type="string", length=40, nullable=false)
     */
    public $Empleado;

    /**
     *
     * @var integer
     * @Column(type="integer", length=21, nullable=false)
     */
    public $Solicitudes;

    /**
     *
     * @var double
     * @Column(type="double", length=25, nullable=true)
     */
    public $Horas;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("hhrr");
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'view_overtime';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return ViewOvertime[]|ViewOvertime
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return ViewOvertime
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
