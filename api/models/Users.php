<?php

class Users extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Column(type="integer", length=5, nullable=false)
     */
    public $UserId;

    /**
     *
     * @var string
     * @Column(type="string", length=40, nullable=false)
     */
    public $Name;

    /**
     *
     * @var integer
     * @Column(type="integer", length=5, nullable=false)
     */
    public $EmployeeId;

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
        return 'users';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Users[]|Users
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Users
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
