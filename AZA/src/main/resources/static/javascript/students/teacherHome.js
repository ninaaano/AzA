// 출석
function attendanceHandler(lessonCode) {
	console.log('클릭됨');
	
	$.ajax({
		url: "http://localhost:8080/students/rest/listStudentsRecord?lessonCode="+lessonCode,
		type: "POST",
		headers: { 
					"Accept" : "application/json",
                	"Content-Type" : "application/json",
                },
		success: function(result) {
			if(result) {
				
				console.log(result);
				
				var list = result.list;
				makeAddAttendanceView(list);
			
			} else {
				console.log("error");
			}
		}
	})
}

function makeAddAttendanceView(result) {
	
	$('#curLessonName').empty();
	$('#curAttendanceList').empty();
	
	$('#curLessonName').append(`<div class="fw-bold">${result[0].lessonName}</div>`)
	
	result.map((student, idx) => {
		var div= `<div class="list-group list-group-flush">
	                 <div class="list-group-item ripple-gray mdc-ripple-upgraded" style="--mdc-ripple-fg-size:488px; --mdc-ripple-fg-scale:1.69072; --mdc-ripple-fg-translate-start:202.606px, -226.656px; --mdc-ripple-fg-translate-end:162.669px, -217.431px;">
	                     <div class="d-flex align-items-center justify-content-between">
	                         <div class="me-3">${student.studentName}</div>
	                         <div class="d-flex align-items-center">
	                             <div class="btn-group" role="group" aria-label="Mixed styles example">
								    <button name class="btn btn-raised-success" type="button" onclick="addStudentsAttendance('${student.studentId}','출석')">출석💚</button>
								    <button name class="btn btn-raised-danger" type="button" onclick="addStudentsAttendance('${student.studentId}','결석')">결석😢</button>
								    <button name class="btn btn-raised-warning" type="button" onclick="addStudentsAttendance('${student.studentId}','지각')">지각🙄</button>
								    <button name class="btn btn-raised-primary" type="button" onclick="addStudentsAttendance('${student.studentId}','도망')">도망🏃‍♀️</button>
								    <button class="btn btn-raised-secondary" type="button" onclick="addStudentsAttendance('${student.studentId}','조퇴')">조퇴👋</button>
								</div>
	                         </div>
	                     </div>
	                 </div>
	             </div>`;

		$('#curAttendanceList').append(div);
		
	})
}

function addStudentsAttendance(studentId, state) {
	
}



window.addEventListener('DOMContentLoaded', event => {
	
	attendanceLoad();
	
})

var now = new Date();
var curMonth = ('0' + (now.getMonth() + 1)).slice(-2);
var curDate = ('0' + now.getDate()).slice(-2);
var curDay = now.getDay();

// AJAX : studentsAttendance 
function attendanceLoad() {

	$.ajax({
		url:"http://localhost:8080/lesson/rest/listLessonTime?lessonDay="+curDay,
		type:"GET",
		headers : {
                "Accept" : "application/json",
                "Content-Type" : "application/json",                                    
            },
        success: function(result) {         	
            if(result) {	
				console.log(result);
				
				makeTimeTable(result);
				
	
			}else {
				console.log("error");
			}
		}
	})
}


function makeTimeTable(result) {
	
	$('#curDate').empty();
	$('#curLessonList').empty();
	
	$('#curDate').append(`<div class="fw-bold">🙃 ${curMonth}월  ${curDate}일 수업 🙃</div>`);
	
	result.map((lesson, idx) => {
		
		var lessonCode = lesson.lessonCode;
		var lessonName = lesson.lessonName;
		var startTime = lesson.lessonStartTime;
		var endTime = lesson.lessonEndTime;
		
		var div = `<div class="list-group-item-action d-flex justify-content-between align-items-center py-2" onclick="attendanceHandler('`+lessonCode+`')">
					<div class="col-6 me-2 text-primary">${startTime} ~ ${endTime}</div>
                    <div class="col-6 me-2 text-muted">${lessonName}</div></div>`;
		
		$('#curLessonList').append(div);
	})	
}







