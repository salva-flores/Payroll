<?php

class CatAcademicLevel extends \Phalcon\Mvc\Model
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
     * @Column(type="string", length=25, nullable=false)
     */
    public $name;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=true)
     */
    public $description;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("hhrr");
        $this->hasMany('id', 'MainEmployee', 'academicLevelId', ['alias' => 'MainEmployee']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'cat_academic_level';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return CatAcademicLevel[]|CatAcademicLevel
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return CatAcademicLevel
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
