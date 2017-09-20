<?php

class SecProfileResource extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Column(type="integer", length=3, nullable=false)
     */
    public $profileId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=5, nullable=false)
     */
    public $resourceId;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("hhrr");
        $this->belongsTo('profileId', '\SecProfile', 'id', ['alias' => 'SecProfile']);
        $this->belongsTo('resourceId', '\SecModRes', 'id', ['alias' => 'SecModRes']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'sec_profile_resource';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return SecProfileResource[]|SecProfileResource
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return SecProfileResource
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
