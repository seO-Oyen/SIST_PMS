<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="${path}/template/module/module_main.jsp" flush="true" />
<style>
.saturday {
    background-color: #f0f8ff; /* 토요일 */
}
.sunday {
	background-color : #fff0f5; /* 일요일 */
}
.gantt_cal_light { /* 라이트박스 속성 변경 */
	width: 40% !important;
	height: auto !important; 
}
.gantt_delete_btn_set { /* 라이트박스 삭제버튼 속성 변경 */
	display: inline-block !important;
	color: #fff !important;
	background-color: #dc3545 !important;
	border-color : #dc3545 !important; 
} 
.gantt_delete_btn_set:hover {
	color: #fff !important;
	background-color: #c82333 !important;
	border-color : #bd2130 !important; 
} 
.gantt_cancel_btn_set { /* 라이트박스 취소버튼 속성 변경 */
	display: inline-block !important;
	color: #fff !important; 
	background-color: #6c7293 !important;
	border-color : #6c7293 !important; 	 
}
.gantt_cancel_btn_set:hover {
	color: #fff !important;
	background-color: #5c617d !important;
	border-color : #565b76 !important;
} 
.gantt_save_btn_set { /* 라이트박스 저장버튼 속성 변경 */
	display: inline-block !important;
	color: #fff !important; 
	background-color: #3b86d1 !important;
	border-color : #3b86d1 !important; 
}
.gantt_save_btn_set:hover {
	color: #fff !important; 
	background-color: #2c73ba !important; 
	border-color : #296db0 !important; 
}
</style>
<div id='gantt_here' style="width:100%; height:100%; margin-left:20px; margin-right:20px;"class="main-panel">

<div >

<script type="text/javascript">
//기존 로케일 설정 유지
gantt.setWorkTime({ day: 6, hours: false }); // 토요일
gantt.setWorkTime({ day: 0, hours: false }); // 일요일
gantt.config.duration_unit = "day"; // duration (기간) 쪽 단위 지정 hour 로 할 경우 시간단위로 조절가능
gantt.config.work_time = true; // 워크타임 적용(주말은 기간 합산 X)
// locale 설정 적용
gantt.i18n.setLocale({
    date: {
        month_full: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
        month_short: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
        day_full: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
        day_short: ["일", "월", "화", "수", "목", "금", "토"]
    },
    labels: {
        new_task: "새로운 작업",
        icon_save: "저장",
        icon_cancel: "취소",
        icon_details: "세부사항",
        icon_edit: "편집",
        icon_delete: "삭제",
        gantt_save_btn: "저장",
        gantt_cancel_btn: "취소",
        gantt_delete_btn: "삭제",
        confirm_closing: "", // 변경사항이 손실될 수 있습니다. 계속하시겠습니까?
        confirm_deleting: "작업이 영구적으로 삭제됩니다. 계속하시겠습니까?",
        section_description: "설명",
        section_time: "기간",
        section_type: "유형",
        
        /* grid columns */
        column_wbs: "WBS",
        column_text: "작업 이름",
        column_start_date: "시작 시간",
        column_duration: "기간",
        column_add: "",
        
        /* link confirmation */
        link: "링크",
        confirm_link_deleting: "삭제될 것입니다",
        link_start: " (시작)",
        link_end: " (끝)",
        
        type_task: "작업",
        type_project: "프로젝트",
        type_milestone: "마일스톤",
        
        minutes: "분",
        hours: "시간",
        days: "일",
        weeks: "주",
        months: "월",
        years: "년",
        
        /* message popup */
        message_ok: "확인",
        message_cancel: "취소",
        
        /* constraints */
        section_constraint: "제약사항",
        constraint_type: "제약사항 유형",
        constraint_date: "제약사항 날짜",
        asap: "가능한 빨리",
        alap: "가능한 늦게",
        snet: "빨리 시작 안함",
        snlt: "늦게 시작 안함",
        fnet: "빨리 끝내지 않음",
        fnlt: "늦게 끝내지 않음",
        mso: "반드시 시작",
        mfo: "반드시 끝내기",
        
        /* resource control */
        resources_filter_placeholder: "필터링을 위해 입력하세요",
        resources_filter_label: "빈 항목 숨기기"
    }
});
gantt.config.scales = [
    {unit: "month", step: 1, format: "%Y년 %m월"}, // 월 단위 설정, 포맷 변경
//    {unit: "week", step: 1, format: function (date) {
//        return "Week #" + gantt.date.getWeek(date); // 주 단위 설정, 포맷 변경
//    }},
	{unit: "day", step: 1, format: "%d %D", css: function(date) {
	    if(!gantt.isWorkTime({ date: date, unit: "day"})){
	        var day = date.getDay();
	        if(day === 6){
				return "saturday";
	        } else if(day === 0){
				return "sunday";
	        }	
	    }
	}}
];

// 기존 설정들 유지
show_empty_state = true;
gantt.config.start_date = new Date(2024, 0, 1); // 시작일
gantt.config.end_date = new Date(2024, 11, 31); // 종료일
gantt.config.autosize = "y"; // 사이즈 자동조절( 아래쪽에 스크롤바 올라옴 )
// 날짜 포맷 변경 
gantt.templates.format_date = function(date){
	return date.toISOString();
}; // ISO 형식으로 날짜 포맷은 해보긴했음
gantt.config.date_grid = "%m월%d일"; // 좌측컬럼 date 형식 모양변경 

// 기존 스케일 설정 삭제 또는 주석 처리
// gantt.config.scale_unit = "month";
// gantt.config.date_scale = "%Y년 %m월";

// 기존 서브스케일 설정 삭제 또는 주석 처리
// gantt.config.subscales = [
//    {unit:"day", step:1, date:"%d %l"} 
// ];
// 라이트박스 섹션 속성 설정
gantt.config.lightbox.sections=[
    {name:"description", height:100, map_to:"text", type:"textarea", focus:true},
    {name:"time",        height:72, map_to:"auto", type:"duration"}
];
 
gantt.config.lightbox.project_sections=[
    {name:"description", height:100, map_to:"text", type:"textarea", focus:true},
    {name:"time",        height:72, map_to:"auto", type:"duration"}
];

// gantt.config.bar_height = 30; 간트 작업 바 세로크기
gantt.config.scale_height = 50;

//gantt.templates.task_text = function(start, end, task){
//    return task.name + " (" + task.duration + " days)";
//};

// 날짜 형식 템플릿 정의
gantt.templates.date_scale = function(date){
    var formatFunc = gantt.date.date_to_str("%d %l");
    return formatFunc(date);
};

// 마일스톤 템플릿 정의
gantt.templates.milestone_class = function(start, end, task){
    if(task.type === gantt.config.types.milestone){
        return "milestone";
    }
    return "";
};

gantt.config.columns=[
    {name:"text",       label:"업무명",  tree:true, width:'*' },
    {name:"start_date", label:"시작일", align: "center" },
    {name:"duration",   label:"기간",   align: "center" },
    {name:"add",        label:"" }
];

gantt.config.calendar_property = "calendar_id"; // 실제 차트 안에 들어갈것들 프로퍼티는.. 무슨종류인지 정하는??
var tasks = {
	    data:[
	        {id:1, text:"Task #1", start_date:"01-04-2023", duration:5, calendar_id:"working_days"},
	        {id:2, text:"Task #2", start_date:"02-04-2023", duration:3, calendar_id:"weekends"},
	        // 더 많은 태스크...
	    ]
	}; 
gantt.init("gantt_here");
gantt.parse(tasks);
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