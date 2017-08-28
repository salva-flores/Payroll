<?php

use Phalcon\Mvc\Model\Validator\Email as EmailValidator;

class MainEmployeeContact extends \Phalcon\Mvc\Model
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
    public $employeeId;

    /**
     *
     * @var string
     * @Column(type="string", length=45, nullable=false)
     */
    public $contactName;

    /**
     *
     * @var string
     * @Column(type="string", length=45, nullable=false)
     */
    public $relationship;

    /**
     *
     * @var string
     * @Column(type="string", length=8, nullable=false)
     */
    public $phone;

    /**
     *
     * @var string
     * @Column(type="string", length=8, nullable=false)
     */
    public $mobile;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=false)
     */
    public $address;

    /**
     *
     * @var string
     * @Column(type="string", length=45, nullable=false)
     */
    public $email;

    /**
     * Validations and business logic
     *
     * @return boolean
     */
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
     * @return MainEmployeeContact[]|MainEmployeeContact
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return MainEmployeeContact
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
        return 'main_employee_contact';
    }

}
