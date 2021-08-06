<?php
    namespace Controllers;

    class TransactionsHistory extends \Controllers\PublicController
    {
        public function run():void
        {
            \Utilities\Site::addLink("public/css/bootstrap.min.css");

            if(\Utilities\Security::isLogged()){
                $viewData = array();

                $userId = \Utilities\Security::getUserId();

                $transactions = \Dao\Transactions::getUserTransactions($userId);
                
                $cont = 0;
                $viewData["transactions"]= array();

                foreach ($transactions as $row=>$item){
                    $viewData["transactions"][$cont]["products"] = json_decode($item["htprds"], TRUE); 
                    $viewData["transactions"][$cont]["date"] = $item["fchtrs"];
                    $viewData["transactions"][$cont]["total"] = $item["total"];
                    $cont++;
                }

                \Views\Renderer::render("transactions", $viewData);

            }else{
                \Utilities\Site::redirectTo(
                    "index.php?page=sec_login"
                );
            }

           
        }
    }
?>