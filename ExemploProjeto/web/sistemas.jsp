<%-- 
    Document   : sistemas
    Created on : 23/12/2015, 16:32:39
    Author     : Marcos Lima da Silva
--%>

<%@page import="conexao.ConexaoSQLite"%>
<%@page contentType="text/html" import="java.util.Date, java.text.*" pageEncoding="ISO-8859-1"%>
<html>
    <head>
        <title>Sistemas</title>
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
                    <h1><small>Lista de Sistemas</small></h1>
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Lista de sistemas
                        <a href="sistemas-form.jsp" class="btn btn-primary btn-sm alert-info pull-right">Novo Sistema</a>
                        </div>
                        <div class="panel-body">
                            <table class="table table-striped table-bordered table-condensed table-hover text-uppercase">
                                <thead>
                                    <tr>
                                        <td>COD</td>
                                        <td>SISTEMA</td>
                                        <td>SERVIDOR</td>
                                        <td>AREA RECEPTORA</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%

                                        ConexaoSQLite conexao = new ConexaoSQLite();
                                        conexao.query("SELECT cod_sis,sistema,Servidores.hostname,area "
                                                + "FROM Sistemas,Servidores "
                                                + "WHERE Sistemas.cod_sistema = Servidores.cod ");

                                        while (conexao.next()) {
                                            int vcod = conexao.getInt("cod_sis");
                                            String vsistema = conexao.getString("sistema");
                                            String vhost = conexao.getString("hostname");
                                            String varea = conexao.getString("area");

                                            out.println("<tr>");
                                            out.println("<td>" + vcod + "</td>");
                                            out.println("<td>" + vsistema + "</td>");
                                            out.println("<td>" + vhost + "</td>");
                                            //out.println("<td>" + vip + "</td>");
                                            out.println("<td>" + varea + "</td>");
                                            //Coluna com Botão ALTERAR
                                            out.println("<td>");
                                            out.println("<a href=\"sistemas-form.jsp?cod_sis=" + vcod + "\" class=\"btn btn-primary btn-xs\">");
                                            out.println("<span class=\"glyphicon glyphicon-edit\"></span>");
                                            out.println("alterar");
                                            out.println("</a>");
                                            out.println("</td>");
                                            /*Coluna com Botão EXCLUIR
                                            out.println("<td>");
                                            out.println("<a href=\"sistemas-rem.jsp?cod=" + vcod + "\" class=\"btn btn-danger btn-xs\">");
                                            out.println("<span class=\"glyphicon glyphicon-edit\"></span>");
                                            out.println("excluir");
                                            out.println("</a>");
                                            out.println("</td>");
                                                    */
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

