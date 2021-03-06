<?php

class SysWorkflowDetail extends \Phalcon\Mvc\Model
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
     * @var integer
     * @Column(type="integer", length=5, nullable=false)
     */
    public $workflow;

    /**
     *
     * @var string
     * @Column(type="string", length=45, nullable=false)
     */
    public $name;

    /**
     *
     * @var integer
     * @Column(type="integer", length=5, nullable=false)
     */
    public $sequence;

    /**
     *
     * @var string
     * @Column(type="string", length=200, nullable=false)
     */
    public $input;

    /**
     *
     * @var string
     * @Column(type="string", length=200, nullable=false)
     */
    public $actors;

    /**
     *
     * @var string
     * @Column(type="string", length=200, nullable=false)
     */
    public $description;

    /**
     *
     * @var string
     * @Column(type="string", length=200, nullable=false)
     */
    public $output;

    /**
     *
     * @var integer
     * @Column(type="integer", length=1, nullable=false)
     */
    public $isMandatory;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("hhrr");
        $this->belongsTo('workflow', '\SysWorkflow', 'id', ['alias' => 'SysWorkflow']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'sys_workflow_detail';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return SysWorkflowDetail[]|SysWorkflowDetail
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return SysWorkflowDetail
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
