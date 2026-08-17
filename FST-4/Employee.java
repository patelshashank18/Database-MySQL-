
    public class Employee {

    private String firstName;
    private String lastName;
    private String email;
    private String phone;
    private double salary;

    // Constructor
    public Employee(String firstName, String lastName,
                    String email, String phone,
                    double salary) {

        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
        this.salary = salary;
    }

    // Getters
    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public double getSalary() {
        return salary;
    }
}

