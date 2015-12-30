<%-- 
    Document   : recursos-alt
    Created on : 29/12/2015, 16:59:21
    Author     : mark
--%>

<%@page import="conexao.ConexaoSQLite"%>
<%
    String vcod = request.getParameter("cxaCod");
    String vcod_recursos = request.getParameter("cod_recursos");
    String vsoperacional = request.getParameter("cxaSoperacional");
    String vmemoria = request.getParameter("cxaMemoria");
    String vprocessador = request.getParameter("cxaProcessador");
    String vvolumetria = request.getParameter("cxaVolumetria");
    String vbanco = request.getParameter("cxaBanco");
        
    ConexaoSQLite conexao = new ConexaoSQLite();
    conexao.queryUpdate("UPDATE Recursos "
            + "SET "
           //+ "cod_recursos='"+vcod_recursos+"',"
            + "soperacional='"+vsoperacional+"',"
            + "memoria='"+vmemoria+"',"
            + "processador='"+vprocessador+"',"
            + "volumetria='"+vvolumetria+"',"
            + "banco='"+vbanco+"'"
            + " WHERE cod='"+vcod+"'");
    conexao.close();
    response.sendRedirect("recursos.jsp");
%>