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
        $rank=$_GET["rank"];

        $sqlmain= "select * from appointment where appoid=?";
        $stmt = $database->prepare($sqlmain);
        $stmt->bind_param("s",$id);
        $stmt->execute();
        $userrow = $stmt->get_result();
        $userfetch=$userrow->fetch_assoc();
        $pid= $userfetch["pid"];
        $scheduleid=$userfetch["scheduleid"];
        $appodate=$userfetch["appodate"];

        //對預約按讚
        if($rank == "1"){
            $sql2="insert into appointment_review(pid,scheduleid,appodate,rank) values ($pid,$scheduleid,'$appodate','1')";
            $result= $database->query($sql2);
        }

        //$result001= $database->query("select * from schedule where scheduleid=$id;");
        //$email=($result001->fetch_assoc())["docemail"];
        $sql= $database->query("delete from appointment where appoid='$id';");
        $stmt = $database->prepare($sqlmain);
        $stmt->bind_param("i",$id);
        $stmt->execute();
        //$sql= $database->query("delete from doctor where docemail='$email';");
        //print_r($email);
        header("location: appointment.php");
    }


?>