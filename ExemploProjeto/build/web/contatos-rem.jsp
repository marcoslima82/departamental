<%@page import="conexao.ConexaoSQLite"%>
<%

    String vcod = request.getParameter("cod");
    
    ConexaoSQLite conexao = new ConexaoSQLite();
    conexao.queryUpdate("DELETE FROM contatos "
            + "WHERE cod='"+vcod+"'");
    conexao.close();
    response.sendRedirect("contatos.jsp");
%>