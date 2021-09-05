<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "items".
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
class Items extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'items';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['item_category_id', 'english'], 'required'],
            [['status'], 'string'],
            [['status_at', 'created_at', 'updated_at'], 'safe'],
            [['english', 'gujarati', 'hindi'], 'string', 'max' => 255],
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
            'gujarati' => 'Gujarati',
            'hindi' => 'Hindi',
            'item_category_id' => 'Item Category',
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
            $image = Yii::getAlias('@webroot') . '/uploads/category/' . $oldimg;
            if (file_exists($image) && unlink($image)) {
                return true;
            }
        } else {
            $image = Yii::getAlias('@webroot') . '/uploads/category/' . $this->image;
            if (file_exists($image) && unlink($image)) {
                $this->image = '';
                $this->save();
                return true;
            }
        }
        return false;
    }
    
     /**
     * Gets query for [[ItemCategory]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getItemCategory()
    {
        return $this->hasOne(ItemsCategories::className(), ['id' => 'item_category_id']);
    }
}
