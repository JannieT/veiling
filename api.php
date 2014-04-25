<?php

class Api
{
    /* contracted values, don't change */

    const KeyBieerId = 'bieer_id';

    /* other constants */
    const DBFile = "db.php";

    public static function getBieer()
    {
        if (!isset($_GET[self::KeyBieerId]))
            return;

        $bieer_id = $_GET[self::KeyBieerId];
        if (empty($bieer_id))
            return;

        include API::DBFile;

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

Api::getBieer();

Api::die_with_bad_request();
