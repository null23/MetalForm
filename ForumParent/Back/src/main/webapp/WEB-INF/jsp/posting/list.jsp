<%@ page contentType="text/html; charset=gb2312" language="java" isELIgnored="false" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
<h2>Hello World!</h2>
<c:forEach items="${list}" var="var">
   <a href="form.action?id=${var.id}">${var.title}</a>

</c:forEach>

<a href="form.action">ĞÂÔö</a>

</body>
</html>
