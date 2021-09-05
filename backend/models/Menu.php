<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "menu".
 *
 * @property int $id
 * @property int $menu_menu_id
 * @property string $name
 * @property string $image
 * @property string $status
 * @property string|null $status_at
 * @property string|null $created_at
 * @property string|null $updated_at
 * @property string|null $gujarati
 * @property string|null $hindi
 * @property string $items
 */
class Menu extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'menu';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['menu_category_id', 'name', 'items'], 'required'],
            [['menu_category_id'], 'integer'],
            [['status'], 'string'],
            [['status_at', 'created_at', 'updated_at', 'description_english', 'description_gujarati', 'description_hindi'], 'safe'],
            [['name', 'gujarati', 'hindi'], 'string', 'max' => 255],
            [['name'], 'unique'],
            [['menu_category_id'], 'exist', 'skipOnError' => true, 'targetClass' => Categories::className(), 'targetAttribute' => ['menu_category_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'menu_category_id' => 'Menu Category',
            'name' => 'Name',
            'image' => 'Image',
            'status' => 'Status',
            'status_at' => 'Status At',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'gujarati' => 'Gujarati',
            'hindi' => 'Hindi',
            'items' => 'Items',
        ];
    }
    
    public function upload() {
        if ($this->image) {
            //$this->map->baseName = $this->id.'_state';
            $filename = 'menu_' . $this->id . '_'.time().'.' . $this->image->extension;
            $this->image->saveAs(Yii::getAlias('@webroot') . '/uploads/menu/' . $filename, false);
            $this->image = $filename;
            $this->save();
            return true;
        }else {
            return false;
        }
    }
    public function deleteImage($oldimg = "") {
        if ($oldimg) {
            $image = Yii::getAlias('@webroot') . '/uploads/menu/' . $oldimg;
            if (file_exists($image) && unlink($image)) {
                return true;
            }
        } else {
            $image = Yii::getAlias('@webroot') . '/uploads/menu/' . $this->image;
            if (file_exists($image) && unlink($image)) {
                $this->image = '';
                $this->save();
                return true;
            }
        }
        return false;
    }
      /**
     * Gets query for [[MenuCategory]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getMenuCategory()
    {
        return $this->hasOne(Categories::className(), ['id' => 'menu_category_id']);
    }
}
