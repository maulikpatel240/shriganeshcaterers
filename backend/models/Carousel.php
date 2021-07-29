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
            [['title_english', 'description_english', 'image'], 'required'],
            [['description_english', 'status', 'description_gujarati', 'description_hindi'], 'string'],
            [['status_at', 'created_at', 'updated_at'], 'safe'],
            [['title_english'], 'string', 'max' => 255],
            [['image', 'title_gujarati', 'title_hindi'], 'string', 'max' => 200],
            [['title_english'], 'unique'],
            [['image'], 'file', 'skipOnEmpty' => true, 'extensions' => Yii::$app->params['image_extention']],
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
            'title_english' => 'Title (English)',
            'description_english' => 'Description (English)',
            'image' => 'Image',
            'status' => 'Status',
            'status_at' => 'Status At',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'title_gujarati' => 'Title (Gujarati)',
            'title_hindi' => 'Title (Hindi)',
            'description_gujarati' => 'Description (Gujarati)',
            'description_hindi' => 'Description (Hindi)',
        ];
    }
    
    public function upload() {
        if ($this->image) {
            //$this->map->baseName = $this->id.'_state';
            $filename = 'carousel_' . $this->id . '_'.time().'.' . $this->image->extension;
            $this->image->saveAs(Yii::getAlias('@webroot') . '/uploads/carousel/' . $filename, false);
            $this->image = $filename;
            $this->save();
            return true;
        }else {
            return false;
        }
    }
    public function deleteImage($oldimg = "") {
        if ($oldimg) {
            $image = Yii::getAlias('@webroot') . '/uploads/carousel/' . $oldimg;
            if (file_exists($image) && unlink($image)) {
                return true;
            }
        } else {
            $image = Yii::getAlias('@webroot') . '/uploads/carousel/' . $this->image;
            if (file_exists($image) && unlink($image)) {
                $this->image = '';
                $this->save();
                return true;
            }
        }
        return false;
    }
}
