<?php
/**
 * PHP Version 7.2
 *
 * @category Public
 * @package  Controllers
 * @author   Orlando J Betancourth <orlando.betancourth@gmail.com>
 * @license  MIT http://
 * @version  CVS:1.0.0
 * @link     http://
 */
namespace Controllers;

/**
 * Index Controller
 *
 * @category Public
 * @package  Controllers
 * @author   Orlando J Betancourth <orlando.betancourth@gmail.com>
 * @license  MIT http://
 * @link     http://
 */
class Index extends PublicController
{
    /**
     * Index run method
     *
     * @return void
     */
    public function run() :void
    {
        \Utilities\Site::addLink("public/css/heropanel.css");
        /*
        1 Conseguir de la DB los registro de Heroes activos
        2 Injectarlo en un arreglo de vista
        3 Mostrar los heros panels en la vista
        */
        $viewData = array();
        $viewData["page"] = $this->toString();
        //$viewData["heroes"] = \Dao\HeroPanel::getActiveHeroeos();
        $viewData["categories"] = \Dao\ProductoPanel::getProductsCategories();
        $viewData["products"] = \Dao\ProductoPanel::getActiveProducts();
        \Views\Renderer::render("index", $viewData);
    }
}
?>
