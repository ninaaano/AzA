/*window.addEventListener('DOMContentLoaded', event => {
	
    const datatablesSimpleQuizListNote = document.getElementById('datatablesSimpleQuizListNote');

    if (datatablesSimpleQuizListNote) {
	    	$.ajax({
		url:"http://localhost:8080/students/rest/listStudentsNote",
		type:"POST",
		headers : {
                "Accept" : "application/json",
                "Content-Type" : "application/json",                                    
            },
        success: function(result) {         	
            if(result) {
	
				console.log("js : rest/listStudentsNote");
				var notes = result.list;
				var noteData = [];
				
				notes.map((note, i) => {
					console.log(note);
					
					var temp = [];
					temp.push(i+1);
					temp.push(note.noteTitle);
					temp.push(note.noteCreateAt);

					console.log(temp);
					
					noteData.push(temp);
				})
				console.log(noteData);
				
				var data = {
					"headings" : [
						"NO",
						"제목",
						"작성날짜"
					],					
					"data" : noteData,

				}	

		var proposalIcon = function(data, type, row) {
			if(data == "0") {
				return `<a href="/students/proposalStudents/${row.lastElementChild.textContent}/1"><span class="badge bg-success pl-3 pr-3 mr-3">승인</span></a><a href="/students/proposalStudents/${row.lastElementChild.textContent}/2"><span class="badge bg-gray">승인 거절</span></a>`				
			} 
			else if(data == "1") {
				return `<span class="badge bg-primary mr-3">승인 완료</span>`+
				`<a href="/students/deleteStudentsRecord/${row.lastElementChild.textContent}"><span class="badge bg-light text-secondary">삭제</span></a>`;
				}
			else if(data == "2") {
				return `<span class="badge bg-warn">승인 거절</span>`
			}
			return data;
		}
		
		var deleteIcon = function(data, type, row) {
			if(data == "1") {
				return row.classList.add("delete"), `<button>delete</button>`;
			}
		}				
				
         new simpleDatatables.DataTable(datatablesSimpleQuizListNote, {
			data,
			columns:[
				{
					select: 7,
					render: proposalIcon
				},
				{
					select: 8,
					hidden: true,
					render: deleteIcon
				},
			],
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
            
	            {
	                targets: [6],
	                orderData: [0, 1],
	            },
	            {
	                targets: [7],
	                orderData: [0, 1],
	            },
            ],	
		});
			}}
		})
    }
});*/


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
});


				