<?php

class PayPayrollDetailDeduction extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=8, nullable=false)
     */
    public $id;

    /**
     *
     * @var integer
     * @Column(type="integer", length=8, nullable=false)
     */
    public $detailId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=5, nullable=false)
     */
    public $deductionId;

    /**
     *
     * @var double
     * @Column(type="double", length=7, nullable=false)
     */
    public $amount;

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
        return 'pay_payroll_detail_deduction';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return PayPayrollDetailDeduction[]|PayPayrollDetailDeduction
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return PayPayrollDetailDeduction
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
