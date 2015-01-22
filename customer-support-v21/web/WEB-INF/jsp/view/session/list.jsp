<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="wrox" uri="http://www.wrox.com/jsp/tld/wrox" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %><%--@elvariable id="timestamp" type="long"--%>
<%--@elvariable id="numberOfSessions" type="int"--%>
<%--@elvariable id="sessionList" type="java.util.List<org.springframework.security.core.session.SessionInformation>"--%>
<spring:message code="title.sessionList" var="sessionTitle" />
<template:basic htmlTitle="${sessionTitle}" bodyTitle="${sessionTitle}">
    <spring:message code="message.sessionList.instruction">
        <spring:argument value="${numberOfSessions}" />
    </spring:message><br /><br />
    <c:forEach items="${sessionList}" var="s">
        <c:out value="${s.sessionId} - ${s.principal}" />
        <c:if test="${s.sessionId == pageContext.session.id}">
            (<spring:message code="message.sessionList.you" />)</c:if>
        - <spring:message code="message.sessionList.lastActive" />
        ${wrox:timeIntervalToString(timestamp - s.lastRequest.time)} ago<br />
    </c:forEach>
</template:basic>
