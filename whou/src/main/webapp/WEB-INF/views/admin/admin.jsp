<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/whou/cs/adminmain">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">WhoU Admin</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>AdminPage</span></a>
                    
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
                        <h1 class="h3 mb-0 text-gray-800">AdminPage</h1>
                    </div>

                    <!-- Content Row -->
                    <div class="row">

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                Notice</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            	<a href="/whou/cs/noticeWriteForm">작성</a>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                FAQ</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            	<a href="/whou/cs/faqWriteForm">작성</a>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                            	ChatBot
                                            </div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            	<a href="/whou/assistant/aiList">수정 & 작성</a>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                        
                    </div>
                    <input type="button" value="오늘" class="dateSel" data-name="today" />
                    <input type="button" value="일주일" class="dateSel" data-name="week" />
                    <input type="button" value="한달" class="dateSel" data-name="month" />
                    <form action="/whou/cs/admin" method="post">
                    	<c:if test="${endDate == null}">
                    		<input type="date" name="startDate" value="${now}" id="startDate"/>
                    	</c:if>
                    	<c:if test="${endDate != null }">
                    		<input type="date" name="startDate" value="${startDate}" id="startDate"/>
                    	</c:if>
                    		<input type="date" name="endDate" value="${endDate}" id="endDate"/>
                    		<input type="hidden" name="jobDateSelect" value="notNull"/>
                    		<input type="submit" value="조회"/>
                    	</form><br/>
                    <div style="width:200px; height:150px; float:left;">
                    직업 <br/>
                        <c:forEach var="jobList" items="${searchJobList}">
	                    	${jobList.job} 
	                    	${jobList.searchcount}
	                    	<br/>
                    	</c:forEach>
                    </div>
                    <div style="width:200px; height:150px; float:left;">
                    검색어 <br/>
                    	 <c:forEach var="keyList" items="${searchKeyList}">
	                    	${keyList.keyword} 
	                    	${keyList.searchcount}
	                    	<br/>
                    	</c:forEach>
                    </div>	
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->
            <!-- Footer -->
           <%@ include file="../footer.jsp" %>
            <!-- End of Footer -->
        </div>
        <!-- End of Content Wrapper -->
    </div>
    <script>
    	var startDate = new Date($("#startDate").val());

    	$("#endDate").change(function(){
	    	var endDate = new Date($("#endDate").val());
    		if(startDate > endDate){
    			alert("시작 날짜보다 이전 날짜로 설정하실 수 없습니다.");
    			$("#endDate").val(startDate.toISOString().substring(0, 10) );
    		}
    	});
    	
    	$(".dateSel").click(function(){
    		var sysdate = new Date('${now}');
    		var name = $(this).data('name');
    		if('${endDate}' != null){startDate = sysdate;}
    		switch(name){
	    		case 'today':
	    			startDate = sysdate;
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