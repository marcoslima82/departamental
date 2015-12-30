<%-- 
    Document   : sistemas-rem
    Created on : 23/12/2015, 19:48:57
    Author     : USERTQI
--%>

<%@page import="conexao.ConexaoSQLite"%>
<%

    String vcod = request.getParameter("cod");
    
    ConexaoSQLite conexao = new ConexaoSQLite();
    conexao.queryUpdate("DELETE FROM Sistemas "
            + "WHERE cod='"+vcod+"'");
    conexao.close();
    response.sendRedirect("sistemas.jsp");
%>