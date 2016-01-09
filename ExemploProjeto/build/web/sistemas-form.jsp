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
<c:forEach var="lista" items="${lista}"><c:out value="${lista}"/><br></c:forEach>
        <div class="container">

            <!-- TOPO --> 
            <%@ include file="topo.jsp" %>

            <!-- MIOLO --> 
            <div class="row">
                <div class="col-md-2"> 
                    <%@ include file="menu.jsp" %>                
                </div>
                <div class="col-md-8">
                    <h1><small>
                            Sistemas</small>
                        <a href="sistemas.jsp" class="btn btn-primary pull-right">voltar</a>
                    </h1>
                    <div class="panel panel-primary">
                        <div class="panel-heading"><small>
                                Cadastro de Sistemas</small>
                        </div>
                        <div class="panel-body">
                            <!-- MIOLO do PAINEL -->
                            <%  
                                
                                String vcod = request.getParameter("cod_sis");
                                String vhost = "vazio";
                                String sAction = "sistemas-ins.jsp";
                                String vsistema = "";
                                String varea = "";
                                String vcod_servidor = "";
                                
                                //testes de variaveis
                                System.out.println("vhost > "+vhost+ " cod_sis > "+vcod );
                               
                                if (vcod != null) 
                                {
                                    sAction = "sistemas-alt.jsp";
                                    ConexaoSQLite conexao = new ConexaoSQLite();
                                    conexao.query("SELECT cod_sis,sistema,Servidores.hostname,Servidores.ip,area,cod_sistema,Servidores.cod "
                                            + "FROM Sistemas,Servidores "
                                            + " WHERE cod_sis='" + vcod + "'");

                                    if (conexao.next())
                                    {   
                                        vcod_servidor = conexao.getString("hostname");
                                        vsistema = conexao.getString("sistema");
                                        //vcod = conexao.getString("cod_sis");
                                        vhost = conexao.getString("hostname");
                                        varea = conexao.getString("area");
                                        
                                    }
                                        conexao.close();
                                }
                            %>
                            <form action="<%= sAction%>" method="GET">

                                <div class="form-group">
                                    <label>COD_Servidor</label>
                                    <select class="form-control" id="cxaServidor"><option><%= vcod_servidor%></option></select>
                                </div>

                                <div class="form-group">
                                    <label>Sistema</label>
                                    <input type="text" value="<%= vsistema%>" class="form-control" name="cxaSistema" placeholder="Digite nome do sistema">
                                </div>
                                <div class="form-group">
                                    <label>Servidor</label>
                                    <input class="form-control" name="cxaServidor" value="<%= vhost %>" disabled="">
                                   </div>

                                <div class="form-group">
                                    <label>Area Receptora</label>
                                    <input type="text" value="<%= varea%>" class="form-control" name="cxaArea" placeholder="Digite Area Receptora">
                                </div>
                                <input type="hidden" name="cxaCod" value="<%= vcod%>" class="form-control">
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

