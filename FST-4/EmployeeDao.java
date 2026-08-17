import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Data Access Object for saving employee information
 * into the EmployeeData database.
 */
public class EmployeeDao {

    /**
     * Database connection URL for the EmployeeData database.
     */
    private String url =
            "jdbc:mysql://localhost:3306/EmployeeData";

    /**
     * Database username.
     */
    private String username = "root";

    /**
     * Database password.
     */
    private String password = "root";

    /**
     * Saves employee information into the employee table.
     *
     * @param employee employee object containing employee details
     */
    public void saveEmployee(Employee employee) {

        /**
         * SQL query to insert employee information
         * into the employee table.
         */
        String sql = "INSERT INTO employee " +
                "(first_name, last_name, email, phone, salary) " +
                "VALUES (?, ?, ?, ?, ?)";

        try {

            /**
             * Loads the MySQL JDBC driver.
             */
            Class.forName("com.mysql.cj.jdbc.Driver");

            /**
             * Establishes a connection to the EmployeeData database.
             */
            Connection con =
                    DriverManager.getConnection(
                            url, username, password);

            /**
             * Creates a PreparedStatement for the SQL query.
             */
            PreparedStatement ps =
                    con.prepareStatement(sql);

            /**
             * Sets employee values in the prepared statement.
             */
            ps.setString(1, employee.getFirstName());
            ps.setString(2, employee.getLastName());
            ps.setString(3, employee.getEmail());
            ps.setString(4, employee.getPhone());
            ps.setDouble(5, employee.getSalary());

            /**
             * Executes the INSERT query and saves the employee data.
             */
            ps.executeUpdate();

            System.out.println("Employee saved successfully.");

            /**
             * Closes the PreparedStatement and database connection.
             */
            ps.close();
            con.close();

        } catch (Exception e) {

            /**
             * Prints the exception details if an error occurs.
             */
            e.printStackTrace();
        }
    }
}