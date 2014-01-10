<?php

include 'secret.php';

if ($_REQUEST['secret'] != $secret) { die(); }

echo 'Auth successfull';

$json = $_REQUEST['payload'];
$j = json_decode($json);
$ref = $j->ref;
$after = $j->after;
file_put_contents("json/$after.json", $json);
$before = $j->before;
$repo_name = $j->repository->name;
file_put_contents('log', $ref.','.$after.','.$before.','.$repo_name."\n", FILE_APPEND | LOCK_EX);
file_put_contents('pipe', $ref.','.$after.','.$before.','.$repo_name."\n", FILE_APPEND | LOCK_EX);

?>
