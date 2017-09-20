<?php

class PayAdvanceRequest extends \Phalcon\Mvc\Model
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
     * @var double
     * @Column(type="double", length=7, nullable=false)
     */
    public $amount;

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
    public $authorizedBy;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $authorizationDate;

    /**
     *
     * @var integer
     * @Column(type="integer", length=3, nullable=false)
     */
    public $status;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=true)
     */
    public $observations;

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
        return 'pay_advance_request';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return PayAdvanceRequest[]|PayAdvanceRequest
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return PayAdvanceRequest
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
