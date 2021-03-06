<?php

class SecMod extends \Phalcon\Mvc\Model
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
        $this->hasMany('id', 'SecModRes', 'typeId', ['alias' => 'SecModRes']);
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return SecMod[]|SecMod
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return SecMod
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
        return 'sec_mod';
    }

}
