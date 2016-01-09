<%-- 
    Document   : recursos-alt
    Created on : 29/12/2015, 16:59:21
    Author     : mark
--%>

<%@page import="conexao.ConexaoSQLite"%>
<%
    
    String vcod = request.getParameter("cxaCod");
    String vhostname = request.getParameter("cxaCod_recursos");
    String vsoperacional = request.getParameter("cxaSoperacional");
    String vmemoria = request.getParameter("cxaMemoria");
    String vprocessador = request.getParameter("cxaProcessador");
    String vvolumetria = request.getParameter("cxaVolumetria");
    String vbanco = request.getParameter("cxaBanco");
        
    ConexaoSQLite conexao = new ConexaoSQLite();
    conexao.queryUpdate("UPDATE Recursos "
            + "SET "
            //+ "cod_recursos='"+vcod_recursos+"'," Não perde o hostname mesmo como null
            + "soperacional='"+vsoperacional+"',"
            + "memoria='"+vmemoria+"',"
            + "processador='"+vprocessador+"',"
            + "volumetria='"+vvolumetria+"',"
            + "banco='"+vbanco+"'"
            + " WHERE cod_rec='"+vcod+"'");
    conexao.close();
    response.sendRedirect("recursos.jsp");
%>