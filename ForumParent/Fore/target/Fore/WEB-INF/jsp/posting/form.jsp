<%@ page contentType="text/html; charset=gb2312" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<meta charset="UTF-8">
<body><h2>Hello World!</h2>
<form action="save.action" method="post"> id:<input type="text" value="${posting.id}" name="id"> title:<input type="text"
                                                                                                value="${posting.title}"
                                                                                                name="title">
    content:<input type="text" value="${posting.content}" name="content"> plate:<select name="plate"> <c:forEach
            items="${plateList}" var="var"> <c:choose> <c:when test="${var.id==posting.plate}">
        <option value="${var.id}" selected="selected">${var.name}</option>
    </c:when> <c:otherwise>
        <option value="${var.id}">${var.name}</option>
    </c:otherwise> </c:choose> </c:forEach> </select> <input type="submit"></form>
</body>
</html>
