<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> --%>
<jsp:include page="${path}/template/module/module_admain.jsp"
	flush="true" />

<script>
	var sessId = "${loginMem.member_id}"
	if (sessId == "") {
		alert("로그인을 하여야 현재화면을 볼 수 있습니다\n로그인 페이지 이동")
		location.href = "${path}/tryForge/login.do"
	}

	$(document).ready(function() {
	    var msg = "${msg}";
	    if(msg!=""){
			if(!confirm(msg+"\n계속 등록하시겠습니까?")){
				location.href="${path}/tryForge/noticeList.do"
			}
		}	

	    $("#regBtn").click(function() {
	        if ($("#noticeTitle").val() === "") {
	            alert("제목을 입력해주세요");
	            return;
	        }
	        if ($("#noticeDetail").val() === "") {
	            alert("공지사항 상세내용을 입력해주세요");
	            return;
	        }
	        if(confirm("등록하시겠습니까?")){
				$("form").submit()				
			}
	        
	    });
	    $("#mainBtn").click(function(){
	    	location.href="${path}/tryForge/noticeList.do"
	    })
	    
	});
</script>
<div class="col-12 grid-margin stretch-card"
	style="max-width: 85%; flex: 0 0 95%;">

	<div class="card">
		<div class="card-body">

			<form class="forms-sample" method="post">
				<input type="hidden" name="member_Key" value="${loginMem.member_no}">
				<input type="hidden" name="member_Role" value="${loginMem.member_role}">
				<input type="hidden" name="project_Key" value="PJ-003">

				<div class="form-group">
					<label for="exampleInputName1">제목</label> <input type="text"
						class="form-control" id="noticeTitle" placeholder="Title"
						name="notice_Title">
				</div>

				<div class="form-group">
					<label for="exampleInputEmail3">작성자</label> <input type="text"
						class="form-control" readonly value="${loginMem.member_name}"
						id="exampleInputEmail3" placeholder="Name" name="notice_Writer">
				</div>

				<div class="form-group">
					<label for="exampleInputName1">아이디</label> <input type="text"
						class="form-control" value="${loginMem.member_id}" id="noticeId" readonly
						name="">
				</div>

				<div class="form-group">
					<label for="exampleInputName1">작성일</label> <input type="text"
						class="form-control" id="noticeDate" value="${formattedDate}"
						readonly>
				</div>

				<div class="form-group">
					<label for="exampleTextarea1">상세내용</label>
					<textarea class="form-control" id="noticeDetail"
						name="notice_Detail"></textarea>
				</div>
				<button id="regBtn" type="button" class="btn btn-info mr-2" style="background:#007FFF;">등록</button>
				<button class="btn btn-light" id="mainBtn">취소</button>
			</form>
		</div>
	</div>
</div>
</div>

<!-- 풋터 -->
<!-- content-wrapper ends -->
<!-- partial:partials/_footer.html -->
<!-- <footer class="footer">
				<div class="card">
					<div class="card-body">
						<div
							class="d-sm-flex justify-content-center justify-content-sm-between">
							<span
								class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright
								Â© 2020 <a href="https://www.bootstrapdash.com/"
								class="text-muted" target="_blank">Bootstrapdash</a>. All
								rights reserved.
							</span> <span
								class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center text-muted">Free
								<a href="https://www.bootstrapdash.com/" class="text-muted"
								target="_blank">Bootstrap dashboard</a> templates from
								Bootstrapdash.com
							</span>
						</div>
					</div>
				</div>
			</footer> -->
<!-- partial -->
<!-- </div> -->
<!-- main-panel ends -->
<!-- 이 밑은 복붙할때 알아서 붙이쇼 -->
</div>
<!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->


</body>

</html>

