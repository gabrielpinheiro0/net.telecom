package Classes;

public class Cadastro {

    private String nome;
    private String cpf;
    private String senha;
    
    
    public Cadastro(String nome, String cpf, String senha) {
        this.nome = nome;
        this.cpf = cpf;
        this.senha = senha;
    }

// get e set
    public String getNome() {
        return nome;
    }

    public void setNome_a(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }


}
