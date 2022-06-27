$(function(){		
	$("td:nth-child(n+1)").on("click",function(){
		/* var lessonCode = $(this).data("value"); */
		self.location="/lesson/getLesson?lessonCode="+$(this).attr('lessonCode');
	})
})

$(function(){
	$("#addLessonBtn").on("click",function(){
		self.location = "/lesson/addLessonView"
	});
});

function fncAddLesson(){
	var lessonName = $("input[name='lessonName']").val();
	var lessonPlace = $("input[name='lessonPlace']").val();
	var fees = $("input[name='fees']").val();
	var subject = $("input[name='subject']").val();
	
	var start_time = $("#lessonStartTime").val();
	var end_time = $("#lessonEndTime").val();
	
	if(lessonName == null || lessonName.length <1){
		alert("강의명은 입력해야 합니다.");
		return;
	}
	if(lessonPlace == null || lessonPlace.length <1){
		alert("수업장소는 입력해야 합니다.");
		return;
	}
	if(fees ==null || fees.length <1){
		alert("수업료는 입력해야 합니다.");
		return;
	}
	if(subject ==null || subject.length <1){
		alert("수업명은 입력해야합니다.");
		return;
	}
	$("form").attr("method","POST").attr("action","/lesson/addLesson").submit();
}

$(function(){
	$("#addBtn").on("click",function(){
		fncAddLesson();
	});
});

$(function(){
	$("#cancleBtn").on("click",function(){
		$("form")[0].reset();
	});
});