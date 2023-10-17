<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.*" import="java.lang.*" import="java.sql.*" import="java.util.Date"%>
<%@page import="Classes.Login" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Net Telecom</title>
    </head>
    
      <style>
            
            .botao{
                margin: 10px 0;
                font-size: 16px;
                font-weight: 700;
                line-height: 19px;
                background-color: #6a80ff;
                color:white;

            }
            
            .contai {           
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
             
            }
              </style>
              <body class="contai">
       <%
         
         
           String cpf = request.getParameter("cpf");
           String senha = request.getParameter("senha");
           
           
           

            Login red = new Login(cpf, senha);
           
                try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/nettelecom"; 
                Connection conexao = DriverManager.getConnection(url, "root", "");           

                Statement stmt = conexao.createStatement();
             
                String sql = "SELECT * FROM usuarios WHERE cpf = '" + red.getCpf() + "' AND senha = '" + red.getSenha() + "'";
                ResultSet rs = stmt.executeQuery(sql);
                
                if (rs.next()) {
            
                response.sendRedirect("menu_cliente.html");
               
           } 
           
           else {
            out.println("<p style='color: red;'>Usuário ou senha incorretos. Por favor, verifique suas credenciais.</p>");
        }

        rs.close();
        stmt.close();
        conexao.close();
    } catch (Exception ex) {
        out.println("<p style='color: red;'>Erro: " + ex.getMessage() + "</p>");
    }
        %>    
        
        <button class="botao" onclick="document.location='index.html'">Voltar</button>
    </body>
</html>
