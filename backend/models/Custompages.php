<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "custompages".
 *
 * @property int $id
 * @property string $image
 * @property string $page_name_english
 * @property string $page_title_english
 * @property string $page_content_english
 * @property string $page_name_gujarati
 * @property string $page_title_guajrati
 * @property string $page_content_guajrati
 * @property string $page_name_hindi
 * @property string $page_title_hindi
 * @property string $page_content_hindi
 * @property string $status
 * @property string|null $status_at
 * @property string|null $created_at
 * @property string|null $updated_at
 */
class Custompages extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'custompages';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['image', 'page_name_english', 'page_title_english', 'page_content_english'], 'required'],
            [['page_content_english', 'page_content_guajrati', 'page_content_hindi', 'status'], 'string'],
            [['status_at', 'created_at', 'updated_at'], 'safe'],
            [['image', 'page_title_english', 'page_title_guajrati', 'page_title_hindi'], 'string', 'max' => 200],
            [['page_name_english', 'page_name_gujarati', 'page_name_hindi'], 'string', 'max' => 100],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'image' => 'Image',
            'page_name_english' => 'Page Name English',
            'page_title_english' => 'Page Title English',
            'page_content_english' => 'Page Content English',
            'page_name_gujarati' => 'Page Name Gujarati',
            'page_title_guajrati' => 'Page Title Guajrati',
            'page_content_guajrati' => 'Page Content Guajrati',
            'page_name_hindi' => 'Page Name Hindi',
            'page_title_hindi' => 'Page Title Hindi',
            'page_content_hindi' => 'Page Content Hindi',
            'status' => 'Status',
            'status_at' => 'Status At',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }
    
    public function upload() {
        if ($this->image) {
            //$this->map->baseName = $this->id.'_state';
            $filename = 'page_' . $this->id . '_'.time().'.' . $this->image->extension;
            $this->image->saveAs(Yii::getAlias('@webroot') . '/uploads/custompage/' . $filename, false);
            $this->image = $filename;
            $this->save();
            return true;
        }else {
            return false;
        }
    }
    public function deleteImage($oldimg = "") {
        if ($oldimg) {
            $image = Yii::getAlias('@webroot') . '/uploads/custompage/' . $oldimg;
            if (file_exists($image) && unlink($image)) {
                return true;
            }
        } else {
            $image = Yii::getAlias('@webroot') . '/uploads/custompage/' . $this->image;
            if (file_exists($image) && unlink($image)) {
                $this->image = '';
                $this->save();
                return true;
            }
        }
        return false;
    }
}
