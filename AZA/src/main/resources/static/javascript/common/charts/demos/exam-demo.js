window.addEventListener('DOMContentLoaded', event => {
	var temp = document.location.href.split("/");
	var studentId = temp[temp.length-1];

	if(studentId !== 'manageStudentsExam') {
		getSubject(studentId);
	} else {
		
		if(sessionStorage.getItem("role") == 'parent') {
			var li =  $('#studentsDropDown').children().first();
			
			studentId = li.dataset.id;
			console.log(studentId);
			getSubject(studentId);
		} else{
			getSubject();
		}
		
		
		
		
	}


});

$(function() {
	$("#addExamFormHandler").on("click", function() {
		examFormHandler();
	})
	
	$("#addStudentsExamBtn").on("click", function() {
		
		var valFlag = false;
		const examYear = document.addStudentsExamForm.examYear.value;
		const examSemester = document.addStudentsExamForm.examSemester.value;
		const examTerm = document.addStudentsExamForm.examTerm.value;
		const examSubject = document.addStudentsExamForm.examSubject.value;
		const examScore = document.addStudentsExamForm.examScore.value;
		
		document.addStudentsExamForm.action = "/students/addStudentsExam";
		document.addStudentsExamForm.method = "POST";
		document.addStudentsExamForm.submit();		

		
	})
	
})

// 성적 추가 폼 활성화
function examFormHandler() {
	
	if($("#studentsExamFormOpenBtn").hasClass('hidden') == false) {
		$("#studentsExamFormOpenBtn").addClass('hidden');
		$("#addStudentsExamForm").removeClass('hidden');
		$("#studentsExamFormCloseBtn").removeClass('hidden');
		
	} else {
	$("#studentsExamFormCloseBtn").addClass('hidden');
	$("#addStudentsExamForm").addClass('hidden');
	$("#studentsExamFormOpenBtn").removeClass('hidden');
		
	}
	

}


// 과목 리스트 가져오기
function getSubject() {

	var url = arguments.length > 0 ? "/students/rest/listStudentsExam/subject/" + arguments[0] :  "/students/rest/listStudentsExam/subject";
	
	$.ajax({
		url: url,
		type:"POST",
		headers : {
                "Accept" : "application/json",
                "Content-Type" : "application/json",                                    
            },
        success: function(result) {
			if(result) {
				console.log(result);
				var subjectList = result;
				
				listExamBySubject(result[0], arguments[0]);
				
			} else {
				console.log("정보 없음");
			}
		}    
	})
}

function makeExamDetailList(examCode, time, score, subject) {

                    
    var scoreDiv = `<div id="examDetail-${examCode}" name="examDetail" onclick="return updateFormHandler('${examCode}')" class="">
    					<div class="list-group-item d-flex justify-content-between px-0">
                     		${time}                  
                    		<div class="ms-2"> ${score}</div>	
						</div>
					</div>
					<div class="hidden" id="updateForm-${examCode}" name="updateForm">
						<form id='form${examCode}' name='updateForm${examCode}' action="/students/updateStudentsExam" method="POST">
							<input type="hidden" name="examCode" value="${examCode}"/>
							 <input type="text" name="examScore" placeholder="점수"/>
							 <button id="updateStudentsExamBtn" type="button" class="fst-button btn-outline-primary text-white" onclick="return updateStudentsExam('${examCode}')">등록</button>
							 <button id="deleteStudentsExamBtn" type="button" class="fst-button btn-outline-primary text-white" onclick="return deleteExamDetail('${examCode}')">삭제</button>
						</form>
						</div>`;
					

                    
    $("#examDetailList").append(scoreDiv);                                        
                                    
	
}

function updateStudentsExam(examCode) {

	$(`#form${examCode}`).submit();	

}

function deleteExamDetail(examCode) {
	console.log(examCode);
	self.location.href = "/students/deleteStudentsExam?examCode="+examCode;
}


// updateForm 활성화
function updateFormHandler(examCode) {

	if($(`#examDetail-${examCode}`).hasClass('update') == false) {
		$(`#updateForm-${examCode}`).removeClass('hidden');	
		$(`#examDetail-${examCode}`).addClass("update");
		console.log("click");
	} else {
		$(`#updateForm-${examCode}`).addClass('hidden');	
		$(`#examDetail-${examCode}`).removeClass("update");
	}
	
	
	
}




