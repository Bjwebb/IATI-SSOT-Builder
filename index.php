<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css" />

<div class="container">
<table class="table table-striped">
<tbody>
<thead>
    <th>Repository</th>
    <th>Preview</th>
    <th>Commit</th>
    <th>Author</th>
</thead>
<?php

$lines = explode("\n", file_get_contents('log'));
$lines = array_reverse($lines);

foreach ($lines as $line) {
    if ($line=='') continue;
    list($ref,$after,$before,$repo_name) = explode(",",$line);
    $j = json_decode(file_get_contents("json/$after.json"));
    ?>
<tr>
    <td><?php echo $j->repository->name; ?></td>
    <td><a href="commit/<?php echo $j->repository->name .'/'. $j->head_commit->id; ?>/en/index.html">HTML</a></td>
    <td><?php echo $j->head_commit->message; ?></td>
    <td><?php echo $j->head_commit->author->name; ?></td>
</tr>
    <?php

}

?>
</tbody>
</table>
</div>

