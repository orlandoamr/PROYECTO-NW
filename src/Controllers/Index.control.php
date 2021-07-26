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
        \Utilities\Site::addLink("public/css/bootstrap.min.css");
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
        

        if ($this->isPostBack()) {
            $viewData["mode"] = $_GET["action"];
            switch($viewData["mode"]){
                case "add":
                    //$product = \Dao\ProductoPanel::getProductoById(1);
                    //$_SESSION["cart_item"] = array();
                    $itemArray = array
                    (
                        "id"=> $_POST["id"],
                        "desc"=>$_POST["desc"],
                        "price"=>$_POST["price"],
                        "imgurl"=>$_POST["imgurl"]
                    );

                    if(!isset($_SESSION["cart_item"])){
                        $_SESSION["cart_item"] = array();
                        $_SESSION["cart_item"][0] =  $itemArray;
                    }else{
                        $NumeroProductos=count($_SESSION['cart_items']);
                        $_SESSION['cart_items'][$NumeroProductos] = $itemArray;
                    }

                    
                    
                    $viewData["cart_items"] = $_SESSION["cart_item"];
                    break;

                case "rem":

                    break;

                case "empty":

                    break;
            }
         }

        \Views\Renderer::render("index", $viewData);
    }
}
?>
