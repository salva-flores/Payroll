<?php

class CatPayrollDetailGeneral extends \Phalcon\Mvc\Model
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
     * @var integer
     * @Column(type="integer", length=3, nullable=false)
     */
    public $payrollId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=3, nullable=false)
     */
    public $field;

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
        return 'cat_payroll_detail_general';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return CatPayrollDetailGeneral[]|CatPayrollDetailGeneral
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return CatPayrollDetailGeneral
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
