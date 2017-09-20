<?php

class PayOvertimeDetail extends \Phalcon\Mvc\Model
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
     * @Column(type="integer", length=5, nullable=false)
     */
    public $requestId;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $entryDate;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $activityDate;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $startTime;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $startTimeStamp;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $endTime;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $endTimeStamp;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=false)
     */
    public $activities;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("hhrr");
        $this->belongsTo('requestId', '\PayOvertimeRequest', 'id', ['alias' => 'PayOvertimeRequest']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'pay_overtime_detail';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return PayOvertimeDetail[]|PayOvertimeDetail
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return PayOvertimeDetail
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
