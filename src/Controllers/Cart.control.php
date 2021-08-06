<?php
    namespace Controllers;

    class Cart extends PublicController
    {
        public function run() :void 
        {
            \Utilities\Site::addLink("public/css/bootstrap.min.css");

            $viewData = array();
            if ($this->isPostBack()){
                if(isset($_POST["btnAction"])){
                    $id = $_POST["id"];
                    switch($_POST["btnAction"]){
                        
                        case "rem":
                            foreach($_SESSION["cart_items"] as $indice=>$producto){
                                if($producto["id"]==$id){
                                    unset($_SESSION["cart_items"][$indice]);
                                }
                            }
                            break;

                    }
                }
            }

            $viewData["total_cart"] = 0.00;
            $_SESSION["total_cart"] = 0.00;
            if(isset($_SESSION["cart_items"])){
            
                foreach ($_SESSION["cart_items"] as $indice=>$producto){
                    $producto["total"] = $producto["price"] * $producto["cant"];
                    $viewData["total_cart"] += $producto["total"];
                    $_SESSION["total_cart"] += $producto["total"];
                }

                $viewData["items"] = $_SESSION["cart_items"];
            }
        

            \Views\Renderer::render("cart", $viewData);
            
        }
    }

?>