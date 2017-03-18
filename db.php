<?php

class Model
{

    private $db;

    public function __construct($config)
    {
        $dsn = sprintf("mysql:host=%s;dbname=%s", $config['host'],
                $config['dbname']
        );

        $this->db = new PDO($dsn, $config['username'],
                $config['password']);
                
        $this->db->query("SET NAMES 'utf8'");
    }


    public function getBieer($bieer_id)
    {
        $sql = "SELECT naam, telefoon, epos "
                . "FROM bieers "
                . "WHERE nommer=? ";
        $stmt = $this->db->prepare($sql);
        $stmt->execute(array($bieer_id));
        if ($bieer = $stmt->fetch(PDO::FETCH_OBJ))
            return $bieer;

       throw new InvalidArgumentException('no user with that id');        
    }

    public function getItemsFor($bieer_id)
    {
        $sql = "SELECT * "
                . "FROM items "
                . "WHERE bieer_id=? "
                . "ORDER BY nommer";
        $stmt = $this->db->prepare($sql);
        $stmt->execute(array($bieer_id));
        if ($items = $stmt->fetchAll(PDO::FETCH_OBJ))
            return $items;

        return array();
//        throw new InvalidArgumentException('no user with that id');        
    }
    
    private function set_unpaid($betaal)
    {
        $qMarks = str_repeat('?,', count($betaal) - 1) . '?';
        $sql = "UPDATE items "
                . "SET betaal = NULL, soort = NULL "
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
            return false;
        }

        return true;
        
    }
    
    private function note_payment($betaal, $soort)
    {
        if (is_array($betaal)) {
            $qMarks = str_repeat('?,', count($betaal) - 1) . '?';
        } else {
            $qMarks = "?";
        }
        $sql = "UPDATE items "
                . "SET betaal = 1, soort = ? "
                . "WHERE nommer IN ($qMarks)";

        array_unshift($betaal, $soort);

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

    /**
     * updates a list of items as paid
     * 
     * @param  array $betaal lys van item ids
     * @param  string $soort  "eft", "cash", "herstel"
     * @return bool true if successful
     */
    public function noteAsPaid($betaal, $soort)
    {
        if ($soort == "herstel") {
            return $this->set_unpaid($betaal);
        } else {
            return $this->note_payment($betaal, $soort);
        }
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
    public $soort;

    // get's called after the members are assigned, 
    // so good for type conversion
    public function __construct()
    {
        $this->id = (int) $this->id;
        $this->nommer = (int) $this->nommer;
        $this->bedrag = (float) $this->bedrag;
        $this->bieer_id = (int) $this->bieer_id;
        $this->betaal = (bool) $this->betaal;
    }

}


class Bieer
{
    public $id;
    public $nommer;
    public $naam;
    public $telefoon;
    public $epos;

    public function __construct()
    {
        $this->id = (int) $this->id;
        $this->nommer = (int) $this->nommer;
    }

}


/*

CREATE TABLE `bieers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nommer` int(11) NOT NULL,
  `naam` varchar(50) DEFAULT NULL,
  `telefoon` varchar(15) DEFAULT NULL,
  `epos` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

CREATE TABLE `items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nommer` int(11) DEFAULT NULL,
  `beskrywing` varchar(255) DEFAULT NULL,
  `bieer_id` int(11) DEFAULT NULL,
  `bedrag` decimal(10,2) DEFAULT NULL,
  `betaal` tinyint(4) DEFAULT NULL,
  `soort` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;


update items 
set bieer_id=null, bedrag=null, betaal=null, soort=null; 

update bieers 
set naam='-', telefoon='-', epos='-';

maak seker daar is al die kaart nommers in biers tabel



 *  */