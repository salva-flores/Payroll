<?php

use Phalcon\Validation;
use Phalcon\Mvc\Model\Validator\Email as EmailValidator;

class MainEmployee extends \Phalcon\Mvc\Model
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
     * @Column(type="integer", length=3, nullable=false)
     */
    public $companyUnit;

    /**
     *
     * @var integer
     * @Column(type="integer", length=3, nullable=false)
     */
    public $academicLevel;

    /**
     *
     * @var integer
     * @Column(type="integer", length=3, nullable=false)
     */
    public $profession;

    /**
     *
     * @var integer
     * @Column(type="integer", length=3, nullable=false)
     */
    public $job;

    /**
     *
     * @var integer
     * @Column(type="integer", length=3, nullable=false)
     */
    public $type;

    /**
     *
     * @var string
     * @Column(type="string", length=40, nullable=false)
     */
    public $firstName;

    /**
     *
     * @var string
     * @Column(type="string", length=40, nullable=false)
     */
    public $lastName;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $dob;

    /**
     *
     * @var integer
     * @Column(type="integer", length=1, nullable=false)
     */
    public $gender;

    /**
     *
     * @var string
     * @Column(type="string", length=3, nullable=false)
     */
    public $bloodType;

    /**
     *
     * @var string
     * @Column(type="string", length=40, nullable=false)
     */
    public $nationality;

    /**
     *
     * @var string
     * @Column(type="string", length=13, nullable=false)
     */
    public $idCard;

    /**
     *
     * @var string
     * @Column(type="string", length=20, nullable=false)
     */
    public $maritalStatus;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $joined;

    /**
     *
     * @var string
     * @Column(type="string", length=150, nullable=false)
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
     * @Column(type="string", length=8, nullable=false)
     */
    public $homePhone;

    /**
     *
     * @var string
     * @Column(type="string", length=8, nullable=false)
     */
    public $officePhone;

    /**
     *
     * @var string
     * @Column(type="string", length=8, nullable=false)
     */
    public $mobilePhone;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=false)
     */
    public $email;

    /**
     *
     * @var double
     * @Column(type="double", length=8, nullable=false)
     */
    public $salary;

    /**
     *
     * @var integer
     * @Column(type="integer", length=3, nullable=false)
     */
    public $shift;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $creationDate;

    /**
     *
     * @var integer
     * @Column(type="integer", length=3, nullable=false)
     */
    public $createdBy;
    public $state; 

    /**
     * Validations and business logic
     *
     * @return boolean
    public function validation()
    {
        $validator = new Validation();

        $validator->add(
            'email',
            new EmailValidator(
                [
                    'model'   => $this,
                    'message' => 'Please enter a correct email address',
                ]
            )
        );

        return $this->validate($validator);
    }
     */

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("hhrr");
        $this->hasMany('id', 'MainCompanyStructure', 'headId', ['alias' => 'MainCompanyStructure']);
        $this->hasMany('id', 'PayOvertimeRequest', 'employeeId', ['alias' => 'PayOvertimeRequest']);
        $this->hasMany('id', 'SecUser', 'employeeId', ['alias' => 'SecUser']);
        $this->hasMany('id', 'SecUserEmp', 'employeeId', ['alias' => 'SecUserEmp']);
        $this->belongsTo('academicLevel', '\CatAdemicLevel', 'id', ['alias' => 'CatAdemicLevel']);
        $this->belongsTo('companyUnit', '\CatCompanyUnit', 'id', ['alias' => 'CatCompanyUnit']);
        $this->belongsTo('job', '\CatJob', 'id', ['alias' => 'CatJob']);
        $this->belongsTo('profession', '\CatProfession', 'id', ['alias' => 'CatProfession']);
        $this->belongsTo('shift', '\CatWorkingHours', 'id', ['alias' => 'CatWorkingHours']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'main_employee';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return MainEmployee[]|MainEmployee
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return MainEmployee
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
