<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "booking_items".
 *
 * @property int $id
 * @property int $booking_id
 * @property int $menu_id
 * @property int $category_id
 * @property int $item_id
 * @property int $item_category_id
 * @property string $weight
 * @property string $unit
 * @property string|null $created_at
 * @property string|null $updated_at
 *
 * @property Booking $booking
 * @property Menu $menu
 * @property Items $item
 * @property ItemsCategories $itemCategory
 * @property Categories $category
 */
class BookingItems extends \yii\db\ActiveRecord {

    /**
     * {@inheritdoc}
     */
    public static function tableName() {
        return 'booking_items';
    }

    /**
     * {@inheritdoc}
     */
    public function rules() {
        return [
            [['booking_id', 'menu_id', 'menu_category_id', 'item_id', 'item_category_id'], 'required', 'on' => ['viewdata']],
            [['booking_id', 'menu_id', 'item_id', 'item_category_id', 'weight', 'unit'], 'required', 'on' => ['updateweight']],
            [['booking_id', 'menu_id', 'menu_category_id', 'item_id', 'item_category_id'], 'integer'],
            [['unit', 'INR'], 'string'],
            [['created_at', 'updated_at', 'menu_list'], 'safe'],
            [['weight'], 'string', 'max' => 100],
            [['booking_id'], 'exist', 'skipOnError' => true, 'targetClass' => Booking::className(), 'targetAttribute' => ['booking_id' => 'id']],
            [['menu_category_id'], 'exist', 'skipOnError' => true, 'targetClass' => Categories::className(), 'targetAttribute' => ['menu_category_id' => 'id']],
            [['menu_id'], 'exist', 'skipOnError' => true, 'targetClass' => Menu::className(), 'targetAttribute' => ['menu_id' => 'id']],
            [['item_id'], 'exist', 'skipOnError' => true, 'targetClass' => Items::className(), 'targetAttribute' => ['item_id' => 'id']],
            [['item_category_id'], 'exist', 'skipOnError' => true, 'targetClass' => ItemsCategories::className(), 'targetAttribute' => ['item_category_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels() {
        return [
            'id' => 'ID',
            'booking_id' => 'Booking ID',
            'menu_id' => 'Menu ID',
            'item_id' => 'Item ID',
            'item_category_id' => 'Item Category ID',
            'weight' => 'Weight',
            'unit' => 'Unit',
            'INR' => '₹ INR (Rupee)',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }

    /**
     * Gets query for [[Booking]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getBooking() {
        return $this->hasOne(Booking::className(), ['id' => 'booking_id']);
    }

    /**
     * Gets query for [[Menu]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getMenu() {
        return $this->hasOne(Menu::className(), ['id' => 'menu_id']);
    }

    /**
     * Gets query for [[Item]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getItem() {
        return $this->hasOne(Items::className(), ['id' => 'item_id']);
    }

    /**
     * Gets query for [[ItemCategory]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getItemCategory() {
        return $this->hasOne(ItemsCategories::className(), ['id' => 'item_category_id']);
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
