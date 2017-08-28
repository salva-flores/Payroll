<?php

class PayRequestVacation extends \Phalcon\Mvc\Model
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
     * @Column(type="integer", length=5, nullable=false)
     */
    public $leaveTypeId;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $requestDate;

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
     * @Column(type="string", length=100, nullable=false)
     */
    public $reason;

    /**
     *
     * @var integer
     * @Column(type="integer", length=5, nullable=false)
     */
    public $aprovedBy;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $aprovalDate;

    /**
     *
     * @var integer
     * @Column(type="integer", length=5, nullable=false)
     */
    public $authorizedBy;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $authorizationDate;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=false)
     */
    public $observations;

    /**
     *
     * @var integer
     * @Column(type="integer", length=3, nullable=false)
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
        return 'pay_request_vacation';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return PayRequestVacation[]|PayRequestVacation
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return PayRequestVacation
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
