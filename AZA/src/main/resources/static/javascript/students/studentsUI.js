window.addEventListener('DOMContentLoaded', event => {
	
	var currentMonth = new Date().getMonth() + 1;
	var month = currentMonth

	loadEvent(month);
	
})

function loadEvent(month) {
	
		if(currentMonth < 10) {
		month = "0" + currentMonth;
	}
	
	console.log(month);
	
	
	$.ajax({
		url:"http://localhost:8080/students/rest/listStudentsAttendance/"+month,
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

// 출석 달력
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