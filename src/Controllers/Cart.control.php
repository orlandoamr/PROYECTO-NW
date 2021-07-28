<?php
    namespace Controllers;

    class Cart extends PublicController
    {

        public function run() :void 
        {
            \Utilities\Site::addLink("public/css/bootstrap.min.css");

            $viewData = array();
            if ($this->isPostBack()){
                if(isset($_POST["btnAccion"])){
                    switch($_POST["btnAccion"]){
                        case "rem":
                            $id = $_POST["id"];
                    
                            foreach($_SESSION["cart_items"] as $indice=>$producto){
                                if($producto["id"]==$id){
                                    unset($_SESSION["cart_items"][$indice]);
                                }
                            }
                            break;
    
                        case "empty":
    
                            break;
                    }
                }
             }

            $viewData["total_cart"] = 0.00;

            if(isset($_SESSION["cart_items"])){
                $viewData["cart_items"] = $_SESSION["cart_items"];

                foreach ($_SESSION["cart_items"] as $indice=>$producto){
                    $viewData["total_cart"] += $producto["price"];
                }
                
            }
           

            \Views\Renderer::render("cart", $viewData);
        }
    }

?>