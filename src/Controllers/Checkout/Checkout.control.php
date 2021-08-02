<?php

namespace Controllers\Checkout;

use Controllers\PublicController;

class Checkout extends PublicController{
    public function run():void
    {
        $viewData = array();
        if ($this->isPostBack()) {
            $PayPalOrder = new \Utilities\Paypal\PayPalOrder(
                "test".(time() - 10000000),
                "http://localhost/proyecto-nw/index.php?page=checkout_error",
                "http://localhost/proyecto-nw/index.php?page=checkout_accept"
            );
            if (isset($_SESSION["cart_items"])){
                foreach ($_SESSION["cart_items"] as $indice=>$producto){
                    $PayPalOrder->addItem(
                                            $producto["desc"], 
                                            $producto["desc"], 
                                            "PRD1", 
                                            $producto["price"], 
                                            15, 
                                            $producto["cant"], 
                                            "DIGITAL_GOODS"
                                        );
                        
                    // $PayPalOrder->addItem(
                    //                         "Test", 
                    //                         "TestItem1", 
                    //                         "PRD1", 
                    //                         100, 
                    //                         15, 
                    //                         1, 
                    //                         "DIGITAL_GOODS"
                    //                     );
                }
            }
            //$PayPalOrder->addItem("Test", "TestItem1", "PRD1", 100, 15, 1, "DIGITAL_GOODS");
            //$PayPalOrder->addItem("Test 2", "TestItem2", "PRD2", 50, 7.5, 2, "DIGITAL_GOODS");
            $response = $PayPalOrder->createOrder();
            $_SESSION["orderid"] = $response[1]->result->id;
            \Utilities\Site::redirectTo($response[0]->href);
            die();
        }

        \Views\Renderer::render("paypal/checkout", $viewData);
    }
}
?>
