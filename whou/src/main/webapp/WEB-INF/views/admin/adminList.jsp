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
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
                <a class="nav-link" href="/whou/admin/adminJoin">
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
                        <h1 class="h3 mb-0 text-gray-800">AdminList</h1>
                    </div>
                    <div style="width:800px;">
                    	<div style="width:400px; float:left;">
                    		<c:if test="${empty adminList}">
                    			<p>조회된 데이터가 없습니다.</p>
                    		</c:if>
                    		<table>
                    			<c:if test="${not empty adminList}">
                    				<thead>
			                    		<tr>
			                    			<th>아이디</th>
			                    			<th>비밀번호</th>
			                    			<th></th>
			                    			
			                    			
			                    		</tr>
			                    	</thead>
                    			</c:if>
                    			
                        		<c:forEach var="adminList" items="${adminList}" varStatus="status">
                        			<tr>
                        			
			                        	<td>${adminList.email}</td>
			                        	<td>${adminList.pw}</td>
			                        	<c:if test="${adminList.email ne 'tmdgnsdl1534@naver.com' }">
				                        	<td><input type="button" class="btn delete" value="삭제" data-email="${adminList.email}"/></td>
			                        	</c:if>
			                    	</tr>
                    			</c:forEach>
                    		</table>
                    	</div>
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
    	$(".delete").click(function(){
    		var email = $(this).data('email');
    		if(confirm("삭제 하시겠습니까?") == true){
				location='/whou/admin/adminDelete?email='+email;	
			}
    	});
    	
    	
    </script>
</body>

</html>