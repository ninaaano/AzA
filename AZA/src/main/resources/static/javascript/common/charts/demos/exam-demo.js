window.addEventListener('DOMContentLoaded', event => {
	getSubject();
});

$(function() {
	$("#studentsExamFormOpenBtn").on("click", function() {
		examFormHandler();
	})
})

var formDiv = `<div class="list-group-item d-flex justify-content-between px-0 hidden">
							<form name="addStudentsExamForm" action="/students/addStudentsExam">
		          				<div class="form-group">
						            <label for="examYear" class="col-form-label">년도 : </label>
						            <input type="text" class="form-control" id="examYear" name="examYear">
						          </div>
						          <div class="form-group">
						            <label for="examSemester" class="col-form-label">학기</label>
						            <input type="text" class="form-control" id="examSemester" name="examSemester">
						          </div>
						          <div class="form-group">
									<select class="form-select form-select-sm" name="examTerm" aria-label="Small select example">
									    <option selected>중간 / 기말</option>
									    <option value="1">중간고사</option>
									    <option value="2">기말고사</option>
									</select>
						          </div>
						          <div class="form-group">
						            <label for="examSubject" class="col-form-label">과목:</label>
						            <input type="text" class="form-control" id="examSubject" name="examSubject">
						          </div>
						          <div class="form-group">
						            <label for="examScore" class="col-form-label">점수:</label>
						            <input type="text" class="form-control" id="examScore" name="examScore">
						          </div>
						          <p class="valCheck text-danger hidden">모든 정보를 입력해주세요(⊙x⊙;)</p>
						          <p class="valCheck text-danger hidden">숫자만 입력해주세요(⊙x⊙;)</p>
						          <div class="d-flex justify-content-end">
					              	<button class="btn btn-text-primary mdc-ripple-upgraded" type="submit" id="addStudentsExamBtn">등록</button>
					              </div>
					        </form>
                        </div>`;

// 성적 추가 폼 활성화
function examFormHandler() {
	$("#examDetailList").append(formDiv);
	$("#studentsExamFormOpenBtn").addClass('hidden');
	$("#studentsExamFormCloseBtn").removeClass('hidden');
}



// 과목 리스트 가져오기
function getSubject() {
		$.ajax({
		url:"/students/rest/listStudentsExam/subject",
		type:"POST",
		headers : {
                "Accept" : "application/json",
                "Content-Type" : "application/json",                                    
            },
        success: function(result) {
			if(result) {
				console.log(result);
				var subjectList = result;
				
				listExamBySubject(result[0]);
				
			} else {
				console.log("정보 없음");
			}
		}    
	})
}

function makeExamDetailList(time, score) {

                    
    var scoreDiv = `<div class="list-group-item d-flex justify-content-between px-0">
                     ${time}
                    <div class="ms-2"> ${score}</div>
					</div>`;
					

                    
    $("#examDetailList").append(scoreDiv);                                        
                                    
	
}




// 과목별 점수 가져오기
function listExamBySubject(subject) {
	
	var data = {
		examSubject : subject
	}
	
	
	$.ajax({
		url:"/students/rest/listStudentsExam",
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
					
					makeExamDetailList(tempLabel, exam.examScore)
					
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
								    tension: 5
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
	
	
	$.ajax({
		url:"/students/rest/listStudentsExam",
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
					
					makeExamDetailList(tempLabel, exam.examScore)
					
				})
				$("#examDetailList").append(formDiv);    
				
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
								    tension: 5
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
