<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="${path}/template/module/module_main.jsp" flush="true" />
<style>
    .content-wrapper {
        height: 100vh;
        display: flex;
        flex-direction: column;
    }

    .card {
        flex: 1;
        display: flex;
        flex-direction: column;
    }

    .card-body {
        flex: 1;
        overflow: hidden !important;
    }

    #calendar {
        height: 100%;
        overflow: hidden !important;
    }
    .card .card-body{
        padding: 1rem 1.65rem;
    }
</style>
<div class="main-panel">
<script type="text/javascript">

	  document.addEventListener('DOMContentLoaded', function() {
		    var calendarEl = document.getElementById('calendar');

		    var calendar = new FullCalendar.Calendar(calendarEl, {
				
		      headerToolbar: {
		        left: 'prev,next today',
		        center: 'title',
		        right: 'dayGridMonth,timeGridWeek,timeGridDay'
		      },
		      initialDate: '2023-01-12',
		      fixedWeekCount: false,
		      height: 'parent',
		      navLinks: true, // can click day/week names to navigate views
		      selectable: true,
		      selectMirror: true,
		      select: function(arg) {
		        var title = prompt('Event Title:');
		        if (title) {
		          calendar.addEvent({
		            title: title,
		            start: arg.start,
		            end: arg.end,
		            allDay: arg.allDay
		          })
		        }
		        calendar.unselect()
		      },
		      eventClick: function(arg) {
		        if (confirm('Are you sure you want to delete this event?')) {
		          arg.event.remove()
		        }
		      },
		      editable: true,
		      dayMaxEvents: true, // allow "more" link when too many events
		      events: [
		        {
		          title: 'All Day Event',
		          start: '2023-01-01'
		        },
		        {
		          title: 'Long Event',
		          start: '2023-01-07',
		          end: '2023-01-10'
		        },
		        {
		          groupId: 999,
		          title: 'Repeating Event',
		          start: '2023-01-09T16:00:00'
		        },
		        {
		          groupId: 999,
		          title: 'Repeating Event',
		          start: '2023-01-16T16:00:00'
		        },
		        {
		          title: 'Conference',
		          start: '2023-01-11',
		          end: '2023-01-13'
		        },
		        {
		          title: 'Meeting',
		          start: '2023-01-12T10:30:00',
		          end: '2023-01-12T12:30:00'
		        },
		        {
		          title: 'Lunch',
		          start: '2023-01-12T12:00:00'
		        },
		        {
		          title: 'Meeting',
		          start: '2023-01-12T14:30:00'
		        },
		        {
		          title: 'Happy Hour',
		          start: '2023-01-12T17:30:00'
		        },
		        {
		          title: 'Dinner',
		          start: '2023-01-12T20:00:00'
		        },
		        {
		          title: 'Birthday Party',
		          start: '2023-01-13T07:00:00'
		        },
		        {
		          title: 'Click for Google',
		          url: 'http://google.com/',
		          start: '2023-01-28'
		        }
		      ]
		    });

		    calendar.render();
		  });
	  
</script>

<div class="content-wrapper">
	<div class="card">
		<div id='calendar' class="card-body">
		
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

