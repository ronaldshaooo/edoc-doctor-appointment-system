<?php

    session_start();

    if(isset($_SESSION["user"])){
        if(($_SESSION["user"])=="" or $_SESSION['usertype']!='a'){
            header("location: ../login.php");
        }

    }else{
        header("location: ../login.php");
    }
    
    
    if($_GET){
        //import database
        include("../connection.php");
        $id=$_GET["id"];
        $delete=$_GET["delete"];

        if($delete == "0"){
            //$result001= $database->query("select * from schedule where scheduleid=$id;");
            //$email=($result001->fetch_assoc())["docemail"];
            $sql= $database->query("delete from appointment where appoid='$id';");
            //$sql= $database->query("delete from doctor where docemail='$email';");
            //print_r($email);
        }else{
            $sqlmain= "select * from appointment where appoid=?";
            $stmt = $database->prepare($sqlmain);
            $stmt->bind_param("s",$id);
            $stmt->execute();
            $userrow = $stmt->get_result();
            $userfetch=$userrow->fetch_assoc();
            $pid= $userfetch["pid"];
            $scheduleid=$userfetch["scheduleid"];
            $appodate=$userfetch["appodate"];

            $sql2="insert into blacklist(pid,appodate) values ($pid,'$appodate')";
            $result= $database->query($sql2);

            $sql= $database->query("delete from appointment where appoid='$id';");
        }
        
        header("location: appointment.php");
    }


?>