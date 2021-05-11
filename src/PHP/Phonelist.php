<?php
header("content-type:text/html;charset=utf8");
$str = file_get_contents('https://openapi.vmall.com/mcp/v1/search/queryPrd');
echo $str;