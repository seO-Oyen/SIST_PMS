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
<style>
#myModal .modal-dialog {
	max-width: 50%; /* 모달의 최대 너비를 80%로 설정 */
}

/* 입력 요소 여백 조절 */
#myModal .form-group {
	margin-bottom: 15px; /* 각 입력 요소 아래 여백 조절 */
	margin-left: 3%;
	margin-right: 8%;
}

#myModal .form-control {
	margin-right: 3%; /* 입력 요소 오른쪽 여백 조절 */
	margin-left: 3%; /* 입력 요소 왼쪽 여백 조절 */
}

#searchResults {
	height: 150px;
	overflow-y: auto;
}
</style>
<script>
	$(document).ready(function() {
		var selectedMemberKeys = [];	
		
		$("#regProj").click(function() {
			$("#myModal").modal('show');
			schMem();
		})

		$("#member_name").keyup(function() {
			schMem();
		});

		$("#regBtn").click(function() {
			event.preventDefault(); // 이 부분 추가
			getAllMemberKeys();
			$.ajax({
				url : "${path}/tryForge/insertAll.do",
				type: "POST",
				data : $("#modalFrm").serialize(),
				dataType : "json",
				  success: function (data) {
			            var msg = data.insertAll;
			            Swal.fire({
			                title: '등록 성공',
			                text: msg,
			                icon: 'success',
			            }).then(function () {
			                $("#clsBtn").click();
			                window.location.reload();
			            });
				  },
				error : function(err) {
					console.log(err)
				}
			})
		})

	});

	function schMem() {
		$.ajax({
			url : "${path}/tryForge/schMem.do",
			data : $("#modalFrm").serialize(),
			dataType : "json",
			success : function(data) {
				var memList = data.memList;
				var html = "";
				$(memList).each(
						function(idx, member) {
							html += "<tr ondblclick='selectMem("
									+ member.member_key + ", \""
									+ member.member_name + "\", \""
									+ member.member_email + "\")' > ";
							html += "<td>" + member.member_name + "</td>";
							html += "<td>" + member.member_email + "</td>";
							html += "</tr>";
						});
				$("#addMem").html(html);
				selectedMemberKeys.push(member_key);
			},
			error : function(err) {
				console.log(err);
			}
		});
	}

	function selectMem(member_key, member_name, member_email) {
	    var row = "<tr data-member-key='" + member_key + "'>";
	    row += "<td>" + member_name + "</td>";
	    row += "<td>" + member_email + "</td>";
	    row += "<td><button class='btn btn-danger' type='button' onclick='deleteMem(this)'>삭제</button></td>";
	    row += "</tr>";

	    $("#selectMem").append(row);
	}

	function deleteMem(buttonElement) {
	    // 삭제 버튼이 속한 행을 찾아서 삭제
	    var row = $(buttonElement).closest("tr");
	    var member_key = row.data("member-key");
	    // 해당 member_key를 가진 행을 찾아서 삭제
	    row.remove();
	}
	
	// 폼 안에 hidden 필드 추가
	$("#modalFrm").append("<input type='hidden' name='member_key' value='' id='hiddenMemberKey'>");

	function getAllMemberKeys() {
	    var member_key = [];

	    // 모든 tr 요소를 선택하고 각각의 data-member-key 값을 가져와 배열에 추가
	    $("#selectMem tr").each(function() {
	        var memberKey = $(this).data("member-key");
	        member_key.push(memberKey);
	    });

	    // hidden 필드의 값을 업데이트
	    $("#hiddenMemberKey").val(member_key);
	    return member_key;
	}
