<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>whou</title>
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
	<link rel="stylesheet" href="/whou/resources/css/style.css">
	<script src="https://kit.fontawesome.com/dbaea98925.js" crossorigin="anonymous"></script>
	<script type="text/javascript" src="../resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script>
	let oEditors2 = [];
	$(function() {
		var i =0; // 스마트에디터 생성 카운트
		$("#add").click(function(){ // '추가' 버튼 눌렀을 때 동작
			if(i===1){return;} // 이미 추가 해놨으면 동작 안 함 
			$("#addText").show(); // 숨겨놨던 div 보여줌
			ajaxSmartEditor();	// 스마트에디터 생성
			i++;
		});
		
	function ajaxSmartEditor() {
	      	nhn.husky.EZCreator.createInIFrame({
	        	oAppRef: oEditors2,
	        	elPlaceHolder: "ajaxCon", // 지정할 textarea ID
	        	sSkinURI: "../resources/smarteditor/SmartEditor2Skin.html",
	        	fCreator: "createSEditor2"
	      		})
	    	}
	
      });
	function ajaxSubmitPost(){
			oEditors2.getById["ajaxCon"].exec("UPDATE_CONTENTS_FIELD", []);
			// 유효성검사
			var content = document.getElementById("ajaxCon").value;
			var qes = document.getElementById("qes").value;
			var ref = document.getElementById("ref").value;
			var ref_level = document.getElementById("ref_level").value;
			if(!qes){
				alert("질문을 입력해 주세요.");
				return false;
			}
			if(content == ""  || content == null || content == '&nbsp;' || content == '<p>&nbsp;</p>')  {
					alert("내용을 입력해주세요.");
					oEditors2.getById["ajaxCon"].exec("FOCUS"); //포커싱
					return false;
			}
			if(!ref){
				alert("그룹을 입력해주세요.");
				return false;
			}
			if(!ref_level){
				alert("레벨을 입력해주세요.");
				return false;
			}
			
	}
			
	</script>
	<c:if test="${lv != 2}"> <%-- 레벨 검사 --%>
		<script>
			alert("잘못된 접근입니다.");
			history.back();
		</script>
	</c:if>
	<style>
		input[type=text]{
			width: 600px;
		}
	</style>
