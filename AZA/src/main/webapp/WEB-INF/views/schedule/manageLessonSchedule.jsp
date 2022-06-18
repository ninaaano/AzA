<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@page import="java.util.List" %>
<%@page import="com.aza.service.domain.Schedule" %> --%>

<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset='utf-8' />
<link type="text/css" href="/resources/css/schedule.css" rel="stylesheet" />
<script type="text/javascript"	src="/resources/javascript/schedule/main.js"></script>
<!-- <script src='../lib/main.min.js'></script> -->
<script type="text/javascript"	src="/resources/javascript/schedule/ko.js"></script>
<script type="text/javascript"	src="/resources/javascript/schedule/schedule.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script> -->
<!-- <script src="path/jquery-3.3.1.min.js"></script> -->

</head>
<body>
	<h2>ScheduleTest</h2>
	<div id='loading'>loading...</div>
	<div style="height:30px; text-align:center; font-size:35px; color:black; margin-bottom:30px; font-weight:bold">
	<div style="width:60%; float:left; text-align:right">일정 현황
	</div><div style="width:40%; float:left;text-align:right"></div>
	<button style="width:120px; height:40px; background-color:black; color:white; vertical-align:middle; font-size:17px;
	cursor:poointer" onclick="javascript:allSave();">전체저장</button></div>
	<div id='calendar'></div>
</body>
</html>