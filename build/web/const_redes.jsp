<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.*" import="java.lang.*" import="java.sql.*" import="java.util.Date"%>
<%@page import="Classes.Redes" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TELECOM.nets</title>
         
        <style>
            table {
                border-collapse: collapse;
                width: 100%;
            }      
            th, td{
                padding: 4px;
                text-align: left;
                border: 1px solid #DDD;
            }
              
            
             
            
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
            
    
    </head>
    <body class="contai">
          <img src="./img/logo.png" alt="" width="300" height="200"/>
           <h1>Lista de Redes/Cliente</h1>                  
        <%             
                           
            try{
                Class.forName("com.mysql.cj.jdbc.Driver"); 
                String url = "jdbc:mysql://localhost:3306/telecom"; 
                Connection conexao = DriverManager.getConnection(url, "root", "");           

                Statement stmt = conexao.createStatement();            
                String sql = "SELECT * FROM redes";       
                
                ResultSet red = stmt.executeQuery(sql);
        %>        
               
        <table style="width:100%">
            <tr bgcolor="F3F3F3">
               <th>#</th>
               <th>Id</th>
               <th>Nome</th>
               <th>Plano Ass</th>
               <th>Endereço</th>
               <th>Contato</th>
               <th>Data Mensalidade</th>
            </tr>
                
        <%
                while (red.next()) {
        %>
            <tr>
               <td><%= red.getRow() %></td>
               <td><%= red.getString("id") %></td>
               <td><%= red.getString("nome") %> </a> </td>
               <td><%= red.getString("plano") %></td>
               <td><%= red.getString("endereco") %></td>
               <td><%= red.getString("contato") %></td>
               <td><%= red.getString("mensal") %></td>
                  
               <td> <a class="botao" href=delet_redes.jsp?id=<%= red.getString("id") %> "> deletar </a>  </td>              
            </tr>
        <%}%>
        </table>
        <%
                stmt.close();             
            } catch (Exception ex) {
                out.println("<br> Erro:" + ex);
            }
        %>    
        <br><br>
        <button class="botao" onclick="document.location='index.html'"> Home Page</button>
      </body>
    </body>
</html>
