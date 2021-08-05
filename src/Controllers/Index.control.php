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
      
        $viewData = array();
        $viewData["page"] = $this->toString();
        $viewData["heroes"] = \Dao\HeroPanel::getActiveHeroeos();
        $viewData["categories"] = \Dao\ProductoPanel::getProductsCategories();
        
        $viewData["products"] = \Dao\ProductoPanel::getActiveProducts();
        
        if ($this->isPostBack()){

                if(isset($_POST["id"])){

                    $id = $_POST["id"];

                    if($_POST["btnAccion"]=="add"){

                        $itemArray = array
                        (
                            "id"=>$_POST["id"],
                            "desc"=>$_POST["desc"],
                            "cant"=>$_POST["cant"],
                            "price"=>$_POST["price"],
                            "total"=>$_POST["price"] * $_POST["cant"],
                            "imgurl"=>$_POST["imgurl"]
                        );

                        if(!isset($_SESSION["cart_items"])){
                            $_SESSION["cart_items"][0] =  $itemArray;
                            
                        }else{

                            $idproductos=array_column($_SESSION['cart_items'],"id");

                            if(in_array($id,$idproductos)){
                                \Utilities\Site::redirectToWithMsg("index.php?page=index", "Este producto ya existe en el carrito");
                            }else{ 
                                $NumeroProductos=count($_SESSION['cart_items']);
                                $_SESSION['cart_items'][$NumeroProductos] = $itemArray;
                            }
                        }

                        $viewData["cart_items"] = $_SESSION["cart_items"];

                    }
                }
               
                
            }

            if(isset($_SESSION["cart_items"])){
                $viewData["total_items"] = $NumeroProductos=count($_SESSION['cart_items']);
            }else{
                $viewData["total_items"] = 0;
            }

        \Views\Renderer::render("index", $viewData);
    }
}
?>
