<?php
    require_once 'core/init.php';
    unset($_SESSION['SBUser']);
    if (isset($_COOKIE['CART_COOKIE'])) {
        unset($_COOKIE['CART_COOKIE']);
        setcookie('CART_COOKIE', '', time() - 3600, '/'); // empty value and old timestamp
    }
    header('Location: login.php');
?>