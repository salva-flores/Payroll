<?php

class MainEmployeeJobHistory extends \Phalcon\Mvc\Model
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
     * @var integer
     * @Column(type="integer", length=3, nullable=true)
     */
    public $companyUnitId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=3, nullable=true)
     */
    public $jobId;

    /**
     *
     * @var string
     * @Column(type="string", length=200, nullable=false)
     */
    public $movementDescription;

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
     * @var double
     * @Column(type="double", length=7, nullable=false)
     */
    public $salary;

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
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return MainEmployeeJobHistory[]|MainEmployeeJobHistory
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return MainEmployeeJobHistory
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
        return 'main_employee_job_history';
    }

}
