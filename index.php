<?php
/**
 * Created by PhpStorm.
 * User: markk@uw.edu
 * Date: 7/24/2018
 * Time: 2:45 PM
*/?>
<html>
<head>
    <title>Superhero Database!</title>
    <link rel="stylesheet" href="base.css">
</head>
<body>
<?php
require_once 'header.inc.php';
?>
<div>
    <h2>Welcome to the Superhero Database!</h2>
    <div>This database is designed to catalog and explore the vast universe of superhuman characters, their powers, affiliations, and their epic battles. </div>
    <h3>What would you like to do?</h3>
        <ul>
            <a href="filtering.php" class="index-button">Superhumans</a> - Find your favorite Superhuman!
            <br>
            <a href="media.php" class="index-button">Media</a> - Explore superhuman content!
        </ul>

    </div>
</div>
</body>
</html>
