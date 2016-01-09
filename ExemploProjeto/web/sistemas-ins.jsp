<%-- 
    Document   : sistemas-ins
    Created on : 23/12/2015, 16:55:40
    Author     : USERTQI
--%>

<%@page import="conexao.ConexaoSQLite"%>
<%

    String vsistema = request.getParameter("cxaSistema");
    //String vhost = request.getParameter("cxaHost");
    //String vcod_servidor = request.getParameter("cxaServidor");
    String varea = request.getParameter("cxaArea");
    
    ConexaoSQLite conexao = new ConexaoSQLite();
    conexao.queryUpdate("INSERT INTO Sistemas "
            + "(sistema,area) values ("
            + "'"+vsistema+"',"
            + "'"+varea+"'"
            //+ "'"+vip+"',"
            //+ "'"+vcod_servidor+"'"
            + ")");
    conexao.close();
    response.sendRedirect("sistemas.jsp");
%>
