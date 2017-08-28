<?php

class CatIsrPercentage extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Column(type="integer", length=3, nullable=false)
     */
    public $id;

    /**
     *
     * @var double
     * @Column(type="double", length=10, nullable=false)
     */
    public $lowerLlimit1;

    /**
     *
     * @var double
     * @Column(type="double", length=10, nullable=false)
     */
    public $upperLimit1;

    /**
     *
     * @var double
     * @Column(type="double", length=10, nullable=false)
     */
    public $percent1;

    /**
     *
     * @var double
     * @Column(type="double", length=10, nullable=false)
     */
    public $lowerLimit2;

    /**
     *
     * @var double
     * @Column(type="double", length=10, nullable=false)
     */
    public $upperLimit2;

    /**
     *
     * @var double
     * @Column(type="double", length=10, nullable=false)
     */
    public $percent2;

    /**
     *
     * @var double
     * @Column(type="double", length=10, nullable=false)
     */
    public $lowerLimit3;

    /**
     *
     * @var double
     * @Column(type="double", length=10, nullable=false)
     */
    public $upperLimit3;

    /**
     *
     * @var double
     * @Column(type="double", length=10, nullable=false)
     */
    public $percent3;

    /**
     *
     * @var double
     * @Column(type="double", length=10, nullable=false)
     */
    public $lowerLimit4;

    /**
     *
     * @var double
     * @Column(type="double", length=10, nullable=false)
     */
    public $upperLimit4;

    /**
     *
     * @var double
     * @Column(type="double", length=10, nullable=false)
     */
    public $percent4;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $validFrom;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $validTo;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("hhrr");
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return CatIsrPercentage[]|CatIsrPercentage
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return CatIsrPercentage
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
        return 'cat_isr_percentage';
    }

}
