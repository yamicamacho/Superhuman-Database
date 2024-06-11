<?php
require_once 'config.inc.php';
?>
<html>
<head>
    <title>Media List</title>
    <link rel="stylesheet" href="base.css">
</head>
<body>
<?php
require_once 'header.inc.php';
?>
<div>
    <h2>Media List</h2>
    
    <!-- Filter Form -->
    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
        <label for="format">Format:</label>
        <select name="format" id="format">
            <option value="">Select Format</option>
            <option value="Movie">Movie</option>
            <option value="Live Action TV Show">Live Action TV Show</option>
            <option value="Comic">Comic</option>
            <option value="Animated TV Show">Animated TV Show</option>
            <!-- Add other formats as necessary -->
        </select>
        <br><br>
        <label for="year">Release Year:</label>
        <input type="number" id="year" name="year">
        <br><br>
        <label for="publisher">Publisher:</label>
        <input type="text" id="publisher" name="publisher">
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
    $sql = "SELECT m.Title, m.Format, pa.PublisherName, ma.StartDate
            FROM MEDIA m
            LEFT JOIN PRODUCE pa ON m.Title = pa.MediaTitle
            LEFT JOIN MEDIA_AIRTIME ma ON m.Title = ma.Title";
    $filters = [];

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        if (!empty($_POST['format'])) {
            $filters[] = "m.Format = '" . $conn->real_escape_string($_POST['format']) . "'";
        }

        if (!empty($_POST['year'])) {
            $filters[] = "YEAR(ma.StartDate) = " . intval($_POST['year']);
        }

        if (!empty($_POST['publisher'])) {
            $filters[] = "pa.PublisherName LIKE '%" . $conn->real_escape_string($_POST['publisher']) . "%'";
        }

        if (count($filters) > 0) {
            $sql .= " WHERE " . implode(" AND ", $filters);
        }
    }

    $sql .= " ORDER BY m.Title";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        echo "<table border='1'>";
        echo "<tr><th>Title</th><th>Format</th><th>Publisher</th><th>Release Date</th></tr>";
        while($row = $result->fetch_assoc()) {
            echo "<tr>";
            echo "<td><a href='show_media.php?title=" . urlencode($row["Title"]) . "'>" . htmlspecialchars($row["Title"]) . "</a></td>";
            echo "<td>" . htmlspecialchars($row["Format"]) . "</td>";
            echo "<td>" . htmlspecialchars($row["PublisherName"]) . "</td>";
            echo "<td>" . htmlspecialchars($row["StartDate"]) . "</td>";
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
