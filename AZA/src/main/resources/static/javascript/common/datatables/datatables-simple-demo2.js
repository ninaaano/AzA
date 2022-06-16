window.addEventListener('DOMContentLoaded', event => {
	
    const datatablesSimpleNote = document.getElementById('datatablesSimpleNote');

    if (datatablesSimpleNote) {
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
				
				
         new simpleDatatables.DataTable(datatablesSimpleNote, {
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
});


				