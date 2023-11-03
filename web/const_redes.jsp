<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.*" import="java.lang.*" import="java.sql.*" import="java.util.Date"%>
<%@page import="Classes.Login" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Net Telecom</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background-color: #FFF; 
            color: #000;
            font-family: Arial, sans-serif;
            line-height: 1.5; 
        }

        .botao {
            margin: 10px 0;
            font-size: 16px;
            font-weight: 700;
            background-color: #4682B4; /* Cor de fundo azul */
            color: white; /* Cor do texto branco */
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
        }

        .titulo {
            font-size: 24px;
            font-weight: 700;
            border: 2px solid #4682B4;
            padding: 10px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <h1 class="titulo">Seu Plano!</h1>

    <%
    String usuarios_cpf = request.getParameter("usuarios_cpf");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/nettelecom";
        Connection conexao = DriverManager.getConnection(url, "root", "");

        Statement stmt = conexao.createStatement();

        String sql = "SELECT * FROM planos WHERE usuarios_cpf LIKE '" + usuarios_cpf + "%';";
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {
            out.println("<br> <strong>Nome da Rede:</strong> " + rs.getString("nome_c"));
            out.println("<br> <strong>Seu Plano:</strong> " + rs.getString("plano"));
            out.println("<br> <strong>Endereço de Cadastro:</strong> " + rs.getString("end_c"));
            out.println("<br> <strong>Contato:</strong> " + rs.getString("contato_c"));
            out.println("<br> <strong>Vencimento da Fatura:</strong> " + rs.getString("vencimento"));
        }
        stmt.close();
    } catch (Exception ex) {
        out.println("<br> Erro:" + ex);
    }
    %>

    <br><br>

    <button class="botao" onclick="document.location='menu_cliente.html'">Início</button>
</body>
</html>

