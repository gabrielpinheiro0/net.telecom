<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.*" import="java.lang.*" import="java.sql.*" import="java.util.Date"%>
<%@page import="Classes.Login" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Net Telecom</title>
    </head>
    <body>
        <h1>Seu Plano!</h1>
        
     <%
           
            String usuarios_cpf = request.getParameter("usuarios_cpf");           

                                   
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/nettelecom"; 
                Connection conexao = DriverManager.getConnection(url, "root", "");           

                Statement stmt = conexao.createStatement();  
                
          
          
                String sql = "SELECT * FROM planos WHERE usuarios_cpf LIKE '"+usuarios_cpf+"%';";       
            
                ResultSet rs = stmt.executeQuery(sql);
                while (rs.next()) {
                    out.println("<br> Nome da Rede: " + rs.getString("nome_c"));
                    out.println("<br> Seu Plano: " + rs.getString("plano"));
                    out.println("<br> Endereço de Cadastro: " + rs.getString("end_c"));
                    out.println("<br> Contato: " + rs.getString("contato_c"));
                }                          
                stmt.close();                
                
            } catch (Exception ex) {
                out.println("<br> Erro:" + ex);
         } 
     %>
    </div>
        <br><br>
        
    <button class="bt" onclick="document.location='menu_cliente.html'"> Início</button>
    </body>
    </body>
</html>