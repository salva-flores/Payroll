<?php

class MainCompany extends \Phalcon\Mvc\Model
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
    public $mipymeTypeId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=3, nullable=false)
     */
    public $economicBranchId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=3, nullable=false)
     */
    public $legalFormId;

    /**
     *
     * @var string
     * @Column(type="string", length=25, nullable=false)
     */
    public $shortName;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=true)
     */
    public $longName;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $foundationDate;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=false)
     */
    public $commercialRegiterCertificate;

    /**
     *
     * @var string
     * @Column(type="string", length=8, nullable=false)
     */
    public $phone;

    /**
     *
     * @var string
     * @Column(type="string", length=200, nullable=false)
     */
    public $address;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=false)
     */
    public $city;

    /**
     *
     * @var integer
     * @Column(type="integer", length=3, nullable=false)
     */
    public $departmentId;

    /**
     *
     * @var string
     * @Column(type="string", length=5, nullable=false)
     */
    public $postalCode;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=false)
     */
    public $mission;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=false)
     */
    public $vision;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=false)
     */
    public $profile;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=false)
     */
    public $logo;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=false)
     */
    public $ip;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=false)
     */
    public $legalRepName;

    /**
     *
     * @var string
     * @Column(type="string", length=13, nullable=false)
     */
    public $legalRepIdCard;

    /**
     *
     * @var string
     * @Column(type="string", length=8, nullable=false)
     */
    public $legalRepPhone;

    /**
     *
     * @var string
     * @Column(type="string", length=25, nullable=false)
     */
    public $contactName;

    /**
     *
     * @var string
     * @Column(type="string", length=25, nullable=false)
     */
    public $contactDesignation;

    /**
     *
     * @var string
     * @Column(type="string", length=8, nullable=false)
     */
    public $contactPhone;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=false)
     */
    public $contactEmail;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("hhrr");
        $this->hasMany('id', 'MainCompanyStructure', 'companyId', ['alias' => 'MainCompanyStructure']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'main_company';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return MainCompany[]|MainCompany
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return MainCompany
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
