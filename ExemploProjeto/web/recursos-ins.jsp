<%-- 
    Document   : recursos-ins
    Created on : 29/12/2015, 17:37:17
    Author     : mark
--%>

<%@page import="conexao.ConexaoSQLite"%>
<%

    String vsoperacional = request.getParameter("cxaSoperacional");
    String vmemoria = request.getParameter("cxaMemoria");
    String vprocessador = request.getParameter("cxaProcessador");
    String vvolumetria = request.getParameter("cxaVolumetria");
    String vbanco = request.getParameter ("cxaBanco");
    
    ConexaoSQLite conexao = new ConexaoSQLite();
    conexao.queryUpdate("INSERT INTO Recursos "
            + "(soperacional,memoria,processador,volumetria,banco) values ("
            + "'"+vsoperacional+"',"
            + "'"+vmemoria+"',"
            + "'"+vprocessador+"',"
            + "'"+vvolumetria+"',"
            + "'"+vbanco+"'"
            + ")");
    conexao.close();
    response.sendRedirect("recursos.jsp");
%>
