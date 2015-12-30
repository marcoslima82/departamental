<%@page import="conexao.ConexaoSQLite"%>
<%@page contentType="text/html" import="java.util.Date, java.text.*" pageEncoding="ISO-8859-1"%>
<html>
    <head>
        <title>Usuários</title>
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
                    <h1>Lista de Usuários</h1>
                    <div class="panel panel-primary">
                        <div class="panel-heading">Lista de usuários</div>
                        <div class="panel-body">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <td>COD</td>
                                        <td>NOME</td>
                                        <td>LOGIN</td>
                                        <td>SENHA</td>
                                        <td> </td>
                                        <td> </td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%

                                        ConexaoSQLite conexao = new ConexaoSQLite();
                                        conexao.query("SELECT * FROM usuarios");

                                        while (conexao.next()) {
                                            int vcod = conexao.getInt("cod");
                                            String vnome = conexao.getString("nome");
                                            String vlogin = conexao.getString("login");
                                            String vsenha = conexao.getString("senha");

                                            out.println("<tr>");
                                            out.println("<td>" + vcod + "</td>");
                                            out.println("<td>" + vnome + "</td>");
                                            out.println("<td>" + vlogin + "</td>");
                                            out.println("<td>" + vsenha + "</td>");
                                            //Coluna com Botão ALTERAR
                                            out.println("<td>");
                                            out.println("<a href=\"usuarios-form.jsp?cod=" + vcod + "\" class=\"btn btn-primary btn-xs\">");
                                            out.println("<span class=\"glyphicon glyphicon-edit\"></span>");
                                            out.println("alterar");
                                            out.println("</a>");
                                            out.println("</td>");
                                            //Coluna com Botão EXCLUIR
                                            out.println("<td>");
                                            out.println("<a href=\"usuarios-rem.jsp?cod=" + vcod + "\" class=\"btn btn-primary btn-xs\">");
                                            out.println("<span class=\"glyphicon glyphicon-edit\"></span>");
                                            out.println("excluir");
                                            out.println("</a>");
                                            out.println("</td>");
                                        }
                                        conexao.close();
                                    %>
                                </tbody>
                            </table>
                            <hr>
                            <a href="usuarios-form.jsp" class="btn btn-primary">Novo Usuario</a>
                        </div>
                    </div>                    
                </div>
                <div class="col-md-2"> </div>
            </div>

        </div>

    </body>
</html>
