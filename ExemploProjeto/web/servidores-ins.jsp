<%-- 
    Document   : servidores-ins
    Created on : 27/12/2015, 19:24:14
    Author     : mark
--%>

<%@page import="conexao.ConexaoSQLite"%>
<%

    String vhostname = request.getParameter("cxaHostname");
    String vip = request.getParameter("cxaIp");
    String vmonitoracao = request.getParameter("cxaMonitoracao");
    String vbackup = request.getParameter("cxaBackup");
    
    ConexaoSQLite conexao = new ConexaoSQLite();
    conexao.queryUpdate("INSERT INTO Servidores "
            + "(hostname,ip,monitoracao,backup) values ("
            + "'"+vhostname+"',"
            + "'"+vip+"',"
            + "'"+vmonitoracao+"',"
            + "'"+vbackup+"'"
            + ")");
    conexao.close();
    response.sendRedirect("servidores.jsp");
%>
