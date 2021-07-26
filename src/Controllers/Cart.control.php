<?php
    namespace Controllers;

    class Cart extends PublicController
    {

        public function run() :void 
        {
            \Utilities\Site::addLink("public/css/bootstrap.min.css");

            $viewData = array();
            if(isset($_SESSION["cart_item"])){
                $viewData["cart_items"] = $_SESSION["cart_items"];

                
            }
           

            \Views\Renderer::render("cart", $viewData);
        }
    }

?>