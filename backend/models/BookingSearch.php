<?php

namespace backend\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Booking;

/**
 * BookingSearch represents the model behind the search form of `backend\models\Booking`.
 */
class BookingSearch extends Booking {

    /**
     * {@inheritdoc}
     */
    public function rules() {
        return [
            [['id', 'people'], 'integer'],
            [['name', 'email', 'phone', 'datetime', 'message', 'created_at', 'time_type'], 'safe'],
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
        $query = (isset($params['sort']) && $params['sort']) ? Booking::find() : Booking::find()->orderBy(['id' => SORT_DESC]);

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
            'datetime' => $this->datetime,
            'people' => $this->people,
            'status_at' => $this->status_at,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ]);

        $query->andFilterWhere(['like', 'name', $this->name])
                ->andFilterWhere(['like', 'email', $this->email])
                ->andFilterWhere(['like', 'phone', $this->phone])
                ->andFilterWhere(['like', 'message', $this->message])
                ->andFilterWhere(['like', 'time_type', $this->time_type])
                ->andFilterWhere(['like', 'status', $this->status]);

        return $dataProvider;
    }

}
