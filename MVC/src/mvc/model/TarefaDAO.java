package mvc.model;

import java.sql.Date;
import java.sql.*;
import java.util.*;

import org.springframework.validation.BindingResult;

public class TarefaDAO {

    private Connection connection = null;
	
    public TarefaDAO() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(
                            "jdbc:mysql://localhost/meus_dados", "root", "123456");
        } catch (SQLException | ClassNotFoundException e) {e.printStackTrace();}
    }

    public void adicionaDescricao(Tarefa tarefa) {
        try {
            String sql = "INSERT INTO tarefas (descricao) values(?)";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1,tarefa.getDescricao());
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {e.printStackTrace();}
    }

    public void adiciona(Tarefa tarefa){
        try {
            String sql = "INSERT INTO tarefas" +
                        "(descricao,finalizado,dataFinalizacao) values(?,?,?)";
           	PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1,tarefa.getDescricao());
            stmt.setBoolean(2, tarefa.isFinalizado());
            if(tarefa.getDataFinalizacao()!=null) {
            	stmt.setDate(3, new Date(tarefa.getDataFinalizacao().getTimeInMillis()));
            } else {
            	stmt.setDate(3, new Date(Calendar.getInstance().getTimeInMillis()));
            }
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {e.printStackTrace();}
    }

    public List<Tarefa> getLista() {
        List<Tarefa> tarefas = new ArrayList<Tarefa>();
        try {	
            PreparedStatement stmt = connection.
					prepareStatement("SELECT * FROM tarefas");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Tarefa tarefa = new Tarefa();
                tarefa.setId(rs.getLong("id"));
                tarefa.setDescricao(rs.getString("descricao"));
                tarefa.setFinalizado(rs.getBoolean("finalizado"));
                Calendar data = Calendar.getInstance();
                Date dataFinalizacao = rs.getDate("dataFinalizacao");
                if(dataFinalizacao!=null) {		
                    data.setTime(dataFinalizacao);
                    tarefa.setDataFinalizacao(data);
                }
                tarefas.add(tarefa);
            }
            rs.close();
            stmt.close();
        } catch(SQLException e) {System.out.println(e);}
        return tarefas;
    }
	
    public void remove(Tarefa tarefa) {
        try {
            PreparedStatement stmt = connection
	                .prepareStatement("DELETE FROM tarefas WHERE id=?");
            stmt.setLong(1, tarefa.getId());
            stmt.execute();
            stmt.close();
        } catch(SQLException e) {System.out.println(e);}
    }

    public Tarefa buscaPorId(Long id) {
        Tarefa tarefa = new Tarefa();
        try {	
            PreparedStatement stmt = connection.
                                    prepareStatement("SELECT * FROM tarefas WHERE id=? ");
            stmt.setLong(1, id);
            ResultSet rs = stmt.executeQuery();
            if(rs.next()) {
                tarefa.setId(rs.getLong("id"));
                tarefa.setDescricao(rs.getString("descricao"));
                tarefa.setFinalizado(rs.getBoolean("finalizado"));
                Calendar data = Calendar.getInstance();
                Date dataFinalizacao = rs.getDate("dataFinalizacao");
                if(dataFinalizacao!=null) {		
                    data.setTime(dataFinalizacao);
                    tarefa.setDataFinalizacao(data);
                }
            }
            rs.close();
            stmt.close();
        } catch(SQLException e) {System.out.println(e);}
        return tarefa;
    }

    public void altera(Tarefa tarefa) {
        try {
            String sql = "UPDATE tarefas SET descricao=?, finalizado=?, " +
            "dataFinalizacao=? WHERE id=?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, tarefa.getDescricao());
            stmt.setBoolean(2, tarefa.isFinalizado());
            stmt.setDate(3, new Date(tarefa.getDataFinalizacao().getTimeInMillis()));
            stmt.setLong(4, tarefa.getId());
            stmt.executeUpdate();
            stmt.close();
        } catch(SQLException e) {System.out.println(e);}
    }
    
    public void alteraEstado(Tarefa tarefa) {
        try {
        	boolean var;
            String sql = "UPDATE tarefas SET finalizado=? " +
            " WHERE id=?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            if(tarefa.isFinalizado()){
            	var = false;
            } else{
            	var = true;
            }
			stmt.setBoolean(1, var);
            stmt.setLong(2, tarefa.getId());
            stmt.executeUpdate();
            stmt.close();
        } catch(SQLException e) {System.out.println(e);}
    }
    
    public void sort(String by) {
        try {
            String sql = "SELECT * from tarefas ORDER BY ? ";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, by);
            stmt.executeUpdate();
            stmt.close();
        } catch(SQLException e) {System.out.println(e);}
    }

    public void close() {
        try { connection.close();}
        catch (SQLException e) {e.printStackTrace();}		
    }

}