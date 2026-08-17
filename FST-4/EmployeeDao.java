import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class EmployeeDao {

    // Database name is EmployeeData
    private String url =
            "jdbc:mysql://localhost:3306/EmployeeData";

    private String username = "root";
    private String password = "root";

    public void saveEmployee(Employee employee) {

        // Table name is employee
        String sql = "INSERT INTO employee " +
                "(first_name, last_name, email, phone, salary) " +
                "VALUES (?, ?, ?, ?, ?)";

        try {

            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to EmployeeData database
            Connection con =
                    DriverManager.getConnection(
                            url, username, password);

            // Create prepared statement
            PreparedStatement ps =
                    con.prepareStatement(sql);

            // Set employee values
            ps.setString(1, employee.getFirstName());
            ps.setString(2, employee.getLastName());
            ps.setString(3, employee.getEmail());
            ps.setString(4, employee.getPhone());
            ps.setDouble(5, employee.getSalary());

            // Insert data into employee table
            ps.executeUpdate();

            System.out.println("Employee saved successfully.");

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}