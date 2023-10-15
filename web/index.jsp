<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Net Telecom</title>
</head>
<body>
    <h1>Net Telecomunicações</h1>
    <%
        String cpf = request.getParameter("cpf");
        String senha = request.getParameter("senha");

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/nettelecom", "root", "");

            String sql = "SELECT * FROM Usuarios WHERE CPF = ? AND Senha = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, cpf);
            stmt.setString(2, senha);
            rs = stmt.executeQuery();

            if (rs.next()) {
             
                response.sendRedirect("menu_cliente.html");
            } else {
                out.println("<p>CPF e/ou senha incorretos. Tente novamente.</p>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Ocorreu um erro ao processar a solicitação.</p>");
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    %>
    </form>
</body>
</html>
