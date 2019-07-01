<?php
Yii::import('application.modules.store.models.Product');

/**
 * Class ProductsFromCategoryWidget
 *
 * Show products from specified category
 *
 * @property string $slug Products category slug
 * @property bool|integer $limit The number of products. Default: false (unlimited)
 * @property string $order The order of products. Default: id DESC
 * @property string $view Widget view file
 */
class LatestProducts extends \yupe\widgets\YWidget
{
    
    public function run()
    {



        $criteria = new CDbCriteria();
        $criteria->limit = 6;
        $criteria->order = 'create_time DESC';
        $criteria->addCondition('discount_price IS NULL');
        $criteria->compare('lang', Yii::app()->language);
        $products = Product::model()->findAll($criteria);

        $this->render(
            $this->view,
            [
                'products' => $products,
            ]
        );
    }
}