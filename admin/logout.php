<?php
    require_once $_SERVER['DOCUMENT_ROOT'].'/wearnrock/core/init.php';
    unset($_SESSION['SBUser']);
    header('Location: login.php');
?>