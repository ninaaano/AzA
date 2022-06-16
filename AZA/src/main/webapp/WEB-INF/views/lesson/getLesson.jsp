<%@ page language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>수업 상세 조회</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script> -->

<!-- 모달 -->
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
				alert("수업코드가 일치하지 않습니다.");
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
<body>
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="93%" class="ct_ttl01">수업 상세 조회</td>
				<td width="20%" align="right">&nbsp;</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">강의명 </td>
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
		<td width="104" class="ct_write">수업스케쥴</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${lesson.lessonDay}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">수업 시작시간/종료시간</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${lesson.lessonStartTime} / ${lesson.lessonEndTime}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">수업 장소</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${lesson.lessonPlace}</td>
	</tr>

	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">수업 시작일 </td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${lesson.lessonCreateAt}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">과목명</td>
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

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<c:choose>
						<c:when test="${user.role eq 'teacher'}">
							<tr>
								<td class="ct_btn01">수정 &nbsp;&nbsp;</td>
								<!-- <td class="ct_btn02">삭제</td> -->
								</tr>
								<!-- Modal -->
								<form>
								  <div class="modal fade" id="myModal" role="dialog"> 
								    <div class="modal-dialog">
								    
								      <!-- Modal content-->
								      <div class="modal-content">
								        <div class="modal-header">
								          <h4 class="modal-title" align="center">수업코드를 입력해 주세요</h4> 
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
</body>
</html>