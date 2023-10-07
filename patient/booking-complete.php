<?php

    //learn from w3schools.com

    session_start();

    if(isset($_SESSION["user"])){
        if(($_SESSION["user"])=="" or $_SESSION['usertype']!='p'){
            header("location: ../login.php");
        }else{
            $useremail=$_SESSION["user"];
        }

    }else{
        header("location: ../login.php");
    }
    

    //import database
    include("../connection.php");
    $sqlmain= "select * from patient where pemail=?";
    $stmt = $database->prepare($sqlmain);
    $stmt->bind_param("s",$useremail);
    $stmt->execute();
    $userrow = $stmt->get_result();
    $userfetch=$userrow->fetch_assoc();
    $userid= $userfetch["pid"];
    $username=$userfetch["pname"];


    if($_POST){
        if(isset($_POST["booknow"])){
            $apponum=$_POST["apponum"];
            $scheduleid=$_POST["scheduleid"];
            $date=$_POST["date"];
            $scheduleid=$_POST["scheduleid"];

            $sqlcheck= "select count(*) from appointment where pid=? and scheduleid=?";
            $stmt = $database->prepare($sqlcheck);
            $stmt->bind_param("ss",$userid,$scheduleid);
            $stmt->execute();
            $checkcount = $stmt->get_result();

            if($checkcount == "0")
            {
                $sql2="insert into appointment(pid,apponum,scheduleid,appodate) values ($userid,$apponum,$scheduleid,'$date')";
                $result= $database->query($sql2);
                //echo $apponom;
                header("location: appointment.php?action=booking-added&id=".$apponum."&titleget=none");
            }else{
                header("location: appointment.php?action=booking-reject&id=".$apponum."&titleget=none");
            }
        }
    }
 ?>