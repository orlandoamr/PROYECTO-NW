<?php
    namespace Dao;

    class Transactions extends Table{

        public static function getUserTransactions($id)
        {
            $registros = array();
            $parameters = array("id" => $id);
            $registros = self::obtenerRegistros(
                "SELECT htprds, fchtrs,total from historico_transacciones where usrcod=:id ORDER BY fchtrs desc;",
                $parameters
            );
            
            return $registros;
        }

        public static function addTransaction($htprds, $payres, $usrcod, $fchtrs, $total)
        {
            $insSQL = "INSERT INTO `historico_transacciones` (`htprds`, `payres`, `usrcod`, `fchtrs`, `total`) VALUES(:htprds, :payres, :usrcod, :fchtrs, :total)";

            $parameters = array(
                "htprds" => $htprds,
                "payres" => $payres,
                "usrcod" => $usrcod,
                "fchtrs" => $fchtrs,
                "total" => $total
            );
    
            return self::executeNonQuery($insSQL, $parameters);
        }

        
    }
?>