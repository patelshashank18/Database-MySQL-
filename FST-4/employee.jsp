<!DOCTYPE html>
<html>

<head>
    <title>Employee Registration</title>
</head>

<body>

    <h2>Employee Registration Form</h2>

    <form action="register" method="post">

        <label>First Name:</label>
        <input type="text"
               name="firstName"
               pattern="[A-Za-z]+"
               title="Only letters are allowed"
               required>
        <br><br>

        <label>Last Name:</label>
        <input type="text"
               name="lastName"
               pattern="[A-Za-z]+"
               title="Only letters are allowed"
               required>
        <br><br>

        <label>Email:</label>
        <input type="email"
               name="email"
               required>
        <br><br>

        <label>Phone:</label>
        <input type="text"
               name="phone"
               inputmode="numeric"
               oninput="this.value = this.value.replace(/[^0-9]/g, '')"
               pattern="[0-9]+"
               title="Only numbers are allowed"
               required>
        <br><br>

        <label>Salary:</label>
        <input type="number"
               name="salary"
               min="0"
               step="0.01"
               required>
        <br><br>

        <input type="submit" value="Register">

    </form>

</body>

</html>