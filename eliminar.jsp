<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jspf/conexion.jspf" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eliminar Profesor</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Eliminar Profesor</h1>
        <p class="text-center">¿Está seguro de que desea eliminar este profesor?</p>
        <div class="row justify-content-center">
            <div class="col-md-6 d-flex justify-content-around">
                <form action="" method="post">
                    <input type="hidden" name="confirm" value="yes">
                    <button type="submit" class="btn btn-danger">Sí</button>
                </form>
                <form action="index.jsp" method="get">
                    <button type="submit" class="btn btn-secondary">No</button>
                </form>
            </div>
        </div>
        <c:if test="${param.confirm == 'yes'}">
            <sql:update dataSource="${Profesores}" var="result">
                DELETE FROM profesor WHERE id = ${param.id};
            </sql:update>
            <c:if test="${result >= 1}">
                <c:redirect url="index.jsp?success=delete" />
            </c:if>
            <c:if test="${result == 0}">
                <c:redirect url="index.jsp?error=delete" />
            </c:if>
        </c:if>
    </div>
</body>
</html>
