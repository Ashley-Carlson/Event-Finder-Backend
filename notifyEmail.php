<?php
function emailNotifaction($message, $event, $address){
    // the message
$   msg = "message";

    // use wordwrap() if lines are longer than 70 characters
    $msg = wordwrap($msg,70);

    // send email
    mail($address,$event,$msg);
}

emailNotifaction("This is a test","Test", "mino2882@bears.unco.edu")
?>

