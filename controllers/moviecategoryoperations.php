<?php
    require_once("../models/moviecategories.php");

    $category= new category();

    if(isset($_POST['savemoviecategory'])){
        $categoryid=$_POST['categoryid'];
        $categoryname=$_POST['categoryname'];
        $categorydescription=$_POST['categorydescription'];
        $response=$category->savemoviecategory($categoryid,$categoryname,$categorydescription);
        echo json_encode($response);
    }

    if(isset($_GET['getmoviecategories'])){
        echo $category->getcategories();
    }

    if(isset($_GET['getmoviecategorydetails'])){
        $categoryid=$_GET['categoryid'];
        echo $category->getcategorydetails($categoryid);
    }

    if(isset($_POST['deletemoviecategory'])){
        $categoryid=$_POST['categoryid'];
        $response=$category->deletemoviecategory($categoryid);
        echo json_encode($response);
    }

?>