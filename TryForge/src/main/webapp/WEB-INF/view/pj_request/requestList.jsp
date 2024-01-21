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

/* 추가적인 스타일링은 여기에 작성할 수 있습니다. */
.project-info {
	font-size: 20px; /* 텍스트 크기 조정 */
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.toggle-switch {
	margin-bottom: 0; /* 토글 스위치의 마진을 없앰 */
}
</style>
<script>
	//var sessId = ${loginMem}
	//if (sessId == "") {
	//alert("로그인을 하여야 현재화면을 볼 수 있습니다\n로그인 페이지 이동")
	//location.href = "${path}/tryForge/login.do"
	//}

	$(document).ready(function() {
		Swal.fire({
			   title: '정말로 그렇게 하시겠습니까?',
			   text: '다시 되돌릴 수 없습니다. 신중하세요.',
			   icon: 'warning',
			   
			   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
			   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
			   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
			   confirmButtonText: '승인', // confirm 버튼 텍스트 지정
			   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
			   
			   reverseButtons: true, // 버튼 순서 거꾸로
			   
			}).then(result => {
			   // 만약 Promise리턴을 받으면,
			   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
			   
			      Swal.fire('승인이 완료되었습니다.', '화끈하시네요~!', 'success');
			   }
			});
		
		$(window).on("load", function() {
			var key = $("[id^='Form01']")
	        key.submit();
	        alert(key)
	    });
		
		
		// 모든 프로젝트의 토글 버튼에 대한 이벤트 처리
		$("[id^=toggleSwitch]").change(function() {
			var projectId = $(this).data("project-id");
			toggleDescription(projectId);
		});

		// 모든 프로젝트의 초기 상태 설정
		$("[id^=toggleSwitch]").each(function() {
			var projectId = $(this).data("project-id");
			toggleDescription(projectId);
		});

		function toggleDescription(projectId) {
			var detailBox = $("#detailBox" + projectId);

			if ($("#toggleSwitch" + projectId).prop("checked")) {
				detailBox.hide();
			} else {
				detailBox.show();
			}
		}
	});
</script>
<div class="col-lg-6 grid-margin stretch-card"
	style="max-width: 85%; flex: 0 0 95%;">
	<div class="card">
		<div class="card-body">
			<h4 class="card-title">REQUEST PROJECT</h4>
			<br>
			<c:forEach var="plist" items="${plist}" varStatus="sts">
				<form method="post" id="Form01" action="${path}/tryForge/reqPJList.do">
					<input type="hidden" name="project_key"
						value="${plist.project_key}" />
				</form>

				<div class="project-info"
					style="padding: 20px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); border: 1px solid #ddd; border-radius: 5px; text-align: center;">

					<div style="margin: 10px 0;">
						<h3 style="margin: 0;">프로젝트 ${plist.project_key}</h3>
					</div>

					<h5>TryForge</h5>
					<p class="mb-0">
						<fmt:formatDate value="${plist.start_date}" pattern="yyyy.MM.dd" />
						~
						<fmt:formatDate value="${plist.end_date}" pattern="yyyy.MM.dd" />
					</p>
					<p class="mb-0">${plist.leader}</p>

					<div class="buttons">
						<button type="button" class="btn btn-inverse-info btn-fw">승인</button>
						<button type="button" class="btn btn-inverse-danger btn-fw">반려</button>
					</div>

					<label class="toggle-switch toggle-switch-info"
						style="margin-top: 10px;"> <input type="checkbox" checked
						id="toggleSwitch${sts.count}" data-project-id="${sts.count}">
						<span class="toggle-slider round"></span>
					</label>
				</div>

				<br>

				<blockquote class="blockquote" id="detailBox${sts.count}"
					style="display: none; background-color: #f9f9f9; padding: 20px; border-radius: 5px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
					<h3 class="card-title" style="margin-bottom: 8px; font-size: 25px">프로젝트
						상세설명</h3>
					<ul class="list-arrow" style="font-size: 18px;">
						<li>${plist.detail}</li>
					</ul>
					<br>
					<h3 class="card-title" style="margin-bottom: 8px; font-size: 25px">참여
						구성원</h3>
					<ol style="font-size: 18px;">
						<li>홍길동</li>
						<!-- 추가적인 참여 구성원 정보 표시 -->
					</ol>
				</blockquote>
			</c:forEach>

			


			<script>

			</script>





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

