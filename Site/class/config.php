<?php

// Configurações do banco de dados:
define('SERVIDOR', 'localhost');
define('USUARIO', 'root');
define('SENHA', '');
define('BANCO', 'iquadras');

function limpaPost($dados){
    $dados = trim($dados); // Tirar espaços em branco no início e no final;
    $dados = stripcslashes($dados); // Tirar as barras;
    $dados = htmlspecialchars($dados); // Tirar injeções de HTML;
    return $dados;
}

?>