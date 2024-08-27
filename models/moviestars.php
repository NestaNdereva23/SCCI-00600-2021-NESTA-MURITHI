<?php
    require_once("db.php");

    class moviestar extends db{
        // check 
        function checkmoviestars($starid,$firstname){
            $sql="CALL `sp_checkmoviestars`({$starid},'{$firstname}')";
            return $this->getData($sql)->rowCount();
        }

        // save moviestar...
        function savemoviestars($starid,$firstname,$lastname){
            // check if star exists
            if($this-> checkmoviestars($starid,$firstname)){
                return ["status"=>"exists","message"=>"moviestar exists"];
            }else{
                 $sql="CALL `sp_savemoviestars`({$starid},'{$firstname}','{$lastname}',{$this->userid})";
                $this->getData($sql);
                return ["status"=>"success","message"=>"moviestar saved succesfully"];
            }
        }

        // get moviestars
        function getmoviestars(){
            $sql="CALL `sp_getmoviestars`()";
            return $this->getJSON($sql);
        }

        // get star details
        function getmoviestardetails($starid){
            $sql="CALL `sp_getmoviestardetails`({$starid})";
            return $this->getJSON($sql);
        }

        // delete star
        function deletemoviestar($starid){
            $sql="CALL `sp_deletemoviestar`({$starid},{$this->userid})";
            // echo $sql.PHP_EOL;
            $this->getData($sql);
            return ["status"=>"success","message"=>"movie star deleted successfully"];
        }
    }
?>