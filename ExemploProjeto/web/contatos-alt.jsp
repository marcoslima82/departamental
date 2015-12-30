<%@page import="conexao.ConexaoSQLite"%>
<%

    String vcod = request.getParameter("cxaCod");
    String vnome = request.getParameter("cxaNome");
    String vemail = request.getParameter("cxaEmail");
    
    ConexaoSQLite conexao = new ConexaoSQLite();
    conexao.queryUpdate("UPDATE contatos "
            + "SET "
            + "nome='"+vnome+"',"
            + "email='"+vemail+"'"
            + " WHERE cod='"+vcod+"'");
    conexao.close();
    response.sendRedirect("contatos.jsp");
%>