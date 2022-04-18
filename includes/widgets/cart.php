<h3 class="text-center">Shopping Cart</h3>
<div>
    <?php
        if(!empty($user_id)){
            $cartQ = $db->query("SELECT * FROM cart WHERE usr_id ='{$user_id}' AND paid = 0 ORDER BY id DESC LIMIT 1");
        }else if(!empty($cart_id) && empty($user_id)){
            $cartQ = $db->query("SELECT * FROM cart WHERE id ='{$cart_id}'");
        }else{
            $cartQ = (object) array('num_rows' => 0);
        }
        //print_r($cartQ['num_rows'] != 0);
        if($cartQ->num_rows != 0){
            $results = mysqli_fetch_assoc($cartQ);
            $items = json_decode($results['items'],true);
            $sub_total = 0;
        }else{
            $items = [];
            $sub_total = 0;
        }
    ?>
    <?php if(count($items) != 0){ ?>
        <table class="table table-condensed" id="cart_widget">
            <tbody>
                <?php foreach($items as $item):
                    $productQ = $db->query("SELECT * FROM products WHERE id = '{$item['id']}'");
                    $product = mysqli_fetch_assoc($productQ);
                ?>
                <tr>
                    <td class="text-left"><?=$item['quantity']; ?></td>
                    <td class="text-left"><?=substr($product['title'],0,15);?></td>
                    <td class="text-right"><?=money($item['quantity'] * $product['price']);?></td>
                </tr>

            <?php
                $sub_total += ($item['quantity'] * $product['price']);
                endforeach; ?>
            <tr>
                <td></td>
                <td><strong>Sub Total</strong></td>
                <td class="text-right"><?=money($sub_total);?></td>
            </tr>
            </tbody>
        </table>
        <a href="cart.php" class="btn btn-xs btn-primary pull-right">View Cart</a>
        <div class="clear-fix"></div>
        
        <?php }else{ ?>
            <p>Your shopping cart is empty.</p>
        <?php } ?>
</div>
