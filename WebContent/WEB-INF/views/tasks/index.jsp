<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <h2>Task list</h2>
        <table id="indexTable">
            <tr>
                <th>Task ID</th>
                <td>Task content</td>
            </tr>
            <c:forEach var="task" items="${tasks}">
                <tr>
                   <th>
                     <a href="${pageContext.request.contextPath}/show?id=${task.id}">
                         <c:out value="${task.id}"/>
                     </a>
                   </th>
                   <td><c:out value="${task.content}" />
                   </td>
                </tr>
            </c:forEach>
        </table>
        <div id="pagination">
            (all ${tasks_count} tasks)<br>
            <c:forEach var="i" begin="1" end="${((tasks_count - 1) / 15) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/index?page=${i}"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        <p><a href="${pageContext.request.contextPath}/new">Post new task</a></p>
    </c:param>
</c:import>
