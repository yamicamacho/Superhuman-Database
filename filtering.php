<?php
require_once 'config.inc.php';
?>
<html>
<head>
    <title>Sample PHP Database Program</title>
    <link rel="stylesheet" href="base.css">
</head>
<body>
<?php
require_once 'header.inc.php';
?>
<div>
    <h2>Superhuman List</h2>
    
    <!-- Filter Form -->
    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
        <label for="alignment">Alignment:</label>
        <select name="alignment" id="alignment">
            <option value="">Select Alignment</option>
            <option value="Hero">Hero</option>
            <option value="Villain">Villain</option>
        </select>
        <br><br>
        <label for="origin">Origin:</label>
        <input type="text" id="origin" name="origin">
        <br><br>
        <label for="power">Power:</label>
        <input type="text" id="power" name="power">
        <br><br>
        <input type="submit" value="Filter">
    </form>
    
    <?php
    // Create connection
    $conn = new mysqli($servername, $username, $password, $database, $port);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Prepare SQL Statement with filters
    $sql = "SELECT DISTINCT s.superID, s.Alias, s.Origin, s.Alignment 
            FROM SUPERHUMAN s
            LEFT JOIN POWERS_POSSESSED pp ON s.superID = pp.ID
            LEFT JOIN POWERS p ON pp.PowerName = p.Name";
    $filters = [];

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        if (!empty($_POST['alignment'])) {
            $filters[] = "s.Alignment = '" . $conn->real_escape_string($_POST['alignment']) . "'";
        }

        if (!empty($_POST['origin'])) {
            $filters[] = "s.Origin LIKE '%" . $conn->real_escape_string($_POST['origin']) . "%'";
        }

        if (!empty($_POST['power'])) {
            $filters[] = "p.Name LIKE '%" . $conn->real_escape_string($_POST['power']) . "%'";
        }

        if (count($filters) > 0) {
            $sql .= " WHERE " . implode(" AND ", $filters);
        }
    }

    $sql .= " ORDER BY s.Alias";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        echo "<table border='1'>";
        echo "<tr><th>Alias</th><th>Origin</th><th>Alignment</th></tr>";
        while($row = $result->fetch_assoc()) {
            echo "<tr>";
            echo "<td><a href='show_superhuman.php?id=" . htmlspecialchars($row["superID"]) . "'>" . htmlspecialchars($row["Alias"]) . "</a></td>";
            echo "<td>" . htmlspecialchars($row["Origin"]) . "</td>";
            echo "<td>" . htmlspecialchars($row["Alignment"]) . "</td>";
            echo "</tr>";
        }
        echo "</table>";
    } else {
        echo "No results found.";
    }

    // Close connection
    $conn->close();
    ?>
</div>
</body>
</html>
