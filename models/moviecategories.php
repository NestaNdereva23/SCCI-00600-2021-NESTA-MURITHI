<?php
    require_once("db.php");

    class category extends db{
        // check category
        function checkmoviecategory($categoryid,$categoryname){
            $sql="CALL `sp_checkmoviecategory`({$categoryid},'{$categoryname}')";
            return $this->getData($sql)->rowCount();
        }

        // save category
        function savemoviecategory($categoryid,$categoryname,$categorydescription){
            // check if category exists
            if($this-> checkmoviecategory($categoryid,$categoryname)){
                return ["status"=>"exists","message"=>"category exists"];
            }else{
                 $sql="CALL `sp_savemoviecategory`({$categoryid},'{$categoryname}','{$categorydescription}',{$this->userid})";
                $this->getData($sql);
                return ["status"=>"success","message"=>"category saved succesfully"];
            }
        }

        // get categories
        function getcategories(){
            $sql="CALL `sp_getmoviecategories`()";
            return $this->getJSON($sql);
        }

        // get category details
        function getcategorydetails($categoryid){
            $sql="CALL `sp_getmoviecategorydetails`({$categoryid})";
            return $this->getJSON($sql);
        }

        // delete category
        function deletemoviecategory($categoryid){
            $sql="CALL `sp_deletemoviecategory`({$categoryid},{$this->userid})";
            // echo $sql.PHP_EOL;
            $this->getData($sql);
            return ["status"=>"success","message"=>"movie category deleted successfully"];
        }
    }
?>