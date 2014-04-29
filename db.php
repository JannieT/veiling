<?php

class DB
{

    private $settings = array(
        'host' => 'localhost',
        'dbname' => 'veiling',
        'username' => 'root',
        'password' => '[ ******** ]',
    );
    private $db;

    public function __construct()
    {
        $dsn = sprintf("mysql:host=%s;dbname=%s", $this->settings['host'],
                $this->settings['dbname']
        );

        $this->db = new PDO($dsn, $this->settings['username'],
                $this->settings['password']);
    }

    private function read_items($bieer_id)
    {
        $sql = "SELECT * "
                . "FROM items "
                . "WHERE bieer_id=? "
                . "ORDER BY nommer";
        $stmt = $this->db->prepare($sql);
        $stmt->execute(array($bieer_id));
        if ($items = $stmt->fetchAll(PDO::FETCH_CLASS, "Item"))
            return $items;

        return array();
//        throw new InvalidArgumentException('no user with that id');        
    }

    private function note_payment($betaal)
    {
        $qMarks = str_repeat('?,', count($betaal) - 1) . '?';
        $sql = "UPDATE items "
                . "SET betaal = 1 "
                . "WHERE nommer IN ($qMarks)";

        try
        {
            $this->db->beginTransaction();
            $this->db->prepare($sql)
                    ->execute($betaal);
            $this->db->commit();
        }
        catch (Exception $ex)
        {
            $this->db->rollBack();
//    echo $exc->getTraceAsString();
            return false;
        }

        return true;
    }

    public static function NoteAsPaid($betaal)
    {
        $model = new DB();
        return $model->note_payment($betaal);
    }

    public static function GetItemsFor($bieer_id)
    {
        $db = new DB();
        return $db->read_items($bieer_id);
    }

}

class Item
{

    public $id;
    public $nommer;
    public $beskrywing;
    public $bieer_id;
    public $bedrag;
    public $betaal;

    // get's called after the members are assigned, 
    // so good for type conversion
    public function __construct()
    {
        $this->id = (int) $this->id;
        $this->bedrag = (float) $this->bedrag;
        $this->bieer_id = (int) $this->bieer_id;
        $this->betaal = (bool) $this->betaal;
    }

}

/*

CREATE TABLE `items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nommer` int(11) DEFAULT NULL,
  `beskrywing` varchar(255) DEFAULT NULL,
  `bieer_id` int(11) DEFAULT NULL,
  `bedrag` decimal(10,2) DEFAULT NULL,
  `betaal` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
 
 *  */