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

<?php
if (!isset($_GET['id'])) {
    die("Error: Superhuman ID not provided.");
}

$superID = intval($_GET['id']);

// Create connection
$conn = new mysqli($servername, $username, $password, $database, $port);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Handle form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $newFname = $_POST['fname'];
    $newMname = $_POST['mname'];
    $newLname = $_POST['lname'];

    // Update the real name in the database
    $update_realname_sql = "UPDATE SUPERHUMAN_REALNAME SET Fname = ?, Mname = ?, Lname = ? WHERE heroID = ?";
    $update_realname_stmt = $conn->prepare($update_realname_sql);
    if (!$update_realname_stmt) {
        die("Prepare failed: (" . $conn->errno . ") " . $conn->error);
    }
    $update_realname_stmt->bind_param("sssi", $newFname, $newMname, $newLname, $superID);
    
    if ($update_realname_stmt->execute()) {
        // Redirect to avoid resubmission
        echo '<script>window.location.href=window.location.href;</script>';
    } else {
        echo "<p>Error updating real name: " . $conn->error . "</p>";
    }
    $update_realname_stmt->close();
}

// Fetch superhuman details
$superhuman_sql = "SELECT * FROM SUPERHUMAN WHERE superID = ?";
$superhuman_stmt = $conn->prepare($superhuman_sql);
if (!$superhuman_stmt) {
    die("Prepare failed: (" . $conn->errno . ") " . $conn->error);
}
$superhuman_stmt->bind_param("i", $superID);
$superhuman_stmt->execute();
$superhuman_stmt->bind_result($superID, $alias, $origin, $alignment); // Bind columns to variables
$superhuman_stmt->fetch(); // Fetch the result

echo '<div class="content">';

if (!empty($superID)) {
    echo "<h2>Superhuman Details</h2>";
    echo "<p><strong>Alias:</strong> " . htmlspecialchars($alias) . "</p>";
    echo "<p><strong>Origin:</strong> " . htmlspecialchars($origin) . "</p>";
    echo "<p><strong>Alignment:</strong> " . htmlspecialchars($alignment) . "</p>";
} else {
    echo "No superhuman found with ID: " . $superID;
}

// Close the statement
$superhuman_stmt->close();

// Fetch real name
$realname_sql = "SELECT Fname, Mname, Lname FROM SUPERHUMAN_REALNAME WHERE heroID = ?";
$realname_stmt = $conn->prepare($realname_sql);
if (!$realname_stmt) {
    die("Prepare failed: (" . $conn->errno . ") " . $conn->error);
}
$realname_stmt->bind_param("i", $superID);
$realname_stmt->execute();
$realname_stmt->bind_result($fname, $mname, $lname);

echo "<h3>Real Name</h3>";
if ($realname_stmt->fetch()) {
    echo "<p>" . htmlspecialchars($fname) . " " . htmlspecialchars($mname) . " " . htmlspecialchars($lname) . "</p>";
    // Add a form to update the real name
    echo '<form method="post" action="' . htmlspecialchars($_SERVER["PHP_SELF"]) . '?id=' . $superID . '">';
    echo '<label for="fname">First Name:</label>';
    echo '<input type="text" id="fname" name="fname" value="' . htmlspecialchars($fname) . '"><br>';
    echo '<label for="mname">Middle Name:</label>';
    echo '<input type="text" id="mname" name="mname" value="' . htmlspecialchars($mname) . '"><br>';
    echo '<label for="lname">Last Name:</label>';
    echo '<input type="text" id="lname" name="lname" value="' . htmlspecialchars($lname) . '"><br>';
    echo '<input type="submit" value="Update">';
    echo '</form>';
} else {
    echo "<p>No real name found for this superhuman.</p>";
}

// Close the statement
$realname_stmt->close();

// Fetch events
$events_sql = "SELECT e.Title, e.Outcome FROM EVENT_ARC e JOIN PARTICIPATES_IN_EVENT pe ON e.Title = pe.EventTitle WHERE pe.SuperID = ?";
$events_stmt = $conn->prepare($events_sql);
if (!$events_stmt) {
    die("Prepare failed: (" . $conn->errno . ") " . $conn->error);
}
$events_stmt->bind_param("i", $superID);
$events_stmt->execute();
$events_stmt->bind_result($eventTitle, $eventOutcome);

echo "<h3>Events</h3>";
echo "<ul>";
while ($events_stmt->fetch()) {
    echo "<li>" . htmlspecialchars($eventTitle) . " (Outcome: " . htmlspecialchars($eventOutcome) . ")</li>";
}
echo "</ul>";

// Close the statement
$events_stmt->close();

// Fetch enemies
$enemies_sql = "SELECT s2.Alias FROM SUPERHUMAN s1 JOIN FIGHT_ENEMIES fe ON s1.superID = fe.SuperID1 JOIN SUPERHUMAN s2 ON fe.SuperID2 = s2.superID WHERE s1.superID = ?";
$enemies_stmt = $conn->prepare($enemies_sql);
if (!$enemies_stmt) {
    die("Prepare failed: (" . $conn->errno . ") " . $conn->error);
}
$enemies_stmt->bind_param("i", $superID);
$enemies_stmt->execute();
$enemies_stmt->bind_result($enemyAlias);

echo "<h3>Enemies</h3>";
echo "<ul>";
while ($enemies_stmt->fetch()) {
    echo "<li>" . htmlspecialchars($enemyAlias) . "</li>";
}
echo "</ul>";

// Close the statement
$enemies_stmt->close();

// Fetch relationships with side characters
$relationships_sql = "SELECT sc.RealName, aw.R_Type FROM SIDE_CHARACTER sc JOIN ASSOCIATES_WITH aw ON sc.CID = aw.SCID WHERE aw.SuperID = ?";
$relationships_stmt = $conn->prepare($relationships_sql);
if (!$relationships_stmt) {
    die("Prepare failed: (" . $conn->errno . ") " . $conn->error);
}
$relationships_stmt->bind_param("i", $superID);
$relationships_stmt->execute();
$relationships_stmt->bind_result($sideCharRealName, $relationshipType);

echo "<h3>Relationships with Side Characters</h3>";
echo "<ul>";
while ($relationships_stmt->fetch()) {
    echo "<li>" . htmlspecialchars($sideCharRealName) . " - " . htmlspecialchars($relationshipType) . "</li>";
}
echo "</ul>";

// Close the statement
$relationships_stmt->close();

echo '</div>'; // Close content div

// Close connection
$conn->close();
?>
</div> <!-- Close content div -->

</body>
</html>