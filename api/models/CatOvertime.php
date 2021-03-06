<?php

class CatOvertime extends \Phalcon\Mvc\Model
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
     * @Column(type="string", nullable=false)
     */
    public $start;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $end;

    /**
     *
     * @var double
     * @Column(type="double", length=3, nullable=false)
     */
    public $percent;

    /**
     *
     * @var string
     * @Column(type="string", length=125, nullable=false)
     */
    public $description;

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
        return 'cat_overtime';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return CatOvertime[]|CatOvertime
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return CatOvertime
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
