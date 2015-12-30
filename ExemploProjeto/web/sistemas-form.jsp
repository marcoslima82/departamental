<%-- 
    Document   : sistemas-form
    Created on : 23/12/2015, 17:15:32
    Author     : USERTQI
--%>

<%@page import="conexao.ConexaoSQLite"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistemas</title>
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
                        Sistemas
                        <a href="sistemas.jsp" class="btn btn-primary pull-right">voltar</a>
                    </h1>
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Cadastro de Sistemas
                        </div>
                        <div class="panel-body">
                            <!-- MIOLO do PAINEL -->
                            <%
                            
                              String vcod = request.getParameter("cod");
                              String sAction = "sistemas-ins.jsp";
                              String vsistema = "";
                              String vhost = "";
                              String vip = "";
                              String varea = "";
                              if(vcod != null) {
                                  sAction = "sistemas-alt.jsp";
                                  ConexaoSQLite conexao = new ConexaoSQLite();
                                  conexao.query("SELECT * FROM Sistemas WHERE cod='"+vcod+"'");
                                  if(conexao.next()) {
                                      vsistema = conexao.getString("sistema");
                                      vhost = conexao.getString("host");
                                      vip = conexao.getString("ip");
                                      varea = conexao.getString("area");
                                  }
                                  conexao.close();
                              }
                            %>
                            <form action="<%= sAction %>" method="GET">
                                <div class="form-group">
                                    <label>Sistema</label>
                                    <input type="text" value="<%= vsistema %>" class="form-control" name="cxaSistema" placeholder="Digite nome do sistema">
                                </div>
                                <div class="form-group">
                                    <label>Host</label>
                                    <input type="text" value="<%= vhost %>" class="form-control" name="cxaHost" placeholder="Digite o Hostname">
                                </div>
                                <div class="form-group">
                                    <label>IP</label>
                                    <input type="text" value="<%= vip %>" class="form-control" name="cxaIp" placeholder="Digite endereço IP">
                                </div>
                                <div class="form-group">
                                    <label>Area</label>
                                    <input type="text" value="<%= varea %>" class="form-control" name="cxaArea" placeholder="Digite Area Receptora">
                                </div>
                                <input type="hidden" name="cxaCod" value="<%= vcod %>" class="form-control">
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

