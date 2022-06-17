      //addEventListener => 특정요소(id, class,tag등등)event를 클릭하면 함수를 실행해
      /* document.addEventListener('DOMContentLoaded', function() { */
    	
    	var diaLogOpt ={
    		  modal:true,	//모달 대화상자
    		  resizable:false,	//크기 조절 x
    		  width: "570",	//dialog 넓이 지정
    		  height: "470"//높이지정
      };
      
      var calFunc = {
    		  calcDate: function(arg,calendar){
    			  var rObj = new Object();
    			  var start = null;
    			  var end = null;
    			  var allDay = arg.allDay;
    			  var startDisp = null;
    			  var endDisp = null;
    			  var id = null;
    			  var xcontent =null;
    			  var title = null;
    			  
    			  if(arg.id!=""&& arg.id!=null && arg.id!=undefined) id=arg.id;
    		      if(arg.title!=""&& arg.title!=null && arg.title!=undefined) title=arg.title;
    		      if(arg.extendedProps!=undefined){
    		      if(arg._def.extendedProps.xcontent!=""&& arg._def.extendedProps.xcontent!=null && arg._def.extendedProps.xcontent!=undefined){
    		         xcontent=arg._def.extendedProps.xcontent;
    				  }
    	  			}
    		      if(allDay){//하루종일이면
    		           var start  = arg.start.toISOString().slice(0,10); //returnCdate(calendar,arg.start);
    		           var end=null;             
    		           if(arg.end!=""&& arg.end!=null && arg.end!=undefined){
    		               end    = arg.end.toISOString().slice(0,10);  //실제 데이터는 날짜를 하루 빼지 않는다 
    		           }
    		           if(start==end) end=null;  //같은날이면 end날짜 없음
    		           
    		           startDisp = start;
    		           //if(end!=null) endDisp = dateRel(arg.end.toISOString().slice(0,10)); //알릴때만 날짜 하루 빼기 
    		       }else{//시간이 같이 들어오면
    		           start = arg.start.toISOString();             
    		           if(arg.end!=""&& arg.end!=null && arg.end!=undefined){
    		               end   = arg.end.toISOString();
    		           }
    		           startDisp = returnCdate(calendar,arg.start);
    		           if(end!=null) endDisp = returnCdate(calendar,arg.end);
    		       }
    		       rObj.start=start;
    		       rObj.end=end;
    		       rObj.start=start;
    		       rObj.startDisp=startDisp;
    		       rObj.endDisp=endDisp;
    		       rObj.id=id;
    		       rObj.xcontent=xcontent;
    		       rObj.title=title;
    		      //============================== date get / set ======================================
    		       return rObj;
    		  },
    		//등록초기
    		  setDateRangeView :function(xobj){
    		      var dispStr = xobj.startDisp;
    		      if(xobj.endDisp!=null) dispStr+=" ~ "+xobj.endDisp;
    		      
    		      $("form#diaForm").find("input[name='xdate']").val(dispStr);
    		      $("form#diaForm").find("input[name='start']").val(xobj.start);
    		      $("form#diaForm").find("input[name='end']").val(xobj.end);
    		      $("form#diaForm").find("input[name='actType']").val("C"); //등록
    		  },
    		  
    		 
    		  //form안에 name값을 $obj에 주입
    		  getFormValue :function(){
    		      var $dForm =$("form#diaForm");
    		      var $obj = new Object();
    		      $("form#diaForm").find("input,textarea,select").each(function(){
    		          var xval = $(this).val();            
    		          $obj[$(this).attr("name")]=xval;
    		      });
    		      
    		      return $obj;
    		  },
    		  
    		  //모든 태그 비활성화
    		  formDsbTrue :function(){
    		      $("form#diaForm").find("input,textarea,select").each(function(){
    		          $(this).attr("disabled",true);
    		      });
    		  },
    		  
    		  
    		  //모든 태그 활성화
    		  formDsbFalse :function(){                
    		      $("form#diaForm").find("input,textarea,select").each(function(){
    		              $(this).attr("disabled",false);
    		      });
    		  },
    		  
    		  //데이터 조회
    		  setDataForm :function(xobj){
    		      var dispStr = xobj.startDisp;
    		      if(xobj.endDisp!=null) dispStr+=" ~ "+xobj.endDisp;
    		      
    		      $("form#diaForm").find("input[name='xdate']").val(dispStr);
    		      $("form#diaForm").find("input[name='start']").val(xobj.start);
    		      $("form#diaForm").find("input[name='end']").val(xobj.end);
    		      $("form#diaForm").find("input[name='actType']").val("U"); //수정
    		      
    		      
    		      $("form#diaForm").find("input[name='id']").val(xobj.id);
    		      $("form#diaForm").find("input[name='title']").val(xobj.title);
    		      $("form#diaForm").find("textarea[name='xcontent']").val(xobj.xcontent);
    		  }      
      };	//calFunc
      
      function createClnd(cal,xobj){
    	  if(!confirm("일정 등록할래?"))return false;
    	  var $obj = calFunc.getFormValue();
    	  
    	  $.ajax({
    		  url: "/schedule/addLessonSchedule",
    		  type: "POST",
    		  data: JSON.stringify($obj)
    	  }).done(function(data){
    		  var result = jQuery.parseJSON(data);
    		  //모든 소스에서 이벤트를 다시 가져와 화면에 다시 띄운다.
    		  cal.refetchEvents();
    	  }).fail(function(e){
    		  alert("실패~"+e);
    	  }).always(function(){
    		  $("#name").val("");
    		  $("#comment").val("");
    	  });
      }
      
      //관리자만 , 주, 일, 옵션 뷰
      var rightm = "";
      rightm+=',listWeek';
      
    	var calendar = null;
    	$(document).ready(function(){
        var calendarEl = document.getElementById('calendar');
        
        /* var all_events = null; */
       /* all_events = loadingEvents();
        

  	  	var return_value;
  	  	alert("==============");
  	  	alert(return_value);ntextPath}" />
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
        		 url: '/schedule/rest/listLessonSchedule',
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
        	  var xObj = calFunc.calcDate(arg,calendar);
        	  
        	  var btnOpt = {
        			  "저장":function(){
        				  createClnd(calendar,xObj);
        				  $(this).dialog("close");
        			  }, "취소":function(){
        				  $(this).dialog("close");
        			  }
        	  }
        	  var dOpt = diaLogOpt;
        	  dOpt.buttons = btnOpt;
        	  $("#name").val("");
        	  $("#comment").val("");
        	  
        	  calFunc.formDsbFalse();
        	  $('#dialog').dialog(dOpt);
        	  calFunc.setDateRangeView(xObj);
        	  
        	  calendar.unselect();
        	  
        /*     var title = prompt('일정 등록: ');  //title값이 있을때, 화면에 calendar.addEvent() json형식으로 일정을 추가
            if(title){
              calendar.addEvent({
            	title: title,
                start: arg.start,
                end: arg.end,  // allDay: arg.allDay,
                backgroundColor:"skyblue",
                textColor:"blue"
              })
            }
           //calendar.unselect()
          },
          eventClick: function(arg){
              if(confirm('이벤트를 지우겠습니까?')){
                arg.event.remove()
              } */
            },
            //클릭함수 넣을 곳
            
          aditable: true        
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
    		  url: '/schedule/rest/listLessonSchedule',
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