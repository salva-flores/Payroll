<?php

class SysModule extends \Phalcon\Mvc\Model
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
     * @Column(type="integer", length=3, nullable=false)
     */
    public $app;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=false)
     */
    public $name;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=false)
     */
    public $description;

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
     * @Column(type="integer", length=4, nullable=true)
     */
    public $isVisible;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("hhrr");
        $this->hasMany('id', 'SysResource', 'module', ['alias' => 'SysResource']);
        $this->hasMany('id', 'SysResource', 'module', ['alias' => 'SysResource']);
        $this->belongsTo('app', '\SysApp', 'id', ['alias' => 'SysApp']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'sys_module';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return SysModule[]|SysModule
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return SysModule
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
