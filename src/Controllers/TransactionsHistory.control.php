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
                
                // $cont = 0;
                // foreach ($transactions as $transaction){
                //    $viewData["transactions"][$cont] = $transaction;
                //    $cont++;
                // }
                
                $cont = 0;
                foreach ($transactions as $row=>$innerArray){
                    // $viewData["transactions"][$cont] = array(); //$innerArray;
                    // $cont++;

                    foreach ($innerArray as $innerRow=>$value){
                        $value = json_decode($value, TRUE);
                        $viewData['value']= $value;
                    }
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