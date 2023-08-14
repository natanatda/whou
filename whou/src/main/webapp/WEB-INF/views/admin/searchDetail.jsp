<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="en">
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" ></script>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>whou</title>

    <!-- Custom fonts for this template-->
    
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="../resources/css/sb-admin-2.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<c:if test="${lv != 2}"> <%-- 레벨 검사 --%>
		<script>
			alert("잘못된 접근입니다.");
			history.back();
		</script>
	</c:if>
</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/whou/cs/admin">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">WhoU Admin</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="/whou/cs/admin">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>AdminPage</span></a>
                    
            </li>
			<hr class="sidebar-divider">
			<!-- Heading -->
            <div class="sidebar-heading">
                admin
            </div>
            <li class="nav-item">
                <a class="nav-link" href="/whou/admin/adminList">
                    <span>AdminList</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/whou/admin/adminJoin">
                    <span>AdminJoinForm</span></a>
            </li>
            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                CS
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="/whou/cs/notice" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <span>Notice</span>
                </a>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="/whou/cs/faq" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <span>FAQ</span>
                </a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                AI
            </div>

            <li class="nav-item">
                <a class="nav-link collapsed" href="/whou/assistant/ai" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <span>ChatBot</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/whou/assistant/aiList">
                    <span>ChatBotList</span></a>
            </li>
            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">
             <!-- Heading -->
            <div class="sidebar-heading">
                Search
            </div>
            <li class="nav-item">
                <a class="nav-link" href="/whou/cs/searchDetail">
                    <span>SearchDetail</span></a>
            </li>
        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
				
                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Search -->
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <div class="input-group-append">
                        <a  href="/whou/main">main</a>
                                    <i class="fas fa-search fa-sm"></i>
                            </div>
                        </div>
                    </form>
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">SearchDetail</h1>
                    </div>

                    <input type="button" value="오늘" class="dateSel btn btn-secondary" data-name="today" />
                    <input type="button" value="일주일" class="dateSel btn btn-secondary" data-name="week" />
                    <input type="button" value="한달" class="dateSel btn btn-secondary" data-name="month" />
                    <form action="/whou/cs/searchDetail" method="post">
                    	<c:if test="${endDate == null}">
                    		<input type="date" name="startDate" value="${now}" id="startDate"/>
                    	</c:if>
                    	<c:if test="${endDate != null }">
                    		<input type="date" name="startDate" value="${startDate}" id="startDate"/>
                    	</c:if>
                    		<input type="date" name="endDate" value="${endDate}" id="endDate" required="required" />
                    		<input type="hidden" name="jobDateSelect" value="notNull"/>
                    		<input type="submit" class="btn btn-secondary" value="조회"/>
                    </form>
	
                    <div style="width:800px;">
                    	<div style="width:400px; float:left;">
                    		<p>직업</p>
                    		<c:if test="${empty searchJobList}">
                    			<p>조회된 데이터가 없습니다.</p>
                    		</c:if>
                    		<table>
                    			<c:if test="${not empty searchJobList}">
                    				<thead style="text-align:center;">
			                    		<tr>
			                    			<th>순위</th>
			                    			<th>직업</th>
			                    			<th>횟수</th>
			                    		</tr>
			                    	</thead>
                    			</c:if>
                        		<c:forEach var="jobList" items="${searchJobList}" varStatus="status">
                        			<tr>
			                        	<td>${status.count}</td>
			                        	<td>${jobList.job}</td>
			                        	<td>${jobList.searchcount}회</td>
			                    	</tr>
                    			</c:forEach>
                    		</table>
                    	</div>
	                    <div style="width:400px; float:left;">
		                    <p>검색어</p>
		                    <c:if test="${empty searchKeyList}">
		                    	<p>조회된 데이터가 없습니다.</p>
		                    </c:if>
		                    <table>
			                    <c:if test="${not empty searchKeyList}">
			                    	<thead>
			                    		<tr>
			                    			<th>순위</th>
			                    			<th>검색어</th>
			                    			<th>횟수</th>
			                    		</tr>
			                    	</thead>
			                    </c:if>
		                    	 <c:forEach var="keyList" items="${searchKeyList}" varStatus="status">
									<tr>
			                        	<td>${status.count}</td>
			                        	<td>${keyList.keyword}</td>
			                        	<td>${keyList.searchcount}회</td>
			                    	</tr>
		                    	</c:forEach>
	                    	</table>
	                    </div>
                    </div>
                    
					<div style="clear:left;">
						<form action="/whou/cs/searchDetail" method="post">
							<input type="hidden" name="rownum" value="${rownum + 5}"/>
							<input type="hidden" name="jobDateSelect" value="${jobDateSelect}"/>
							<c:if test="${endDate == null}">
								<input type="hidden" name="startDate" value="${now}" />
							</c:if>
							<c:if test="${endDate != null }">
								<input type="hidden" name="startDate" value="${startDate}" />
							</c:if>
							<input type="hidden" name="endDate" value="${endDate}" />
							<c:if test="${fn:length(searchJobList) ge rownum or fn:length(searchKeyList) ge rownum}"> <%-- 리스트 두 개 중 하나가 rownum보다 크거나 같을때 동작 --%>
								<input type="submit" class="btn btn-secondary" value="더보기"/>
							</c:if>
						</form>
                   	</div>
                    	
                </div>
                <!-- /.container-fluid -->
            </div>
           <%@ include file="../footer.jsp" %>
            <!-- End of Main Content -->
            <!-- Footer -->
            <!-- End of Footer -->
        </div>
        <!-- End of Content Wrapper -->
    </div>
    <script>
    	// 시작 날짜
    	var startDate = new Date($("#startDate").val());
		// 조회 날짜 바꾸면 동작하는 이벤트
    	$("#endDate").change(function(){
	    	var endDate = new Date($("#endDate").val());
	    	var changeDate = new Date($("#startDate").val());
    		if(changeDate > endDate){
    			alert("시작 날짜보다 이전 날짜로 설정하실 수 없습니다.");
    			
    			// 시작 날짜 인코딩해서 입력 (2023-00-00)
    			$("#endDate").val(changeDate.toISOString().substring(0, 10) ); 
    		}
    	});
    	// 오늘, 일주일, 한달 버튼 누르면 동작하는 이벤트
    	$(".dateSel").click(function(){
    		var sysdate = new Date('${now}');
    		var name = $(this).data('name');
    		if('${endDate}' != null){startDate = sysdate;}
    		switch(name){
	    		case 'today':
	    			startDate = sysdate; // 시작 날짜에 서버 시간 대입
	    			$("#startDate").val(startDate.toISOString().substring(0, 10) );
	    			$("#endDate").val(startDate.toISOString().substring(0, 10) );
	    			break;
	    		case 'week':
	    			$("#endDate").val(startDate.toISOString().substring(0, 10) );
	    			startDate.setDate(startDate.getDate()-7);
	    			$("#startDate").val(startDate.toISOString().substring(0, 10) );
	    			startDate = sysdate;
	    			break;
	    		case 'month':
	    			$("#endDate").val(startDate.toISOString().substring(0, 10) );
	    			startDate.setMonth(startDate.getMonth()-1);
	    			$("#startDate").val(startDate.toISOString().substring(0, 10) );
	    			startDate = sysdate;
	    			break;
	    	}
    	});
    </script>
</body>

</html>