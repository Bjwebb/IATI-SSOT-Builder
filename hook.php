<?php

include 'secret.php';

if ($_REQUEST['secret'] != $secret) { die(); }

$j = json_decode($_REQUEST['payload']);
$ref = $j->ref;
$after = $j->after;
$before = $j->before;
file_put_contents('pipe', $ref.','.$after.','.$before, FILE_APPEND | LOCK_EX);

?>
