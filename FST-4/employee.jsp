<!DOCTYPE html>
<html>

<head>
    <title>Employee Registration</title>
</head>

<body>

    <!-- Displays the employee registration form heading -->
    <h2>Employee Registration Form</h2>

    <!-- Employee registration form -->
    <form action="register" method="post">

        <!-- First name input field -->
        <label>First Name:</label>
        <input type="text"
               name="firstName"
               pattern="[A-Za-z]+"
               title="Only letters are allowed"
               required>
        <br><br>

        <!-- Last name input field -->
        <label>Last Name:</label>
        <input type="text"
               name="lastName"
               pattern="[A-Za-z]+"
               title="Only letters are allowed"
               required>
        <br><br>

        <!-- Email input field -->
        <label>Email:</label>
        <input type="email"
               name="email"
               required>
        <br><br>

        <!-- Phone number input field -->
        <label>Phone:</label>
        <input type="text"
               name="phone"
               inputmode="numeric"
               oninput="this.value = this.value.replace(/[^0-9]/g, '')"
               pattern="[0-9]+"
               title="Only numbers are allowed"
               required>
        <br><br>

        <!-- Salary input field -->
        <label>Salary:</label>
        <input type="number"
               name="salary"
               min="0"
               step="0.01"
               required>
        <br><br>

        <!-- Submit button -->
        <input type="submit" value="Register">

    </form>

</body>

</html>