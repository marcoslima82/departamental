<%-- 
    Document   : servidores-alt
    Created on : 27/12/2015, 19:37:38
    Author     : mark
--%>

<%@page import="conexao.ConexaoSQLite"%>
<%
    String vcod = request.getParameter("cxaCod");
    String vhostname = request.getParameter("cxaHostname");
    String vip = request.getParameter("cxaIp");
    String vmonitoracao = request.getParameter("cxaMonitoracao");
    String vbackup = request.getParameter("cxaBackup");
    
    ConexaoSQLite conexao = new ConexaoSQLite();
    conexao.queryUpdate("UPDATE Servidores "
            + "SET "
            + "hostname='"+vhostname+"',"
            + "ip='"+vip+"',"
            + "monitoracao='"+vmonitoracao+"',"
            + "backup='"+vbackup+"'"
            + " WHERE cod='"+vcod+"'");
    conexao.close();
    response.sendRedirect("servidores.jsp");
%>