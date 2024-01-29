<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="${path}/template/module/module_myPage.jsp"
	flush="true" />

<div class="main-panel">
	<div class="content-wrapper">
		<div class="row">
			<div class="col-xl-6 grid-margin stretch-card flex-column">
				<div class="card">
					<div class="row">
						<div class="col-md-6" style="flex: 0 0 100%; max-width: 100%;">
							<div class="card-body">

								<h4 class="card-title">개인정보</h4>

								<div
									class="d-flex justify-content-between align-items-start flex-wrap">
									<div id="income-chart-legend" class="flex-wrap mt-1 mt-md-0">
										<div>이름 : ${loginMem.member_name}</div>
										<div>아이디 : ${loginMem.member_id}</div>
										<div>이메일 : ${loginMem.member_email}</div>
										<div>권한 : ${loginMem.member_role}</div>
									</div>

								</div>
								<div style="text-align: center; padding: 10px;">
									<button type="button" class="btn btn-info btn-md mr-3">비밀번호
										변경</button>
									<button type="button"
										class="btn btn-info btn-md btn-icon-text mr-3">개인정보
										수정</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-6 grid-margin stretch-card flex-column">
				<div class="card">
					<div class="row">
						<div class="col-md-6" style="flex: 0 0 100%; max-width: 100%;">
							<div class="card-body">

								<h4 class="card-title">메모</h4>

								<div
									class="d-flex justify-content-between align-items-start flex-wrap">
									<div id="income-chart-legend" class="flex-wrap mt-1 mt-md-0">
										<div>이름 : ${loginMem.member_name}</div>
										<div>아이디 : ${loginMem.member_id}</div>
										<div>이메일 : ${loginMem.member_email}</div>
										<div>권한 : ${loginMem.member_role}</div>
									</div>

								</div>
								<div style="text-align: center; padding: 10px;">
									<button type="button" class="btn btn-info btn-md mr-3">비밀번호
										변경</button>
									<button type="button"
										class="btn btn-info btn-md btn-icon-text mr-3">개인정보
										수정</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-xl-6 grid-margin stretch-card flex-column">
				<div class="card">
					<div class="row">
						<div class="col-md-6" style="flex: 0 0 100%; max-width: 100%;">
							<div class="card-body">

								<h4 class="card-title">메모</h4>

								<div
									class="d-flex justify-content-between align-items-start flex-wrap">
									<div id="income-chart-legend" class="flex-wrap mt-1 mt-md-0">
										<div>이름 : ${loginMem.member_name}</div>
										<div>아이디 : ${loginMem.member_id}</div>
										<div>이메일 : ${loginMem.member_email}</div>
										<div>권한 : ${loginMem.member_role}</div>
									</div>

								</div>
								<div style="text-align: center; padding: 10px;">
									<button type="button" class="btn btn-info btn-md mr-3">비밀번호
										변경</button>
									<button type="button"
										class="btn btn-info btn-md btn-icon-text mr-3">개인정보
										수정</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-xl-6 grid-margin stretch-card flex-column">
				<div class="card">
					<div class="row">
						<div class="col-md-6" style="flex: 0 0 100%; max-width: 100%;">
							<div class="card-body">

								<h4 class="card-title">메모</h4>

								<div
									class="d-flex justify-content-between align-items-start flex-wrap">
									<div id="income-chart-legend" class="flex-wrap mt-1 mt-md-0">
										<div>이름 : ${loginMem.member_name}</div>
										<div>아이디 : ${loginMem.member_id}</div>
										<div>이메일 : ${loginMem.member_email}</div>
										<div>권한 : ${loginMem.member_role}</div>
									</div>

								</div>
								<div style="text-align: center; padding: 10px;">
									<button type="button" class="btn btn-info btn-md mr-3">비밀번호
										변경</button>
									<button type="button"
										class="btn btn-info btn-md btn-icon-text mr-3">개인정보
										수정</button>
								</div>
							</div>
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