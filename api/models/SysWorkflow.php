<?php

class SysWorkflow extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=5, nullable=false)
     */
    public $id;

    /**
     *
     * @var string
     * @Column(type="string", length=45, nullable=false)
     */
    public $name;

    /**
     *
     * @var string
     * @Column(type="string", length=200, nullable=false)
     */
    public $description;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("hhrr");
        $this->hasMany('id', 'SysWorkflowDetail', 'workflow', ['alias' => 'SysWorkflowDetail']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'sys_workflow';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return SysWorkflow[]|SysWorkflow
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return SysWorkflow
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
