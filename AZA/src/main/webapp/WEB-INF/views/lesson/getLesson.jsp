<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
<title>수업상세내용</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" type="text/css">

<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.12.1/b-2.2.3/b-colvis-2.2.3/b-html5-2.2.3/b-print-2.2.3/sl-1.4.0/datatables.min.css"/>
 
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.12.1/b-2.2.3/b-colvis-2.2.3/b-html5-2.2.3/b-print-2.2.3/sl-1.4.0/datatables.min.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap"
	rel="stylesheet">
	
	
	
<script type="text/javascript">
	$(function(){
		$("button.btn.btn-outline-primary:contains('수정')").on("click",function(){
			self.location="/lesson/updateLessonView?lessonCode=${lesson.lessonCode}"
		});
	});	
	
	function fncdeleteLesson(){
		var lessonCode = $("input[name='lessonCode']").val();
		if(lessonCode != "${lesson.lessonCode}"){
			alert("수업코드가 일치하지 않습니다..");
			return;
		}
		$("form").attr("method","GET").attr("action","/lesson/deleteLesson").submit();
	}
	
	$(function(){
		$("#ct_btn02").on("click",function(){
			fncdeleteLesson();
		});
	});
	
	
</script>

<style>
body{
	width:100%;
	height:100vh;
}
.modal{
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

/* @media (min-width: 576px) */
.modal-dialog {
    max-width: 500px;
    margin: 7.75rem auto;
    margin-top: 7.75rem;
    margin-right: auto;
    margin-bottom: 7.75rem;
    margin-left: auto;
}

</style>

</head>
<body class="nav-fixed">
	
		
		<div class="border border-top-0 p-3 p-sm-5 bg-light">
			<div class="mx-5 px-5">
				<div class="mx-5 px-5">
				<div class="mx-5 px-5">
			<div class="col flex-shrink-0 mb-5 mb-md-0" style="margin: 10px 0px 10px 0px">
		        <h1 class="display-4 mb-0">수업 상세 조회</h1>
		        <div class="text-muted">LESSON</div>
	    	</div>
	        <!-- style="font-size:16px;" -->
	        <div class="input-group mb-3" style="margin: 20px 0px 20px 0px" id="lessonNameListInput">
	            <p class="btn btn-outline-primary" style="font-size:18px; width:120px;">수업명</p>
                <input class="form-control" type="text" value="${lesson.lessonName}" aria-label="Example text with button addon" 
	              style="font-size:16px;"id="lessonName" name="lessonName" aria-describedby="button-addon1" readOnly="true">
	        </div>
	        <div class="input-group mb-3">
	            <p class="btn btn-outline-primary" style="font-size:18px;width:120px;">수업요일</p>
	            <input class="form-control" type="text" placeholder="" aria-label="Example text with button addon" 
	             style="font-size:16px;" id="lessonDay" name="lessonDay" value="${lesson.lessonDay}" aria-describedby="button-addon1" readOnly="true">
	        </div>
	        <div class="input-group mb-3">
	            <p class="btn btn-outline-primary" style="font-size:18px;width:120px;">수업 시간</p>
	            <input class="form-control" type="text" placeholder="" aria-label="Example text with button addon" 
	            style="font-size:16px;" value="${lesson.lessonStartTime} ~ ${lesson.lessonEndTime}" aria-describedby="button-addon1" readOnly="true">
	        </div>
	        <div class="input-group mb-3">
	            <p class="btn btn-outline-primary" style="font-size:18px;width:120px;">수업시작일</p>
	            <input class="form-control" type="text" placeholder="" aria-label="Example text with button addon" 
	            style="font-size:16px;" id="lessonCreateAt" name="lessonCreateAt" value="${lesson.lessonCreateAt}" aria-describedby="button-addon1" readOnly="true">
	        </div>
	        <div class="input-group mb-3">
	            <p class="btn btn-outline-primary" style="font-size:18px;width:120px;">수업 장소</p>
	            <input class="form-control" type="text" placeholder="" aria-label="Example text with button addon" 
	            style="font-size:16px;" id="lessonPlace" name="lessonPlace" value="${lesson.lessonPlace}" aria-describedby="button-addon1" readOnly="true">
	        </div>
	        <div class="input-group mb-3">
	            <p class="btn btn-outline-primary" style="font-size:18px;font-size:18px;width:120px;">강의명</p>
	            <input class="form-control" type="text" placeholder="" aria-label="Example text with button addon" 
	            style="font-size:16px;" id="subject" name="subject" value="${lesson.subject}" aria-describedby="button-addon1" readOnly="true">
	        </div>
	        <div class="input-group mb-3">
	            <p class="btn btn-outline-primary" style="font-size:18px;width:120px;">수업코드</p>
	            <input class="form-control" type="text" placeholder="" aria-label="Example text with button addon" 
	            style="font-size:16px;" id="lessonCode" name="lessonCode" value="${lesson.lessonCode}" aria-describedby="button-addon1" readOnly="true">
	        </div>
	        <div class="input-group mb-3">
	            <p class="btn btn-outline-primary"  style="font-size:18px;width:120px;">수업료</p>
	            <input class="form-control" type="text" placeholder="" aria-label="Example text with button addon" 
	             style="font-size:16px;"id="fees" name="fees" value="${lesson.fees}" aria-describedby="button-addon1" readOnly="true">
	        </div>        
	        <div class="mb-0">
	            <p class="btn btn-outline-primary" style="font-size:18px;width:120px; margin:0px 0px 15px 0px;" >커리큘럼</p>
	            <textarea class="form-control"  style="font-size:16px;"value="${lesson.lessonContent}" rows="12" readonly>${lesson.lessonContent}</textarea>
	        </div>	
	        
	        
	        <table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
			<tr>
				<td width="53%"></td>
				<td align="right">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<c:choose>
								<c:when test="${user.role eq 'teacher'}">
									<div align="left">
										<button class="btn btn-outline-primary" style="font-size:18px; margin:0px 0px 15px 0px;">수정</button>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#myModal" style="font-size:18px; margin:0px 0px 15px 0px;">삭제</button>
									</div>
										<!-- Modal -->
										<form>
											 <div class="modal fade" id="myModal" role="dialog"> 
											 <div class="modal-dialog">
											
											 <!-- Modal content-->
											<div class="modal-content">
											 <div class="modal-header">
											 <h4 class="modal-title" align="center">수업코드를 입력해주세요</h4> 
											 </div>
											 <div class="modal-body" align="center">
														<div class="form-group">
												         <label for="lessonCode" class="col-sm-2 control-label">수업코드</label>
												         <div class="col-sm-10">
												           <input type="text" class="form-control" id="lessonCode" name="lessonCode" placeholder="수업코드">
												         </div>
												       </div>
											</div>
											<div class="modal-footer">
											 	<button type="button" class="btn btn-outline-primary" id="ct_btn02" style="font-size:12px;width:120px; margin:0px 0px 15px 0px;">삭제</button>
												<button type="button" class="btn btn-outline-primary" data-dismiss="modal" style="font-size:12px;width:120px; margin:0px 0px 15px 0px;">닫기</button>
											</div>
											</div>
											</div>
											</div>
										</form>
										
									</c:when>					
									<c:otherwise>
										이전					
									</c:otherwise>
								</c:choose>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						
						
	        		</div>
	        		</div>
	        	</div>
			</div>
		
		
		


		<%-- <div class="d-flex mt-10 mb-4 align-items-center">
		        <h1 class="page-header mb-0">수업상세정보</h1>
		</div>
		<div class="card-body p-4">
		<div class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">
		<div class="dataTable-top">
		
		<div class="dataTable-container">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:13px;">
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">수업명</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="105">${lesson.lessonName}
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			
			<tr>
				<td width="104" class="ct_write">수업요일</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${lesson.lessonDay}</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			
			<tr>
				<td width="104" class="ct_write">수업시작시간</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${lesson.lessonStartTime} / ${lesson.lessonEndTime}</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">수업장소</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${lesson.lessonPlace}</td>
			</tr>
		
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">수업시작일</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${lesson.lessonCreateAt}</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			
			<tr>
				<td width="104" class="ct_write">강의명</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${lesson.subject}</td>
			</tr>
			
			<tr>
				<td width="104" class="ct_write">수업코드</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${lesson.lessonCode}</td>
			</tr>
			
				<tr>
				<td width="104" class="ct_write">수납일</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${lesson.fees}</td>
			</tr>
			
				<tr>
				<td width="104" class="ct_write">수업료</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${lesson.fees}</td>
			</tr>
			
				<tr>
				<td width="104" class="ct_write">커리큘럼</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${lesson.lessonContent}</td>
			</tr>
		
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
		</table>
		</div>
				</div></div>
		</div>
		
		<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
			<tr>
				<td width="53%"></td>
				<td align="right">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<c:choose>
								<c:when test="${user.role eq 'teacher'}">
									<tr>
										<td class="ct_btn01">수정  &nbsp;&nbsp;</td>
										</tr>
										<!-- Modal -->
										<form>
										 <div class="modal fade" id="myModal" role="dialog"> 
										 <div class="modal-dialog">
										
										 <!-- Modal content-->
										<div class="modal-content">
										 <div class="modal-header">
										 <h4 class="modal-title" align="center">수업코드를 입력해주세요</h4> 
										 </div>
										 <div class="modal-body" align="center">
													<div class="form-group">
											         <label for="lessonCode" class="col-sm-2 control-label">수업코드</label>
											         <div class="col-sm-10">
											           <input type="text" class="form-control" id="lessonCode" name="lessonCode" placeholder="수업코드">
											         </div>
											       </div>
										</div>
										 <div class="modal-footer">
										 <button type="button" class="ct_btn02" id="ct_btn02">삭제</button>
												  <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
										</div>
										</div>
										</div>
										</div>
										</form>
										
										<br/><br/>
										&nbsp;&nbsp;<button type="button" data-toggle="modal" data-target="#myModal">삭제</button>
										
								</c:when>					
								<c:otherwise>
									이전					
								</c:otherwise>
							</c:choose>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		 --%>


<!-- Load Bootstrap JS bundle-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <!-- Load global scripts-->
        <script type="module" src="js/material.js"></script>
        <script src="js/scripts.js"></script>
        <!-- Load Prism plugin scripts-->
        <script src="/js/prism.js"></script>
</body>
</html>