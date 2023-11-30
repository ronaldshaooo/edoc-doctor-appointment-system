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

            $sqlcheck= "select count(*)  from appointment where pid=? and scheduleid=?";
            $stmt = $database->prepare($sqlcheck);
            $stmt->bind_param("ss",$userid,$scheduleid);
            $stmt->execute();
            $countrow = $stmt->get_result();
            $countfetch=$countrow->fetch_assoc();
            $count=$countfetch["count(*)"];

            if($count == 0)
            {
                $blacklistcheck = "select count(*) FROM blacklist WHERE pid=?  AND appodate >= DATE_FORMAT(CURDATE(), '%Y-%m-01') - INTERVAL 3 MONTH";
                $stmt = $database->prepare($blacklistcheck);
                $stmt->bind_param("s",$userid);
                $stmt->execute();
                $blacklistrow = $stmt->get_result();
                $blacklistfetch=$blacklistrow->fetch_assoc();
                $blacklistcount=$blacklistfetch["count(*)"];
                
                //3個月內3次沒報到
                if($blacklistcount < 3){
                    $sql2="insert into appointment(pid,apponum,appodate) values ($userid,$apponum,'$date')";
                    $result= $database->query($sql2);
                    //echo $apponom;
                    header("location: appointment.php?action=booking-added&id=".$apponum."&titleget=none");
                }else{
                    //黑名單
                    header("location: appointment.php?action=booking-blacklist&id=".$count."&titleget=none");
                }
            }else{
                header("location: appointment.php?action=booking-reject&id=".$count."&titleget=none");
            }
        }
    }
 ?>