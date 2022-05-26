<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Display Products</title>
    <style>
        body {
            text-align: center;
        }
        table {
        font-family: Arial, Helvetica, sans-serif;
        border-collapse: collapse;
        width: 60%;
        margin: 0 auto;
        }

        td, th {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 8px;
        }

        tr:nth-child(even) {
        background-color: #dddddd;
        }
    </style>
</head>
<body >
    <?php
        
        
    ?>

    <h2>Products Data</h2>
    <p>The Query is SELECT * FROM Products</p>

    <table>
        <tr>
            <th>Num</th>
            <th>Product</th>
            <th>Cost</th>
            <th>Weight</th>
            <th>Count</th>
        </tr>
        <?php
            include '../CONFIG.php';
            $connect = mysqli_connect($server, $user, $pass, $mydb);
    
            if (!$connect) {
                die ("Cannot connect to $server using $user");
            }
    
            $sql = "SELECT * FROM $table_name";
            $result = mysqli_query($connect, $sql);
    
            if (mysqli_num_rows($result) > 0) {
                // hiển thị dữ liệu trên trang
                while($row = mysqli_fetch_assoc($result)) {
                    echo "<tr>
                            <td>$row[$num]</td>
                            <td>$row[$product]</td>
                            <td>$row[$cost]</td>
                            <td>$row[$weight]</td>
                            <td>$row[$count]</td>
                        </tr>";
                    }
            } else {
                echo "0 results";
            }
            mysqli_close($connect);
        ?>
        
    </table>
    
</body>
</html>