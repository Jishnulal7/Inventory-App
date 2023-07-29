<?php

include 'C:\xampp\htdocs\inventory\connection.php';

$Email = $_POST['email'];
$Password = $_POST['password'];
$Username = $_POST['username'];
$Mobile = $_POST['mobile'];

// Check if the user exists in 'login_tb'
$sql_check_user = "SELECT * FROM login_tb WHERE email = '$Email'";
$result_check_user = mysqli_query($con, $sql_check_user);

$myarray = array(); // Create an empty array to store the response data

if (mysqli_num_rows($result_check_user) > 0) {
    // User already exists
    $myarray['result'] = 'user_exists';
} else {
    // Insert data into 'login_tb'
    $sql_insert_login = "INSERT INTO login_tb (email, password  ) VALUES ('$Email', '$Password')";
    if (mysqli_query($con, $sql_insert_login)) {
        $userID = mysqli_insert_id($con);

        // Insert data into 'register_tb'
        $sql_insert_register = "INSERT INTO register_tb ( log_id,username,mobile) VALUES ('$userID','$Username','$Mobile')";
        if (mysqli_query($con, $sql_insert_register)) {
            $myarray['result'] = 'success';
        } else {
            $myarray['result'] = 'failed';
            $myarray['error'] = mysqli_error($con); // Get the specific error message for debugging.
        }
    } else {
        $myarray['result'] = 'failed';
        $myarray['error'] = mysqli_error($con); // Get the specific error message for debugging.
    }
}

// Send the response as JSON
header('Content-Type: application/json');
echo json_encode($myarray);
?>