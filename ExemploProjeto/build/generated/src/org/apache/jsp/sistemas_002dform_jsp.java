package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import conexao.ConexaoSQLite;

public final class sistemas_002dform_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/topo.jsp");
    _jspx_dependants.add("/menu.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Sistemas</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap.min.css\">\n");
      out.write("        <script src=\"js/jquery-1.11.1.min.js\"></script>\n");
      out.write("        <script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <div class=\"container\">\n");
      out.write("\n");
      out.write("            <!-- TOPO --> \n");
      out.write("            ");
      out.write('\n');

    String vnomeUser = "";
    if(request.getSession().getAttribute("sessaoNome") != null) {
        vnomeUser = request.getSession().getAttribute("sessaoNome").toString();
    }
    if(vnomeUser.equals("")) {
        response.sendRedirect("index.jsp?erro=2");
    }

      out.write("\n");
      out.write("<!-- TOPO --> \n");
      out.write("<div class=\"row\">\n");
      out.write("    <div class=\"col-md-3\">\n");
      out.write("        <img src=\"imagens/logout.png\" height=\"100px\" width=\"100px\">\n");
      out.write("    </div>\n");
      out.write("    <div class=\"col-md-8 col-md-offset-1\">\n");
      out.write("        <h1>Controle de Sistemas Departamentais\n");
      out.write("            <a href=\"logout.jsp\" class=\"btn btn-primary btn-sm pull-right\">Sair</a> \n");
      out.write("            <span class=\"badge pull-right\" style=\"margin-right: 10px;\">\n");
      out.write("                ");
      out.print( vnomeUser );
      out.write("\n");
      out.write("            </span> \n");
      out.write("        </h1>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            <!-- MIOLO --> \n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-md-2\"> \n");
      out.write("                    ");
      out.write("\n");
      out.write("\n");
      out.write("    <h3>Menu</h3>\n");
      out.write("    <hr>\n");
      out.write("    <div class=\"well\">\n");
      out.write("        <a href=\"home.jsp\">Home</a>\n");
      out.write("        <hr>\n");
      out.write("        <a href=\"contatos.jsp\">Contatos</a>\n");
      out.write("        <hr>\n");
      out.write("        <a href=\"sistemas.jsp\">Sistemas</a>\n");
      out.write("        <hr>\n");
      out.write("        <a href=\"servidores.jsp\">Servidores</a>\n");
      out.write("        <hr>\n");
      out.write("        <a href=\"usuarios.jsp\">Usuários</a>\n");
      out.write("        <hr>\n");
      out.write("        <a href=\"backup.jsp\">Backup</a>\n");
      out.write("        <hr>\n");
      out.write("        <a href=\"monitoracao.jsp\">Monitoração</a>\n");
      out.write("    </div>\n");
      out.write("                \n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-md-8\">\n");
      out.write("                    <h1>\n");
      out.write("                        Sistemas\n");
      out.write("                        <a href=\"usuarios.jsp\" class=\"btn btn-primary pull-right\">voltar</a>\n");
      out.write("                    </h1>\n");
      out.write("                    <div class=\"panel panel-primary\">\n");
      out.write("                        <div class=\"panel-heading\">\n");
      out.write("                            Cadastro de Sistemas\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"panel-body\">\n");
      out.write("                            <!-- MIOLO do PAINEL -->\n");
      out.write("                            ");

                            //insere
                              String vcod = request.getParameter("");
                              String sAction = "sistemas-ins.jsp";
                              String vsistema = "";
                              String vhost = "";
                              int vip = 1;
                              String varea = "";
                              if(vcod != null) {
                                  sAction = "sistemas-alt.jsp";
                                  ConexaoSQLite conexao = new ConexaoSQLite();
                                  conexao.query("SELECT * FROM Sistemas WHERE ID_Sistema='"+vcod+"'");
                                  if(conexao.next()) {
                                      vsistema = conexao.getString("sistema");
                                      vhost = conexao.getString("host");
                                      vip = conexao.getInt("ip");
                                      varea = conexao.getString("area");
                                  }
                                  conexao.close();
                              }
                            
      out.write("\n");
      out.write("                            <form action=\"");
      out.print( sAction );
      out.write("\" method=\"GET\">\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <label>Sistema</label>\n");
      out.write("                                    <input type=\"text\" value=\"");
      out.print( vsistema );
      out.write("\" class=\"form-control\" name=\"cxaSistema\" placeholder=\"Digite nome do sistema\">\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <label>Host</label>\n");
      out.write("                                    <input type=\"text\" value=\"");
      out.print( vhost );
      out.write("\" class=\"form-control\" name=\"cxaHost\" placeholder=\"Digite o Hostname\">\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <label>IP</label>\n");
      out.write("                                    <input type=\"number\" value=\"");
      out.print( vip );
      out.write("\" class=\"form-control\" name=\"cxaIp\" placeholder=\"Digite endereço IP\">\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <label>Area</label>\n");
      out.write("                                    <input type=\"text\" value=\"");
      out.print( varea );
      out.write("\" class=\"form-control\" name=\"cxaArea\" placeholder=\"Digite Area Receptora\">\n");
      out.write("                                </div>\n");
      out.write("                                <input type=\"hidden\" name=\"cxaCod\" value=\"");
      out.print( vcod );
      out.write("\">\n");
      out.write("                                <button type=\"submit\" class=\"btn btn-primary\">Cadastrar</button>\n");
      out.write("                            </form>                            \n");
      out.write("                        </div>\n");
      out.write("                    </div>                    \n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-md-2\"> </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
