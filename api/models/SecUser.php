<?php

use Phalcon\Validation;
use Phalcon\Mvc\Model\Validator\Email as EmailValidator;

class SecUser extends \Phalcon\Mvc\Model
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
     * @Column(type="string", length=15, nullable=false)
     */
    public $userName;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=false)
     */
    public $email;

    /**
     *
     * @var string
     * @Column(type="string", length=200, nullable=false)
     */
    public $password;

    /**
     *
     * @var integer
     * @Column(type="integer", length=3, nullable=false)
     */
    public $profileId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=5, nullable=true)
     */
    public $employeeId;

    /**
     *
     * @var string
     * @Column(type="string", length=20, nullable=true)
     */
    public $firstName;

    /**
     *
     * @var string
     * @Column(type="string", length=20, nullable=true)
     */
    public $lastName;

    /**
     *
     * @var string
     * @Column(type="string", length=8, nullable=false)
     */
    public $phone;

    /**
     *
     * @var string
     * @Column(type="string", length=20, nullable=true)
     */
    public $avatar;

    /**
     *
     * @var string
     * @Column(type="string", length=1, nullable=false)
     */
    public $isActive;

    /**
     *
     * @var string
     * @Column(type="string", length=1, nullable=true)
     */
    public $changePass;

    /**
     * Commented this function due to validation error, Sal.
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
        $this->hasMany('id', 'SecUserEmp', 'userId', ['alias' => 'SecUserEmp']);
        $this->belongsTo('employeeId', '\MainEmployee', 'id', ['alias' => 'MainEmployee']);
        $this->belongsTo('profileId', '\SecProfile', 'id', ['alias' => 'SecProfile']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'sec_user';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return SecUser[]|SecUser
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return SecUser
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
