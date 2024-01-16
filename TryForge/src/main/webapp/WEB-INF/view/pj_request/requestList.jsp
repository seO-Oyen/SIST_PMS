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

	})
</script>
<div class="col-lg-6 grid-margin stretch-card"
	style="max-width: 85%; flex: 0 0 95%;">
	<div class="card">
		<div class="card-body">
			<h4 class="card-title">REQUEST PROJECT</h4>
			<br>
			<form>

				<div class="project-info"
					style="padding: 20px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); border: 1px solid #ddd; border-radius: 5px;">
					<h3 style="margin-bottom: 10px;">프로젝트 PJ-1</h3>
					<h5>TryForge</h5>
					<p class="mb-0">20240115~20240215</p>

					<!-- 버튼을 같은 div로 묶음 -->
					<div class="buttons" >
						<button type="button" class="btn btn-inverse-info btn-fw">승인</button>
						<button type="button" class="btn btn-inverse-danger btn-fw">반려</button>
					</div>

					<label class="toggle-switch toggle-switch-info"
						style="margin-top: 10px;"> <input type="checkbox" checked
						id="toggleSwitch" onchange="toggleDescription()"> <span
						class="toggle-slider round"></span>
					</label>
				</div>
				<br>
				<blockquote class="blockquote" id="projectDescription2"
					style="display: none; background-color: #f9f9f9; padding: 20px; border-radius: 5px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
					<h4 class="card-title">프로젝트 상세설명</h4>
					<ul class="list-arrow">
						<li>pms프로그램 제작</li>
					</ul>
					<h4 class="card-title">참여 구성원</h4>
					<ol>
						<li>홍길동 PL</li>
						<li>김길동 PM</li>
						<li>최길동 PM</li>
						<li>박길동 PM</li>
						<li>오길동 PM</li>
					</ol>
				</blockquote>
			
			</form>
			<script>
				toggleDescription();

				function toggleDescription() {
					var description2 = document
							.getElementById("projectDescription2");

					if (!document.getElementById("toggleSwitch").checked) {
						// 토글 스위치가 체크된 경우
						description2.style.display = "none";
					} else {
						// 토글 스위치가 체크되지 않은 경우
						description2.style.display = "block";
					}
				}
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

