<?php

class EmailConfirmations extends \Phalcon\Mvc\Model
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
     * @Column(type="integer", length=3, nullable=false)
     */
    public $usersId;

    /**
     *
     * @var string
     * @Column(type="string", length=32, nullable=false)
     */
    public $code;

    /**
     *
     * @var integer
     * @Column(type="integer", length=10, nullable=false)
     */
    public $createdAt;

    /**
     *
     * @var integer
     * @Column(type="integer", length=10, nullable=true)
     */
    public $modifiedAt;

    /**
     *
     * @var string
     * @Column(type="string", length=1, nullable=true)
     */
    public $confirmed;

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
        return 'email_confirmations';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return EmailConfirmations[]|EmailConfirmations
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return EmailConfirmations
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
