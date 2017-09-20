<?php

class SysConfigLong extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=5, nullable=false)
     */
    public $id_config;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=false)
     */
    public $name;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=false)
     */
    public $cKey;

    /**
     *
     * @var string
     * @Column(type="string", length=255, nullable=false)
     */
    public $value;

    /**
     *
     * @var string
     * @Column(type="string", length=20, nullable=false)
     */
    public $fType;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $fKey;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $fValue;

    /**
     *
     * @var string
     * @Column(type="string", length=1, nullable=false)
     */
    public $isEditable;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $comment;

    /**
     *
     * @var integer
     * @Column(type="integer", length=5, nullable=true)
     */
    public $idSeq;

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
        return 'sys_config_long';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return SysConfigLong[]|SysConfigLong
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return SysConfigLong
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
