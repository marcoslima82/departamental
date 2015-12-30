<%@page import="conexao.ConexaoSQLite"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>

        <div class="container">

            <!-- TOPO --> 
            <%@ include file="topo.jsp" %>

            <!-- MIOLO --> 
            <div class="row">
                <div class="col-md-2"> 
                    <%@ include file="menu.jsp" %>                
                </div>
                <div class="col-md-8">
                    <h1>
                        Usuários
                        <a href="usuarios.jsp" class="btn btn-primary pull-right">voltar</a>
                    </h1>
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Cadastro de Usuários
                        </div>
                        <div class="panel-body">
                            <!-- MIOLO do PAINEL -->
                            <%
                              String vcod = request.getParameter("cod");
                              String sAction = "usuarios-ins.jsp";
                              String vnome = "";
                              String vlogin = "";
                              String vsenha = "";
                              if(vcod != null) {
                                  sAction = "usuarios-alt.jsp";
                                  ConexaoSQLite conexao = new ConexaoSQLite();
                                  conexao.query("SELECT * FROM usuarios WHERE cod='"+vcod+"'");
                                  if(conexao.next()) {
                                      vnome = conexao.getString("nome");
                                      vlogin = conexao.getString("login");
                                      vsenha = conexao.getString("senha");
                                  }
                                  conexao.close();
                              }
                            %>
                            <form action="<%= sAction %>" method="GET">
                                <div class="form-group">
                                    <label>Nome</label>
                                    <input type="text" value="<%= vnome %>" class="form-control" name="cxaNome" placeholder="Digite nome do contato">
                                </div>
                                <div class="form-group">
                                    <label>Login</label>
                                    <input type="text" value="<%= vlogin %>" class="form-control" name="cxaLogin" placeholder="Digite email do contato">
                                </div>
                                <div class="form-group">
                                    <label>Senha</label>
                                    <input type="password" value="<%= vsenha %>" class="form-control" name="cxaSenha" placeholder="Digite email do contato">
                                </div>
                                <input type="hidden" name="cxaCod" value="<%= vcod %>">
                                <button type="submit" class="btn btn-primary">Cadastrar</button>
                            </form>                            
                        </div>
                    </div>                    
                </div>
                <div class="col-md-2"> </div>
            </div>

        </div>
    </body>
</html>
