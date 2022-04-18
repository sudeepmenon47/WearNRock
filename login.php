<?php
    require_once 'core/init.php';
    include 'includes/head.php';
    //Login
    $l_email = ((isset($_POST['l_email']))?sanitize($_POST['l_email']):'');
    $l_email = trim($l_email);
    $l_password = ((isset($_POST['l_password']))?sanitize($_POST['l_password']):'');
    $l_password = trim($l_password);
    $errors = array();
?>

<style>
    body{
        background-image: url("/wearnrock/images/headerlogo/login_background.jpg");
        background-size: 100vw 100vh;
        background-attachment: fixed;
    }
    a{
        padding: 5px;
        border-radius: 15px;
    }
</style>
<div id="login-form">
    <div>
    
    <?php 
        if (isset($_POST['login_user'])) {
            //form validation
            if(empty($_POST['l_email']) || empty($_POST['l_password'])) {
                $errors[] = 'You must Provide email and password.';
            }
            //validate email
            if(!filter_var($l_email,FILTER_VALIDATE_EMAIL)) {
                $errors[] = 'You must enter a Valid email';
            }
            
            //password is more than 6 characters.
            if(strlen($l_password) < 6) {
                $errors[] = 'Password must at least 6 Characters.';
            }
            
            //Check if email exists in the database
            $query = $db->query("SELECT * FROM users WHERE email = '$l_email'");
            $user = mysqli_fetch_assoc($query);
            $userCount = mysqli_num_rows($query);
            if($userCount < 1) {
                $errors[] = 'That email doesn\'t exist in our database'; 
            }
            
            if(!password_verify($l_password, $user['password'])) {
                $errors[] = 'The password does not match our records. Please try again!';
            }
            
            //Check for errors
            if(!empty($errors)) {
                echo display_errors($errors);
            }else {
                //log user in.
                $user_id = $user['id'];
                login($user_id);
            }
        }

        if (isset($_POST['reg_user'])) {
            $name = ((isset($_POST['name']))?sanitize($_POST['name']):'');
            $email = ((isset($_POST['email']))?sanitize($_POST['email']):'');
            $password = ((isset($_POST['password']))?sanitize($_POST['password']):'');
            $confirm = ((isset($_POST['confirm']))?sanitize($_POST['confirm']):'');
            $permissions = 'user';
            $errors = array();
            if($_POST) {
                $emailQuery = $db->query("SELECT * FROM users WHERE email = '$email'");
                $emailCount = mysqli_num_rows($emailQuery);
                
                if($emailCount != 0) {
                    $errors[] = 'That email already exists in our database.';
                }
                
                $required = array('name', 'email', 'password', 'confirm');
                foreach($required as $f) {
                    if(empty($_POST[$f])) {
                        $errors[] = 'You must fill out all fields.';
                        break;
                    }
                }
                if(strlen($password) < 6) {
                    $errors[] = 'Your password must be at least 6 characters!';
                }
                
                if($password != $confirm) {
                    $errors[] = 'Your password does not match';
                }
                
                if(!filter_var($email,FILTER_VALIDATE_EMAIL)) {
                    $errors[] = 'You must enter a valid email_id!';
                }
                
                if(!empty($errors)) {
                    echo display_errors($errors);
                }else {
                    //add user to database.
                    $hashed = password_hash($password,PASSWORD_DEFAULT);
                    $db->query("INSERT INTO users (`full_name`,`email`,`password`,`permissions`) VALUES ('$name','$email','$hashed','$permissions')");
                    $_SESSION['success_flash'] = 'Thank you for registering with WearNRock! Please Login to continue.';
                    header('Location: login.php');
                }
            }
        }
    ?>
        
    </div>
    <form action="login.php" method="post">
        <ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#login">Login In</a></li>
            <li><a data-toggle="tab" href="#signup">Sign Up</a></li>
        </ul>

        <div class="tab-content">
            <!-- Login -->
            <div id="login" class="tab-pane fade in active">
                <h1>Welcome Back!</h1>
                <form action="login.php" method="post">
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" name="l_email" id="l_email" class="form-control" value="<?=$l_email;?>">
                    </div>
                    <div class="form-group">
                        <label for="password">Password:</label>
                        <input type="password" name="l_password" id="l_password" class="form-control" value="<?=$l_password;?>">
                    </div>
                
                    <div class="form-group" style="text-align:center; margin-top:40px">
                        <input type="submit" value="Login" name="login_user" class="btn btn-primary">
                    </div>
                </form>
            </div>

            <!-- Sign up -->
            <div id="signup" class="tab-pane fade">  
                <h1>Sign Up for Free</h1>
                <form action="login.php" method="post">
                    <div class="form-group col-md-6">
                        <label for="name">Full Name:</label>
                        <input type="text" name="name" id="name" class="form-control" value="">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="email">Email:</label>
                        <input type="email" name="email" id="email" class="form-control" value="">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="password">Password:</label>
                        <input type="password" name="password" id="password" class="form-control" value="">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="confirm">Confirm:</label>
                        <input type="password" name="confirm" id="confirm" class="form-control" value="">
                    </div>
                    <div class="form-group" style="text-align:center; margin-top:40px">
                        <input type="submit" value="Register" name="reg_user" class="btn btn-primary">
                    </div>
                </form>

            </div>
        </div>
        <p class="text-right"><a href="/wearnrock/index.php" alt='home'>Visit Site</a></p>
       
    </form>
</div>

<?php include 'includes/footer.php'; ?>