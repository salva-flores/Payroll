<?php

class SysLog extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=10, nullable=false)
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
     * @Column(type="integer", length=3, nullable=false)
     */
    public $action;

    /**
     *
     * @var string
     * @Column(type="string", length=12, nullable=true)
     */
    public $userName;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $actionEnum;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=true)
     */
    public $table;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $when;

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
     * @return SysLog[]|SysLog
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return SysLog
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
        return 'sys_log';
    }

}
