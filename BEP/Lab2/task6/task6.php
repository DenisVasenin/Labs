<?php
if (isset($_SERVER['QUERY_STRING'])) {
    $query = $_SERVER['QUERY_STRING'];
    parse_str($query, $output);
    echo $output['arg1'] + $output['arg2'];
}
