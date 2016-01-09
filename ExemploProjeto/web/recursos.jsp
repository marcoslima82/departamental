<%-- 
    Document   : recursos
    Created on : 29/12/2015, 15:53:05
    Author     : mark
--%>

<%@page import="conexao.ConexaoSQLite"%>
<%@page contentType="text/html" import="java.util.Date, java.text.*" pageEncoding="ISO-8859-1"%>
<html>
    <head>
        <title>Recursos</title>
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
                    <h1>Recursos dos Servidores</h1>
                    <div class="panel panel-primary">
                        <div class="panel-heading">Recurso dos servidores</div>
                        <div class="panel-body">
                            <table class="table table-striped table-bordered table-condensed table-hover">
                                <thead>
                                    <tr>
                                        <td>COD</td>
                                        <td>HOSTNAME</td>
                                        <td>S.O</td>
                                        <td>MEMORIA</td>
                                        <td>PROCESSADOR</td>
                                        <td>VOLUMETRIA</td>
                                        <td>BANCO</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%

                                        ConexaoSQLite conexao = new ConexaoSQLite();
                                        //conexao.query("SELECT * FROM Recursos");
                                        conexao.query("SELECT cod_rec,Servidores.hostname,soperacional,memoria,processador,volumetria,banco "
                                                + "from Recursos,Servidores "
                                                + "where Recursos.cod_recursos like Servidores.cod");
                                        while (conexao.next()) {
                                            int vcod = conexao.getInt("cod_rec");
                                            String vhostname = conexao.getString("hostname");
                                            String vsoperacional = conexao.getString("soperacional");
                                            String vmemoria = conexao.getString("memoria");
                                            String vprocessador = conexao.getString("processador");
                                            String vvolumetria = conexao.getString("volumetria");
                                            String vbanco = conexao.getString("banco");
                                            //String vcod_recursos = conexao.getString("cod_recursos");
                                            
                                            out.println("<tr>");
                                            out.println("<td>" + vcod + "</td>");
                                            out.println("<td>" + vhostname + "</td>");
                                            out.println("<td>" + vsoperacional + "</td>");
                                            out.println("<td>" + vmemoria + "</td>");
                                            out.println("<td>" + vprocessador + "</td>");
                                            out.println("<td>" + vvolumetria + "</td>");
                                            out.println("<td>" + vbanco + "</td>");
                                           
                                            //Coluna com Botão ALTERAR
                                            out.println("<td>");
                                            out.println("<a href=\"recursos-form.jsp?cod_rec=" + vcod + "\" class=\"btn btn-primary btn-xs\">");
                                            out.println("<span class=\"glyphicon glyphicon-edit\"></span>");
                                            out.println("alterar");
                                            out.println("</a>");
                                            out.println("</td>");
                                            /*Coluna com Botão EXCLUIR
                                            out.println("<td>");
                                            out.println("<a href=\"recursos-rem.jsp?cod_rec=" + vcod + "\" class=\"btn btn-danger btn-xs\">");
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
                            <a href="recursos-form.jsp" class="btn btn-primary">Novo Servidor</a>
                        </div>
                    </div>                    
                </div>
                <div class="col-md-2"> </div>
            </div>

        </div>

    </body>
</html>
