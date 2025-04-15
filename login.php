<?php
session_start();
include 'includes/db.php';

$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = $_POST['email'] ?? '';
    $password = $_POST['password'] ?? '';

    // First check if the user is an employee
    $stmt = $conn->prepare("SELECT * FROM employees WHERE email = :email");
    $stmt->execute(['email' => $email]);
    $employee = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($employee && password_verify($password, $employee['password'])) {
        $_SESSION['employee_id'] = $employee['employee_id'];
        $_SESSION['role'] = $employee['role'];
        $_SESSION['name'] = $employee['name'];

        // Redirect based on role
        if ($employee['role'] === 'manager') {
            header("Location: manager/manager_dashboard.php");
        } elseif ($employee['role'] === 'salesman') {
            header("Location: employee/employee_dashboard.php");
        }
        exit();
    }

    // If not an employee, check if the user is a customer
    $stmt = $conn->prepare("SELECT * FROM customers WHERE email = :email");
    $stmt->execute(['email' => $email]);
    $customer = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($customer && password_verify($password, $customer['password'])) {
        $_SESSION['customer_id'] = $customer['customer_id'];
        $_SESSION['name'] = $customer['name'];
        header("Location: customer/customer_dashboard.php");
        exit();
    }

    // If both checks fail
    $error = "Invalid email or password!";
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
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

        div.left {
            background-color: #7494ec;
            width: 50%;
            height: inherit;
            border-radius: 30px 30% 30% 30px;
            float: left;
            position: relative;
        }

        div.left div {
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
        }

        div.left div p {
            color: #fff;
            font-size: 36px;
            font-weight: bolder;
        }

        div.left div a {
            display: block;
            color: #fff;
            text-decoration: none;
            font-size: 14.5px;
            margin-top: 20px;
        }

        div.right {
            margin-top:  90px;
            width: 50%;
            height: 100%;
            position: relative;
            float: right;
            padding: 40px;
        }

        div.right h1 {
            font-size: 36px;
            text-align: center;
            font-weight: bold;
            opacity: 70%;
            margin-bottom: 30px;
        }

        div.right input {
            padding: 13px 50px 13px 20px;
            margin: 10px 0;
            background-color: #efefef;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            width: 100%;
        }

        div.right button {
            background-color: #7494ec;
            width: 100%;
            height: 48px;
            color: #fff;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
        }

        .error {
            color: #ff4444;
            text-align: center;
            margin-bottom: 15px;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <form action="" method="post" id="Login">
        <div class="left">
            <div>
                <p>Hello, Welcome!</p>
                <a href="register.php">Don't have an account?
                    <button type="button" style="margin-top: 15px; padding: 10px 25px; background: white; color: #7494ec; border: none; border-radius: 8px; font-weight: bold; cursor: pointer;">
                         Register
                     </button>
                </a>
            </div>
        </div>

        <div class="right">
            <div>
                <?php if (!empty($error)) echo "<p class='error'>$error</p>"; ?>
                <h1>Login</h1>
                <input type="email" name="email" placeholder="Email" required />
                <input type="password" name="password" placeholder="Password" required />
                <button type="submit">Login</button>
            </div>
        </div>
    </form>
</body>
</html>