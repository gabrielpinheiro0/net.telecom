package Classes;



public class Redes {
    private String usuarios_cpf; // foreing key
    private String nome_c; // nome d
    private String plano;  // plano de assinatura
    private String end_c;  // endereço
    private String contato_c; // contato do cliente
    private String vencimento; // data de vencimento
   
    
    public Redes(String usuarios_cpf, String nome_c,String plano,String end_c, String contato_c, String vencimento) {
       this.usuarios_cpf = usuarios_cpf;
       this.nome_c  = nome_c;
       this.plano = plano;
       this.end_c = end_c;
       this.contato_c = contato_c;
       this.vencimento = vencimento;
       
    
    }
   // get
    public String getNome_c() {
        return nome_c;
    }

    public String getPlano() {
        return plano;
    }
    public String getEnd_c() {
        return end_c;
    }

    public String getContato_c() {
        return contato_c;
    }

    public String getUsuarios_cpf() {
        return usuarios_cpf;
    }
   

    // set
    public void setNome_c(String nome_c) {
        this.nome_c = nome_c;
    }

    public void setPlano(String plano) {
        this.plano = plano;
    }
    public void setEnd_c(String end_c) {
        this.end_c = end_c;
    }

    public void setContato_c(String contato_c) {
        this.contato_c = contato_c;
    }
   public void setUsuarios_cpf(String usuarios_cpf) {
        this.usuarios_cpf = usuarios_cpf;
    }
    public void setVencimento(String vencimento) {
         this.vencimento = vencimento;
    }
    
    public String getVencimento() {
         return vencimento;
    }
 
}