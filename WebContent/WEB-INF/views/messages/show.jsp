<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${message != null}">
                <h2>Page that message detail; id : ${message.id} </h2>
                <table>
                    <tr>
                        <th>Title</th>
                        <td><c:out value="${message.title}" /></td>
                    </tr>

                    <tr>
                        <th>Message</th>
                        <td><c:out value="${message.content}" /></td>
                    </tr>
                    <tr>
                        <th>Date created</th>
                        <td><fmt:formatDate value="${message.created_at}" pattern="MM/dd/YYYY HH:mm:ss" /></td>
                    </tr>
                    <tr>
                        <th>Date updated</th>
                        <td><fmt:formatDate value="${message.updated_at}" pattern="MM/dd/YYYY HH:mm:ss" /></td>
                    </tr>
                </table>
                <p><a href="${pageContext.request.contextPath}/index">Back to list</a></p>
                <p><a href="${pageContext.request.contextPath}/edit?id=${message.id}">Edit this post</a></p>
            </c:when>
            <c:otherwise>
                <h2 style="color : #CC6666;">Your pointed page has been trashed.</h2>
            </c:otherwise>
        </c:choose>
    </c:param>
</c:import>
