<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="wrox" uri="http://www.wrox.com/jsp/tld/wrox" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %><%--@elvariable id="tickets" type="java.util.List<com.wrox.site.entities.Ticket>"--%>
<spring:message code="title.ticketList" var="listTitle" />
<template:basic htmlTitle="${listTitle}" bodyTitle="${listTitle}">
    <c:choose>
        <c:when test="${fn:length(tickets) == 0}">
            <i><spring:message code="message.ticketList.none" /></i>
        </c:when>
        <c:otherwise>
            <c:forEach items="${tickets}" var="ticket">
                <spring:message code="message.ticketList.ticket" />&nbsp;${ticket.id}:
                <a href="<c:url value="/ticket/view/${ticket.id}" />">
                <c:out value="${wrox:abbreviateString(ticket.subject, 60)}"/>
                </a><br />
                <c:out value="${ticket.customer.username}" />&nbsp;
                <spring:message code="message.ticketList.created" />&nbsp;
                <wrox:formatDate value="${ticket.dateCreated}" type="both"
                                 timeStyle="short" dateStyle="medium" /><br />
                <br />
            </c:forEach>
        </c:otherwise>
    </c:choose>
</template:basic>
