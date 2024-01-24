<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" /> --%>
<jsp:include page="${path}/template/module/module_admain.jsp"
	flush="true" />

<script>
var msg = "${msg}"
if(msg != "") {
	alert(msg)
}

$(document).ready(function(){
	$("#inviteBtn").click(function() {
		if ($("[name=receiver]").val() != "") {
			$("form").attr("method", "post")
			$("form").submit()
		} else {
			alert("보내는 사람의 메일을 입력해주세요.")
			$("[name=receiver]").focus()
		}
	})
})
</script>
<div class="content-wrapper">
<div class="row">
<div class="col-12 grid-margin stretch-card">
	<div class="card">
		<div class="card-body">
			<h4 class="card-title">유저 초대</h4>
			<form class="forms-sample">
				<div class="form-group row">
					<label for="exampleInputUsername2" class="col-sm-3 col-form-label">초대받으실 분의 이메일</label>
					<div class="col-sm-9">
						<input type="email" name="receiver" class="form-control" id="exampleInputUsername2"
							placeholder="Email" autocomplete="off">
					</div>
				</div>
				<div style="text-align: center;">
					<button type="button" id="inviteBtn" class="btn btn-primary mr-2">초대하기</button>
				</div>
			</form>
		</div>
	</div>
</div>

<div class="col-12 grid-margin stretch-card">
	<div class="card">
		<div class="card-body">
			<h4 class="card-title">초대 목록</h4>
			
		</div>
	</div>
</div>
</div>
</div>

</div>
<!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->


</body>

</html>