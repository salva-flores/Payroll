<?php

class CatPayroll extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=3, nullable=false)
     */
    public $id;

    /**
     *
     * @var string
     * @Column(type="string", length=25, nullable=false)
     */
    public $name;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=false)
     */
    public $description;

    /**
     *
     * @var integer
     * @Column(type="integer", length=3, nullable=false)
     */
    public $timeUnit;

    /**
     *
     * @var integer
     * @Column(type="integer", length=3, nullable=false)
     */
    public $yearlyPayments;

    /**
     *
     * @var integer
     * @Column(type="integer", length=1, nullable=false)
     */
    public $status;

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
        return 'cat_payroll';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return CatPayroll[]|CatPayroll
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return CatPayroll
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
