<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "carousel".
 *
 * @property int $id
 * @property string $title
 * @property string $description
 * @property string $image
 * @property string $status
 * @property string|null $status_at
 * @property string|null $created_at
 * @property string|null $updated_at
 * @property string $lang_key
 */
class Carousel extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'carousel';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['title', 'description', 'image', 'lang_key'], 'required'],
            [['description', 'status'], 'string'],
            [['status_at', 'created_at', 'updated_at'], 'safe'],
            [['title', 'lang_key'], 'string', 'max' => 255],
            [['image'], 'string', 'max' => 200],
            [['title'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => 'Title',
            'description' => 'Description',
            'image' => 'Image',
            'status' => 'Status',
            'status_at' => 'Status At',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'lang_key' => 'Lang Key',
        ];
    }
}
