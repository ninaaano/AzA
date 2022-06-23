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

<script type="text/javascript">
	$(function(){
		$("td.ct_btn01:contains('수정')").on("click",function(){
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
		$("button.ct_btn02").on("click",function(){
			fncdeleteLesson();
		});
	});
</script>


</head>
<body class="nav-fixed">
<form class="form-horizontal">
		<div class="border border-top-0 p-3 p-sm-10 bg-light">
			<div class="px-10 mx-10">
			<div class="col flex-shrink-0 mb-5 mb-md-0" style="margin: 10px 0px 10px 0px">
		        <h1 class="display-4 mb-0">수업 상세 조회</h1>
		        <div class="text-muted">Lesson</div>
	    	</div>
	        <div class="input-group mb-3">
	            <p class="btn btn-outline-primary"  style="width:120px;">강의명</p>
	            <input class="form-control" type="text" placeholder="강의명을 입력하세요" aria-label="Example text with button addon" 
	             id="lessonName" name="lessonName" aria-describedby="button-addon1" style="height:36.5px;">
	        </div>
	        <div class="input-group mb-3">
	            <p class="btn btn-outline-primary" style="width:120px;">수업 요일</p>&nbsp;&nbsp;
		        월&nbsp;<input type="checkbox"  id="lessonDay" name="lessonDay" value="월"/>&nbsp;&nbsp;
		        화&nbsp;<input type="checkbox" id="lessonDay" name="lessonDay" value="화"/>&nbsp;&nbsp;
		        수&nbsp;<input type="checkbox" id="lessonDay" name="lessonDay" value="수"/>&nbsp;&nbsp;
		        목&nbsp;<input type="checkbox" id="lessonDay" name="lessonDay" value="목"/>&nbsp;&nbsp;
		        금&nbsp;<input type="checkbox" id="lessonDay" name="lessonDay" value="금"/>&nbsp;&nbsp;
		        토&nbsp;<input type="checkbox" id="lessonDay" name="lessonDay" value="토"/>&nbsp;&nbsp;
		         일&nbsp;<input type="checkbox"  id="lessonDay" name="lessonDay" value="일"/>&nbsp;&nbsp;
		        <input type="hidden" id="hiddenValue" name="hiddenValue" value=""/>
	        </div>
	        <div class="input-group mb-3">
	            <p class="btn btn-outline-primary" style="width:120px;">수업 시작 시간</p>
	            <input class="form-control" type="time" aria-label="Example text with button addon" 
	            id="lessonStartTime" name="lessonStartTime" aria-describedby="button-addon1"style="height:36.5px;">
	        </div>
	        <div class="input-group mb-3">
	            <p class="btn btn-outline-primary" style="width:120px;">수업 종료 시간</p>
	            <input class="form-control" type="time" aria-label="Example text with button addon" 
	            id="lessonEndTime" name="lessonEndTime" aria-describedby="button-addon1"style="height:36.5px;">
	        </div>
	        <div class="input-group mb-3">
	            <p class="btn btn-outline-primary" style="width:120px;">수업 장소</p>
	            <input class="form-control" type="text" aria-label="Example text with button addon" 
	            id="lessonPlace" name="lessonPlace" aria-describedby="button-addon1" placeholder="수업장소을 입력하세요"style="height:36.5px;">
	        </div>
	        <div class="input-group mb-3">
	            <p class="btn btn-outline-primary" style="width:120px;">수업료</p>
	            <input class="form-control" type="text" aria-label="Example text with button addon" placeholder="수업료를 입력하세요"
	            id="fees" name="fees" aria-describedby="button-addon1"style="height:36.5px;">
	        </div>
	        <div class="input-group mb-3">
	            <p class="btn btn-outline-primary" style="width:120px;">수업명</p>
	            <input class="form-control" type="text" placeholder="수업을 입력하세요" aria-label="Example text with button addon" 
	            id="subject" name="subject" aria-describedby="button-addon1"style="height:36.5px;">
	        </div>       
	        	        
	        <div class="mb-0">
	            <p class="btn btn-outline-primary" style="width:120px; margin:0px 0px 15px 0px;" >커리큘럼</p>
	            <textarea class="form-control"  id="lessonContent" name="lessonContent" placeholder="수업 커리큘럽 입력하세요" rows="12"></textarea>
	        </div>
	        </div>
	    </div>
		
	       <div class="form-group" align="center">
		         <div class="col-sm-offset-4  col-sm-4 text-center">
		           <button type="button" class="btn btn-primary" >저&nbsp;장</button>&nbsp;&nbsp;&nbsp;
		           <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		         </div>
	       </div>		
	</form>	


		<div class="d-flex mt-10 mb-4 align-items-center">
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
			
		<%-- 		<tr>
				<td width="104" class="ct_write">수납일</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${lesson.fees}</td>
			</tr> --%>
			
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
		


<!-- Load Bootstrap JS bundle-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <!-- Load global scripts-->
        <script type="module" src="js/material.js"></script>
        <script src="js/scripts.js"></script>
        <!-- Load Prism plugin scripts-->
        <script src="/js/prism.js"></script>
</body>
</html>