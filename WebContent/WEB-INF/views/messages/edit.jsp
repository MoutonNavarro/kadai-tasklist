<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${message != null}">

                <h2>Edit page that message; id : ${message.id} </h2>

                <form method="POST" action="${pageContext.request.contextPath}/update">
                    <c:import url="_form.jsp" />
                </form>

                <p><a href="${pageContext.request.contextPath}/index">Back to list</a></p>
                <p><a href="#" onclick="confirmDestroy();">Delete this message</a></p>
                <form method="POST" action="${pageContext.request.contextPath}/destroy">
                    <input type="hidden" name="_token" value="${_token}" />
                </form>
                <script>
                function confirmDestroy(){
                    if (confirm("You trying to delete this post. Really do you that?")){
                        document.forms[1].submit();
                    }
                }
                </script>
            </c:when>
            <c:otherwise>
                <h2 style="color : #CC6666;">Your pointed page has been trashed.</h2>
            </c:otherwise>
        </c:choose>
    </c:param>
</c:import>
