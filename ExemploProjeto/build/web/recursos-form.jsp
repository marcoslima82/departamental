<%-- 
    Document   : recursos-form
    Created on : 29/12/2015, 16:01:49
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
                        Recursos
                        <a href="recursos.jsp" class="btn btn-primary pull-right">voltar</a>
                    </h1>
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Cadastro de Recursos
                        </div>
                        <div class="panel-body">
                            <!-- MIOLO do PAINEL -->
                            <%
                            
                              String vcod = request.getParameter("cod");
                              String sAction = "recursos-ins.jsp";
                              String vcod_recursos = request.getParameter("cod_recursos");
                              String vsoperacional = "";
                              String vmemoria = "";
                              String vprocessador = "";
                              String vvolumetria = "";
                              String vbanco = "";
                              if(vcod != null) {
                                  sAction = "recursos-alt.jsp";
                                  ConexaoSQLite conexao = new ConexaoSQLite();
                                  conexao.query("SELECT * FROM Recursos WHERE cod='"+vcod+"'");
                                  if(conexao.next()) {
                                      //vcod_recursos = conexao.getString("cod_recursos");
                                      vsoperacional = conexao.getString("soperacional");
                                      vmemoria = conexao.getString("memoria");
                                      vprocessador = conexao.getString("processador");
                                      vvolumetria = conexao.getString("volumetria");
                                      vbanco = conexao.getString("banco");
                                  }
                                  conexao.close();
                              }
                            %>
                            <form action="<%= sAction %>" method="GET">
                                <div class="form-group">
                                    <label>Cod_Rec</label>
                                    <select class="form-control"><option><%= vcod_recursos %></option></select>
                                </div>
                                
                                <div class="form-group">
                                    <label>S.O</label>
                                    <input type="text" value="<%= vsoperacional %>" class="form-control" name="cxaSoperacional" placeholder="Digite o Ip do host">
                                </div>
                                
                                <div class="form-group">
                                    <label>Memoria</label>
                                    <input type="text" value="<%= vmemoria %>" class="form-control" name="cxaMemoria" placeholder="Digite Memoria">
                                </div>
                                <div class="form-group">
                                    <label>Processador</label>
                                    <input type="text" value="<%= vprocessador %>" class="form-control" name="cxaProcessador" placeholder="Digite Processador">
                                </div>
                                <div class="form-group">
                                    <label>Volumetria</label>
                                    <input type="text" value="<%= vvolumetria %>" class="form-control" name="cxaVolumetria" placeholder="Digite Volumetria">
                                </div>
                                <div class="form-group">
                                    <label>Banco</label>
                                    <input type="text" value="<%= vbanco %>" class="form-control" name="cxaBanco" placeholder="Digite Status Banco">
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
