<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jspf/conexion.jspf" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar Profesor</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Agregar Profesor</h1>
        <c:if test="${not empty param.success}">
            <div class="alert alert-success">Profesor agregado exitosamente.</div>
        </c:if>
        <c:if test="${not empty param.error}">
            <div class="alert alert-danger">Error al agregar el profesor. Por favor, complete todos los campos.</div>
        </c:if>
        <form action="" method="post" class="row g-3">
            <div class="col-md-12">
                <label for="cedula" class="form-label">Cédula</label>
                <input type="text" class="form-control" id="cedula" name="cedula" required>
            </div>
            <div class="col-md-12">
                <label for="nombre" class="form-label">Nombre</label>
                <input type="text" class="form-control" id="nombre" name="nombre" required>
            </div>
            <div class="col-md-12">
                <label for="area" class="form-label">Área</label>
                <input type="text" class="form-control" id="area" name="area" required>
            </div>
            <div class="col-md-12">
                <label for="telefono" class="form-label">Teléfono</label>
                <input type="text" class="form-control" id="telefono" name="telefono" required>
            </div>
            <div class="col-md-12">
                <label for="id_categoria" class="form-label">Categoría</label>
                <select class="form-select" id="id_categoria" name="id_categoria" required>
                    <option value="" disabled selected>Seleccione una categoría</option>
                    <sql:query dataSource="${Profesores}" var="categorias">
                        SELECT id, descripcion FROM categoria;
                    </sql:query>
                    <c:forEach var="categoria" items="${categorias.rows}">
                        <option value="${categoria.id}">${categoria.descripcion}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-12">
                <button type="submit" class="btn btn-primary">Agregar</button>
                <a href="index.jsp" class="btn btn-secondary">Regresar</a>
            </div>
        </form>
        <c:if test="${not empty param.cedula and not empty param.nombre and not empty param.area and not empty param.telefono and not empty param.id_categoria}">
            <sql:update dataSource="${Profesores}" var="result">
                INSERT INTO profesor (cedula, nombre, area, telefono, id_categoria)
                VALUES ('${param.cedula}', '${param.nombre}', '${param.area}', '${param.telefono}', ${param.id_categoria});
            </sql:update>
            <c:if test="${result >= 1}">
                <c:redirect url="index.jsp?success=add" />
            </c:if>
            <c:if test="${result == 0}">
                <c:redirect url="agregar.jsp?error=true" />
            </c:if>
        </c:if>
        <c:if test="${empty param.cedula or empty param.nombre or empty param.area or empty param.telefono or empty param.id_categoria}">
            <c:if test="${not empty param.cedula or not empty param.nombre or not empty param.area or not empty param.telefono or not empty param.id_categoria}">
                <c:redirect url="agregar.jsp?error=true" />
            </c:if>
        </c:if>
    </div>
</body>
</html>
