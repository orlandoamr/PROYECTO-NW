<?php
    namespace Controllers;

    class CartItems extends PublicController
    {

        public function run() :void 
        {

            if ($this->isPostBack()) {
                
               switch($_POST["action"]){
                    case "add":
                        
                        break;

                    case "rem":

                        break;

                    case "empty":

                        break;
               }
            }

        }
    }

?>