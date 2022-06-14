$(function() {


$('#addStudentsRecordBtn').on("click", function() {
	console.log("클릭함");
	$("#addStudentsRecordForm").attr("action","/students/addStudentsRecord").submit();
	})
})