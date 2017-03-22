<?php

class Api
{
    /* contracted values, don't change */

    const KeyPing = 'ping';
    const KeyBetaal = 'betaal';
    const KeyBetaalSoort = 'betaal_soort';
    const KeyBieerNaam = 'bieer_naam';
    const KeyBieerId = 'bieer_id';
    const KeyPhoto = "foto";

    const KeyRegistrasie = "registrasie";
    const KeyLotte = "lotte";
    

    /* other constants */
    const Model = "../db.php";
    const UploadFolder = "../uploads/";
    const Config = "../config.php";

    private $config;

    private function run()
    {
        // public routes
        
        $this->getItemsForBier();
        $this->getBieer();


        // privileged routes
        // ----------------------------
        $this->authenticate();

        $this->handlePing();
        $this->handleBetaal();
        $this->handleFileUpload();

        $this->dieWithBadRequest();
    }

    public function __construct()
    {
        $this->config = include_once Api::Config;
        $this->run();
    }

    private function authenticate()
    {
        if (!isset($_SERVER['HTTP_AUTHORIZATION'])) 
            $this->dieWithUnauthorised();

        $key = substr($_SERVER['HTTP_AUTHORIZATION'], 7);
        if ($key != $this->config['api_key']) 
            $this->dieWithUnauthorised();
       
    }

    private function getModel()
    {
        include_once API::Model;
        return new Model($this->config);
    }

    public function handleFileUpload()
    {
        if (!isset($_FILES[Api::KeyPhoto]['error']) || ($_FILES[Api::KeyPhoto]['error'] != UPLOAD_ERR_OK))
            return;

        $uploadfile = Api::UploadFolder . basename($_FILES[Api::KeyPhoto]['name']);
        if (move_uploaded_file($_FILES[Api::KeyPhoto]['tmp_name'], $uploadfile))
        {
            $this->respond("OK");
        }
    }

    public function handleBetaal()
    {
        if ((isset($_POST[Api::KeyBetaal]) == false))
        {
            return;
        }

        $betaal = json_decode($_POST[Api::KeyBetaal]);
        $soort = $_POST[Api::KeyBetaalSoort];
        // var_dump($betaal); die();

//        $betaal = array(1, 7, 16);
        $model = $this->getModel();
        if ($model->noteAsPaid($betaal, $soort))
        {
            $this->respond("OK");
        }

        $this->dieWithServerError();
    }
    
    public function handlePing()
    {
        if (!isset($_GET[self::KeyPing]))
            return;
        
         $this->respond("OK");
    }

    public function getItemsForBier()
    {
        if (!isset($_GET[self::KeyBieerId]))
            return;

        $bieer_id = $_GET[self::KeyBieerId];
        if (empty($bieer_id))
            return;

        $model = $this->getModel();

        $this->respond($model->GetItemsFor($bieer_id));
    }
    
    public function getBieer()
    {
        if (!isset($_GET[self::KeyBieerNaam]))
            return;

        $bieer_id = $_GET[self::KeyBieerNaam];
        if (empty($bieer_id))
            return;

        $model = $this->getModel();

        try {
            $this->respond($model->getBieer($bieer_id));
        } catch (Exception $e) {
            $this->dieWithNotFound();
        }
    }

    private function respond($result)
    {
        header('Content-Type: application/json; charset=utf-8');
        die(json_encode($result));
    }

    private function dieWithUnauthorised()
    {
        header($_SERVER["SERVER_PROTOCOL"] . " 401 Unauthorized", true, 401);
        die();
    }

    private function dieWithForbidden()
    {
        header($_SERVER["SERVER_PROTOCOL"] . " 403 Forbidden", true, 403);
        die();
    }

    private function dieWithServerError()
    {
        header($_SERVER["SERVER_PROTOCOL"] . " 500 Internal Server Error", true, 500);
        die();
    }

    public function dieWithNotFound()
    {
        header($_SERVER["SERVER_PROTOCOL"] . " 404 Not Found", true, 404);
        die();
    }

    public function dieWithBadRequest()
    {
        header($_SERVER["SERVER_PROTOCOL"] . " 400 Bad Request", true, 400);
        die();
    }

}


$api = new Api();

