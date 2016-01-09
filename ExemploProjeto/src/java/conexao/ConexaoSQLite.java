package conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class ConexaoSQLite {
    private Connection conexao;
    private Statement stmt;
    private ResultSet rs;
    
    public ConexaoSQLite()
    {
        String filename= "C:/Users/Mark/Documents/GitHub/departamental/ExemploProjeto/BD_DEP_2015.s3db";
        try {
          stmt = null;
          rs = null;
          Class.forName("org.sqlite.JDBC");
          conexao = DriverManager.getConnection("jdbc:sqlite:"+filename);
        } catch ( Exception e ) {
          System.err.println( e.getClass().getName() + ": " + e.getMessage() );
        }
    }

    public void queryUpdate(String query)
    {
        try {
            stmt = conexao.createStatement();
            stmt.executeUpdate(query);
            stmt.close();        
        } catch ( Exception e ) {
          System.err.println( e.getClass().getName() + ": " + e.getMessage() );
        }
    }
    
    public ResultSet query(String query)
    {
        try {
            stmt = conexao.createStatement();
            rs = stmt.executeQuery(query);
        } catch ( Exception e ) {
          System.err.println( e.getClass().getName() + ": " + e.getMessage() );
        }
        return rs;
    }
    
    public boolean next()
    {
        try {
            return rs.next();
        } catch ( Exception e ) {
          System.err.println( e.getClass().getName() + ": " + e.getMessage() );
        }
        return false;
    }
    
    public int getInt(String fieldName)
    {
        try {
            return rs.getInt(fieldName);
        } catch ( Exception e ) {
          System.err.println( e.getClass().getName() + ": " + e.getMessage() );
        }
        return 0;        
    }

    public String getString(String fieldName)
    {
        try {
            return rs.getString(fieldName);
        } catch ( Exception e ) {
          System.err.println( e.getClass().getName() + ": " + e.getMessage() );
        }
        return "";        
    }

    public double getDouble(String fieldName)
    {
        try {
            return rs.getDouble(fieldName);
        } catch ( Exception e ) {
          System.err.println( e.getClass().getName() + ": " + e.getMessage() );
        }
        return 0.0;        
    }

    public void close()
    {
        try {
            if(stmt != null) stmt.close();
            if(conexao != null) conexao.close();
        } catch ( Exception e ) {
          System.err.println( e.getClass().getName() + ": " + e.getMessage() );
        }
    }
    
}
