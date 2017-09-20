<?php

class PayEmpDeduction extends \Phalcon\Mvc\Model
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
    public $employeeId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=3, nullable=false)
     */
    public $deductionId;

    /**
     *
     * @var double
     * @Column(type="double", length=7, nullable=false)
     */
    public $amount;

    /**
     *
     * @var integer
     * @Column(type="integer", length=3, nullable=false)
     */
    public $fees;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $start;

    /**
     *
     * @var double
     * @Column(type="double", length=7, nullable=false)
     */
    public $totalDebt;

    /**
     *
     * @var integer
     * @Column(type="integer", length=3, nullable=false)
     */
    public $feesPayed;

    /**
     *
     * @var double
     * @Column(type="double", length=7, nullable=false)
     */
    public $balance;

    /**
     *
     * @var string
     * @Column(type="string", length=1, nullable=false)
     */
    public $isFirst;

    /**
     *
     * @var string
     * @Column(type="string", length=1, nullable=false)
     */
    public $isSecond;

    /**
     *
     * @var string
     * @Column(type="string", length=1, nullable=false)
     */
    public $isActive;

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
        return 'pay_emp_deduction';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return PayEmpDeduction[]|PayEmpDeduction
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return PayEmpDeduction
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
