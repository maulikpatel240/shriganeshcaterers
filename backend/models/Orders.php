<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "orders".
 *
 * @property int $id
 * @property string $name
 * @property string $email
 * @property string $phone
 * @property string $mobile
 * @property string|null $time_type
 * @property string $datetime
 * @property int $people
 * @property string $message
 * @property string $status
 * @property string|null $status_at
 * @property string|null $created_at
 * @property string|null $updated_at
 */
class Orders extends \yii\db\ActiveRecord
{
    public $date = '';
    public $time = '';
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'orders';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'phone', 'mobile', 'date', 'time', 'people', 'message', 'time_type'], 'required'],
            [['time_type', 'message', 'status'], 'string'],
            [['datetime', 'status_at', 'created_at', 'updated_at', 'email'], 'safe'],
            [['people'], 'integer'],
            [['name', 'email'], 'string', 'max' => 100],
            [['phone', 'mobile'], 'string', 'max' => 16],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'email' => 'Email',
            'phone' => 'Phone',
            'mobile' => 'Mobile',
            'time_type' => 'Time Type',
            'datetime' => 'Datetime',
            'people' => 'People',
            'message' => 'Message',
            'status' => 'Status',
            'status_at' => 'Status At',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }
}
