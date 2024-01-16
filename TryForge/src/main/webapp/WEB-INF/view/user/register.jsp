<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="shortcut icon" type="image/x-icon"
	href="${path}/template/images/logo_backDelete.png">
<title>TryForge</title>
<!-- base:css -->
<link rel="stylesheet"
	href="${path}/template/vendors/typicons/typicons.css">
<link rel="stylesheet"
	href="${path}/template/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- plugin css for this page -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet"
	href="${path}/template/css/vertical-layout-light/style.css">
<!-- endinject -->
<!-- base:js -->
<script src="${path}/template/vendors/js/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- inject:js -->
<script src="${path}/template/js/off-canvas.js"></script>
<script src="${path}/template/js/hoverable-collapse.js"></script>
<script src="${path}/template/js/template.js"></script>
<script src="${path}/template/js/settings.js"></script>
<script src="${path}/template/js/todolist.js"></script>
<!-- endinject -->
<script type="text/javascript">
$(document).ready(function(){
	// 회원가입 성공 여부
	var result = "${insertResult}"
	if(result != "" && result == "true") {
		alert("가입완료\n로그인창으로 이동합니다.")
		location.href = "${path}/login.do"
	} else if (result != "" && result == "false") {
		alert("가입 실패")
	}
	
	// 아이디 중복 체크
	$("#idChkBtn").click(function() {
		/* alert("클릭클릭~~") */
		var userId = $("[name=member_id]").val()
		$.ajax({
			url : "ajax/checkId.jsp",
			datat : "userId=" + userId,
			dataType : "json",
			success : function(rs) {
				if (userId == "") {
					alert("아이디를 입력해주세요.")
				} else {
					if (rs.checkId) {
						alert("가입가능한 아이디입니다.")
					} else {
						alert("이미 존재하는 아이디입니다.")
					}
				}
				
			}
		})
	})
});

</script>
</head>

<body>
  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
              <div class="brand-logo">
                <img src="${path}/template/images/try_forge01.jpg" alt="logo">
              </div>
              <h4>회원가입</h4>
              <!-- <h6 class="font-weight-light">Signing up is easy. It only takes a few steps</h6> -->
              <form class="pt-3" method="post">
                <div class="form-group" style="display: flex;">
                  <input type="text" class="form-control form-control-lg" id="id" name="member_id" placeholder="ID">
                  <input type="button" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" id="idChkBtn" value="중복체크" 
                  	style="padding-left: 10px; padding-right: 10px;
							width: 122px; margin-left: 10px; margin-top: 3px;">
                </div>
                <div class="form-group">
                  <input type="password" class="form-control form-control-lg" id="password" name="member_pwd" placeholder="PassWord">
                </div>
                <!-- <div class="form-group">
                  <select class="form-control form-control-lg" id="exampleFormControlSelect2">
                    <option>Country</option>
                    <option>United States of America</option>
                    <option>United Kingdom</option>
                    <option>India</option>
                    <option>Germany</option>
                    <option>Argentina</option>
                  </select>
                </div> -->
                <div class="form-group">
                  <input type="password" class="form-control form-control-lg" id="passwordChk" name="passwordChk" placeholder="PasswordCheck">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-lg" id="name" name="member_name" placeholder="Name">
                </div>
                <div class="form-group">
                  <input type="email" class="form-control form-control-lg" id="email" name="member_email" placeholder="Email">
                </div>
                <!-- <div class="mb-4">
                  <div class="form-check">
                    <label class="form-check-label text-muted">
                      <input type="checkbox" class="form-check-input">
                      I agree to all Terms & Conditions
                    </label>
                  </div>
                </div> -->
                <div class="mt-3">
					<input type="submit" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn"
						value="회원가입" />
				</div>
                <div class="text-center mt-4 font-weight-light">
                  이미 계정이 있으신가요? <a href="login.do" class="text-primary">로그인</a>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
</body>

</html>
