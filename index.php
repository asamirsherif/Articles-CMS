<?php


include 'config/config.php';

//----------------------------------------------------------------------------------
// Check DEBUG_MODE (config)
if (DEBUG_MODE) {
    // Activate PHP debugging
    ini_set('display_errors', 'On');
    error_reporting(E_ALL);
}


include 'core/Message.php';

include 'core/File.php';



include 'core/Database.php';
include 'core/Session.php';
Session::start();






include 'core/Model.php';
include 'core/View.php';
include 'core/Controller.php';

// Load Debug class
include 'core/Debug.php';
include 'core/Helper.php';

include 'core/Application.php';
$app = new Application();