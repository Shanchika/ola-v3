<!DOCTYPE html>
<html>
<head>
    <title>Manage Promo Codes</title>
</head>
<body>
    <h2>Manage Promo Codes</h2>
    <form action="AdminController?action=managePromos" method="POST">
        <label>Promo Code:</label>
        <input type="text" name="promoCode" required>
        <button type="submit">Manage Promo</button>
    </form>

    <%-- Handle promo code management status --%>
    <c:if test="${param.success != null}">
        <p style="color:green">${param.success}</p>
    </c:if>
    <c:if test="${param.error != null}">
        <p style="color:red">${param.error}</p>
    </c:if>
</body>
