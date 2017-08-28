<?php

class SecUserEmp extends \Phalcon\Mvc\Model
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
    public $userId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=5, nullable=false)
     */
    public $employeeId;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("hhrr");
        $this->belongsTo('employeeId', '\MainEmployee', 'id', ['alias' => 'MainEmployee']);
        $this->belongsTo('userId', '\SecUser', 'id', ['alias' => 'SecUser']);
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return SecUserEmp[]|SecUserEmp
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return SecUserEmp
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
        return 'sec_user_emp';
    }

}
