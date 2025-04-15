<?php
session_start();
include 'includes/db.php';

$error = '';
$success = '';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST['name'] ?? '';
    $email = $_POST['email'] ?? '';
    $password = $_POST['password'] ?? '';
    $confirm_password = $_POST['confirm_password'] ?? '';

    // Validate inputs
    if (empty($name) || empty($email) || empty($password) || empty($confirm_password)) {
        $error = "All fields are required!";
    } elseif ($password !== $confirm_password) {
        $error = "Passwords do not match!";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $error = "Invalid email format!";
    } else {
        // Check if email already exists
        $stmt = $conn->prepare("SELECT email FROM customers WHERE email = :email");
        $stmt->execute(['email' => $email]);
        
        if ($stmt->rowCount() > 0) {
            $error = "Email already registered!";
        } else {
            // Hash the password
            $hashed_password = password_hash($password, PASSWORD_DEFAULT);

            try {
                $stmt = $conn->prepare("INSERT INTO customers (name, email, password) VALUES (:name, :email, :password)");
                $stmt->execute([
                    ':name' => $name,
                    ':email' => $email,
                    ':password' => $hashed_password
                ]);
                
                $_SESSION['registration_success'] = true;
                header("Location: login.php");
                exit();
            } catch (PDOException $e) {
                $error = "Registration failed: " . $e->getMessage();
            }
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Poppins", sans-serif;
            text-decoration: none;
            list-style: none;
        }

        body {
            background: linear-gradient(90deg, rgba(255, 255, 255, 1) 0%, rgba(201, 214, 255, 1) 100%);
            height: 100vh;
        }

        form {
            width: 850px;
            height: 550px;
            background-color: #fff;
            border-radius: 30px;
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        .left {
            background-color: #7494ec;
            width: 50%;
            height: inherit;
            border-radius: 30px 30% 30% 30px;
            position: relative;
            float: left;
        }

        .left div {
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
        }

        .left div p {
            color: #fff;
            font-size: 36px;
            font-weight: bolder;
        }

        .left div a {
            color: #fff;
            text-decoration: none;
            font-size: 14.5px;
            margin-top: 20px;
        }

        .right {
            width: 50%;
            height: 100%;
            position: relative;
            float: right;
            padding: 40px;
        }

        .right div {
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            width: 80%;
        }

        .right h1 {
            font-size: 36px;
            text-align: center;
            font-weight: bold;
            margin-bottom: 30px;
        }

        .right input {
            padding: 13px 50px 13px 20px;
            margin: 10px 0;
            background-color: #efefef;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            width: 100%;
        }

        .right input:focus {
            outline-color: transparent;
        }

        .success {
            color: #4CAF50;
            text-align: center;
            margin-bottom: 15px;
            font-size: 14px;
        }

        .error {
            color: #ff4444;
            text-align: center;
            margin-bottom: 15px;
            font-size: 14px;
        }

        button {
            background-color: #7494ec;
            width: 100%;
            height: 48px;
            color: #fff;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            transition: all 0.3s;
            margin-top: 10px;
        }

        button:hover {
            background-color: #5a7bd4;
        }
    </style>
</head>
<body>
    <form action="" method="post" id="Register">
        <div class="left">
            <div>
                <p>Hello, Customer!</p>
                <a href="login.php">Already have an account?
                    <button type="button" style="margin-top: 15px; padding: 10px 25px; background: white; color: #7494ec; border: none; border-radius: 8px; font-weight: bold; cursor: pointer;">
                         login
                     </button>
                </a>
            </div>
        </div>

        <div class="right">
            <div>
                <?php 
                if (isset($_SESSION['registration_success'])) {
                    echo "<p class='success'>Registration successful! Please login.</p>";
                    unset($_SESSION['registration_success']);
                }
                if (!empty($error)) echo "<p class='error'>$error</p>"; 
                ?>
                
                <h1>Create Account</h1>

                <input type="text" name="name" placeholder="Full Name" required />
                <input type="email" name="email" placeholder="Email" required />
                <input type="password" name="password" placeholder="Password" required />
                <input type="password" name="confirm_password" placeholder="Confirm Password" required />

                <button type="submit">Register</button>
            </div>
        </div>
    </form>
</body>
</html>