// AJAX : restCtrl
function loadEvent(month) {
	var url = new URL(window.location.href);
	var urlParam = url.searchParams;
	var studentId = urlParam.has("studentId") ? urlParam.get("studentId") : "";
	var lessonCode = urlParam.has("lessonCode") ? urlParam.get("lessonCode") : "";
	
	console.log(month, urlParam, studentId,lessonCode);

	$.ajax({
		url:"http://localhost:8080/students/rest/listStudentsAttendance/"+month+"/"+currentYear+"?studentId="+studentId+"&lessonCode="+lessonCode,
		type:"POST",
		headers : {
                "Accept" : "application/json",
                "Content-Type" : "application/json",                                    
            },
        success: function(result) {         	
            if(result) {
				
				var list = result.list;
				
				console.log(list);
	
				var attendanceArr = [];
				
				list.map(x=> {
					var date = x.attendanceDate.substr(-2);
					var status = x.attendanceState;
					
					date = date[0] == "0" ? date.substr(-1) : date
					
					var temp = {date, status};
					
					attendanceArr.push(temp);
				})

				console.log(attendanceArr);
	
				makeCalendar(currentYear, currentMonth);
			
				attendanceArr.map(x => {
					colored(x);
				})

			}else {
				console.log("실패");
			}
		}
	})	
}	


// 달력
function colored(data) {
	
	var badge = "";
	
	switch (data.status) {
		case "결석":
			badge = `<div class="m-0"><span class="badge bg-danger">결석</span></div>`;
			break;
		case "출석":
			badge = `<div class="m-0"><span class="badge bg-success">출석</span></div>`;
			break;
		case "도망":
			badge =	`<div class="m-0"><span class="badge bg-warning text-dark">도망</span></div>`;
			break;
		default:
			badge = `<div class="m-0"><span class="badge bg-secondary">${data.status}</span></div>`;
			break;
	}

	$(`#${data.date}`).append(badge);
	
}

const months = [
    { 'id': 1, 'name': 'Jan' },
    { 'id': 2, 'name': 'Feb' },
    { 'id': 3, 'name': 'Mar' },
    { 'id': 4, 'name': 'Apr' },
    { 'id': 5, 'name': 'May' },
    { 'id': 6, 'name': 'Jun' },
    { 'id': 7, 'name': 'Jul' },
    { 'id': 8, 'name': 'Aug' },
    { 'id': 9, 'name': 'Sep' },
    { 'id': 10, 'name': 'Oct' },
    { 'id': 11, 'name': 'Nov' },
    { 'id': 12, 'name': 'Dec' },
];
var currentYear = new Date().getFullYear();
var currentMonth = new Date().getMonth() + 1;


function letsCheck(year, month) {
    var daysInMonth = new Date(year, month, 0).getDate();
    var firstDay = new Date(year, month, 01).getUTCDay();
    var array = {
        daysInMonth: daysInMonth,
        firstDay: firstDay
    };
    return array;
}

function makeCalendar(year, month) {
    var getChek = letsCheck(year, month);
    getChek.firstDay === 0 ? getChek.firstDay = 7 : getChek.firstDay;
    $('#calendarList').empty();
    for (let i = 1; i <= getChek.daysInMonth; i++) {
        if (i === 1) {
            var div = '<li id="' + i + '" style="grid-column-start: ' + getChek.firstDay + ';"><div>1</div></li>';
        } else {
            var div = '<li id="' + i + '" ><div>' + i + '</div></li>'
        }
        $('#calendarList').append(div);
    }
    monthName = months.find(x => x.id === month).name;
    $('#yearMonth').text(year + ' ' + monthName);
    
    month = month < 10 ? "0"+ month : month;
    var yearInput = `<input type='hidden' value=${year} name='year'/>`;
    var monthInput = `<input type='hidden' value=${month} name='month'/>`;
    
    $('#yearMonth').append(monthInput);
}

function nextMonth() {
	
    currentMonth = currentMonth + 1;
    if (currentMonth > 12) {
        currentYear = currentYear + 1;
        currentMonth = 1;
    }
    $('#calendarList').empty();
    $('#yearMonth').text(currentYear + ' ' + currentMonth);
    loadEvent(currentMonth);
    
}


function prevMonth() {
	
    currentMonth = currentMonth - 1;
    if (currentMonth < 1) {
        currentYear = currentYear - 1;
        currentMonth = 12;
    }
    $('#calendarList').empty();
    $('#yearMonth').text(currentYear + ' ' + currentMonth);

    loadEvent(currentMonth);
}

///////////////////////////////////////////////////////////////