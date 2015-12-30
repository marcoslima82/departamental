<%-- 
    Document   : sistemas-alt
    Created on : 23/12/2015, 18:30:20
    Author     : Marcos Lima
--%>

<%@page import="conexao.ConexaoSQLite"%>
<%
    String vcod = request.getParameter("cxaCod");
    String vsistema = request.getParameter("cxaSistema");
    String vhost = request.getParameter("cxaHost");
    String vip = request.getParameter("cxaIp");
    String varea = request.getParameter("cxaArea");
    
    ConexaoSQLite conexao = new ConexaoSQLite();
    conexao.queryUpdate("UPDATE Sistemas "
            + "SET "
            + "sistema='"+vsistema+"',"
            + "host='"+vhost+"',"
            + "ip='"+vip+"',"
            + "area='"+varea+"'"
            + " WHERE cod='"+vcod+"'");
    conexao.close();
    response.sendRedirect("sistemas.jsp");
%>