<?php 
namespace Dao;

class ProductoPanel extends Table{
    
    public static function getAllProductos()
    {
        $registros = array();
        $registros = self::obtenerRegistros(
            "SELECT * from products;",
            array()
        );
        
        return $registros;
    }

    public static function getProductoById($id)
    {
        $sqlstr = "SELECT * from products where prdcod=:id;";
        $parameters = array("id" => $id);
        $registro = self::obtenerUnRegistro($sqlstr, $parameters);
        return $registro;

    }

    public static function getActiveProducts(){
        $sqlstr = "SELECT *FROM products WHERE prdest='ACT'";
        
        $registros =  self::obtenerRegistros($sqlstr, array());

        return $registros;
    }

    public static function getProductsCategories(){
        $sqlstr = "SELECT DISTINCT prdctg FROM products WHERE prdest='ACT'";
        
        $registros =  self::obtenerRegistros($sqlstr, array());

        return $registros;
    }
    
    public static function addProducto($prddsc, $prdprc, $prdImgPrm, $prdImgScd)
    {
        $insSQL = "INSERT INTO `products` (`prddsc`, `prdprc`, `prdImgPrm`, prdImgScd) VALUES (:prddsc, :prdprc, :prdImgPrm, :prdImgScd);";
        $parameters = array(
            "prddsc" => $prddsc,
            "prdprc" => $prdprc,
            "prdImgPrm" => $prdImgPrm,
            "prdImgScd" => $prdImgScd,

        );

        return self::executeNonQuery($insSQL, $parameters);
    }

    public static function updateProducto($prddsc, $prdprc, $prdImgPrm, $prdImgScd, $prdcod)
    {
        $updSQL = "UPDATE `products` set `prddsc`=:prddsc, `prdprc`=:prdprc, `prdImgPrm`=:prdImgPrm, `prdImgScd`=:prdImgScd where prdcod=:prdcod;";
        $parameters = array(
            "prddsc" => $prddsc,
            "prdprc" => $prdprc,
            "prdImgPrm" => $prdImgPrm,
            "prdImgScd" => $prdImgScd,
            "prdcod" => $prdcod,
        );

        return self::executeNonQuery($updSQL, $parameters);
    }

    public static function deleteProducto($prdcod)
    {
        $delSQL = "DELETE FROM `products`  where `prdcod`=:prdcod;";
        $parameters = array(
            "prdcod" => $prdcod
        );

        return self::executeNonQuery($delSQL, $parameters);
    }

   

}



?>
