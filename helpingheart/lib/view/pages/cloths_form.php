<?php
include 'connection.php';
header('Content-Type: application/json');


$response=array();

    $uid = $_POST["user_id"];
    $type = "cloths";
    $items = $_POST["items"];
    $description = $_POST["description"];
    $qty = $_POST["approxfood_inkg"];
    $img1 = $_POST["img1"];
    $img2 = $_POST["img2"];
    $status = "done";
    $result=mysqli_query($conn,"insert into tbl_donation(user_id,type,items,img1,img2,description,approxfood_inkg,status) values ('$uid','$type', '$items', '$img1', '$img2', '$description', '$qty','$status')");

    if($result==true)
    {
        $response["status"]="Success";
        $response['message'] = "Donation Successfully."; 
    }
    else
    {
        $response["status"]="Failure";
        $response['message'] = "Donation Fail"; 

    }
    echo json_encode($response);
?>