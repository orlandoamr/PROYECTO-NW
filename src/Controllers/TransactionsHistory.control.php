<?php
    namespace Controllers;

    class TransactionsHistory extends \Controllers\PrivateController
    {
        public function run():void
        {
        
            $viewData = array();
            $id = 1;
            $tmpProductos = \Dao\TransactionsList::getUserTransactions($id);
        }
    }
?>