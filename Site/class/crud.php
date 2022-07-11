<?php

require_once('db.php');

abstract class crud extends db{
    protected string $tabela;

    abstract public function insert();
    abstract public function update($cpf_locatario);

    public function find($cpf_locatario){
        $sql = "SELECT * FROM $this->tabela WHERE cpf_locatario=?";
        $sql = db::prepare($sql);
        $sql->execute(array($cpf_locatario));
        $valor = $sql->fetch();
        return $valor;
    }

    public function findAll($cpf_locatario){
        $sql = "SELECT * FROM $this->tabela";
        $sql = db::prepare($sql);
        $sql->execute(array($cpf_locatario));
        $valor = $sql->fetchAll();
        return $valor;
    }

    public function delete($cpf_locatario){
        $sql = "DELETE FROM $this->tabela WHERE cpf_locatario=?";
        $sql = db::prepare($sql);
        return $sql->execute(array($cpf_locatario));
    }
}

?>