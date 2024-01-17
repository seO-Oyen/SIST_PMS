<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<jsp:useBean id="service" class="tryForge.member.service.MemberService" />
{"checkId" : ${service.checkId(userId)}}