</script>
<div class="main-panel">
	<div class="content-wrapper">
		<div class="row">
			<!-- 진행중인 프로젝트 -->
			<div class="col-md-12">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">Ongoing Development Project</h4>
						<!-- 진행중인 프로젝트 테이블 -->
						<div class="table-responsive" style="width: 95%; margin-left: 4%; max-height: 500px; overflow-x: auto;">
							<table class="table table-hover" style="width: 100%;">
								<thead>
									<tr>
										<th>진행중인 프로젝트</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="plist" items="${plist}">
										<c:if test="${plist.status == '진행중'}">
											<tr>
												<td>${plist.title}</td>
												<c:set var="formattedStartDate" value="${fn:substring(plist.start_date, 0, 10)}" />
												<td><c:out value="${formattedStartDate}" /></td>
												<c:set var="formattedEndDate" value="${fn:substring(plist.end_date, 0, 10)}" />
												<td><c:out value="${formattedEndDate}" /></td>
												<td><button type="button"
														class="btn btn-link btn-rounded btn-fw"
														style="margin-left: 60%;">자세히</button></td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<!-- 진행중인 프로젝트 end -->

			<!-- 완료된 프로젝트 -->
			<div class="col-md-12" style="margin-top: 3%;">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">Completed Projects</h4>
						<!-- 완료된 프로젝트 테이블 -->
						<div class="table-responsive" style="width: 95%; margin-left: 4%;">
							<table class="table table-hover" style="width: 100%;">
								<thead>
									<tr>
										<th>완료된 프로젝트</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="plist" items="${plist}">
										<c:if test="${plist.status == '완료'}">
											<tr>
												<td>${plist.title}</td>
												<td><button type="button"
														class="btn btn-link btn-rounded btn-fw"
														style="margin-left: 60%;">자세히</button></td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- 완료된 프로젝트 end -->
		</div>
		<br>
		<button type="button" class="btn btn-dark btn-lg btn-block"
			id="regProj"
			style="width: 50%; margin-left: 24%; background-color: #007FFF; border: none;">프로젝트
			생성</button>
	</div>
</div>
<!-- The Modal -->
<div class="modal" id="myModal">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h2 class="modal-title">New Project</h2>
				<button type="button" class="close" data-dismiss="modal">×</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<h3>프로젝트 생성</h3>

			</div>
			<form class="forms-sample" id="modalFrm">
			
				<div class="form-group">
					<label for="exampleInputUsername1">프로젝트 타이틀</label> <input
						name="title" type="text" class="form-control" id=""
						placeholder="title">
				</div>
				<div class="form-group">
					<label for="exampleInputEmail1">팀 명</label> <input type="text"
						name="team_name" class="form-control" id="" placeholder="teamName">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">프로젝트 시작일</label> <input
						name="start_date" type="date" class="form-control" id=""
						placeholder="startDate">
				</div>
				<div class="form-group">
					<label for="exampleInputConfirmPassword1">프로젝트 종료일</label> <input
						name="end_date" type="date" class="form-control" id=""
						placeholder="endDate">
				</div>
				<div class="form-group">
					<label for="exampleTextarea1">상세설명</label>
					<textarea class="form-control" id="" rows="4" name="detail"></textarea>
				</div>
				<!-- 프로젝트 구성원 추가 -->
				<div class="form-group">
					<label>프로젝트 구성원 추가</label>
					<div class="row mt-3">
						<!-- 왼쪽: 검색 결과 -->
						<div class="col-6">
							<input type="text" class="form-control mb-2" id="member_name"
								placeholder="검색">
							<div id="searchResults" style="height: 150px; overflow-y: auto;">
								<table class="table table-hover">

									<tbody id="addMem">
									</tbody>
								</table>
							</div>
						</div>
						<!-- 오른쪽: 선택한 구성원 -->
						<div class="col-6">

							<div id="selectMember" style="height: 200px; overflow-y: auto;">
							<input type="hidden" name="member_key" value="" id="hiddenMemberKey">
								<table class="table table-hover">

									<tbody id="selectMem">
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</form>


			<!-- Modal footer -->
			<div class="modal-footer">
				<div class="mx-auto">
					<button type="button" class="btn btn-" id="regBtn"
						style="background-color: #007FFF; color: white;">등록</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal"
						id="clsBtn">닫기</button>
				</div>
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

