<?php
    require_once $_SERVER['DOCUMENT_ROOT'].'/wearnrock/core/init.php';
    $mode = sanitize($_POST['mode']);
    if(isset($_POST['usr_id'])){
        $usr_id = sanitize($_POST['usr_id']);
    }else{
        $usr_id = '';
    }
    $edit_size = sanitize($_POST['edit_size']);
    $edit_id = sanitize($_POST['edit_id']);
    if(isset($_POST['crt_id'])){
        $crt_id = sanitize($_POST['crt_id']);
    }else{
        $crt_id = '';
    }
    if(!empty($usr_id)){
        $cartQ = $db->query("SELECT * FROM cart WHERE usr_id ='{$user_id}' AND paid = 0 ORDER BY id DESC LIMIT 1");
    }elseif(!empty($crt_id)){
        $cartQ = $db->query("SELECT * FROM cart WHERE id = '{$crt_id}'");
    }else{
        $cartQ = $db->query("SELECT * FROM cart WHERE id = '{$cart_id}'");
    }
    $result = mysqli_fetch_assoc($cartQ);
   
    $items = json_decode($result['items'],true);
    $updated_items = array();
    $domain = (($_SERVER['HTTP_HOST'] != 'localhost')?'.'.$_SERVER['HTTP_HOST']:false);
    if($mode == 'removeone'){
        foreach ($items as $item) {
            if($item['id'] == $edit_id && $item['size'] == $edit_size){
                $item['quantity'] = $item['quantity'] - 1;
            }
            if($item['quantity'] > 0){
                $updated_items[] = $item;
            }
        }
    }

    if($mode == 'addone'){
        foreach ($items as $item) {
            if($item['id'] == $edit_id && $item['size'] == $edit_size){
                $item['quantity'] = $item['quantity'] + 1;
            }
            $updated_items[] = $item;
        }
    }
  
    if(!empty($updated_items)){
        $json_updated = json_encode($updated_items);
        if($usr_id != ''){
            $db->query("UPDATE cart SET items = '{$json_updated}' WHERE id = '{$crt_id}'");
        }elseif($crt_id != '' && $usr_id != ''){
            $db->query("UPDATE cart SET items = '{$json_updated}' WHERE id = '{$crt_id}' AND usr_id = '{$usr_id}'");
        }else{
            $db->query("UPDATE cart SET items = '{$json_updated}' WHERE id = '{$cart_id}'");
        }
        $_SESSION['success_flash'] = 'Your shopping cart has been updated!';
    }

    if(empty($updated_items)){
        if($usr_id = ''){
            $db->query("DELETE FROM cart WHERE id = '{$cart_id}'");
        }elseif($crt_id != '' && $usr_id != ''){
            $db->query("DELETE FROM cart WHERE id = '{$crt_id}' AND usr_id = '{$usr_id}'");
        }else{
            $db->query("DELETE FROM cart WHERE id = '{$cart_id}'");
        }
        setcookie(CART_COOKIE,'',1,"/",$domain,false);
    } 
?>
