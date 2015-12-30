<%-- 
    Document   : servidores-rem
    Created on : 27/12/2015, 19:43:21
    Author     : mark
--%>


<%@page import="conexao.ConexaoSQLite"%>
<%

    String vcod = request.getParameter("cod");
    
    ConexaoSQLite conexao = new ConexaoSQLite();
    conexao.queryUpdate("DELETE FROM Servidores "
            + "WHERE cod='"+vcod+"'");
    conexao.close();
    response.sendRedirect("servidores.jsp");
%>