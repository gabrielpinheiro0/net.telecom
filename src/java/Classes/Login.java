package Classes;

public class Login {

    private String cpf;
    private String senha;
    
    
    public Login(String cpf, String senha) {
            this.cpf = cpf;
            this.senha = senha;
            
            
    }
    
    //get
    
    public String getCpf() {
        return cpf;
    }

    public String getSenha() {
        return senha;
    }
    
    //set
    public void setCpf(String cpf) {
        this.cpf = cpf;
    }


    public void setSenha(String senha) {
        this.senha = senha;
    }


}
