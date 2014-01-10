<?php

include 'secret.php';

if ($_REQUEST['secret'] != $secret) { die(); }

echo 'Auth successfull';

$j = json_decode($_REQUEST['payload']);
$ref = $j->ref;
$after = $j->after;
$before = $j->before;
$repo_name = $j->repository->name;
file_put_contents('pipe', $ref.','.$after.','.$before.','.$repo_name, FILE_APPEND | LOCK_EX);

?>
