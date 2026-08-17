/**
 * Represents an employee and stores employee information.
 */
public class Employee {

    /**
     * Stores the first name of the employee.
     */
    private String firstName;

    /**
     * Stores the last name of the employee.
     */
    private String lastName;

    /**
     * Stores the email address of the employee.
     */
    private String email;

    /**
     * Stores the phone number of the employee.
     */
    private String phone;

    /**
     * Stores the salary of the employee.
     */
    private double salary;

    /**
     * Constructs an Employee object with the given details.
     *
     * @param firstName first name of the employee
     * @param lastName last name of the employee
     * @param email email address of the employee
     * @param phone phone number of the employee
     * @param salary salary of the employee
     */
    public Employee(String firstName, String lastName,
                    String email, String phone,
                    double salary) {

        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
        this.salary = salary;
    }

    /**
     * Returns the first name of the employee.
     *
     * @return first name of the employee
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * Returns the last name of the employee.
     *
     * @return last name of the employee
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * Returns the email address of the employee.
     *
     * @return email address of the employee
     */
    public String getEmail() {
        return email;
    }

    /**
     * Returns the phone number of the employee.
     *
     * @return phone number of the employee
     */
    public String getPhone() {
        return phone;
    }

    /**
     * Returns the salary of the employee.
     *
     * @return salary of the employee
     */
    public double getSalary() {
        return salary;
    }
}