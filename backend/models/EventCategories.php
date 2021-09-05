<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "event_categories".
 *
 * @property int $id
 * @property string $english
 * @property string $image
 * @property string $status
 * @property string|null $status_at
 * @property string|null $created_at
 * @property string|null $updated_at
 * @property string|null $gujarati
 * @property string|null $hindi
 */
class EventCategories extends \yii\db\ActiveRecord {

    /**
     * {@inheritdoc}
     */
    public static function tableName() {
        return 'event_categories';
    }

    /**
     * {@inheritdoc}
     */
    public function rules() {
        return [
            [['english', 'description_english'], 'required'],
            [['status'], 'string'],
            [['status_at', 'created_at', 'updated_at', 'description_gujarati', 'description_hindi'], 'safe'],
            [['english', 'gujarati', 'hindi'], 'string', 'max' => 255],
            [['image'], 'string', 'max' => 200],
            [['image'], 'file', 'skipOnEmpty' => true, 'extensions' => Yii::$app->params['image_extention']],
            [['english'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels() {
        return [
            'id' => 'ID',
            'english' => 'English',
            'image' => 'Image',
            'status' => 'Status',
            'status_at' => 'Status At',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'gujarati' => 'Gujarati',
            'hindi' => 'Hindi',
        ];
    }

}
