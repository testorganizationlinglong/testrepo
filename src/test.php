<?php include_once 'include/common.php'?>
<!--
To change this template, choose Tools | Templates
and open the template in the editor.
-->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
      
        <?php
             $db = new PDO(CONNECTIONSTRING,USER,PASSWORD);
              $stmt = $db->query("SELECT * FROM schedule_land");
              while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    echo $row['no'].' '.$row['ad_term1'] . "<br>"; //etc...
              }
        ?>
    </body>
</html>
