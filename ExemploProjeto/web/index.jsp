<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Controle de sistemas departamentais v.1.0</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-3"> </div>
                <div class="col-md-6"> 
                    <hr>
                    <img src="imagens/logout.png" height="100px" width="100px">
                    <form class="form" action="login.jsp" method="POST">
                        <h2>Controle de Sistemas Departamentais</h2>
                        <input type="text" name="cxaLogin" class="form-control" placeholder="Digite seu login">
                        <input type="password" name="cxaSenha" class="form-control" placeholder="Password" required>
                        <br>
                        <%
                            String verro = request.getParameter("erro");
                            if(verro != null) {
                                out.print("<div class=\"alert alert-danger\">Login ou senha inválidos!</div>");
                            }
                        %>
                        <button type="submit" class="btn btn-lg btn-primary btn-block">Acessar</button>
                    </form>
                </div>
                <div class="col-md-3"> </div>
            </div>
        </div> <!-- /container -->
    </body>
</html>