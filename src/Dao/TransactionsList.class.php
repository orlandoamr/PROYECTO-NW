<?php
    namespace Dao;

    class TransactionsList extends Table{

        public static function getUserTransactions($id)
        {
            $registros = array();
            $registros = self::obtenerRegistros(
                "SELECT * from historico_transacciones where usrcod=':id';",
                array()
            );
            return $registros;
        }
    }
?>