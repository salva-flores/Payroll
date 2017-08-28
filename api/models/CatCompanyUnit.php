<?php

class CatCompanyUnit extends \Phalcon\Mvc\Model
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
     * @Column(type="string", length=200, nullable=true)
     */
    public $description;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("hhrr");
        $this->hasMany('id', 'MainCompanyStructure', 'unitId', ['alias' => 'MainCompanyStructure']);
        $this->hasMany('id', 'MainCompanyStructure', 'parentUnitId', ['alias' => 'MainCompanyStructure']);
        $this->hasMany('id', 'MainEmployee', 'companyUnitId', ['alias' => 'MainEmployee']);
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return CatCompanyUnit[]|CatCompanyUnit
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return CatCompanyUnit
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
        return 'cat_company_unit';
    }

}