// 과목별 점수 가져오기
function listExamBySubject(subject, studentId) {
	
	var data = {
		examSubject : subject
	}
	
	var url = arguments.length > 1 ? "/students/rest/listStudentsExam/"+studentId : "/students/rest/listStudentsExam";

	if(arguments.length < 2 && sessionStorage.getItem("role") == 'parent') {
		url += "/" + $('#studentsDropDown').children().first().dataset.studentid;
	}
	
	$.ajax({
		url:url,
		type:"POST",
		headers : {
                "Accept" : "application/json",
                "Content-Type" : "application/json",                                    
            },
    	data: JSON.stringify(data),
        success: function(result) {
			if(result) {
				console.log(result);
				
				$('#examSubject').text(subject);
				
				var examDatas = result.list;
				var times = [];
				var scores = [];
				
				$("#examDetailList").empty();
				var titleDiv = `<div class="list-group-item d-flex justify-content-between px-0">
                    <div class="caption text-white-50">년도/학기</div>
                    <div class="caption text-white-50 ms-2">점수</div>
                    </div>` ;
				$("#examDetailList").append(titleDiv);
				

				
				examDatas.map(exam => {
					var term = exam.examTerm == '1' ? '중간고사' : '기말고사';
					var tempLabel = exam.examYear + " - " + exam.examSemester + " " + term;
					times.push(tempLabel);
					scores.push(exam.examScore);
					
					makeExamDetailList(exam.examCode, tempLabel, exam.examScore, subject);
					
				})
				
				console.log(times);
				console.log(scores);
				//const labels = times;
				const data = {
								  labels: times,
								  datasets: [{
								    label: subject,
								    data: scores,
								    fill: true,
								    borderColor: '#7b68EE',
								    tension: 0.25
								  }]
								};
								
			var ctx = document.getElementById('dashboardAreaChart').getContext('2d');
			const config = {
						    type: 'line',
						    data: data,
						    options: {
							
						}
						  };					
			makeLineChart(ctx, config);
								
			} else {
				console.log("정보 없음");
			}
		}    
	})
}

// 클릭해서 과목별 차트 바꾸기
const setMyLineChart = (subject) => {
	console.log(subject);
	
		
	var data = {
		examSubject : subject
	}
	
	var temp = document.location.href.split("/");
	var studentId = temp[temp.length-1];
	var url = studentId !== 'manageStudentsExam' ? "/students/rest/listStudentsExam/" + studentId : "/students/rest/listStudentsExam/";
	
	$.ajax({
		url:url,
		type:"POST",
		headers : {
                "Accept" : "application/json",
                "Content-Type" : "application/json",                                    
            },
    	data: JSON.stringify(data),
        success: function(result) {
			if(result) {
				console.log(result);
				$('#examSubject').text(subject);
				
				var examDatas = result.list;
				var times = [];
				var scores = [];
				
				$("#examDetailList").empty();
				var titleDiv = `<div class="list-group-item d-flex justify-content-between px-0">
                    <div class="caption text-white-50">년도/학기</div>
                    <div class="caption text-white-50 ms-2">점수</div>
                    </div>` ;
				$("#examDetailList").append(titleDiv);
				
				examDatas.map(exam => {
					var term = exam.examTerm == '1' ? '중간고사' : '기말고사';
					var tempLabel = exam.examYear + " - " + exam.examSemester + " " + term;
					times.push(tempLabel);
					scores.push(exam.examScore);
					
					makeExamDetailList(exam.examCode, tempLabel, exam.examScore, subject);
					
				})   
				
				console.log(times);
				console.log(scores);
				
				const labels = times;
				const data = {
								  labels: labels,
								  datasets: [{
								    label: subject,
								    data: scores,
								    fill: true,
								    borderColor: '#7b68EE',
								    tension: 0.25
								  }]
								};
	
				const chart = Chart.getChart("dashboardAreaChart");
				chart.data = data;
				chart.update();
				console.log(chart.data);
				
    		} else {
				console.log("error");
			}}	
	})
}
var makeLineChart = (ctx, config) => new Chart(ctx,config);
