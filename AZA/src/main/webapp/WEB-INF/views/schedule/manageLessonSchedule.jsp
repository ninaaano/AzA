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
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script> -->
<script src="path/jquery-3.3.1.min.js"></script>

<script>
      //addEventListener => 특정요소(id, class,tag등등)event를 클릭하면 함수를 실행해
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
		//new FullCalendar.Calendar(대상 DOM 객체,(속성: 속성값, 속성2: 속성값2..))
        var calendar = new FullCalendar.Calendar(calendarEl, {
          headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridDay'
          },
          initialView: 'dayGridMonth',
          locale: 'ko',   //한글설정 나머지 영어빼고 지움
          buttonIcons: false, //이전달 다음달로 보임 <> == true
          navLinks: true,  //날짜 누르면 상세 조회
          businessHours: true, //상세 시간 표시
          editable: true,
          selectable: true, //날짜 선택시 표시
          dayMaxEvents: true, //이벤트가 많을 시 +표시로 보여줌 ㅎㅎ
          selectMirror: true,
          eventAdd: function(){//이벤트가 추가되면 발생하는 이벤트
        	  console.log()
          },
          
          select: function(arg){
            var title = prompt('일정 등록: ');
            //title값이 있을때, 화면에 calendar.addEvent() json형식으로 일정을 추가
            if(title){
              calendar.addEvent({
                title: title,
                start: arg.start,
                end: arg.end,
                allDay: arg.allDay,
                backgroundColor:"yellow",
                textColor:"blue",
              })
            } 
           /*  var allEvent = calendar.getEvents(); //.getEvents()함수로 모든 이벤트를 Array형식으로 가져온다.
            var events = new Array(); //Json 데이터를 받기 위한 배열 선언
            for (var i = 0; i < allEvent.length; i++) {
                var obj = new Object();     // Json 을 담기 위해 Object 선언
                // alert(allEvent[i]._def.title); // 이벤트 명칭 알람
                obj.title = allEvent[i]._def.title; // 이벤트 명칭  ConsoleLog 로 확인 가능.
                obj.start = allEvent[i]._instance.range.start; // 시작
                obj.end = allEvent[i]._instance.range.end; // 끝
                events.push(obj);
            }
            var jsondata = JSON.stringify(events);
            console.log(jsondata);
            
            $(function saveData(jsonData) {
            	$.ajax({
            		url: "/full-calendar/calendar-admin-update",
            		method:"POST",
            		dataType: "json",
            		data: JSON.stringify(events),
            		contentType: 'application/json',
            	})
            	.done(function (result){
            		//alert(result);
            	})
            	.fail(function (request, status, error){
            		alert("에러 발생"+error);
            	});
            	 
            }); */
            calendar.unselect()
          },
          eventClick: function(arg){
            	arg.event.remove()
              
          },
          aditable: true,
          //ajax데이터를 불러올 부분
            events: [
              $.ajax({
            	  url:"/schedule/rest/manageLessonSchedule",
            	 method:"GET",
            	 dataType:"json",
            	 headers:{
					"Accept":"application/json",
					"Content-Type":"application/json"
            	 },            	  
            	  success: function(response){
            		  result = response.result
            		  for(i=0; i<result.length; i++){
            			  calendar.addEvent({
            				  title: result[i]['title'],
            				  start: result[i]['start'],
            				  end: result[i]['end']
            			  })
            		  }
            	  }
              }),
              {
               title: '일정 api 제작',
               start: '2022-06-06T13:00:00',
               constraint:'fullCalendar',  //정의되어지는것
               color: '#257e4a'
             }
              /* ${schedule.scheduleStartTime}, */
              /* ${schedule.scheduleTitle}, */
          //   {
          //     title: '일정api 끝내자아!!',
          //     start: '2022-06-06T19:00:00',
          //     end: '2022-06-07T09:30:00'
          //   },
          //   {
          //     title: '오후 회의',
          //     start: '2022-06-06T21:00:00',
          //     end: '2022-06-06T22:00:00'
          //   }
            // , // 내가 적은것을 삭제할 수 있는 영역 표시
            // {
            //   groupId: 'fullCalendar',
            //   start: '2022-06-06T13:00:00',
            //   end: '2022-06-17T09:00:00',
            //   display: 'background'
            // },
            // {//삭제 영역 빨간색 표시
            //   start: '2022-06-06',
            //   end: '2022-06-07',
            //   overlap: false,
            //   display: 'background',
            //   color: '#ff9f89'
            // }
        	   ]
        });

        calendar.render();

        //선택한 옵션이 변경되면 동적으로 일정관리 옵션 변경
        localeSelectorEl.addEventListener('change', function() {
            if (this.value) {
              calendar.setOption('locale', this.value);
            }
          });
      });

    </script>

<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 1100px;
	margin: 0 auto;
	padding: 0 10px;
}

.fc-header-toolbar {
	/*달련 상단 툴바 위치 조정*/
	padding-top: 1em;
	padding-left: 1em;
	padding-right: 1em;
}

#loading {
	display: none;
	position: absolute;
	top: 10px;
	right: 10px;
}
</style>

</head>
<body>
	<h2>ScheduleTest</h2>
	<div id='loading'>loading...</div>
	<div id='calendar'></div>
</body>
</html>