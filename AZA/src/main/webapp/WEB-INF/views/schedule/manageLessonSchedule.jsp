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
<!-- <script src="path/jquery-3.3.1.min.js"></script> -->


<script>
      //addEventListener => 특정요소(id, class,tag등등)event를 클릭하면 함수를 실행해
      /* document.addEventListener('DOMContentLoaded', function() { */
    	
      
    	var calendar = null;
    	$(document).ready(function(){
        var calendarEl = document.getElementById('calendar');
        
        /* var all_events = null; */
       /* all_events = loadingEvents();
        

  	  	var return_value;
  	  	alert("==============");
  	  	alert(return_value);
  	  	console.log(return_value); */
        /* console.log(all_events);
        alert(JSON.stringify(all_events)); */
        
       /*  let json = JSON.stringify(all_events);
        
        alert(json);
        
        var jsonConverList = JSON.parse(all_events);
        console.log('--------');
        console.log(jsonConverList);
        console.log('--------'); */
        
        /* var arr = new Array(all_events);
        var json = json_encode(arr);
        console.log(json); */
        
		//new FullCalendar.Calendar(대상 DOM 객체,(속성: 속성값, 속성2: 속성값2..))
        calendar = new FullCalendar.Calendar(calendarEl, {
          headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridDay'
          },
          initialView: 'dayGridMonth',
          locale: 'ko',   //한글설정 나머지 영어빼고 지움
          buttonIcons: false, //이전달 다음달로 보임 <> == true
          navLinks: true,  //날짜 누르면 상세 조회.
          businessHours: true, //상세 시간 표시
          editable: true,	//수정가능여부
          selectable: true, //날짜 선택시 표시
          dayMaxEvents: true, //이벤트가 많을 시 +표시로 보여줌 ㅎㅎ
          selectMirror: true,
          events: function(info, successCallback, failureCallback){
        	  // ajax 처리로 데이터를 로딩 시킨다.
        	  /* var datalist = []; */
        	  $.ajax({
        		 type:"post",
        		 url: '/schedule/listLessonSchedule',
        		 dataType: "json",
                 success: function(list) {
                	  var events = [];
                      console.log("^^ 될거지?");
                      console.log(list);
                      $.each(list, function (index,data){
                    	  /* for(var i=0; i<data.length; i++){
                    		  console.log(data[i].title);  
                    	  } */
                    		var datalist = data.list;
                    	  
                    		/* for(var i=0; i<data.length; i++){ */
	                    		if(data.pValue !=null && data.pValue === 'private'){
	                    			for(var i=0; i<data.length; i++){
	                    			events.push({
		                    				title:data[i].title
		                    				,start:data[i].start
		                    				,end:data[i].end
	                    			}); 
	                    			}
	                    		}else if(data.pValue!=null&&data.pValue ==='public'){
	                    			for(var i=0; i<data.length; i++){
	                    			events.push({
		                    				title:data[i].title
		                    				,start:data[i].start
		                    				,end:data[i].end
	                    				}); 
	                    			}
	                    		}else{
	                    			for(var i=0; i<data.length; i++){
		                    			events.push({
			                    				title:data[i].title
			                    				,start:data[i].start
			                    				,end:data[i].end
		                    				}); 
		                    			}                  			
	                    		}
                    		 /*} */
                      })                      
                      /* datalist.push({
                    		title:result.title,
                    		start:result.start,
                    		end:result.end */
                    		/* title: "오후 회의",
                    		start: "2022-06-06T19:00:00",
                    		end: "2022-06-07T09:30:00" */
                      /* }); */
                	  successCallback(events);
                 	}
        	  });
          },//json형태의 값
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
                /* allDay: arg.allDay, */
                backgroundColor:"skyblue",
                textColor:"blue"
              })
            }
           /*  calendar.unselect() */
          },
          eventClick: function(arg){
              if(confirm('이벤트를 지우겠습니까?')){
                arg.event.remove()
              }
            },
          aditable: true
          //ajax데이터를 불러올 부분
          /* events: all_events */
          /* events: */
        });
        calendar.render();       
        //선택한 옵션이 변경되면 동적으로 일정관리 옵션 변경
/*         localeSelectorEl.addEventListener('change', function() {
            if (this.value) {
              calendar.setOption('locale', this.value);
            }
          });*/
      });
      
      function allSave()
      {
    	  var allEvent = calendar.getEvents();
    	  
    	  var events = new Array(); 
    	  
    	  /* console.log(allEvent); */
    	  for(var i=0; i< allEvent.length; i++)
    	  {
    		 var obj = new Object();
    		  /* alert(allEvent[i]._def.title);//이벤트 명칭 */
    		 obj.title = allEvent[i]._def.title;	//이벤트 명칭
    		 /* obj.allday = allEvent[i]._def.allDay; //하루종일의 이벤트인지 알려주는 boolean */
    		 obj.start = allEvent[i]._instance.range.start; //시작 날짜 및 시간
    		 obj.end = allEvent[i]._instance.range.end;
    		 
    		 events.push(obj);
    	  }
    	  var jsondata = JSON.stringify(events);
    	  /* console.log(jsondata); */
    	  
    	  savedata(jsondata)
      }
      
      function loadingEvents()	//전체 json data 담김
      {
    	  $.ajax
    	  ({
    		  type:'POST',
    		  url: '/schedule/listLessonSchedule',
    		  data: {},
    		  dataType: 'JSON',	//가지고 올때의 데이터 타입
    		  async: false //==>동기
    		})
    		.done(function(result){
    			/* console.log(result); */
    			/* alert(JSON.stringify(result));*/
    			
    			/* var list = result.list;
    			list.map(schedule => {
    				console.log(schedule.start);
    				console.log(schedule.end);
    				console.log(schedule.title);
    			}) */
    			
    			return_value = JSON.stringify(result);
    			/* alert(JSON.stringify(result)); */
    			alert(return_value);
    			return return_value;
    		})    		
    		.fail(function(request, status, error){
    			alert("에러 발생:"+error)	
    		});
    	  /* 
    		return return_value; */
      }
      
      function savedata(jsondata)
      {
    	  $.ajax
    	  ({
    		  type:'POST',
    		  url: '/schedule/addLessonSchedule',
    		  data: {"alldata": jsondata},
    		  /* data: {"scheduleTitle":jsondata.scheduleTitle,
    			  "scheduleStartTime":"scheduleStartTime",
    			  "scheduleEndTime":"scheduleEndTime"}, */
    		  dataType: 'text',
    		  async: false //==>동기
    		  /* success: function(data){
    			  alert("OK");
    		  } */
    		})
    		.done(function(result){
    			alert("ok");
    			alert(result);
    		})
    		
    		.fail(function(request, status, error){
    			alert("에러 발생:"+error)	
    		});
      }
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
	<div style="height:30px; text-align:center; font-size:35px; color:black; margin-bottom:30px; font-weight:bold">
	<div style="width:60%; float:left; text-align:right">일정 현황
	</div><div style="width:40%; float:left;text-align:right"></div>
	<button style="width:120px; height:40px; background-color:black; color:white; vertical-align:middle; font-size:17px;
	cursor:poointer" onclick="javascript:allSave();">전체저장</button></div>
	<div id='calendar'></div>
</body>
</html>