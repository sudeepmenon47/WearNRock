<!-- Top nvbar Default -->
<?php
    $sql = "SELECT * FROM categories WHERE parent = 0";
    $pquery = $db->query($sql);
?>
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <a href="index.php" class="navbar-brand">WearNRock</a>
                <ul class="nav navbar-nav">
                    <?php while($parent = mysqli_fetch_assoc($pquery)) : ?>
                    <?php 
                        $parent_id = $parent['id']; 
                        $sql2 = "SELECT * FROM categories WHERE parent = '$parent_id'";
                        $cquery = $db->query($sql2);
                    ?>
                    <!-- Menu Items -->
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><?php echo $parent['category']; ?> <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <?php while($child = mysqli_fetch_assoc($cquery)) : ?>
                            <li><a href="category.php?cat=<?=$child['id'];?>"><?php echo $child['category']; ?></a></li>
                            <?php endwhile; ?>
                        </ul>
                    </li>
                    <?php endwhile; ?>
                    <li><a href="cart.php"><span class="glyphicon glyphicon-shopping-cart"></span> My Cart</a></li>
                </ul>
                <?php if(isset($user_data['first'])){ ?>
                    <ul class="nav navbar-nav" style="float: right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Hello <?=$user_data['first'];?>!
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="change_password.php">Change Password</a></li>
                                <li><a href="logout.php">Log Out</a></li>
                            </ul>
                        </li>
                    </ul>
                <?php }else{ ?> 
                    <div style="margin-top:15px; float:right"><a href="login.php"><span class="glyphicon glyphicon-user"></span> Login</a></div>
                <?php } ?>
            </div>
        </nav>