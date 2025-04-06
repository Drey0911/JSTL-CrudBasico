<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jspf/conexion.jspf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profesores</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <c:if test="${param.success == 'add'}">
            <div class="alert alert-success">Profesor agregado exitosamente.</div>
        </c:if>
        <c:if test="${param.success == 'edit'}">
            <div class="alert alert-success">Profesor editado exitosamente.</div>
        </c:if>
        <c:if test="${param.success == 'delete'}">
            <div class="alert alert-success">Profesor eliminado exitosamente.</div>
        </c:if>
        <c:if test="${param.error == 'delete'}">
            <div class="alert alert-danger">Error al eliminar el profesor.</div>
        </c:if>
        <h1 class="text-center mb-4">Lista de Profesores</h1>
        <sql:query dataSource="${Profesores}" var="result">
            SELECT 
                profesor.id, 
                profesor.cedula,
                profesor.nombre, 
                profesor.area, 
                profesor.telefono, 
                categoria.descripcion
            FROM profesor
            LEFT JOIN categoria
            ON profesor.id_categoria = categoria.id;
        </sql:query>
        <div class="table-responsive">
        <table class="table table-bordered table-striped">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Cédula</th>
                    <th>Nombre</th>
                    <th>Área</th>
                    <th>Teléfono</th>
                    <th>Categoría</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td>${row.id}</td>
                        <td>${row.cedula}</td>
                        <td>${row.nombre}</td>
                        <td>${row.area}</td>
                        <td>${row.telefono}</td>
                        <td>${row.descripcion}</td>
                        <td>
                            <a href="editar.jsp?id=${row.id}" class="btn btn-warning btn-sm">Editar</a>
                            <a href="eliminar.jsp?id=${row.id}" class="btn btn-danger btn-sm">Eliminar</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        </div>
        <a href="agregar.jsp" class="btn btn-success">Agregar Nuevo Profesor</a>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
