<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.*" import="java.lang.*" import="java.sql.*" import="java.util.Date"%>
<%@page import="Classes.Redes" %>
<!DOCTYPE html>
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
         
         
           String nome_c = request.getParameter("nome_c");
           String plano = request.getParameter("plano");
           String end_c = request.getParameter("end_c");
           String contato_c = request.getParameter("contato_c");
           

            Redes red = new Redes(nome_c, plano, end_c, contato_c);
           
                try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/nettelecom"; 
                Connection conexao = DriverManager.getConnection(url, "root", "");           

                Statement stmt = conexao.createStatement();
             
                String sql = "INSERT INTO planos (nome_c, plano, end_c, contato_c, usuarios_cpf) VALUES ('" + red.getUsuarios_cpf() + "','" + red.getNome_c() + "','" + red.getPlano() + "','" + red.getEnd_c() + "','" + red.getContato_c() + "')";

                 // String sql = "INSERT INTO planos () VALUES ('0','" + 
          //red.getNome_c()+ "','" +red.getPlano()+ "','" + red.getEnd_c()+"','" +red.getContato_c()+"')";
         
          // String sql = "INSERT INTO planos (id, nome_c, plano, end_c, contato_c) VALUES ('0', 'Mateus', 'Net', 'RUa x', '11000000')";
                stmt.executeUpdate(sql);
                stmt.close();
                
                out.println("<br> O registro foi feito com sucesso!");
            } catch (Exception ex) {
                out.println("<br> Error:" + ex);
            }
        %>    
        
        <button class="botao" onclick="document.location='index.html'"> Home Page</button>
    </body>
</html>

