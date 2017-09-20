<?php

class CatLegalForm extends \Phalcon\Mvc\Model
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
     * @Column(type="string", length=100, nullable=false)
     */
    public $name;

    /**
     *
     * @var integer
     * @Column(type="integer", length=3, nullable=false)
     */
    public $partners;

    /**
     *
     * @var double
     * @Column(type="double", length=10, nullable=false)
     */
    public $shareCapital;

    /**
     *
     * @var string
     * @Column(type="string", length=25, nullable=false)
     */
    public $responsibility;

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
        return 'cat_legal_form';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return CatLegalForm[]|CatLegalForm
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return CatLegalForm
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
