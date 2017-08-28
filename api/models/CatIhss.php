<?php

class CatIhss extends \Phalcon\Mvc\Model
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
     * @Column(type="string", length=7, nullable=false)
     */
    public $code;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=false)
     */
    public $description;

    /**
     *
     * @var double
     * @Column(type="double", length=4, nullable=false)
     */
    public $value;

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
     * @return CatIhss[]|CatIhss
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return CatIhss
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
        return 'cat_ihss';
    }

}
