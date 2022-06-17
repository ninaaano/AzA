<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>성적은 REST이다.</title>
<!--  -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">    
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="/webjars/stomp-websocket/stomp.min.js"></script>
    <script src="/webjars/sockjs-client/sockjs.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/b209e29beb.js" crossorigin="anonymous"></script>
    <link href="/resources/css/message.css" rel="stylesheet">
    <!-- Load Favicon-->
    <link href="assets/img/favicon.ico" rel="shortcut icon" type="image/x-icon">
    <!-- Load Material Icons from Google Fonts-->
    <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet">
    <!-- Load Simple DataTables Stylesheet-->
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet">
    <!-- Roboto and Roboto Mono fonts from Google Fonts-->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto+Mono:400,500" rel="stylesheet">
    <!-- Load main stylesheet-->
    <link href="/resources/css/styles.css" rel="stylesheet">
    
        
        
        
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="/resources/css/message.css"/>
        
<!--  -->

  <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">

  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>

  <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>

  <script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
  
</head>


<body>

<h1> Rest 싫어요 :( </h1>



				<c:set var="i" value="0" />
				<c:forEach var="students" items="${list}">
		 	    <c:set var="i" value="${ i+1 }" />
		 	    	  
					I D : ${students.studentId}	  <br/>
					이름 : ${students.studentName} <br/>
					과목 : ${students.examSubject} <br/>
					점수 : ${students.examScore}
					<hr/>
				 </c:forEach>

<div id="myfirstchart" style="height: 250px;">
          <script>

              new Morris.Line({

              // ID of the element in which to draw the chart.

              element: 'myfirstchart',

              // Chart data records -- each entry in this array corresponds to a point on

              // the chart.

              data: [

                { day: '2016-04-07', rank: 18, sales: 3},

                { day: '2016-04-08', rank: 10, sales: 4},

                { day: '2016-04-11', rank: 7, sales: 5},

                { day: '2016-04-12', rank: 5, sales: 6},

                { day: '2016-04-13', rank: 7, sales: 7},

                { day: '2016-04-14', rank: 10, sales: 7},

                { day: '2016-04-18', rank: 7, sales: 10},

                { day: '2016-04-19', rank: 5, sales: 14}

              ],

              // The name of the data record attribute that contains x-values.

              xkey: 'day',

              // A list of names of data record attributes that contain y-values.

              ykeys: ['rank'],

              // Labels for the ykeys -- will be displayed when you hover over the

              // chart.

              labels: ['rank'],

              lineColors: ['black'],

              pointFillColors: ['red'],

              pointSize: ['5px'],

              lineWidth: ['3px'],

              resize: ['true'],

              smooth: ['true'],

              events: ['2016-04-19'],

              eventStrokeWidth: ['5px'],

              parseTime:['true']

            });



          </script>



        </div>


</body>
</html>