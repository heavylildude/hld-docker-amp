<?php
// session_test_2.php
session_start();
if (isset($_SESSION['vibe_check']) && $_SESSION['vibe_check'] === 'gnarly') {
    echo '<h1>✅ SUCCESS! ✅</h1>';
    echo '<p>The session variable was remembered. PHP sessions are working perfectly!</p>';
    unset($_SESSION['vibe_check']); // Clean up the session
} else {
    echo '<h1>❌ FAILURE! ❌</h1>';
    echo '<p>The session variable was lost. PHP sessions are broken in this environment.</p>';
    echo '<h3>Session Data Found:</h3><pre>';
    print_r($_SESSION);
    echo '</pre>';
}
?>