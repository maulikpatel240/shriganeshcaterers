<?php

namespace backend\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Custompages;

/**
 * CustompagesSearch represents the model behind the search form of `backend\models\Custompages`.
 */
class CustompagesSearch extends Custompages
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id'], 'integer'],
            [['page_name_english', 'page_title_english', 'page_content_english', 'page_name_gujarati', 'page_title_guajrati', 'page_content_guajrati', 'page_name_hindi', 'page_title_hindi', 'page_content_hindi', 'status', 'status_at', 'created_at', 'updated_at'], 'safe'],
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
        $query = (isset($params['sort']) && $params['sort']) ? Custompages::find() : Custompages::find()->orderBy(['id' => SORT_DESC]);
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
            'status_at' => $this->status_at,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ]);

        $query->andFilterWhere(['like', 'image', $this->image])
            ->andFilterWhere(['like', 'page_name_english', $this->page_name_english])
            ->andFilterWhere(['like', 'page_title_english', $this->page_title_english])
            ->andFilterWhere(['like', 'page_content_english', $this->page_content_english])
            ->andFilterWhere(['like', 'page_name_gujarati', $this->page_name_gujarati])
            ->andFilterWhere(['like', 'page_title_guajrati', $this->page_title_guajrati])
            ->andFilterWhere(['like', 'page_content_guajrati', $this->page_content_guajrati])
            ->andFilterWhere(['like', 'page_name_hindi', $this->page_name_hindi])
            ->andFilterWhere(['like', 'page_title_hindi', $this->page_title_hindi])
            ->andFilterWhere(['like', 'page_content_hindi', $this->page_content_hindi])
            ->andFilterWhere(['like', 'status', $this->status]);

        return $dataProvider;
    }
}
