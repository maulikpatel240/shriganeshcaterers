<?php

namespace backend\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Items;

/**
 * ItemsSearch represents the model behind the search form of `backend\models\Items`.
 */
class ItemsSearch extends Items
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'item_category_id'], 'integer'],
            [['english', 'status', 'status_at', 'created_at', 'updated_at', 'gujarati', 'hindi'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
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
    public function search($params, $pageSize)
    {
        $query = (isset($params['sort']) && $params['sort']) ? Items::find() : Items::find()->orderBy(['id' => SORT_DESC]);
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
            'item_category_id' => $this->item_category_id,
            'status_at' => $this->status_at,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ]);

        $query->andFilterWhere(['like', 'english', $this->english])
            ->andFilterWhere(['like', 'status', $this->status])
            ->andFilterWhere(['like', 'gujarati', $this->gujarati])
            ->andFilterWhere(['like', 'hindi', $this->hindi]);

        return $dataProvider;
    }
}
