<%@page import="conexao.ConexaoSQLite"%>
<%

    String vnome = request.getParameter("cxaNome");
    String vemail = request.getParameter("cxaEmail");
    
    ConexaoSQLite conexao = new ConexaoSQLite();
    conexao.queryUpdate("INSERT INTO contatos "
            + "(nome,email) values ("
            + "'"+vnome+"',"
            + "'"+vemail+"'"
            + ")");
    conexao.close();
    response.sendRedirect("contatos.jsp");
%>