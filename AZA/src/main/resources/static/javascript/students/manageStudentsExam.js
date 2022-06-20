$(function() {
	$( "button.btn.btn-raised-success.btn-sm.col-sm-1.mb-4:contains('등록')" ).on("click" , function() {
		alert("등록 click");
		addStudentsExam();
		
		$.ajax({
			url:"/studnents/rest/manageStudentsExam",
			method:"POST",
				headers: { 
					"Accept" : "application/json",
                	"Content-Type" : "application/json"
				},success : function(JSONData , status) {
					
				}
		})
	});
});

function addStudentsExam() {
	var examYear = $("input[name='examYear']").val();
	var examSemester = $("input[name='examSemester']").val();
	var examTerm = $("input[name='examTerm']").val();
	var examSubject = $("input[name='examSubject']").val();
	var examScore = $("input[name='examScore']").val();
	
	
/* 	alert("년도 => "+examYear);
	alert("학기 => "+examSemester);
	alert("분기 => "+examTerm);
	alert("과목 => "+examSubject);
	alert("점수 => "+examScore); */
	
	if(examYear == null || examYear.length < 1){
		
		alert("년도는 필수 입력 항목입니다.");
		return;
	}
	
	if(examSemester == null || examSemester.length < 1){
		
		alert("학기는 필수 입력 항목입니다.");
		return;
	}
	
	if(examTerm == null || examTerm.length < 1){
		
		alert("분기는 필수 입력 항목입니다.");
		return;
	}
	
	if(examSubject == null || examSubject.length < 1){
		
		alert("과목은 필수 입력 항목입니다.");
		return;
	}
	
	if(examScore == null || examScore.length < 1){
		
		alert("점수는 필수 입력 항목입니다.");
		return;
	}
	
	$("form").attr("method" , "POST").attr("action" , "/students/addStudentsExam").submit();
}




$(function() {
		$('#exam').on('change', function() {
			alert("change");
	
 		var examCode = $('option:selected').attr("examCode"); 
			
/*  	
		var examScore = $('option:selected').val().trim();
		var examSubject = $('option:selected').text().trim();  
			alert("examScore => " + examScore); 
			alert("examSubject => " + examSubject);
			alert("examCode => " + examCode); */
			
			
			$.ajax(
					{url : "/students/rest/getStudentsExam/"+examCode ,
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						
					},success : function(JSONData , status) {
						alert("exam Code => "+JSONData.examCode);
						alert("examSubject => "+JSONData.examSubject);
						alert("examScore => "+JSONData.examScore);
						
					}						
					})
		})

})


new Chart(document.getElementById("myLineChart"), {
	  type: 'line',
	  data: {
	    labels: ["2022/1 중간","2022/1 기말","2022/2 중간","2022/2 기말"],
	    datasets: [{ 
	        data: [86,114,106,106],
	        label: "수학",
	        borderColor: "#3e95cd",
	        fill: false
	      }, { 
	        data: [282,350,411,502],
	        label: "과학",
	        borderColor: "#8e5ea2",
	        fill: false
	      }, { 
	        data: [168,170,178,190],
	        label: "사회",
	        borderColor: "#3cba9f",
	        fill: false
	      }, { 
	        data: [40,20,10,16],
	        label: "Java",
	        borderColor: "#e8c3b9",
	        fill: false
	      }
	    ]
	  },
	  options: {
	    title: {
	      display: true,
	      text: 'exam chart test'
	    }
	  }
	});



/*             var context = document
                .getElementById('myLineChart')
                .getContext('2d');
            var myChart = new Chart(context, {
                type: 'line', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: [
                        //x 축
                        '1','2','3','4','5','6','7'
                    ],
                    datasets: [
                        { //데이터
                            label: 'test1', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: [
                                21,19,25,20,23,26,25 //x축 label에 대응되는 데이터 값
                            ],
                            backgroundColor: [
                                //색상
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                //경계선 색상
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 1 //경계선 굵기
                        }
                    ]
                },
                options: {
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true
                                }
                            }
                        ]
                    }
                }
            }); */