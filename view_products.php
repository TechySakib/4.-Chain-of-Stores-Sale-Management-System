<?php
session_start();
require_once __DIR__ . '/db.php';

if (!isset($_SESSION['employee_id'])) {
    header("Location: login.php");
    exit();
}

try {
    // Get the assigned store ID for the employee
    $stmt = $conn->prepare("
        SELECT store_id 
        FROM employee_store_assignments 
        WHERE employee_id = :employee_id
    ");
    $stmt->bindParam(':employee_id', $_SESSION['employee_id']);
    $stmt->execute();
    $assignment = $stmt->fetch();

    if ($assignment) {
        $store_id = $assignment['store_id'];
        
        // Fetch products from the store
        $stmt = $conn->prepare("
            SELECT p.*, s.store_name 
            FROM products p
            LEFT JOIN stores s ON p.store_id = s.store_id
            WHERE p.store_id = :store_id
            ORDER BY p.name
        ");
        $stmt->bindParam(':store_id', $store_id);
        $stmt->execute();
        $products = $stmt->fetchAll();
    } else {
        $products = [];
    }
    
    if (empty($products)) {
        $no_products = "<p class='no-products'>No products available in your assigned store.</p>";
    }
} catch (PDOException $e) {
    die("Database error: " . $e->getMessage());
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Store Products</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        html, body {
            height: 100%;
        }

        body {
            background: linear-gradient(90deg, rgba(255, 255, 255, 1) 0%, rgba(201, 214, 255, 1) 100%);
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            padding: 20px;
        }

        .wrapper {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px;
        }

        .dashboard-container {
            width: 850px;
            height: 550px;
            background-color: #fff;
            border-radius: 30px;
            margin: 150px auto;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            display: flex;
        }

        .left-panel {
            background-color: #7494ec;
            width: 50%;
            height: 100%;
            border-radius: 30px 30% 30% 30px;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
        }

        .left-panel-content h2 {
            font-size: 36px;
            font-weight: bolder;
            margin-bottom: 20px;
        }

        .right-panel {
            width: 50%;
            padding: 40px 30px;
            display: flex;
            flex-direction: column;
        }

        .right-panel h1 {
            font-size: 28px;
            text-align: center;
            font-weight: bold;
            color: #7494ec;
            margin-bottom: 20px;
        }

        .products-container {
            flex-grow: 1;
            overflow-y: auto;
            padding-right: 10px;
        }

        .product-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px;
            border-bottom: 1px solid #eee;
        }

        .product-info {
            flex-grow: 1;
        }

        .product-name {
            font-weight: 600;
            color: #333;
            margin-bottom: 5px;
        }

        .product-details {
            display: flex;
            gap: 15px;
            font-size: 14px;
            color: #666;
        }

        .product-price {
            color: #7494ec;
            font-weight: bold;
        }

        .product-quantity {
            background-color: #f8f9fa;
            padding: 3px 8px;
            border-radius: 10px;
            font-size: 13px;
        }

        .no-products {
            text-align: center;
            padding: 20px;
            color: #6c757d;
        }

        .back-link {
            display: inline-block;
            background-color: #7494ec;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 12px 20px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            transition: all 0.3s;
            margin-top: 15px;
            align-self: center;
        }

        .back-link:hover {
            background-color: #5a7bd4;
            transform: translateY(-2px);
        }

        .welcome-message {
            font-size: 16px;
            text-align: center;
            margin-bottom: 20px;
            color: #555;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <div class="left-panel">
            <div class="left-panel-content">
                <h2>Store Products</h2>
                <p>View all products in your assigned store</p>
            </div>
        </div>

        <div class="right-panel">
            <h1><i class="fas fa-boxes"></i> Product Inventory</h1>
            <p class="welcome-message">Hello, <?php echo isset($_SESSION['employee_name']) ? htmlspecialchars($_SESSION['employee_name']) : 'Employee'; ?>!</p>
            
            <div class="products-container">
                <?php if (isset($no_products)): ?>
                    <div class="no-products">
                        <?php echo $no_products; ?>
                    </div>
                <?php else: ?>
                    <?php foreach ($products as $product): ?>
                        <div class="product-item">
                            <div class="product-info">
                                <div class="product-name"><?php echo htmlspecialchars($product['name']); ?></div>
                                <div class="product-details">
                                    <span class="product-price">$<?php echo number_format($product['price'], 2); ?></span>
                                    <span class="product-store"><?php echo htmlspecialchars($product['store_name'] ?? 'All Stores'); ?></span>
                                </div>
                            </div>
                            <div class="product-quantity">
                                Qty: <?php echo htmlspecialchars($product['stock_quantity']); ?>
                            </div>
                        </div>
                    <?php endforeach; ?>
                <?php endif; ?>
            </div>
            
            <a href="employee_dashboard.php" class="back-link">
                <i class="fas fa-arrow-left"></i> Back to Dashboard
            </a>
        </div>
    </div>
    
    <?php include 'footer.php'; ?>
</body>
</html>