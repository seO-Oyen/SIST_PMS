<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/> --%>
<jsp:include page="${path}/template/module/module_admain.jsp" flush="true" />
<script>
	$(document).ready(function(){
		//var sessId = ${loginMem}
		
	})
	funtion goDetail(data){
		
	}
	
</script>
<div class="col-lg-6 grid-margin stretch-card" style="max-width: 85%; flex: 0 0 95%;">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">NOTICE</h4>
            <button type="button" class="btn btn-outline-info btn-fw"
                style="margin-left: 85%; height: 5%; display: flex; align-items: center;">공지사항 등록</button>
			<form>
			<div style="display: flex; width: 100%;">
				<div class="form-group" style="width: 30%; margin-left: 10%;">
					<label for="exampleInputUsername1">제목</label> <input type="text" name="notice_Title"
						class="form-control" id="exampleInputUsername1" value="${notice.notice_Title}"
						placeholder="Noticename" style="width: 100%;">
				</div>
				<div class="form-group" style="width: 30%; margin-left: 1%;">
					<label for="exampleInputUsername2">작성자</label> <input type="text" name="notice_Writer"
						class="form-control" id="exampleInputUsername2" value="${notice.notice_Writer}"
						placeholder="writer" style="width: 100%;">
				</div>

				<button type="submit" class="btn btn-inverse-info btn-fw"
					style="margin-left: 10px; height: 5%; margin-top: 2.3%; width:10%;">검색</button>

			</div>
			</form>
			<div class="table-responsive" style="width: 95%;">
				<table class="table table-hover" style="width: 95%; margin-left:4%;">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>날짜</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="nlist" items="${noticeList}">
						<tr onclick="goDatail('${nlist.notice_Key}')">
							<td>${nlist.notice_Key}</td>
							<td>${nlist.notice_Title}</td>
							<td>${nlist.notice_Writer}</td>
							<td>${nlist.notice_Regdte}</td>							
						</tr>						
					</c:forEach>
					</tbody>
				</table>
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

