<%@page import="conexao.ConexaoSQLite"%>
<%

    String vcod = request.getParameter("cod");
    
    ConexaoSQLite conexao = new ConexaoSQLite();
    conexao.queryUpdate("DELETE FROM usuarios "
            + "WHERE cod='"+vcod+"'");
    conexao.close();
    response.sendRedirect("usuarios.jsp");
%>