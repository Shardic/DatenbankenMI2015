/**
 * Created by Fabian on 27.06.15.
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DBConnection {

    private Connection connection;
    private PreparedStatement loginStatement;

    public DBConnection() {
        try {
            // getConnection(String url, String user, String password)
            //this.connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/tech_groups",
             //       "techgroups_dev", "G3kcu5cMTf1DtKBM3lkv");
            this.connection = DriverManager.getConnection("jdbc:mysql://localhost:3306",
                    "root", "testpassword");

        } catch (SQLException e) {
            System.err.println("Connection wasn't established :-/" + e);

        }
        this.createPreparedStatements();
    }

    private void createPreparedStatements() {
        try {
            this.loginStatement = this.connection.prepareStatement("SELECT * "
                    + "FROM mitglied WHERE username=? AND passwort=?");
        } catch (SQLException e) {
            System.err.println("Creating prepared login Statement failed :-/");
        }
    }

    public void addAuthentication(final String type){
        try {
            final Statement statement = this.connection.createStatement();
            statement.executeUpdate("INSERT INTO authentifizierung VALUES('" + type + "')");
            statement.close();
        } catch (SQLException e) {
            System.err.println("Creating Statement failed :-/");
        }

    }

    public void deleteAuthentication(final String type){
        try {
            final Statement statement = this.connection.createStatement();
            statement.executeUpdate("DELETE FROM authentifizierung WHERE typ='" + type + "'");
            statement.close();
        } catch (SQLException e) {
            System.err.println("Creating Statement failed :-/");
        }

    }

    public List<String> getAllAuthentications(){
        final List<String> authentications = new ArrayList<>();
        try {
            final Statement statement = this.connection.createStatement();
            final ResultSet resultSet = statement.executeQuery("SELECT * FROM authentifizierung");
            while(resultSet.next()){
                authentications.add(resultSet.getString(1));
            }
            statement.close();
        } catch (SQLException e) {
            System.err.println("Creating Statement failed :-/");
        }

        return authentications;
    }

    public boolean login(final String user, final String password){
        boolean loginCorrect = false;
        try {
            this.loginStatement.setString(1, user);
            this.loginStatement.setString(2, password);
            final ResultSet resultSet = this.loginStatement.executeQuery();
            loginCorrect = resultSet.next();
        } catch (SQLException e) {
            System.err.println("Usage of prepared Statement failed :-/");
        }

        return loginCorrect;
    }


    public void close(){
        if(this.connection != null){
            try {
                this.loginStatement.close();
                this.connection.close();
            } catch (SQLException e) {
                System.err.println("Connection couldn't be closed :-/");
            }
        }
    }
}
