<%@page import="conexao.ConexaoSQLite"%>
<%

    String vlogin = request.getParameter("cxaLogin");
    String vsenha = request.getParameter("cxaSenha");
    
    ConexaoSQLite conexao = new ConexaoSQLite();
    conexao.query("SELECT * FROM Login WHERE "
            + "login='"+vlogin+"' AND senha='"+vsenha+"'");
    if(conexao.next()) {
        String vnome = conexao.getString("login");
        request.getSession().setAttribute("sessaoNome", vnome);
        conexao.close();
        response.sendRedirect("home.jsp");
    }
    else {
        conexao.close();
        response.sendRedirect("index.jsp?erro=1");
    }
    
%>
