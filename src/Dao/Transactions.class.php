<?php
    namespace Dao;

    class Transactions extends Table{

        public static function getUserTransactions($id)
        {
            $registros = array();
            $parameters = array("id" => $id);
            $registros = self::obtenerRegistros(
                "SELECT * from historico_transacciones where usrcod=:id ORDER BY fchtrs desc;",
                $parameters
            );
            
            return $registros;
        }

        public static function addTransaction($htprds, $payres, $usrcod, $fchtrs)
        {
            $insSQL = "INSERT INTO `historico_transacciones` (`htprds`, `payres`, `usrcod`, `fchtrs`) VALUES(:htprds, :payres, :usrcod, :fchtrs)";

            $parameters = array(
                "htprds" => $htprds,
                "payres" => $payres,
                "usrcod" => $usrcod,
                "fchtrs" => $fchtrs
            );
    
            return self::executeNonQuery($insSQL, $parameters);
        }

        
    }
?>