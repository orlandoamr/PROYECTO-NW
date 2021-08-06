<?php
    namespace Controllers\Checkout;

    use Controllers\PrivateController;
    use Controllers\PublicController;

    class Accept extends PublicController{
        public function run():void
        {
            \Utilities\Site::addLink("public/css/bootstrap.min.css");
            
            $dataview = array();
            $token = $_GET["token"] ?: "";
            $session_token = $_SESSION["orderid"] ?: "";
            if ($token !== "" && $token == $session_token) {
                $result = \Utilities\Paypal\PayPalCapture::captureOrder($session_token);
                $dataview["orderjson"] = json_encode($result, JSON_PRETTY_PRINT);

                $productos = array();
                $productos = json_encode($_SESSION["cart_items"], JSON_PRETTY_PRINT);
                $total = 0.00;
                $userCod = \Utilities\Security::getUserId();

                $total = $_SESSION["total_cart"];
                $today = date("Y-m-d H:i:s");

                \Dao\Transactions::addTransaction($productos, $dataview["orderjson"], $userCod, $today, $total);

                $_SESSION["cart_items"] = null;
                $_SESSION["total_cart"] = null;

            } else {
                $dataview["orderjson"] = "No Order Available!!!";
            }
            \Views\Renderer::render("paypal/accept", $dataview);
        }
    }

?>
