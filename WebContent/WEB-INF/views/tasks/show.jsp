<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${task != null}">
                <h2>Page that task detail; id : ${task.id} </h2>
                <table>
                    <tr>
                        <th>Content</th>
                        <td><c:out value="${content.content}" /></td>
                    </tr>
                    <tr>
                        <th>Date created</th>
                        <td><fmt:formatDate value="${task.created_at}" pattern="MM/dd/YYYY HH:mm:ss" /></td>
                    </tr>
                    <tr>
                        <th>Date updated</th>
                        <td><fmt:formatDate value="${task.updated_at}" pattern="MM/dd/YYYY HH:mm:ss" /></td>
                    </tr>
                </table>
                <p><a href="${pageContext.request.contextPath}/index">Back to list</a></p>
                <p><a href="${pageContext.request.contextPath}/edit?id=${task.id}">Edit this post</a></p>
            </c:when>
            <c:otherwise>
                <h2 style="color : #CC6666;">Your pointed page has not found.</h2>
            </c:otherwise>
        </c:choose>
    </c:param>
</c:import>