</head>
<body>
	<%@ include file="../header.jsp" %>        
        <!-- Header-->
        <header class="py-5">
            <div class="container px-5">
                <h2 class="page-title">ai</h2>
			</div>
		</header>	
	<!-- start -->
	<div style="margin:0 auto; height: 40px; display:flex; justify-content: center;">
		<input style="float: left;" class="btn btn-light" type="button" id="add" value="추가" />
	</div>
	<div style="display:flex; justify-content: center;">
											<%-- div 숨김 --%>
		<div id="addText" style="margin:0 auto; display:none; height: 510px; width: 600px;">
			<form action="/whou/assistant/aiInsert" method="post" onsubmit="return ajaxSubmitPost();" style="width: 600px;">
				<div class="form-group">
					<label  class="form-label">질문</label>
					<input type="text" id="qes" name="qes" placeholder="질문" />
				</div>
				<div class="form-group">
					<label class="form-label">답변</label>
					<textarea id="ajaxCon" name="con" placeholder="답변" cols="5" rows="5"> </textarea>
				</div>
				<div class="form-group">
					<label  class="form-label">그룹</label>
					<input type="number" id="ref" name="ref" placeholder="그룹" min="1" />
				</div>
				<div class="form-group">			
					<label class="form-label">레벨</label>
					<input type="number" id="ref_level" name="ref_level" placeholder="그룹레벨" min="1"/>
				</div>
				<input type="submit" class="btn btn-light" value="저장"/>
			</form>
		</div>
	</div>
		<hr/>
		<script>
			let oEditors = [];
		</script>
	<c:if test="${count > 0 }" >
		<c:forEach items="${list}" var="assistant">
			<script>
				$(document).ready(function() {
					function smartEditor() { // 스마트 에디터 만드는 함수
						nhn.husky.EZCreator.createInIFrame({
							oAppRef: oEditors,
							elPlaceHolder: "exampleFormControlTextarea${assistant.num}", // 지정할 textarea ID
							sSkinURI: "../resources/smarteditor/SmartEditor2Skin.html",
							fCreator: "createSEditor2"
						});
					}
					
					var j = 0; // div 숨김, 보여줌 카운트
					var z = 0; // 스마트에디터 생성 카운트
					$("#show${assistant.num}").click(function(event){ // '추가' 버튼 눌렀을 때 동작
						event.preventDefault(); // a태그 동작 막음
						if(j===1){
							$("#test${assistant.num}").hide(); // div숨김
							j--;
							return;
						}
						$("#test${assistant.num}").show(); // div 보여줌
						if(z === 0){
							smartEditor(); // 스마트 에디터 생성	
							z++;
						}
						j++;
					});
				});
				function submitPost${assistant.num}(){
					oEditors.getById["exampleFormControlTextarea${assistant.num}"].exec("UPDATE_CONTENTS_FIELD", []); // textarea 내용 서버에 전달
					// 유효성 검사
					var content = $("#exampleFormControlTextarea${assistant.num}").val();
					var qes = $("#qes${assistant.num}").val();
					var ref = $("#ref${assistant.num}").val();
					var ref_level = $("#ref_level${assistant.num}").val();
					if(!qes){
						alert("질문을 입력해 주세요.");
						return false;
					}
					if(content == ""  || content == null || content == '&nbsp;' || content == '<p>&nbsp;</p>')  {
						alert("내용을 입력해주세요.");
						oEditors.getById["exampleFormControlTextarea${assistant.num}"].exec("FOCUS"); //포커싱
						return false;
					}
					if(!ref){
						alert("그룹을 입력해주세요.");
						return false;
					}
					if(!ref_level){
						alert("레벨을 입력해주세요.");
						return false;
					}
					
				}
			</script>
			<div style="margin: 0 auto; display:flex; justify-content: center; width: 600px;" >
				<form action="/whou/assistant/aiUpdate" method="post" onsubmit="return submitPost${assistant.num}();" style="width: 600px;">
					<div class="form-group">
						<label class="form-label">질문</label><a href="#" id="show${assistant.num}">></a> 
						<input type="text" id="qes${assistant.num}" name="qes" value="${assistant.qes}" />
					</div>
					<!-- display: none; -->
					<div id="test${assistant.num}" style="display: none;">
					
					<div class="form-group">
						<label class="form-label">답변</label>
			  			<textarea class="form-control" name="con" id="exampleFormControlTextarea${assistant.num}" >${assistant.con}</textarea>
		  			</div>
		  			<div class="form-group">
						<label class="form-label">그룹</label>
						<input type="number" id="ref${assistant.num}" name="ref" value="${assistant.ref}" min="1"/>
					</div>
					<div class="form-group">
						<label class="form-label">레벨</label>
						<input type="number" id="ref_level${assistant.num}" name="ref_level" value="${assistant.ref_level}" min="1"/> <br/>
					</div>
					
					</div>
					<input type="hidden" name="num" value="${assistant.num}" />
					<input type="submit" class="btn btn-light" value="수정" />
					<input type="button" class="btn btn-light deleteList" data-value="${assistant.num}" value="삭제"/>
				</form>
				</div>
			<hr/>
		</c:forEach>
	</c:if>
	<!-- end -->
	<%@ include file="../footer.jsp" %>
	<!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		$(".deleteList").click(function(){
			var deleteNum = $(this).data('value');
			if(confirm("삭제 하시겠습니까?") == true){
				location='/whou/assistant/aiDelete?num='+deleteNum;	
			}
		});
	</script>
    </body>
    
</html>