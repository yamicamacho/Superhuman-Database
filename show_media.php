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
require_once 'config.inc.php';

if (!isset($_GET['title'])) {
    die("Error: Media title not provided.");
}

$title = urldecode($_GET['title']);

// Create connection
$conn = new mysqli($servername, $username, $password, $database, $port);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Handle outcome update
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['updateOutcome']) && isset($_POST['eventTitle']) && isset($_POST['newOutcome'])) {
    $eventTitle = $conn->real_escape_string($_POST['eventTitle']);
    $newOutcome = $conn->real_escape_string($_POST['newOutcome']);

    $update_sql = "UPDATE EVENT_ARC SET Outcome = ? WHERE Title = ?";
    $update_stmt = $conn->prepare($update_sql);
    $update_stmt->bind_param("ss", $newOutcome, $eventTitle);

    if ($update_stmt->execute()) {
        // Redirect to avoid resubmission
        echo '<script>window.location.reload(true);</script>';
    } else {
        echo "<p>Error updating outcome: " . $conn->error . "</p>";
    }

    // Close the statement
    $update_stmt->close();
}

// Start output buffering
ob_start();

// Fetch media details
$media_sql = "SELECT m.Title, m.Format, pa.PublisherName, ma.StartDate 
              FROM MEDIA m
              LEFT JOIN PRODUCE pa ON m.Title = pa.MediaTitle
              LEFT JOIN MEDIA_AIRTIME ma ON m.Title = ma.Title
              WHERE m.Title = ?";
$media_stmt = $conn->prepare($media_sql);
$media_stmt->bind_param("s", $title);
$media_stmt->execute();
$media_stmt->bind_result($title, $format, $publisherName, $releaseDate);
$media_stmt->fetch();

// Navigation bar
require_once 'header.inc.php';

echo '<div class="content">';

if (!empty($title)) {
    echo "<h2>Media Details</h2>";
    echo "<p><strong>Title:</strong> " . htmlspecialchars($title) . "</p>";
    echo "<p><strong>Format:</strong> " . htmlspecialchars($format) . "</p>";
    echo "<p><strong>Publisher:</strong> " . htmlspecialchars($publisherName) . "</p>";
    echo "<p><strong>Release Date:</strong> " . htmlspecialchars($releaseDate) . "</p>";
} else {
    echo "No media found with title: " . htmlspecialchars($title);
}

// Close the statement
$media_stmt->close();

// Fetch event details
$event_sql = "SELECT ea.Title, ea.Outcome 
              FROM EVENT_ARC ea
              JOIN ADAPTS ad ON ea.Title = ad.EventTitle
              WHERE ad.MediaTitle = ?";
$event_stmt = $conn->prepare($event_sql);
$event_stmt->bind_param("s", $title);
$event_stmt->execute();
$event_stmt->bind_result($eventTitle, $eventOutcome);
$event_stmt->fetch();

echo "<h3>Event</h3>";
if (!empty($eventTitle)) {
    echo "<p><strong>Event Title:</strong> " . htmlspecialchars($eventTitle) . "</p>";
    echo "<p><strong>Outcome:</strong> " . htmlspecialchars($eventOutcome) . "</p>";
} else {
    echo "<p>No event found for this media.</p>";
}

// Close the statement
$event_stmt->close();

// Fetch participants
$participants_sql = "SELECT s.Alias, sc.RealName 
                     FROM PARTICIPATES_IN_EVENT pe
                     JOIN SUPERHUMAN s ON pe.SuperID = s.superID
                     JOIN SIDE_CHARACTER sc ON pe.SCID = sc.CID
                     WHERE pe.EventTitle = ?";
$participants_stmt = $conn->prepare($participants_sql);
$participants_stmt->bind_param("s", $eventTitle);
$participants_stmt->execute();
$participants_stmt->bind_result($superAlias, $sideCharacterName);

echo "<h3>Participants</h3>";
echo "<ul>";
while ($participants_stmt->fetch()) {
    echo "<li>" . htmlspecialchars($superAlias) . " - " . htmlspecialchars($sideCharacterName) . "</li>";
}
echo "</ul>";

// Close the statement
$participants_stmt->close();

echo "<p><strong>Is the outcome wrong? Feel free to edit it!</strong></p>";
echo "<form method='post' action=''>";
echo "<input type='hidden' name='eventTitle' value='" . htmlspecialchars($eventTitle) . "'>";
echo "<input type='text' name='newOutcome' value='" . htmlspecialchars($eventOutcome) . "'>";
echo "<input type='submit' name='updateOutcome' value='Update'>";
echo "</form>";

echo '</div>'; // Close content div

// Flush the buffer and output everything
ob_end_flush();

// Close connection
$conn->close();
?>
</div> <!-- Close content div -->

</body>
</html>