<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${errors != null}">
    <div id="flush_error">
        入力内容にエラーがあります。<br />
        <c:forEach var="error" items="${errors}">
            ・<c:out value="${error}" /><br />
        </c:forEach>

    </div>
</c:if>
<label for="report_date">日付</label><br />
<input type="date" name="report_date" value="<fmt:formatDate value='${report.report_date}' pattern='yyyy-MM-dd' />" readonly />
<br /><br />

<label for="name">氏名</label><br />
<c:out value="${sessionScope.login_employee.name}" />
<br /><br />

<c:choose>
    <c:when test="${login_employee.id == report.employee.id}">
    <label for="title">タイトル</label><br />
    <input type="text" name="title" value="${report.title}" readonly/>
    <br /><br />
    </c:when>

    <c:otherwise>
    <label for="title">タイトル</label><br />
    <input type="text" name="title" value="${report.title}"/>
    <br /><br />
    </c:otherwise>
</c:choose>

<label for="content">内容</label><br />
<textarea name="content" rows="10" cols="50">${report.content}</textarea>
<br /><br />

<c:choose>

<c:when test="${empty report.content}">
</c:when>

<c:when test="${ login_employee.admin_flag == 1}">
            <tr>
        <th>分類欄</th>
            <td>
                <label><input type="checkbox" name="sort_id"id="reportSortBusiness" value="業務" >  業務</label>&nbsp;
                <label><input type="checkbox" name="sort_id"id="reportSortReration" value="人間関係" > 人間関係</label>&nbsp;
                <label><input type="checkbox" name="sort_id"id="reportSortTool" value="備品等道具類"> 備品等道具類</label>&nbsp;
                <label><input type="checkbox" name="sort_id"id="reportSortCheck" value="管理者✔"> 管理者✔</label>&nbsp;
            </td>
    </tr>
    </c:when>

<c:otherwise>
            <tr>
        <th>分類欄</th>
            <td>
               <c:out value="${report.sort_id}" />
            </td>
    </tr>
    </c:otherwise>
</c:choose>
<input type="hidden" name="_token" value="${_token}" />
<button type="submit">投稿</button>