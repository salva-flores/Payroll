<?php

class CatIsrDeductible extends \Phalcon\Mvc\Model
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
     * @var integer
     * @Column(type="integer", length=3, nullable=false)
     */
    public $isrId;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=false)
     */
    public $concept;

    /**
     *
     * @var double
     * @Column(type="double", length=10, nullable=true)
     */
    public $value;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=false)
     */
    public $description;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $fromDate;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $toDate;

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
        return 'cat_isr_deductible';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return CatIsrDeductible[]|CatIsrDeductible
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return CatIsrDeductible
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
