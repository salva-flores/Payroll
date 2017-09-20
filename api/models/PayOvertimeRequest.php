<?php

class PayOvertimeRequest extends \Phalcon\Mvc\Model
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
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $date;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $dateTimeStamp;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $startTime;

    /**
     *
     * @var integer
     * @Column(type="integer", length=3, nullable=false)
     */
    public $estimatedTime;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=false)
     */
    public $requestedBy;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $class;

    /**
     *
     * @var string
     * @Column(type="string", length=200, nullable=false)
     */
    public $description;

    /**
     *
     * @var string
     * @Column(type="string", length=1, nullable=false)
     */
    public $isOpen;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $state;

    /**
     *
     * @var integer
     * @Column(type="integer", length=5, nullable=true)
     */
    public $decidedBy;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $decisionDate;

    /**
     *
     * @var integer
     * @Column(type="integer", length=5, nullable=true)
     */
    public $authorizedBy;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $authorizationDate;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $payDate;

    /**
     *
     * @var string
     * @Column(type="string", length=200, nullable=true)
     */
    public $observations;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("hhrr");
        $this->hasMany('id', 'PayOvertimeDetail', 'requestId', ['alias' => 'PayOvertimeDetail']);
        $this->belongsTo('employeeId', '\MainEmployee', 'id', ['alias' => 'MainEmployee']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'pay_overtime_request';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return PayOvertimeRequest[]|PayOvertimeRequest
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return PayOvertimeRequest
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
