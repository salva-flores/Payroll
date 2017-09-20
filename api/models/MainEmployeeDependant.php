<?php

class MainEmployeeDependant extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Column(type="integer", length=5, nullable=false)
     */
    public $id;

    /**
     *
     * @var integer
     * @Column(type="integer", length=5, nullable=false)
     */
    public $employeeId;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=false)
     */
    public $name;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $dob;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=false)
     */
    public $relation;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=false)
     */
    public $insurance;

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
        return 'main_employee_dependant';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return MainEmployeeDependant[]|MainEmployeeDependant
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return MainEmployeeDependant
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
