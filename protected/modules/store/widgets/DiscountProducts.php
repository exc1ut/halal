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
class DiscountProducts extends \yupe\widgets\YWidget
{
    
    public function run()
    {



        $criteria = new CDbCriteria();
        $criteria->limit = 6;
        $criteria->condition = 'discount_price IS not NULL';
        $products = Product::model()->findAll($criteria);

        $this->render(
            $this->view,
            [
                'products' => $products,
            ]
        );
    }
}