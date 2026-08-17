import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet that handles employee registration requests.
 */
@WebServlet("/register")
public class EmployeeServlet extends HttpServlet {

        /**
         * Handles POST requests from the employee registration form.
         *
         * @param request  HTTP request containing employee form data
         * @param response HTTP response sent back to the client
         * @throws ServletException if a servlet-related error occurs
         * @throws IOException      if an input or output error occurs
         */
        protected void doPost(HttpServletRequest request,
                        HttpServletResponse response)
                        throws ServletException, IOException {

                /**
                 * Gets employee form data from the request.
                 */
                String firstName = request.getParameter("firstName");

                String lastName = request.getParameter("lastName");

                String email = request.getParameter("email");

                String phone = request.getParameter("phone");

                double salary = Double.parseDouble(
                                request.getParameter("salary"));

                /**
                 * Creates an Employee object using the form data.
                 */
                Employee employee = new Employee(
                                firstName,
                                lastName,
                                email,
                                phone,
                                salary);

                /**
                 * Creates an EmployeeDao object.
                 */
                EmployeeDao dao = new EmployeeDao();

                /**
                 * Saves employee data into the database.
                 */
                dao.saveEmployee(employee);

                /**
                 * Sets the response content type to HTML.
                 */
                response.setContentType("text/html");

                /**
                 * Sends the employee registration result
                 * back to the browser.
                 */
                response.getWriter().println(
                                "<html><body>"
                                                + "<h2>Employee Registered Successfully!</h2>"
                                                + "<p>First Name: " + firstName + "</p>"
                                                + "<p>Last Name: " + lastName + "</p>"
                                                + "<p>Email: " + email + "</p>"
                                                + "<p>Phone: " + phone + "</p>"
                                                + "<p>Salary: " + salary + "</p>"
                                                + "</body></html>");
        }
}