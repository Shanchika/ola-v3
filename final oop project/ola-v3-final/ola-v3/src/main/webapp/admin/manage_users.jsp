<!DOCTYPE html>
<html>
<head>
    <title>Manage Users</title>
</head>
<body>
    <h2>Manage Users</h2>
    <form action="AdminController?action=deleteUser" method="POST">
        <label>User ID to delete:</label>
        <input type="text" name="userId" required>
        <button type="submit">Delete User</button>
    </form>

    <%-- Handle user deletion status --%>
    <c:if test="${param.success != null}">
        <p style="color:green">${param.success}</p>
    </c:if>
    <c:if test="${param.error != null}">
        <p style="color:red">${param.error}</p>
    </c:if>
</body>
</html>
