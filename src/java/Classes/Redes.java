package Classes;



public class Redes {
    
    private String nome_c; // nome d
    private String plano;  // plano de assinatura
    private String end_c;  // endereço
    private String contato_c; // contato do cliente

   
    
    public Redes( String nome_c,String plano,String end_c, String contato_c) {
       this.nome_c  = nome_c;
        this.plano = plano;
        this.end_c = end_c;
        this.contato_c = contato_c;
    
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


 
    
    
    
}
