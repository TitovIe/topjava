<%@ page import="ru.javawebinar.topjava.model.MealTo" %>
<%@ page import="java.util.List" %>
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
<%
    String color;
    List<MealTo> mealToList = (List<MealTo>) request.getAttribute("meals");
    for (MealTo meal : mealToList) {
        if (meal.isExcess())
            color = "red";
        else
            color = "green";
%>
    <tr style="color: <%=color%>">
        <th><%=meal.getDate()%></th>
        <th><%=meal.getTime()%></th>
        <th><%=meal.getDescription()%></th>
        <th><%=meal.getCalories()%></th>
    </tr>
<%
    }
%>
</table>
</body>
</html>
