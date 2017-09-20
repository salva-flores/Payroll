<?php

class MainCompanyStructure extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Column(type="integer", length=3, nullable=false)
     */
    public $companyId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=3, nullable=false)
     */
    public $unitId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=3, nullable=false)
     */
    public $parentUnitId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=3, nullable=false)
     */
    public $headJobId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=5, nullable=false)
     */
    public $headId;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("hhrr");
        $this->belongsTo('unitId', '\CatCompanyUnit', 'id', ['alias' => 'CatCompanyUnit']);
        $this->belongsTo('parentUnitId', '\CatCompanyUnit', 'id', ['alias' => 'CatCompanyUnit']);
        $this->belongsTo('companyId', '\MainCompany', 'id', ['alias' => 'MainCompany']);
        $this->belongsTo('headId', '\MainEmployee', 'id', ['alias' => 'MainEmployee']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'main_company_structure';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return MainCompanyStructure[]|MainCompanyStructure
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return MainCompanyStructure
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
