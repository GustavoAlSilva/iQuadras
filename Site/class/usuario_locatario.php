<?php

require_once('crud.php');

class usuario_locatario extends crud{
    protected string $tabela = 'usuario_locatario';

    function __construct(
        public string $nome_locatario,
        private string $cpf_locatario,
        private string $fone_locatario,
        private string $email_locatario,
        private string $senha_locatario,
        private string $repete_senha="",
        public array $erro=[]
    ){}

    public function set_repeticao($repete_senha){
        $this->repete_senha = $repete_senha;
    }

    public function validar_cadastro(){

        // Validação do nome:
        if (!preg_match("/^[A-Za-záàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ'\s]+$/",$this->nome_locatario)) {
            $this->erro["erro_nome"] = "Por favor informe um nome válido.";
        }

        // Validação do e-mail:
        if(!filter_var($this->email_locatario, FILTER_VALIDATE_EMAIL)){
            $this->erro["erro_email"] = "Formato de e-mail inválido.";
        }

        // Validação de senha:
        if(strlen($this->senha_locatario) < 6){
            $this->erro["erro_senha"] = "Senha deve ter, no mínimo, 6 caracteres.";
        }

        // Validação de repetição de senha:
        if($this->senha_locatario !== $this->repete_senha){
            $this->erro["erro_repete"] = "Senhas diferentes.";
        }
    }

    public function insert() {
        // Verificar se esse e-mail já está cadastrado no banco de dados:
        $sql = "SELECT ect * FROM usuario_locatario WHERE email_locatario=? LIMIT 1";
        $sql = db::prepare($sql);
        $sql->execute(array($this->email_locatario));
        $usuario_locatario = $sql->fetch();
        // Se não existir:
        if(!$usuario_locatario){
            $senha_cripto = sha1($this->senha_locatario);
            $sql = "INSERT INTO $this->tabela VALUES (?,?,?,?,?)";
            $sql = db::prepare($sql);
            return $sql->execute(array($this->cpf_locatario, $this->nome_locatario, $this->fone_locatario, $this->email_locatario, $this->senha_cripto));
        }else{
            $this->erro["erro_geral"] = "Usuário já cadastrado.";
        }
    }
    public function update($cpf_locatario) {}

}

?>