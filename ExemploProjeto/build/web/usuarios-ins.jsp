<%@page import="conexao.ConexaoSQLite"%>
<%

    String vnome = request.getParameter("cxaNome");
    String vlogin = request.getParameter("cxaLogin");
    String vsenha = request.getParameter("cxaSenha");
    
    ConexaoSQLite conexao = new ConexaoSQLite();
    conexao.queryUpdate("INSERT INTO usuarios "
            + "(nome,login,senha) values ("
            + "'"+vnome+"',"
            + "'"+vlogin+"',"
            + "'"+vsenha+"'"
            + ")");
    conexao.close();
    response.sendRedirect("usuarios.jsp");
%>