<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "langs".
 *
 * @property int $id
 * @property string $lang_key
 * @property string|null $type
 * @property string|null $english
 * @property string|null $gujarati
 * @property string|null $hindi
 *
 * @property Cities $cities
 * @property Countries $countries
 * @property Districts $districts
 * @property States[] $states
 */
class Langs extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'langs';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['lang_key','type','english', 'gujarati', 'hindi'], 'required'],
            [['type', 'english', 'gujarati', 'hindi'], 'string'],
            [['lang_key'], 'string', 'max' => 200],
            [['lang_key'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'lang_key' => 'Lang Key',
            'type' => 'Type',
            'english' => 'English',
            'gujarati' => 'Gujarati',
            'hindi' => 'Hindi',
        ];
    }

    /**
     * Gets query for [[Cities]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCities()
    {
        return $this->hasOne(Cities::className(), ['lang_id' => 'id']);
    }

    /**
     * Gets query for [[Countries]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCountries()
    {
        return $this->hasOne(Countries::className(), ['lang_id' => 'id']);
    }

    /**
     * Gets query for [[Districts]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getDistricts()
    {
        return $this->hasOne(Districts::className(), ['lang_id' => 'id']);
    }

    /**
     * Gets query for [[States]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getStates()
    {
        return $this->hasMany(States::className(), ['lang_id' => 'id']);
    }
}
