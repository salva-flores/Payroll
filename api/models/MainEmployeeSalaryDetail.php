<?php

class MainEmployeeSalaryDetail extends \Phalcon\Mvc\Model
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
     * @Column(type="integer", length=5, nullable=true)
     */
    public $employeeId;

    /**
     *
     * @var double
     * @Column(type="double", length=8, nullable=false)
     */
    public $salary;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=false)
     */
    public $bankName;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=false)
     */
    public $accountHolderName;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=false)
     */
    public $bankAccountNumber;

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
        return 'main_employee_salary_detail';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return MainEmployeeSalaryDetail[]|MainEmployeeSalaryDetail
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return MainEmployeeSalaryDetail
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
