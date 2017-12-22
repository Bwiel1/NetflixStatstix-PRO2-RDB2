package SQL;

public class Repository {
    private SqlConnection sqlConnection;

    public Repository(SqlConnection sqlConnection) {
        this.sqlConnection = sqlConnection;
    }
}
