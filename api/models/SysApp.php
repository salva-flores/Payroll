<?php

class SysApp extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=3, nullable=false)
     */
    public $id;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=false)
     */
    public $name;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=false)
     */
    public $icon;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=false)
     */
    public $state;

    /**
     *
     * @var integer
     * @Column(type="integer", length=1, nullable=false)
     */
    public $isVisible;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("hhrr");
        $this->hasMany('id', 'SysModule', 'app', ['alias' => 'SysModule']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'sys_app';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return SysApp[]|SysApp
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return SysApp
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
