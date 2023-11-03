<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.*" import="java.lang.*" import="java.sql.*" import="java.util.Date"%>
<%@page import="Classes.Redes" %>
<!DOCTYPE html>
<html>
<head>
    <title>Resultado da Atualização</title>
    <meta charset="UTF-8">
    <style>
        body {
            background-color: #FFF; 
            color: #000;
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        .content {
            text-align: center;
        }

        .botao {
            margin: 10px 0;
            font-size: 16px;
            font-weight: 700;
            background-color: #4682B4;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="content">
        <%
            String cpf = request.getParameter("usuarios_cpf");
            String vencimento = request.getParameter("vencimento");

            String url = "jdbc:mysql://localhost:3306/nettelecom";
            String usuario = "root";
            String senha = "";

            Connection conn = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, usuario, senha);

                String sql = "UPDATE planos SET vencimento = ? WHERE usuarios_cpf = ?";

                PreparedStatement preparedStatement = conn.prepareStatement(sql);
                preparedStatement.setString(1, vencimento);
                preparedStatement.setString(2, cpf);

                int rowsUpdated = preparedStatement.executeUpdate();

                if (rowsUpdated > 0) {
                    out.println("Data de Vencimento atualizada com sucesso.");
                } else {
                    out.println("Nenhum registro encontrado para o CPF: " + cpf);
                }

            } catch (ClassNotFoundException e) {
                out.println("Erro na atualização: Classe do driver não encontrada.");
            } catch (SQLException e) {
                out.println("Erro na atualização: " + e.getMessage());
            } finally {
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (SQLException e) {
                        out.println("Erro ao fechar a conexão: " + e.getMessage());
                    }
                }
            }
        %>
    </div>
    <button class="botao" onclick="document.location='menu_cliente.html'">Voltar para o Menu</button>
</body>
</html>