<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="${path}/template/module/module_main.jsp" flush="true" />

<div id='gantt_here' class="main-panel">

<div class="content-wrapper">

<script type="text/javascript">
gantt.init("gantt_here");
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
<div tabindex="-1" class="modal pmd-modal fade add-dialog" id="createEventModal" style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header pmd-modal-border">
                <h2 class="modal-title">Create Event</h2>
                <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
            </div>
      
            <div class="modal-body">
                <form id="createAppointmentForm">
                    <div class="form-group pmd-textfield pmd-textfield-floating-label">
                        <label for="mobil">Event Name</label>
                        <input type="text" class="form-control" name="patientName" id="patientName" style="margin: 0 auto;" data-provide="typeahead" data-items="4" data-source="[&quot;Value 1&quot;,&quot;Value 2&quot;,&quot;Value 3&quot;]">
                        <input type="hidden" class="form-control" id="apptStartTime"/>
                        <input type="hidden" class="form-control" id="apptEndTime"/>
                        <input type="hidden" class="form-control" id="apptAllDay" />
                    </div>
                    <div class="form-group pmd-textfield">
                        <label class="control-label" for="when">When:</label>
                        <div class="controls controls-row" id="when" style="margin-top:5px;"></div>
                    </div>  
                </form>
            </div>
            <div class="modal-footer">
                <button data-dismiss="modal" id="submitButton" class="btn pmd-ripple-effect btn-primary pmd-btn-raised" type="button">Send</button>
                <button data-dismiss="modal" class="btn pmd-ripple-effect btn-outline-dark" type="button">Reset</button>
            </div>
        </div>
    </div>
</div>
	
</body>

</html>