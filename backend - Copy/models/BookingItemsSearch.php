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
            [['id', 'booking_id', 'menu_id', 'item_id', 'item_category_id'], 'integer'],
            [['weight', 'unit', 'created_at', 'updated_at'], 'safe'],
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
        $query = (isset($params['sort']) && $params['sort']) ? BookingItems::find()->where(['booking_id' => $this->booking->id]) : BookingItems::find()->where(['booking_id' => $this->booking->id])->orderBy(['id' => SORT_DESC]);

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
            'id' => $this->id,
            'booking_id' => $this->booking_id,
            'item_id' => $this->item_id,
            'item_category_id' => $this->item_category_id,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ]);

        $query->andFilterWhere(['like', 'weight', $this->weight])
              ->andFilterWhere(['like', 'menu_id', $this->menu_id])
                ->andFilterWhere(['like', 'unit', $this->unit]);


        return $dataProvider;
    }

}
