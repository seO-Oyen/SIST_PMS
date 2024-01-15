<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--<c:set var="path" value="${pageContext.request.contextPath }"/> --%>
<jsp:include page="${path}/template/module/module_main.jsp" flush="true" />
<style>
  .file-div {
    flex: 0 0 12.5%;
    max-width: 12.5%;
  }
  .file-image {
  	max-width: 100%;
  	height: auto;
  }
  .file-title {
  	font-size: 20px;
  	text-align: center;
  	overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }
</style>

		<!-- main 대시보드 내용 -->
		<!-- partial -->
		<div class="main-panel">
			<div class="content-wrapper">

				<div class="row">
					<div class="col-xl-6 grid-margin stretch-card flex-column" style = "flex: 0 0 100%; max-width: 100%;">
					    <div class="d-flex justify-content-between mb-4 align-items-center">
					        <h5 class="mb-2 text-titlecase">파일저장소</h5>
					        	<form method="post" enctype="multipart/form-data" action="upload.do">
					        		<button type="button" id="uploadBtn" class="btn btn-success">업로드</button>
					    			<input type="file" id="fileInput" name="files" multiple="multiple" style="display: none;" />
					    		</form>
					    </div>
						<div class="row">
							<c:forEach var = "file" items="${fList}">
							<div class="col-md-6 grid-margin stretch-card file-div">
								<div class="card">
									<div
										class="card-body d-flex flex-column justify-content-between">
										<div
											class="d-flex justify-content-between align-items-center mb-2">
											<img src="${pageContext.request.contextPath}${file.iconPath}" alt ="${file.ftype}"class="file-image">
										</div>
										<h4 title="${file.fname}" class="file-title">${file.fname}</h4>
										<h4 title="${file.fsize}" class="file-title">${file.fsize}</h4>
									</div>
								</div>
							</div>
							</c:forEach>
						</div>
					</div>
				</div>

<!-- 업로드 버튼눌렀을때 바로 파일 선택하고, 파일 선택 시 업로드처리까지 한번에 처리. -->
<script type="text/javascript">
document.querySelector("#uploadBtn").addEventListener('click', function(){
	document.querySelector("#fileInput").click();
});

document.querySelector("#fileInput").addEventListener('change', function(){
	$("form").submit()
})
</script>			
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

