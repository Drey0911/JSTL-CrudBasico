<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jspf/conexion.jspf" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Profesor</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Editar Profesor</h1>
        <sql:query dataSource="${Profesores}" var="profesor">
            SELECT * FROM profesor WHERE id = ${param.id};
        </sql:query>
        <c:forEach var="row" items="${profesor.rows}">
            <form action="" method="post" class="row g-3">
                <div class="col-md-12">
                    <label for="nombre" class="form-label">Nombre</label>
                    <input type="text" class="form-control" id="nombre" name="nombre" value="${row.nombre}" required>
                </div>
                <div class="col-md-12">
                    <label for="area" class="form-label">Área</label>
                    <input type="text" class="form-control" id="area" name="area" value="${row.area}" required>
                </div>
                <div class="col-md-12">
                    <label for="telefono" class="form-label">Teléfono</label>
                    <input type="text" class="form-control" id="telefono" name="telefono" value="${row.telefono}" required>
                </div>
                <div class="col-md-12">
                    <label for="id_categoria" class="form-label">Categoría</label>
                    <select class="form-select" id="id_categoria" name="id_categoria" required>
                        <sql:query dataSource="${Profesores}" var="categorias">
                            SELECT id, descripcion FROM categoria;
                        </sql:query>
                        <c:forEach var="categoria" items="${categorias.rows}">
                            <option value="${categoria.id}" ${categoria.id == row.id_categoria ? 'selected' : ''}>
                                ${categoria.descripcion}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-12">
                    <button type="submit" class="btn btn-primary">Guardar Cambios</button>
                    <a href="index.jsp" class="btn btn-secondary">Regresar</a>
                </div>
            </form>
        </c:forEach>
        <c:if test="${not empty param.nombre and not empty param.area and not empty param.telefono and not empty param.id_categoria}">
            <sql:update dataSource="${Profesores}" var="result">
                UPDATE profesor
                SET nombre = '${param.nombre}', area = '${param.area}', telefono = '${param.telefono}', id_categoria = ${param.id_categoria}
                WHERE id = ${param.id};
            </sql:update>
            <c:if test="${result >= 1}">
                <c:redirect url="index.jsp?success=edit" />
            </c:if>
            <c:if test="${result == 0}">
                <c:redirect url="editar.jsp?id=${param.id}&error=true" />
            </c:if>
        </c:if>
        <c:if test="${empty param.nombre or empty param.area or empty param.telefono or empty param.id_categoria}">
            <c:if test="${not empty param.nombre or not empty param.area or not empty param.telefono or not empty param.id_categoria}">
                <c:redirect url="editar.jsp?id=${param.id}&error=true" />
            </c:if>
        </c:if>
    </div>
</body>
</html>
