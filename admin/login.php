<?php
    require_once '../core/init.php';
    include 'includes/head.php';

    $email = ((isset($_POST['email']))?sanitize($_POST['email']):'');
    $email = trim($email);
    $password = ((isset($_POST['password']))?sanitize($_POST['password']):'');
    $password = trim($password);
    $errors = array();
?>

<style>
    a{
        padding: 5px;
        border-radius: 15px;
        box-shadow: 1px 1px 7px 3px rgba(0,0,0,0.6);
    }
</style>
<div id="login-form">
    <div>
    
    <?php 
        if($_POST) {
            //form validation
            if(empty($_POST['email']) || empty($_POST['password'])) {
                $errors[] = 'You must Provide email and password.';
            }
            //validate email
            if(!filter_var($email,FILTER_VALIDATE_EMAIL)) {
                $errors[] = 'You must enter a Valid email';
            }
            
            //password is more than 6 characters.
            if(strlen($password) < 6) {
                $errors[] = 'Password must at least 6 Characters.';
            }
            
            //Check if email exists in the database
            $query = $db->query("SELECT * FROM users WHERE email = '$email'");
            $user = mysqli_fetch_assoc($query);
            $userCount = mysqli_num_rows($query);
            if($userCount < 1) {
                $errors[] = 'That email doesn\'t exist in our database'; 
            }
            
            if(!password_verify($password, $user['password'])) {
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
    ?>
        
    </div>
    <h2 class="text-center">Login</h2><hr>
    <form action="login.php" method="post">
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" name="email" id="email" class="form-control" value="<?=$email;?>">
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" name="password" id="password" class="form-control" value="<?=$password;?>">
        </div>
        <div class="form-group">
            <input type="submit" value="Login" class="btn btn-primary">
        </div>
    </form>
    <p class="text-right"><a href="/wearnrock/index.php" alt='home'>Visit Site</a></p>
</div>

<?php include 'includes/footer.php'; ?>