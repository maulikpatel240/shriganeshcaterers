<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "categories".
 *
 * @property int $id
 * @property string $english
 * @property string $status
 * @property string|null $status_at
 * @property string|null $created_at
 * @property string|null $updated_at
 * @property string $lang_key
 * @property string|null $gujarati
 * @property string|null $hindi
 */
class Categories extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'categories';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['english'], 'required'],
            [['status'], 'string'],
            [['status_at', 'created_at', 'updated_at'], 'safe'],
            [['english', 'gujarati', 'hindi'], 'string', 'max' => 255],
            [['image'], 'string', 'max' => 200],
            [['image'], 'file', 'skipOnEmpty' => true, 'extensions' => Yii::$app->params['image_extention']],
            [['english'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'english' => 'English',
            'status' => 'Status',
            'status_at' => 'Status At',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'lang_key' => 'Lang Key',
            'gujarati' => 'Gujarati',
            'hindi' => 'Hindi',
        ];
    }
    
    public function upload() {
        if ($this->image) {
            //$this->map->baseName = $this->id.'_state';
            $filename = 'category_' . $this->id . '_'.time().'.' . $this->image->extension;
            $this->image->saveAs(Yii::getAlias('@webroot') . '/uploads/category/' . $filename, false);
            $this->image = $filename;
            $this->save();
            return true;
        }else {
            return false;
        }
    }
    public function deleteImage($oldimg = "") {
        if ($oldimg) {
            $image = Yii::getAlias('@webroot') . '/uploads/image/' . $oldimg;
            if (file_exists($image) && unlink($image)) {
                return true;
            }
        } else {
            $image = Yii::getAlias('@webroot') . '/uploads/image/' . $this->image;
            if (file_exists($image) && unlink($image)) {
                $this->image = '';
                $this->save();
                return true;
            }
        }
        return false;
    }
}
