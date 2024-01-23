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
</script>

<div class="col-md-6 grid-margin stretch-card">
	<div class="card">
		<div class="card-body">
			<h4 class="card-title">유저 초대</h4>
			<form class="forms-sample" method="post">
				<div class="form-group row">
					<label for="exampleInputUsername2" class="col-sm-3 col-form-label">Email</label>
					<div class="col-sm-9">
						<input type="email" name="receiver" class="form-control" id="exampleInputUsername2"
							placeholder="Email" autocomplete="off">
					</div>
				</div>
				<button type="submit" class="btn btn-primary mr-2">Submit</button>
				<button class="btn btn-light">Cancel</button>
			</form>
		</div>
	</div>
</div>





</div>
<!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->


</body>

</html>