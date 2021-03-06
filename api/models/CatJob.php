<?php

class CatJob extends \Phalcon\Mvc\Model
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
     * @Column(type="string", length=200, nullable=false)
     */
    public $responsibilities;

    /**
     *
     * @var string
     * @Column(type="string", length=200, nullable=false)
     */
    public $abilities;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=false)
     */
    public $experience;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("hhrr");
        $this->hasMany('id', 'MainEmployee', 'job', ['alias' => 'MainEmployee']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'cat_job';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return CatJob[]|CatJob
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return CatJob
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
