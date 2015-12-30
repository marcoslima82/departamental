<%-- 
    Document   : sistemas-ins
    Created on : 23/12/2015, 16:55:40
    Author     : USERTQI
--%>

<%@page import="conexao.ConexaoSQLite"%>
<%

    String vsistema = request.getParameter("cxaSistema");
    String vhost = request.getParameter("cxaHost");
    String vip = request.getParameter("cxaIp");
    String varea = request.getParameter("cxaArea");
    
    ConexaoSQLite conexao = new ConexaoSQLite();
    conexao.queryUpdate("INSERT INTO Sistemas "
            + "(sistema,host,ip,area) values ("
            + "'"+vsistema+"',"
            + "'"+vhost+"',"
            + "'"+vip+"',"
            + "'"+varea+"'"
            + ")");
    conexao.close();
    response.sendRedirect("sistemas.jsp");
%>
