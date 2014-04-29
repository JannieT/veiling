<?php

class Api
{
    /* contracted values, don't change */

    const KeyBetaal = 'betaal';
    const KeyBieerId = 'bieer_id';
    const KeySecret = "sleutel";
    const ClientSecret = "4c5908f725f1c858b468d7d2f9f724ba";

    /* other constants */
    const DBFile = "db.php";

    public function __construct()
    {
        $authorized = isset($_REQUEST[Api::KeySecret]) && ($_REQUEST[Api::KeySecret] == Api::ClientSecret);
        if (!$authorized)
        {
            header("HTTP/1.1 403 Forbidden", true, 403);
            die();
        }
    }

    public function handlePost()
    {
        if ((isset($_REQUEST[Api::KeyBetaal]) == false))
        {
            return;
        }

        $betaal = json_decode($_REQUEST[Api::KeyBetaal]);
//        $betaal = array(1, 7, 16);
        include_once API::DBFile;
        if (DB::NoteAsPaid($betaal))
        {
            API::respond("OK");
        }
        
        API::die_with_server_error();
    }

    public static function getBieer()
    {
        if (!isset($_GET[self::KeyBieerId]))
            return;

        $bieer_id = $_GET[self::KeyBieerId];
        if (empty($bieer_id))
            return;

        include_once API::DBFile;

        API::respond(DB::GetItemsFor($bieer_id));
    }

    public static function respond($result)
    {
        header('Content-Type: application/json');
        die(json_encode($result));
    }

    private static function die_with_server_error()
    {
        header("HTTP/1.1 500 Internal Server Error", true, 500);
        die();
    }

    public static function die_with_bad_request()
    {
        header("HTTP/1.1 400 Bad Request", true, 400);
        die();
    }

}

/* open calls */
Api::getBieer();

/* priviledged calls */
$api = new Api();
$api->handlePost();

Api::die_with_bad_request();
