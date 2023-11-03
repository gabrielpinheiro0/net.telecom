<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.*" import="java.lang.*" import="java.sql.*" import="java.util.Date"%>
<%@page import="Classes.Cadastro" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Processar Cadastro</title>
</head>
<body>
    <%
        String cpf = request.getParameter("cpf");
        String nome = request.getParameter("nome");       
        String senha = request.getParameter("senha");
        String repetirSenha = request.getParameter("repetir_senha");
       

    if (!senha.equals(repetirSenha)) {
    %>
        <p style="color: red;">As senhas não coincidem. Por favor, repita a senha corretamente.</p>
    <%
    }
        Cadastro cad = new Cadastro(cpf, nome, senha);
 try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/nettelecom"; 
                Connection conexao = DriverManager.getConnection(url, "root", "");           

                Statement stmt = conexao.createStatement();
             
             String sql = "INSERT INTO usuarios (cpf, nome, senha) VALUES ('" + 
                cad.getNome() + "','" + cad.getCpf() + "','" + cad.getSenha()+ "')";

            
              //String sql = "INSERT INTO usuarios (cpf, nome, senha) VALUES ('47584171800', 'Gabriel', 'as')";
        
                stmt.executeUpdate(sql);
                stmt.close();
                
                   response.sendRedirect("menu_cliente.html");
            } catch (Exception ex) {
                out.println("<br> Error:" + ex);
            }

    %> 
</body>
</html>
