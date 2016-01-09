<%-- 
    Document   : servidores
    Created on : 23/12/2015, 16:32:39
    Author     : Marcos Lima da Silva
--%>

<%@page import="conexao.ConexaoSQLite"%>
<%@page contentType="text/html" import="java.util.Date, java.text.*" pageEncoding="ISO-8859-1"%>
<html>
    <head>
        <title>Servidores</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                    <h1><small>Lista de Servidores</small></h1>
                    
                    <div class="panel panel-primary">
                        
                        <div class="panel-heading">
                            Lista de servidores 
                            <a href="servidores-form.jsp" class="btn btn-primary btn-sm alert-info pull-right">Novo Servidor</a>
                        </div>
                        <div class="panel-body">
                           
                            <table class="table table-striped table-bordered table-condensed table-hover text-uppercase">
                                <thead>
                                    <tr>
                                        <td>COD</td>
                                        <td>HOSTNAME</td>
                                        <td>IP</td>
                                        <td>MONITORAÇÃO</td>
                                        <td>BACKUP</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%

                                        ConexaoSQLite conexao = new ConexaoSQLite();
                                        conexao.query("SELECT * FROM Servidores");

                                        while (conexao.next()) {
                                            int vcod = conexao.getInt("cod");
                                            String vhostname = conexao.getString("hostname");
                                            String vip = conexao.getString("ip");
                                            String vmonitoracao = conexao.getString("monitoracao");
                                            String vbackup = conexao.getString("backup");

                                            out.println("<tr>");
                                            out.println("<td>" + vcod + "</td>");
                                            out.println("<td>" + vhostname + "</td>");
                                            out.println("<td>" + vip + "</td>");
                                            out.println("<td>" + vmonitoracao + "</td>");
                                            out.println("<td>" + vbackup + "</td>");
                                            //Coluna com Botão ALTERAR
                                            out.println("<td>");
                                            out.println("<a href=\"servidores-form.jsp?cod=" + vcod + "\" class=\"btn btn-primary btn-xs\">");
                                            out.println("<span class=\"glyphicon glyphicon-edit\"></span>");
                                            out.println("alterar");
                                            out.println("</a>");
                                            out.println("</td>");
                                            //Coluna com Botão EXCLUIR
                                            /*out.println("<td>");
                                            out.println("<a href=\"servidores-rem.jsp?cod=" + vcod + "\" class=\"btn btn-danger btn-xs\">");
                                            out.println("<span class=\"glyphicon glyphicon-edit\"></span>");
                                            out.println("excluir");
                                            out.println("</a>");
                                            out.println("</td>");*/
                                        }
                                        conexao.close();
                                    %>
                                </tbody>
                            </table>
                            <hr>
                            
                        </div>
                    </div>                    
                </div>
                <div class="col-md-2"> </div>
            </div>

        </div>

    </body>
</html>


