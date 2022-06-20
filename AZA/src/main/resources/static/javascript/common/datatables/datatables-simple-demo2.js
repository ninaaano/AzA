window.addEventListener('DOMContentLoaded', event => {

    const datatablesSimpleQuizList = document.getElementById('datatablesSimpleQuizList');

    if (datatablesSimpleQuizList) {
	    	$.ajax({
		url:"/paper/rest/listPaperQuiz",
		type:"POST",
		headers : {
                "Accept" : "application/json",
                "Content-Type" : "application/json",                                    
            },
        success: function(result) {         	
            if(result) {
	
				console.log("js : rest/listPaperQuiz");
				var quizs = result.list;
				var quizData = [];
				
				quizs.map((record, i) => {
					console.log(record);
					
					var temp = [];
					temp.push(i+1);
					temp.push(record.lessonName);
					temp.push(record.quizTitle);
					temp.push(record.studentName);
					temp.push(record.quizCreateAt);
					temp.push(record.quizSubmitDate);
					temp.push(record.quizScore);

					console.log(temp);
					
					quizData.push(temp);
				})
				console.log(quizData);
				
				var data = {
					"headings" : [
						"NO",
						"수업명",
						"시험명",
						"학생 이름",
						"시험 등록일",
						"시험 제출일",
						"시험 점수",
					],					
					"data" : quizData,

				}
						
				
				
         new simpleDatatables.DataTable(datatablesSimpleQuizList, {
			data,
			columnDefs: [
	            {
	                targets: [0],
	                orderData: [0, 1],
	            },
	            {
	                targets: [1],
	                orderData: [0, 1],
	            },
	            {
	                targets: [2],
	                orderData: [0, 1],
	            },
	            {
	                targets: [3],
	                orderData: [0, 1],
	            },
	            {
	                targets: [4],
	                orderData: [0, 1],
	            },
	            {
	                targets: [5],
	                orderData: [0, 1],
	            },
            ],	
		});
			}}
		})
    }
 ////////////////////////////////////////////////////////////////////////   
    const datatablesSimpleNoteList = document.getElementById('datatablesSimpleNoteList');

    if (datatablesSimpleQuizList) {
	    	$.ajax({
		url:"/students/rest/listPaperQuiz",
		type:"POST",
		headers : {
                "Accept" : "application/json",
                "Content-Type" : "application/json",                                    
            },
        success: function(result) {         	
            if(result) {
	
				console.log("js : rest/listPaperQuiz");
				var quizs = result.list;
				var quizData = [];
				
				quizs.map((record, i) => {
					console.log(record);
					
					var temp = [];
					temp.push(i+1);
					temp.push(record.lessonName);
					temp.push(record.quizTitle);
					temp.push(record.studentName);
					temp.push(record.quizCreateAt);
					temp.push(record.quizSubmitDate);
					temp.push(record.quizScore);

					console.log(temp);
					
					quizData.push(temp);
				})
				console.log(quizData);
				
				var data = {
					"headings" : [
						"NO",
						"수업명",
						"시험명",
						"학생 이름",
						"시험 등록일",
						"시험 제출일",
						"시험 점수",
					],					
					"data" : quizData,

				}
						
				
				
         new simpleDatatables.DataTable(datatablesSimpleQuizList, {
			data,
			columnDefs: [
	            {
	                targets: [0],
	                orderData: [0, 1],
	            },
	            {
	                targets: [1],
	                orderData: [0, 1],
	            },
	            {
	                targets: [2],
	                orderData: [0, 1],
	            },
	            {
	                targets: [3],
	                orderData: [0, 1],
	            },
	            {
	                targets: [4],
	                orderData: [0, 1],
	            },
	            {
	                targets: [5],
	                orderData: [0, 1],
	            },
            ],	
		});
			}}
		})
    }
    /////////////////////////////////////////////////
});


				