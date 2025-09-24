<?php
// session_test_1.php
session_start();
$_SESSION['vibe_check'] = 'gnarly';
header('Cache-Control: no-store, no-cache, must-revalidate, max-age=0');
echo '<h1>Session Started!</h1>';
echo '<p>A session variable has been set.</p>';
echo '<h2><a href="/session_test_2.php">==> Click here to check the session on the next page</a></h2>';
?>