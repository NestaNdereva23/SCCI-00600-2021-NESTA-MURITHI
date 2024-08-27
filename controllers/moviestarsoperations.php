<?php
    require_once("../models/moviestars.php");

    $moviestar = new moviestar();

    if(isset($_POST['savemoviestars'])){
        $starid=$_POST['starid'];
        $firstname=$_POST['firstname'];
        $lastname=$_POST['lastname'];
        $response=$moviestar->savemoviestar($starid,$firstname,$lastname);
        echo json_encode($response);
    }

    if(isset($_GET['getmoviestars'])){
        echo $moviestar->getmoviestars();
    }

    if(isset($_GET['getmoviestardetails'])){
        $starid=$_GET['starid'];
        echo $moviestar->getmoviestardetails($starid);
    }

    if(isset($_POST['deletemoviestar'])){
        $starid=$_POST['starid'];
        $response=$moviestar->deletemoviestar($starid);
        echo json_encode($response);
    }

?>