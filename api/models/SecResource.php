<?php

class SecResource extends \Phalcon\Mvc\Model
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
     * @var integer
     * @Column(type="integer", length=5, nullable=true)
     */
    public $typeId;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=false)
     */
    public $description;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=true)
     */
    public $icon;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=true)
     */
    public $state;

    /**
     *
     * @var string
     * @Column(type="string", length=1, nullable=true)
     */
    public $inMenu;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("hhrr");
        $this->hasMany('id', 'SecProfileResource', 'resourceId', ['alias' => 'SecProfileResource']);
        $this->belongsTo('typeId', '\SecResourceType', 'id', ['alias' => 'SecResourceType']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'sec_resource';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return SecResource[]|SecResource
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return SecResource
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
