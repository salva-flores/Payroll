<?php

class PayPayrollHeader extends \Phalcon\Mvc\Model
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
    public $payrollTypeId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=3, nullable=false)
     */
    public $month;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $fromDate;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $toDate;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $payDate;

    /**
     *
     * @var integer
     * @Column(type="integer", length=3, nullable=false)
     */
    public $workflowStatus;

    /**
     *
     * @var string
     * @Column(type="string", length=1, nullable=false)
     */
    public $isPayed;

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
        return 'pay_payroll_header';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return PayPayrollHeader[]|PayPayrollHeader
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return PayPayrollHeader
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
