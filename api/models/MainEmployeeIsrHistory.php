<?php

class MainEmployeeIsrHistory extends \Phalcon\Mvc\Model
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
     * @var double
     * @Column(type="double", length=10, nullable=false)
     */
    public $yearlyIncome;

    /**
     *
     * @var double
     * @Column(type="double", length=10, nullable=false)
     */
    public $taxDeductible;

    /**
     *
     * @var double
     * @Column(type="double", length=10, nullable=false)
     */
    public $taxableIncome;

    /**
     *
     * @var double
     * @Column(type="double", length=10, nullable=false)
     */
    public $totalTax;

    /**
     *
     * @var integer
     * @Column(type="integer", length=3, nullable=false)
     */
    public $feesToRetain;

    /**
     *
     * @var double
     * @Column(type="double", length=7, nullable=false)
     */
    public $monthlyFee;

    /**
     *
     * @var double
     * @Column(type="double", length=10, nullable=false)
     */
    public $retainedAmount;

    /**
     *
     * @var double
     * @Column(type="double", length=7, nullable=false)
     */
    public $feeAdjustment;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("hhrr");
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return MainEmployeeIsrHistory[]|MainEmployeeIsrHistory
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return MainEmployeeIsrHistory
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'main_employee_isr_history';
    }

}
