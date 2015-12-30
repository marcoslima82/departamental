<%@page import="conexao.ConexaoSQLite"%>
<%

    String vcod = request.getParameter("cxaCod");
    String vnome = request.getParameter("cxaNome");
    String vlogin = request.getParameter("cxaLogin");
    String vsenha = request.getParameter("cxaSenha");
    
    ConexaoSQLite conexao = new ConexaoSQLite();
    conexao.queryUpdate("UPDATE usuarios "
            + "SET "
            + "nome='"+vnome+"',"
            + "login='"+vlogin+"',"
            + "senha='"+vsenha+"'"
            + " WHERE cod='"+vcod+"'");
    conexao.close();
    response.sendRedirect("usuarios.jsp");
%>