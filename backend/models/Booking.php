<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "booking".
 *
 * @property int $id
 * @property string $name
 * @property string $email
 * @property string $phone
 * @property string $datetime
 * @property int $people
 * @property string $message
 * @property string $status
 * @property string|null $status_at
 * @property string|null $created_at
 * @property string|null $updated_at
 */
class Booking extends \yii\db\ActiveRecord {

    public $date = '';
    public $time = '';

    /**
     * {@inheritdoc}
     */
    public static function tableName() {
        return 'booking';
    }

    /**
     * {@inheritdoc}
     */
    public function rules() {
        return [
            [['name', 'phone', 'date', 'time', 'people', 'menu'], 'required', 'message' => Yii::t('app', 'Required'), 'on' => ['frontend']],
            [['name', 'phone', 'date', 'time', 'people', 'menu', 'message'], 'required', 'on' => ['backend']],
            [['total_price'], 'required', 'on' => ['payment']],
            [['datetime', 'status_at', 'created_at', 'updated_at', 'paid_at', 'booking_id'], 'safe'],
            [['people'], 'integer'],
            [['message', 'status', 'payment_type'], 'string'],
            [['total_price', 'partial_price', 'total_pay_price'], 'number'],
            [['name', 'email'], 'string', 'max' => 100],
            [['phone'], 'string', 'max' => 16],
            [['total_price'], 'number', 'min' => 1],
            ['partial_price', 'required', 'when' => function ($model) {
                return $model->payment_type == 'Partial' ? true : false;
            }, 'whenClient' => "function (attribute, value) {
                return ($('input[type=\"radio\"][name=\"Booking[payment_type]\"]:checked').val() == 'Partial') ? true : false;
            }", 'message'=> 'Partial Price must be no greater than total price.', 'on' => ['payment']]
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels() {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'email' => 'Email',
            'phone' => 'Phone',
            'datetime' => 'Booking Datetime',
            'people' => 'People',
            'message' => 'Message',
            'status' => 'Status',
            'status_at' => 'Status At',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'total_price' => 'Total Price (₹)',
            'payment_type' => 'Payment Type',
            'partial_price' => 'Partial Price (₹)',
            'total_pay_price' => 'Total Pay Price (₹)',
            'paid_at' => 'Paid At',
            'menu' => 'Menu',
        ];
    }

}
