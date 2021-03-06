<?php

class PayEmpAdjustment extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=5, nullable=false)
     */
    public $id;

    /**
     *
     * @var integer
     * @Column(type="integer", length=5, nullable=false)
     */
    public $payrollId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=5, nullable=false)
     */
    public $employeeId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=3, nullable=false)
     */
    public $typeId;

    /**
     *
     * @var double
     * @Column(type="double", length=7, nullable=false)
     */
    public $amount;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $date;

    /**
     *
     * @var string
     * @Column(type="string", length=1, nullable=false)
     */
    public $isDebit;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=false)
     */
    public $description;

    /**
     *
     * @var string
     * @Column(type="string", length=1, nullable=false)
     */
    public $isPending;

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
        return 'pay_emp_adjustment';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return PayEmpAdjustment[]|PayEmpAdjustment
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return PayEmpAdjustment
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
