<%-- 
    Document   : servidores-form
    Created on : 27/12/2015, 19:28:52
    Author     : mark
--%>


<%@page import="conexao.ConexaoSQLite"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Servidores</title>
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
                        Servidores
                        <a href="sistemas.jsp" class="btn btn-primary pull-right">voltar</a>
                    </h1>
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Cadastro de Servidores
                        </div>
                        <div class="panel-body">
                            <!-- MIOLO do PAINEL -->
                            <%
                            
                              String vcod = request.getParameter("cod");
                              String sAction = "servidores-ins.jsp";
                              String vhostname = "";
                              String vip = "";
                              String vmonitoracao = "";
                              String vbackup = "";
                              if(vcod != null) {
                                  sAction = "servidores-alt.jsp";
                                  ConexaoSQLite conexao = new ConexaoSQLite();
                                  conexao.query("SELECT * FROM Servidores WHERE cod='"+vcod+"'");
                                  if(conexao.next()) {
                                      vhostname = conexao.getString("hostname");
                                      vip = conexao.getString("ip");
                                      vmonitoracao = conexao.getString("monitoracao");
                                      vbackup = conexao.getString("backup");
                                  }
                                  conexao.close();
                              }
                            %>
                            <form action="<%= sAction %>" method="GET">
                                <div class="form-group">
                                    <label>Hostname</label>
                                    <input type="text" value="<%= vhostname %>" class="form-control" name="cxaHostname" placeholder="Digite nome do host">
                                </div>
                                <div class="form-group">
                                    <label>Ip</label>
                                    <input type="text" value="<%= vip %>" class="form-control" name="cxaIp" placeholder="Digite o Ip do host">
                                </div>
                                <div class="form-group">
                                    <label>Monitoração</label>
                                    <input type="text" value="<%= vmonitoracao %>" class="form-control" name="cxaMonitoracao" placeholder="Digite Status Monitoração">
                                </div>
                                <div class="form-group">
                                    <label>Backup</label>
                                    <input type="text" value="<%= vbackup %>" class="form-control" name="cxaBackup" placeholder="Digite Status Backup">
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

