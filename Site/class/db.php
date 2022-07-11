<?php

require_once('config.php');

class db{
    private static $pdo;
    public static function instanciar(){
        if(!isset(self::$pdo)){
            try{
                self::$pdo = new PDO('mysql:host='.SERVIDOR.';dbname='.BANCO,USUARIO,SENHA); // Conexão com o banco de dados;
                self::$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                self::$pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_OBJ);
            }catch(PDOException $erro){ // (Se houver erro na conexão:)
                echo "Falha ao se conectar com o banco de dados: ".$erro->getMessage();
            }
        }
        return self::$pdo;
    }
    public static function prepare($sql){
        return self::instanciar()->prepare($sql);
    }
}

?>