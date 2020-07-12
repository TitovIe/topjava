<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Meals</title>
</head>
<body>
<table width ="40%" border="2" style="left: 36px; position: relative">
    <tr>
        <th>Date</th>
        <th>Time</th>
        <th>Description</th>
        <th>Calories</th>
    </tr>
<jsp:useBean id="meals" scope="request" type="java.util.List"/>
<c:forEach var="meal" items="${meals}">
    <c:choose>
        <c:when test="${meal.isExcess() eq true}">
            <c:set var="color" value="red"/>
        </c:when>
        <c:when test="${meal.isExcess() eq false}">
            <c:set var="color" value="green"/>
        </c:when>
    </c:choose>
    <tr style="color: ${color}">
        <th>${meal.getDate()}></th>
        <th>${meal.getTime()}</th>
        <th>${meal.getDescription()}</th>
        <th>${meal.getCalories()}</th>
    </tr>
</c:forEach>
</table>
</body>
</html>
