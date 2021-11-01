<?php

namespace backend\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\BookingItems;

/**
 * BookingItemsSearch represents the model behind the search form of `backend\models\BookingItems`.
 */
class BookingItemsSearch extends BookingItems {

    public $item_category = '';
    public $booking;
    
    public function __construct($booking) {
        $this->booking = $booking;
    }

    /**
     * {@inheritdoc}
     */
    public function rules() {
        return [
            [['id', 'booking_id', 'menu_category_id', 'menu_id', 'item_id', 'item_category_id'], 'integer'],
            [['menu_list', 'weight', 'unit', 'INR', 'created_at', 'updated_at'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios() {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params, $pageSize) {
        $query = (isset($params['sort']) && $params['sort']) ? BookingItems::find()->joinWith('menuCategory')->where(['booking_items.booking_id' => $this->booking->id])->orderBy(['categories.position' => SORT_ASC]) : BookingItems::find()->joinWith('menuCategory')->where(['booking_items.booking_id' => $this->booking->id])->orderBy(['categories.position' => SORT_ASC]);
        
        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                'pageSize' => $pageSize,
            ],
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'booking_items.id' => $this->id,
            'booking_items.booking_id' => $this->booking_id,
            'booking_items.menu_category_id' => $this->menu_category_id,
            'booking_items.menu_id' => $this->menu_id,
            'booking_items.item_id' => $this->item_id,
            'booking_items.item_category_id' => $this->item_category_id,
            'booking_items.created_at' => $this->created_at,
            'booking_items.updated_at' => $this->updated_at,
        ]);

        $query->andFilterWhere(['like', 'booking_items.weight', $this->weight])
                ->andFilterWhere(['like', 'booking_items.unit', $this->unit]);
        
        return $dataProvider;
    }

}
