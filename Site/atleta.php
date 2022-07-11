<?php

require_once('class/config.php');
require_once('autoload.php');

// Verificar se existe o post com todos os dados:
if(isset($_POST['cpf']) && isset($_POST['nome']) && isset($_POST['telefone']) && isset($_POST['email']) && isset($_POST['senha']) && isset($_POST['repete_senha'])){
    // Receber valores vindos do post e limpar:
    $cpf_locatario = limpaPost($_POST['cpf']);
    $nome_locatario = limpaPost($_POST['nome']);
    $fone_locatario = limpaPost($_POST['telefone']);
    $email_locatario = limpaPost($_POST['email']);
    $senha_locatario = limpaPost($_POST['senha']);
    $repete_senha = limpaPost($_POST['repete_senha']);

    // Verificar se os valores do post não estão vazios:
    if(empty($cpf_locatario) or empty($nome_locatario) or empty($fone_locatario) or empty($email_locatario) or empty($senha_locatario) or empty($repete_senha) or empty($_POST['termos'])){
        $erro_geral = "Todos os campos são obrigatórios!"; // AINDA TEM QUE FAZER O AVISO DE ERRO
    }else{

        // Instanciar a classe usuario_locatario:
        $usuario_locatario = new usuario_locatario($cpf_locatario,$nome_locatario,$fone_locatario,$email_locatario,$senha_locatario);

        // Setar a repetição de senha:
        $usuario_locatario->set_repeticao($repete_senha);

        // Validar o cadastro:
        $usuario_locatario->validar_cadastro();

        // Caso não tenha nenhum erro:
        if(empty($usuario_locatario->erro)){
            // Inserir:
            if($usuario_locatario->insert()){
                header('location: entrar.html');
            }else{
                // Erro:
                $erro_geral = $usuario_locatario->erro["erro_geral"];
            }
        }
    }
}
?>