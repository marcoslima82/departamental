<%-- 
    Document   : sistemas-alt
    Created on : 23/12/2015, 18:30:20
    Author     : Marcos Lima
--%>

<%@page import="conexao.ConexaoSQLite"%>
<%
    String vcod = request.getParameter("cxaCod");
    String vsistema = request.getParameter("cxaSistema");
    String vservidor = request.getParameter("cxaHostname");
    String varea = request.getParameter("cxaArea");
        
    ConexaoSQLite conexao = new ConexaoSQLite();
    conexao.queryUpdate("UPDATE Sistemas "
            + "SET "
            + "sistema='"+vsistema+"',"
           // + "hostname'"+vservidor+"',"
            + "area='"+varea+"'"
            + " WHERE cod_sis='"+vcod+"'");
    conexao.close();
    response.sendRedirect("sistemas.jsp");
%>