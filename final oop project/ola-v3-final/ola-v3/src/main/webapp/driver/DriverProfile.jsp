<%@ page import="com.java.model.Driver" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Driver Profile</title>
    <link rel="icon" type="image/x-icon" href="images/faviconNew.ico">
    <link rel="stylesheet" href="styleRegister.css">
    <link rel="stylesheet" href="indexStyle.css">
</head>
<body>

<div id="details">
<%
    // Fetch the last inserted driver details
    String driverName = "new name"; // Get driverName from request
    List<Driver> detail =  (List<Driver>) request.getAttribute("driver_list");; // Fetch driver details

    // Check if driver details were found
    if (detail == null || detail.isEmpty()) {
%>
        <h2>No driver details found.</h2>
<%
    } else {
        // Set the fetched driver details as a request attribute for JSTL
        request.setAttribute("DriverDetails", detail);
%>

    <h1 style="text-decoration: underline;">DRIVER PROFILE DETAILS</h1>
    <br>
    <br>

    <c:forEach var="driver" items="${DriverDetails}">
        DriverID   : <input type="text" name="aId" value="${driver.driverID}" readonly>
        <br>
        <br>

        DriverName : <input type="text" name="aName" value="${driver.driverName}" readonly>
        <br>
        <br>

        DriverContact : <input type="text" name="aDriverContact" value="${driver.contactNo}" readonly>
        <br>
        <br>

        DriverLicenseNo : <input type="text" name="aDriverCLicenseNo" value="${driver.licenseNo}" readonly>
        <br>
        <br>

        Username  : <input type="text" name="aUsername" value="${driver.userName}" readonly>
        <br>
        <br>

        Password  : <input type="text" name="aPassword" value="${driver.password}" readonly>
        <br>
        <br>
    </c:forEach>
<%
    }
%>
    <!-- Add update and delete buttons here as needed -->
</div>

<!-- Footer or other sections of your page -->
</body>
</html>
