<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>whou</title>
   <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
   <link rel="stylesheet" href="/whou/resources/css/style.css">
   
   <script src="https://kit.fontawesome.com/dbaea98925.js" crossorigin="anonymous"></script>
</head>
<style>
.cont_test_intro {
   width: 999px;
   margin: 0 auto;
   padding: 54px 0 130px;
}

.cont_test_intro .panel_exam_guide {
   height: 44px;
   margin: -23px 0 36px;
   padding: 17px 30px 14px;
   background: #f8f8f8;
   border: 1px solid #e7e5eb;
   border-radius: 7px;
   line-height: 44px;
}

.cont_test_intro .panel_exam_guide .emph_g {
   font-weight: bold;
   color: #41435a;
}

.cont_test_intro .panel_exam_guide .guide_right {
   float: right;
   font-size: 0;
}

.cont_test_intro .panel_exam_guide .type_dropmenu, .cont_test_intro .panel_exam_guide .btn_view {
   display: inline-block;
   vertical-align: top;
}

.cont_test_intro .panel_exam_guide .type_dropmenu {
   border-color: #d2d5d6;
   border-radius: 8px;
}

.cont_test_intro .panel_exam_guide .type_dropmenu .link_selected {
   width: 225px;
   height: 42px;
   line-height: 42px;
   color: #6c6c6c;
   padding-left: 25px;
}

.cont_test_intro .panel_exam_guide .type_dropmenu .link_selected .ico_arrow {
   right: 19px;
/*    background-image: url(../img/sp_intro_popup.png); */
   background-size: 273px 262px;
   background-position: -256px -237px;
   width: 12px;
   height: 9px;
}

.cont_test_intro .panel_exam_guide .type_dropmenu .box_select {
   top: 42px;
   border-radius: 0 0 8px 8px;
   border-top: 1px solid #e8eaea;
   box-shadow: none;
}

.cont_test_intro .panel_exam_guide .type_dropmenu .box_select .list_select {
   border-radius: 0 0 8px 8px;
   padding: 17px 0;
}

.cont_test_intro .panel_exam_guide .type_dropmenu .box_select .list_select li {
   border: none;
}

.cont_test_intro .panel_exam_guide .type_dropmenu .box_select .link_opt {
   position: relative;
   padding-left: 25px;
   line-height: 27px;
}

.cont_test_intro .panel_exam_guide .type_dropmenu .box_select .link_opt:hover, .cont_test_intro .panel_exam_guide .type_dropmenu .box_select .link_opt :focus {
   background: none;
}

.cont_test_intro .panel_exam_guide .type_dropmenu .box_select .on .link_opt {
   color: #269bed;
}

.cont_test_intro .panel_exam_guide .type_dropmenu .box_select .on .link_opt:before {
   position: absolute;
   top: 8px;
   right: 20px;
/*    background-image: url(../img/sp_intro_popup.png); */
   background-size: 273px 262px;
   background-position: -256px -221px;
   width: 14px;
   height: 10px;
   content: '';
}

.cont_test_intro .panel_exam_guide .type_dropmenu.on {
   border-radius: 8px 8px 0 0;
}

.cont_test_intro .panel_exam_guide .btn_view {
   width: 71px;
   margin-left: 8px;
   border-radius: 8px;
   line-height: 44px;
   color: #5c5b5b;
   background: #d5d5d5;
   text-align: center;
}

.cont_test_intro .tit_test_intro {
   font-weight: normal;
   font-size: 36px;
   line-height: 38px;
   color: #000;
}

.cont_test_intro .tit_intro_item {
   display: block;
   margin-top: 50px;
   font-weight: normal;
   font-size: 22px;
   line-height: 24px;
   color: #000;
}

.cont_test_intro .tit_intro_sub {
   display: block;
   position: relative;
   margin-top: 20px;
   padding-left: 9px;
   line-height: 18px;
   font-weight: bold;
   color: #5A3FFF;
}

.cont_test_intro .tit_intro_sub:before {
   position: absolute;
   top: 8px;
   left: 0;
   width: 4px;
   height: 4px;
   background: #5A3FFF;
   content: '';
}

.cont_test_intro .panel_intro_stat {
   margin-top: 38px;
   padding: 25px 0;
   border-top: 1px solid #000;
   border-bottom: 1px solid #000;
   font-size: 0;
   line-height: 1px;
}

.cont_test_intro .desc_stat {
   display: inline-block;
   overflow: hidden;
   padding: 0 2px 2px 0;
   vertical-align: top;
   font-size: 16px;
   line-height: 18px;
   color: #666;
}

.cont_test_intro .desc_stat dt {
   float: left;
   position: relative;
   color: #252525;
}

.cont_test_intro .desc_stat dt:before {
   position: absolute;
   top: 1px;
   left: 0;
   content: '';
}

.cont_test_intro .desc_stat dd {
   float: left;
}

.cont_test_intro .stat_type1 dt {
   width: 100px;
}

.cont_test_intro .stat_type1 dt:before {
   left: 4px;
/*    background-image: url(../img/sp_intro_popup.png); */
   background-size: 273px 262px;
   background-position: -256px 0px;
   width: 17px;
   height: 17px;
}

.cont_test_intro .stat_type2 {
   margin-left: 35px;
}

.cont_test_intro .stat_type2 dt {
   width: 72px;
   padding-left: 26px;
}

.cont_test_intro .stat_type2 dt:before {
/*    background-image: url(../img/sp_intro_popup.png); */
   background-size: 273px 262px;
   background-position: -206px -150px;
   width: 18px;
   height: 18px;
}

.cont_test_intro .stat_type3 {
   display: block;
   margin-top: 20px;
}

.cont_test_intro .stat_type3 dt {
   width: 100px;
}

.cont_test_intro .stat_type3 dt:before {
   top: 2px;
   left: 6px;
/*    background-image: url(../img/sp_intro_popup.png); */
   background-size: 273px 262px;
   background-position: -256px -67px;
   width: 15px;
   height: 16px;
}

.cont_test_intro .box_guide_sub {
   margin-top: 20px;
   padding: 20px;
   border: 1px solid #d4dbde;
   background: #f8fbfb;
}

.cont_test_intro .list_subject {
   overflow: hidden;
   margin-top: 15px;
   padding-left: 20px;
}

.cont_test_intro .list_subject li {
   list-style-position: inside;
   list-style: decimal;
   float: left;
   width: 25%;
   line-height: 26px;
}

.cont_test_intro .txt_intro {
   margin-top: 15px;
   line-height: 26px;
}

.cont_test_intro .wrap_table_guide {
   padding-top: 50px;
}

.cont_test_intro .wrap_table_guide .tbl_guide {
   width: 100%;
   table-layout: fixed;
   border-top: 1px solid #000;
   border-bottom: 1px solid #000;
   border-collapse: collapse;
}

.cont_test_intro .wrap_table_guide .tbl_guide caption {
   margin-bottom: 18px;
   font-family: "Noto Sans KR", "Malgun Gothic", "맑은 고딕", "돋움", dotum, AppleGothic, droidS, sans-serif;
   text-align: left;
   line-height: 18px;
}

.cont_test_intro .wrap_table_guide .tbl_guide thead {
   border-bottom: 1px solid #000;
}

.cont_test_intro .wrap_table_guide .tbl_guide thead th {
   height: 53px;
}

.cont_test_intro .wrap_table_guide .tbl_guide tbody tr {
   border-top: 1px solid #cdcdcd;
}

.cont_test_intro .wrap_table_guide .tbl_guide tbody tr:first-child {
   border-top: none;
}

.cont_test_intro .wrap_table_guide .tbl_guide th, .cont_test_intro .wrap_table_guide .tbl_guide td {
   text-align: center;
}

.cont_test_intro .wrap_table_guide .tbl_guide th.align_left, .cont_test_intro .wrap_table_guide .tbl_guide td.align_left {
   padding-left: 44px;
   text-align: left;
}

.cont_test_intro .wrap_table_guide .tbl_guide th.colspan, .cont_test_intro .wrap_table_guide .tbl_guide td.colspan {
   color: #898989;
}

.cont_test_intro .wrap_table_guide .tbl_guide th {
   font-weight: normal;
   color: #252525;
}

.cont_test_intro .wrap_table_guide .tbl_guide td {
   padding: 22px 0;
   color: #666;
}

.cont_test_intro .wrap_table_guide .tbl_guide .br_left {
   border-left: 1px solid #cdcdcd;
}

.cont_test_intro .table_guide_type2 {
   padding-top: 15px;
}

.cont_test_intro .table_guide_type3 {
   padding-top: 15px;
}

.cont_test_intro .table_guide_type3 .tbl_guide thead tr {
   border-top: 1px solid #cdcdcd;
}

.cont_test_intro .table_guide_type3 .tbl_guide thead tr:first-child {
   border-top: none;
}

.cont_test_intro .table_guide_type3 .tbl_guide thead th {
   border-left: 1px solid #cdcdcd;
}

.cont_test_intro .table_guide_type3 .tbl_guide thead th:first-child {
   border-left: none;
}

.cont_test_intro .table_guide_type3 .tbl_guide thead th.br_left {
   border-left: 1px solid #cdcdcd;
}

.cont_test_intro .table_guide_type3 .tbl_guide tbody td {
   padding: 18px 0;
}

.cont_test_intro .table_guide_type4 {
   padding-top: 15px;
}

.cont_test_intro .table_guide_type4 .tbl_guide thead tr {
   border-top: 1px solid #cdcdcd;
}

.cont_test_intro .table_guide_type4 .tbl_guide thead tr:first-child {
   border-top: none;
}

.cont_test_intro .table_guide_type4 .tbl_guide thead th {
   border-left: 1px solid #cdcdcd;
}

.cont_test_intro .table_guide_type4 .tbl_guide thead .br_clear {
   border: none;
}

.cont_test_intro .table_guide_type4 .tbl_guide tbody td {
   padding: 18px 0;
   border-left: 1px solid #cdcdcd;
}

.cont_test_intro .table_guide_type4 .tbl_guide tbody .br_clear {
   border: none;
}

.cont_test_intro .desc_thumb {
   margin-top: 45px;
}

.cont_test_intro .desc_thumb .tit_thumb {
   display: block;
   margin-bottom: 17px;
   font-weight: normal;
}

.cont_test_intro .desc_thumb img {
   display: block;
   margin: 0 auto;
}

.cont_test_intro .box_job_class {
   margin-top: 24px;
   padding: 15px 0;
   border: 1px solid #d4dbde;
   background: #f8fbfb;
}

.cont_test_intro .box_job_class .list_job {
   overflow: hidden;
}

.cont_test_intro .box_job_class .list_job li {
   float: left;
   width: 20%;
   margin: 10px 0;
   text-align: center;
   line-height: 18px;
}

.cont_test_intro .common_intro_bottom {
   position: fixed;
   z-index: 20;
   bottom: 0;
   width: 999px;
    padding: 0;
    left: 50%;
    margin-left: -500px;
}

.cont_test_intro .type_set_item .item_set {
   width: 413px;
   text-indent: 30px;
}

.cont_test_intro .link_top {
   display: block;
   line-height: 96px;
   font-size: 18px;
   color: #2478b5;
}

.cont_test_intro .link_top .ico_test_intro {
   margin: 26px 17px 0 0;
   background-position: 0px -128px;
   width: 44px;
   height: 44px;
}

.cont_test_intro .box_set_guide {
   margin-top: 60px;
   padding: 30px;
   background: #f7f7f7;
}

.cont_test_intro .box_set_guide .tit_intro_item {
   position: relative;
   margin-top: 0;
   color: #333;
}

.cont_test_intro .box_set_guide .tit_intro_item:before {
   position: absolute;
   top: -8px;
   left: 0;
   background-image: url(../img/sp_intro_popup.png);
   background-size: 273px 262px;
   background-position: -100px -178px;
   width: 32px;
   height: 33px;
   content: '';
}

.cont_test_intro .box_set_guide .txt_intro {
   color: #555;
}


.cont_test_intro .wrap_table_guide.table_guide_type3 .tbl_guide td.align_left{padding: 18px 26px;}

.cont_test_intro .table_guide_type3 .tbl_guide tbody td{border-left: 1px solid #cdcdcd; color:#333;}
.cont_test_intro .table_guide_type3 .tbl_guide tbody th, .cont_test_intro .table_guide_type3 .tbl_guide tbody th ~ td{border-top: 1px solid #a5a5a5;}
.cont_test_intro .table_guide_type3 .tbl_guide tbody tr:first-child th, .cont_test_intro .table_guide_type3 .tbl_guide tbody tr:first-child th ~ td{border-top: none;}
.cont_test_intro .box_set_guide .txt_check{font-size: 18px; font-weight: 500; color:#333; margin-top: 28px;}
.cont_test_intro .box_set_guide .txt_check:before{content:''; display: inline-block; width: 15px; height: 15px; background:url(../img/ico_txt_check.png) no-repeat;}
.cont_test_intro .table_guide_type3.short .tbl_guide tbody td{padding: 14px 0;}
/* .cont_test_intro .stat_type4.icon01 dt:before {background-image:url(/whou/resources/img/ico_test_intro01.png);} */
/* .cont_test_intro .stat_type4 dt:before{width: 17px; */
/*     height: 17px; */
/*     margin-left: 5px; */
/*     background-repeat: no-repeat; */
/*     background-position: 0 0;} */
.cont_test_intro .stat_type4 {
    width: 290px;
    margin: 0 0 20px;
}
.cont_test_intro .stat_type4.icon03 {
    display: block;
    width: auto;
    padding: 0;
    margin: 0;
}
.tabs{
   margin-right: 93px; 
   margin-left: 93px; 
   margin-top: 40px;
}
.nav-tabs .nav-link{border:0;color:#111;}

</style>
<body>
    <nav>
        <div class="nav nav-tabs tabs" id="nav-tab" role="tablist">
            <button class="nav-link active" id="nav-intro-tab" data-bs-toggle="tab" data-bs-target="#nav-intro" type="button" role="tab" aria-controls="nav-intro" aria-selected="true">검사소개</button>
            <button class="nav-link" id="nav-result-tab" data-bs-toggle="tab" data-bs-target="#nav-result" type="button" role="tab" aria-controls="nav-result" aria-selected="false">검사결과예시</button>
        </div>
    </nav>
    <div id="nav-tabContent">
        <div class="tab-pane fade show active" id="nav-intro" role="tabpanel" aria-labelledby="nav-intro-tab" tabindex="0">
            <!-- 검사소개 내용 작성 -->
            <c:if test="${qnum == 21}">
            <div tabindex="0" class="cont_test_intro">
               <h3 id="top" class="tit_test_intro">직업적성검사 소개</h3>
               <div class="panel_intro_stat">
               
                  <dl class="desc_stat stat_type4 icon01">
                     <dt>예상소요시간</dt>
                     <dd>30분(시간제한없음)</dd>
                  </dl>
                  <dl class="desc_stat stat_type4 icon03">
                     <dt>총 문항수</dt>
                     <dd>88문항</dd>
                  </dl>
               </div>
               <strong class="tit_intro_item">가. 검사 개요</strong>
               <p class="txt_intro">
                  적성이란, 특정 영역(학업, 업무 등)에서 능력을 발휘하는 잠재적인 가능성을 말합니다. <br> 이 검사는
                  직업과 관련된 다양한 능력을 여러분이 어느 정도 가지고 있는가를 스스로 진단하여 자아성찰과 진로 및 직업세계 탐색에
                  도움을 주기 위한 것입니다.
               </p>
               <strong class="tit_intro_item">나. 검사 항목</strong>
               <ol class="list_subject">
                  <li>신체ㆍ운동능력</li>
                  <li>손재능</li>
                  <li>공간지각력</li>
                  <li>음악능력</li>
                  <li>창의력</li>
                  <li>언어능력</li>
                  <li>수리ㆍ논리력</li>
                  <li>자기성찰능력</li>
                  <li>대인관계능력</li>
                  <li>자연친화력</li>
                  <li>예술시각능력</li>
               </ol>
               <strong class="tit_intro_item">다. 검사 결과</strong>
               <p class="txt_intro grade-info-txt">
                  각 적성 영역별 능력 정도를 나타내는 프로파일이 제공됩니다. <br> 그 중 상대적으로 높은 능력을 보이는
                  2~3개 적성영역이 제시되고 관련 직업이 추천됩니다. <br> 또한 각 직업군별 능력보유 정도가 5등급( 낮음
                  <span class="grade-dot gd5"><span title="낮음"
                     class="inner-score"></span></span> 약간낮음 <span class="grade-dot gd4"><span
                     title="약간낮음" class="inner-score"></span></span> 보통 <span
                     class="grade-dot gd3"><span title="보통" class="inner-score"></span></span>
                  높음 <span class="grade-dot gd2"><span title="높음"
                     class="inner-score"></span></span> 매우높음 <span class="grade-dot gd1"><span
                     title="매우높음" class="inner-score"></span></span> ) 중 한 가지로 제시됩니다.
               </p>
               <strong class="tit_intro_item">라. 검사 실시요령</strong>
               <p class="txt_intro">
                  검사는 직업과 관련된 다양한 능력을 여러분이 어느 정도 가지고 있는가를 스스로 평가하는 방식입니다. <br>
                  검사시간에 제한이 없으니 천천히 생각하면서 답해 주십시오.
               </p>
               <strong class="tit_intro_item">마. 검사의 특징</strong> <em
                  class="tit_intro_sub">검사 과정 및 결과의 교육적 효과</em>
               <p class="txt_intro">
                  본 검사는 검사를 치르는 과정이 교육적 경험이 되도록 구성되어 있습니다. 학생들은 직업세계에서 중요한 다양한 능력들 및
                  각 능력에 포함되는 요소들, 나아가 각 요소와 관련된 긍정적 행동예시들을 접함으로써, 그러한 능력들의 중요성 및 바람직한
                  행동 모델에 대하여 학습할 수 있습니다. 실제로 학생들이 검사를 실시한 후 소감을 묻는 질문에 중학생의 91.3%,
                  고등학생의 90.8%가 검사를 통하여 직업에서 필요로 하는 능력들이 매우 다양함을 알게 되었다고 응답하였습니다. <br>
                  또한 검사 결과를 제한된 직업만 제시하는 것이 아니라, 다양한 직업군에서 요구하는 능력과 각 직업군에 대한 개인의
                  적합성을 알려주는 방식을 택함으로써, 학생들의 직업세계 탐색의 폭을 넓히고 자기 발전의 가능성을 알려주고자 하였습니다.
               </p>
               <em class="tit_intro_sub">다양한 적성영역 포함</em>
               <p class="txt_intro">본 검사는 언어능력, 수리·논리력, 공간지각력과 같은 인지능력만이 아니라,
                  신체 · 운동능력, 손재능, 음악능력, 대인관계능력, 자기성찰능력, 자연친화력, 창의력을 적성 영역으로 포함하고
                  있습니다.</p>
               <div class="wrap_table_guide">
                  <table class="tbl_guide">
                     <caption>&lt;표&gt; 직업적성검사의 적성 영역</caption>
                     <colgroup>
                        <col width="199">
                        <col>
                     </colgroup>
                     <thead>
                        <tr>
                           <th scope="col">적성영역</th>
                           <th scope="col">정의</th>
                        </tr>
                     </thead>
                     <tbody>
                        <tr>
                           <td>신체ㆍ운동능력</td>
                           <td class="align_left">기초 체력을 바탕으로 효율적으로 몸을 움직이고 동작을 학습할 수
                              있는 능력</td>
                        </tr>
                        <tr>
                           <td>손재능</td>
                           <td class="align_left">손으로 정교한 작업을 할 수 있는 능력</td>
                        </tr>
                        <tr>
                           <td>공간지각력</td>
                           <td class="align_left">머릿속으로 입체적인 물체의 위치나 모습을 상상하여 떠올릴 수 있는
                              능력</td>
                        </tr>
                        <tr>
                           <td>음악능력</td>
                           <td class="align_left">노래 부르고, 악기를 연주하며, 감상할 수 있는 능력</td>
                        </tr>
                        <tr>
                           <td>창의력</td>
                           <td class="align_left">새롭고 독특한 방식으로 문제를 해결하고, 아이디어를 내는 능력</td>
                        </tr>
                        <tr>
                           <td>언어능력</td>
                           <td class="align_left">말과 글로써 자신의 생각과 감정을 표현하며, 다른 사람의 말과
                              글을 잘 이해할 수 있는 능력</td>
                        </tr>
                        <tr>
                           <td>수리ㆍ논리력</td>
                           <td class="align_left">논리적으로 사고하여 문제를 해결하는 능력</td>
                        </tr>
                        <tr>
                           <td>자기성찰능력</td>
                           <td class="align_left">자신을 돌아보고, 생각과 감정을 조절하며, 자신에게 주어진 여러
                              자원을 관리하는 능력</td>
                        </tr>
                        <tr>
                           <td>대인관계능력</td>
                           <td class="align_left">조직 속에서 구성원들과 협조적이며 원만한 관계를 유지하는 능력</td>
                        </tr>
                        <tr>
                           <td>자연친화력</td>
                           <td class="align_left">인간과 자연이 서로 연관되어 있음을 이해하며, 자연에 대하여
                              관심을 가지고 탐구ㆍ보호할 수 있는 능력</td>
                        </tr>
                        <tr>
                           <td>예술시각능력</td>
                           <td class="align_left">선, 색, 공간, 영상 등에 민감하게 반응하고 조화롭게 재구성할
                              수 있는 능력</td>
                        </tr>
                     </tbody>
                  </table>
               </div>
               <em class="tit_intro_sub">자기평가 방식에 의한 능력 평정</em>
               <p class="txt_intro">본 검사는 능력에 대한 자기 인식이 개인의 진로선택 및 수행에 영향을 미친다는
                  연구 결과에 기초하여 각 하위 영역에 포함되는 다양한 요소들에 대해서 자기평가 경험을 할 수 있도록 구성되어 있습니다.
                  자기평가방식은 검사 시간이 짧고, 기본적인 언어독해력만 있으면, 부담 없이 검사에 임할 수 있는 장점이 있습니다.</p>
               <em class="tit_intro_sub">행동고정 평정척도 방식에 의한 객관적 평정 유도</em>
               <p class="txt_intro">본 검사는 각 적성 요소별로 그 능력이 나타나는 행동 예시를 그 능력이
                  나타내는 수준과 함께 제시함으로써, 자기 평정에서 오는 오차를 최소화하였습니다.</p>
               <em class="tit_intro_sub">검사의 신뢰도 및 타당도에 대한 철저한 분석</em>
               <p class="txt_intro">본 검사는 검사의 신뢰도 및 타당도를 확인하기 위하여 최대한의 노력을
                  기울였으며, 그 결과 만족할 만한 신뢰도 및 타당도 근거들을 확보하였습니다. 신뢰도의 경우 내적 일치도 계수만이 아니라,
                  검사-재검사 신뢰도를 확인하였으며, 타당도는 내용타당도, 구인타당도, 공인타당도, 결과타당도 등을 검토하였습니다.</p>
               <em class="tit_intro_sub">직무조사에 기초한 적성관련 직업분류</em>
               <p class="txt_intro">직업적성검사의 유용성을 결정짓는 중요한 요인 중의 하나는 적합한 직업분류체계를
                  갖추는 것입니다. 다시 말해, 검사 결과에 따라 특정 능력에 요청되는 직업들과 연결하기 위해서는 직업에서 요구하는 능력에
                  따른 직업분류가 필요합니다. 직업분류를 위하여 각 직업에서 요청되는 능력에 대한 면접조사를 실시하였으며, 재직자
                  조사(직무분석) 결과를 통해 43개 직업군(457개 직업)을 적성 영역별로 구분하여 제시하였습니다.</p>
               <em class="tit_intro_sub">청소년의 감각에 맞춘 검사지 디자인</em>
               <p class="txt_intro">본 검사에서는 검사 실시에 대한 동기를 높이고, 반응의 성실도를 끌어내기
                  위하여 전문 시각디자이너와의 공동작업을 통하여 학생들의 인지적ㆍ정의적 특성에 가장 적합한 편집체제를 적용하였습니다. 그
                  결과 학생들로부터 검사지의 외관에 대한 긍정적인 반응을 확인할 수 있었습니다.</p>
               <strong class="tit_intro_item">바. 대상 및 활용목적</strong>
               <p class="txt_intro">
                  1) 검사의 대상<br> 본 검사는 중학교 1학년부터 고등학교 3학년을 대상으로 실시할 때, 가장 적합합니다.
                  중학교 1학년은 언어이해력이 다소 부족할 것으로 판단되므로, 개별 사용자의 숙고에 따른 사용이 요청됩니다.<br>
                  <br> 2) 검사의 활용 목적<br> 본 검사는 학교 진로교육 및 상담, 각종 청소년 상담기관에서
                  교육 및 상담자료로 활용될 수 있으며, 개인이 웹 상에서 자아 성찰을 할 수 있는 도구로서도 활용될 수 있습니다. 목적에
                  따른 검사 활용 방법은 다음과 같습니다.
               </p>
               <p class="box_guide_sub">
                  01. 진로선택을 위한 보조자료<br> 개인이 진로선택을 해야 하는 상황에서 자신의 능력에 보다 적합한 직업군을
                  알고자 하는 경우, 다양한 직업군과 관련된 자신의 적합성에 대한 정보를 바탕으로 개인의 진로선택의 윤곽을 정하는데 도움을
                  줄 수 있습니다.<br>
                  <br> 02. 자아 성찰을 위한 교육자료<br> 검사의 구성상, 각 능력에 대한 정의와 각 능력에
                  포함되는 요소들, 나아가 각 요소에 해당되는 구체적인 행동예시들이 제시되므로 검사를 치르는 과정이 교육적 경험으로
                  작용합니다. 따라서 학생들의 자아성찰을 도모하는 수업이나 프로그램 운영시 본 검사가 적절하게 활용될 수 있습니다.<br>
                  <br> 03. 직업세계에서 필요한 능력 및 관련 직업에 대한 교육 자료<br> 본 검사의 결과표에는
                  각 직업들에서 요구하는 능력들이 무엇인가에 대한 정보가 제공됩니다. 따라서, 직업세계에서 요청하는 다양한 능력이
                  무엇이며, 그러한 능력들과 관련된 직업군들이 무엇인가를 알아볼 수 있는 진로교육 자료로서 활용될 수 있습니다.
               </p>
               <strong class="tit_intro_item">사. 신뢰도 및 규준집단</strong>
               <p class="txt_intro">1) 검사의 신뢰도</p>
               <div class="wrap_table_guide table_guide_type2">
                  <table class="tbl_guide">
                     <caption>&lt;표&gt; 검사의 내적 일치도 계수(cronbach α )</caption>
                     <thead>
                        <tr>
                           <th scope="col">적성영역</th>
                           <th scope="col">중학생</th>
                           <th scope="col">고등학생</th>
                        </tr>
                     </thead>
                     <tbody>
                        <tr>
                           <td>신체ㆍ운동능력</td>
                           <td>.75</td>
                           <td>.85</td>
                        </tr>
                        <tr>
                           <td>손재능</td>
                           <td>.84</td>
                           <td>.87</td>
                        </tr>
                        <tr>
                           <td>공간지각력</td>
                           <td>.83</td>
                           <td>.85</td>
                        </tr>
                        <tr>
                           <td>음악능력</td>
                           <td>.89</td>
                           <td>.90</td>
                        </tr>
                        <tr>
                           <td>창의력</td>
                           <td>.91</td>
                           <td>.92</td>
                        </tr>
                        <tr>
                           <td>언어능력</td>
                           <td>.88</td>
                           <td>.88</td>
                        </tr>
                        <tr>
                           <td>수리ㆍ논리력</td>
                           <td>.89</td>
                           <td>.93</td>
                        </tr>
                        <tr>
                           <td>자기성찰능력</td>
                           <td>.86</td>
                           <td>.86</td>
                        </tr>
                        <tr>
                           <td>대인관계능력</td>
                           <td>.89</td>
                           <td>.89</td>
                        </tr>
                        <tr>
                           <td>자연친화력</td>
                           <td>.85</td>
                           <td>.87</td>
                        </tr>
                        <tr>
                           <td>예술시각능력</td>
                           <td>.89</td>
                           <td>.89</td>
                        </tr>
                     </tbody>
                  </table>
               </div>
               <div class="wrap_table_guide">
                  <table class="tbl_guide">
                     <caption>&lt;표&gt; 검사-재검사 신뢰도(2주간)</caption>
                     <thead>
                        <tr>
                           <th scope="col">적성영역</th>
                           <th scope="col">전체</th>
                           <th scope="col">중학생</th>
                           <th scope="col">고등학생</th>
                        </tr>
                     </thead>
                     <tbody>
                        <tr>
                           <td>신체ㆍ운동능력</td>
                           <td>.90</td>
                           <td>.91</td>
                           <td>.89</td>
                        </tr>
                        <tr>
                           <td>손재능</td>
                           <td>.83</td>
                           <td>.85</td>
                           <td>.81</td>
                        </tr>
                        <tr>
                           <td>공간지각력</td>
                           <td>.91</td>
                           <td>.98</td>
                           <td>.83</td>
                        </tr>
                        <tr>
                           <td>음악능력</td>
                           <td>.89</td>
                           <td>.90</td>
                           <td>.88</td>
                        </tr>
                        <tr>
                           <td>창의력</td>
                           <td>.88</td>
                           <td>.87</td>
                           <td>.89</td>
                        </tr>
                        <tr>
                           <td>언어능력</td>
                           <td>.82</td>
                           <td>.80</td>
                           <td>.84</td>
                        </tr>
                        <tr>
                           <td>수리ㆍ논리력</td>
                           <td>.89</td>
                           <td>.86</td>
                           <td>.91</td>
                        </tr>
                        <tr>
                           <td>자기성찰능력</td>
                           <td>.84</td>
                           <td>.84</td>
                           <td>.83</td>
                        </tr>
                        <tr>
                           <td>대인관계능력</td>
                           <td>.84</td>
                           <td>.88</td>
                           <td>.80</td>
                        </tr>
                        <tr>
                           <td>자연친화력</td>
                           <td>.78</td>
                           <td>.81</td>
                           <td>.74</td>
                        </tr>
                        <tr>
                           <td>예술시각능력</td>
                           <td>.83</td>
                           <td>.88</td>
                           <td>.78</td>
                        </tr>
                     </tbody>
                  </table>
               </div>
               <p class="txt_intro">2) 규준집단의 특성</p>
               <div class="wrap_table_guide table_guide_type2">
                  <table class="tbl_guide">
                     <caption>&lt;표&gt; 규준집단의 지역별/학교급별 참가 학생수</caption>
                     <thead>
                        <tr>
                           <th scope="col">지역</th>
                           <th scope="col">중학교</th>
                           <th scope="col">일반고</th>
                           <th scope="col">특성화고</th>
                           <th scope="col">합계</th>
                        </tr>
                     </thead>
                     <tbody>
                        <tr>
                           <td>대도시</td>
                           <td>1,224</td>
                           <td>932</td>
                           <td>249</td>
                           <td>2,405</td>
                        </tr>
                        <tr>
                           <td>중소도시</td>
                           <td>1,314</td>
                           <td>1,151</td>
                           <td>217</td>
                           <td>2,682</td>
                        </tr>
                        <tr>
                           <td>읍면지역</td>
                           <td>462</td>
                           <td>357</td>
                           <td>94</td>
                           <td>913</td>
                        </tr>
                        <tr>
                           <td>합계</td>
                           <td>3,000</td>
                           <td>2,440</td>
                           <td>560</td>
                           <td>6,000</td>
                        </tr>
                     </tbody>
                  </table>
               </div>
               <div class="box_set_guide">
                  <strong class="tit_intro_item">결과해석시 유의할 점</strong>
                  <p class="txt_intro">적성검사는 자신을 이해하기 위한 많은 방법 중의 하나일 뿐입니다. 따라서
                     적성검사 점수만을 믿고 자신의 소중한 진로를 결정하지 않도록 할 필요가 있습니다. 평소에 자신에 대하여 관찰한 것,
                     잘하는 과목, 좋아하는일들이 무엇인지, 가치관 검사 및 흥미검사 결과 등을 검토하고, 그리고 관심 있는 직업들을 잘
                     알아본 후에 결정하세요. 이 때 다른 사람(부모님, 선생님, 상담가, 친구 등)과 이야기를 나누어 보면 자신의 생각을
                     분명하게하고 조언을 얻을 수 있을 것입니다. 그밖에 적성검사와 해석에 대한 자세한 내용은 "자주 묻는 질문"에서 확인할
                     수 있습니다.</p>
               </div>
               
               <div class="col-lg-6 col-xl-3 mt-5 d-flex justify-content-end" style="margin-top: 20px;width:100%;">
                       <div class="card mb-5 mb-xl-0 test-cont-wrap">
                     <button class="purple-btn" style="padding:0 20px;" onclick="location='/whou/aptitude/itrstkAptitude?qnum=21'">검사시작</button>
                  </div>
               </div>
            </div>
         
         </c:if>
         <c:if test="${qnum == 25}">
            <div class="cont_test_intro"><h3 id="top" class="tit_test_intro">직업가치관검사 소개</h3> <div class="panel_intro_stat"><dl class="desc_stat stat_type1"><dt>
                          예상소요시간
                      </dt> <dd>
                          15~20분(시간제한없음)
                  </dd></dl> <dl class="desc_stat stat_type3"><dt>
                          총 문항수
                      </dt> <dd>
                          49
                      </dd></dl></div> <strong class="tit_intro_item">가. 검사 개요</strong> <p class="txt_intro">
                 직업가치관 검사는 여러분이 직업을 선택할 때 어떤 가치를 중요하게 여기는지 알아보기 위한 것입니다. 직업가치관은 여러분의 직업선택에 중요한 기준이 되며, 자신의 가치와 일치하는 직업을 가졌을 때 더 큰 만족감과 성취감을 느끼게 됩니다. 직업가치관 검사 결과를 통해 직업에 있어 나에게 어떤 가치가 중요한지 이해하는 데 도움이 될 것입니다.
              </p> <strong class="tit_intro_item">나. 검사 항목</strong> <ol class="list_subject"><li>안정성</li> <li>보수</li> <li>일과 삶의 균형</li> <li>즐거움</li> <li>소속감</li> <li>자기 계발</li> <li>도전성</li> <li>영향력</li> <li>사회적 기여</li> <li>성취</li> <li>사회적 인정</li> <li>자율성</li></ol> <strong class="tit_intro_item">다. 검사 결과</strong> <p class="txt_intro">
                 각 개인별로 12가지 직업가치관 점수가 그래프로 제시됩니다.<br>
                 4가지 가치지향 유형 결과가 그림과 그래프로 제시되며, 선호하는 직업가치관 3가지가 제시됩니다.
              </p> <strong class="tit_intro_item">라. 검사 실시요령</strong> <p class="txt_intro">
                 각 문항에 대해 자신의 생각과 가장 일치한다고 생각하는 항목에 응답해주십시오.
              </p> <strong class="tit_intro_item">마. 목적 및 필요성</strong> <p class="txt_intro">
                 진로상담의 핵심은 개인의 성격특성이나 가치관, 흥미 등과 관련성이 높은 직업을 선택했을 때 높은 만족과 성취를 가져온다는 것입니다. 그 중에서도 개인의 가치가 직업 또는 조직의 가치와 얼마나 잘 맞느냐가 직업에 대한 만족도를 결정한다는 연구결과들이 있습니다(De Clercq, Fontaine, &amp; Anseel, 2008; Kristof, 1996).
                 Kalleberg(1977)는 직업가치관을 ‘개인이 자신의 직업에 관하여 가지는 생각, 즉 무엇을 원하는가에 대한 관점으로 한 직업에 대한 일반화된 개념’으로 정의하고 있습니다. 그러나 청소년 시기는 직장 경험이 없으므로, 직업과 관련된 가치를 명료하게 형성하기가 어렵습니다(Gay, Weiss, Hendel, Dawis &amp; Lofquist, 1971; Yao-Ting Sung, Yun-Tim Yvonne Chang, Tzu-Ying Cheng, &amp; Hsiu-Lan Shelly Tine, 2017).<br>
                 &nbsp;따라서 직업가치관 검사에서는 직업가치관을 ‘개인의 가치가 일이나 조직생활에 적용된 것으로, 개인이 일이나 조직생활에 대하여 지니고 있는 가치관’이라고 정의하여 검사를 개발하였습니다.
                 직업가치관 검사는 직업과 관련된 다양한 가치들에 대해 각 개인이 무엇을 더 중요하게 여기는가에 대한 정보를 제공함으로써 진로선택 및 진로상담 과정에서 매우 중요한 의미를 갖습니다.
              </p> <strong class="tit_intro_item">바. 검사의 하위요소</strong> <div class="wrap_table_guide table_guide_type2"><table class="tbl_guide"><caption>&lt;표&gt; 직업가치관검사에 포함되는 하위 요소별 정의</caption> <colgroup><col width="220"></colgroup> <thead><tr><th scope="col">가치</th> <th scope="col">내용</th></tr></thead> <tbody><tr><th scope="row">안정성</th> <td class="align_left">“안정성” 가치가 높을수록 내가 하고 싶은 일을 계속해서 안정적으로 하는 것을 중요하게 여긴다는 것을 나타냅니다.
                          </td></tr> <tr><th scope="row">보수</th> <td class="align_left">“보수” 가치가 높을수록 일을 통해 돈과 같은 경제적 보상을 얻는 것을 중요하게 여긴다는 것을 나타냅니다.
                         </td></tr><tr><th scope="row">일과 삶의 균형</th> <td class="align_left">“일과 삶의 균형” 가치가 높을수록 일과 개인생활의 균형을 이루는 것을 중요하게 여긴다는 것을 나타냅니다</td></tr><tr><th scope="row">즐거움</th> <td class="align_left">“즐거움” 가치가 높을수록 일에서 흥미와 보람을 느끼고 즐거움을 얻는 것을 중요하게 여긴다는 것을 나타냅니다.
                         </td></tr><tr><th scope="row">소속감</th> <td class="align_left">“소속감” 가치가 높을수록 조직 또는 단체의 구성원이 되어 다른 사람들과 함께 일하는 것을 중요하게 여긴다는 것을 나타냅니다.
                         </td></tr><tr><th scope="row">자기 계발</th> <td class="align_left">“자기 계발” 가치가 높을수록 일을 통해서 자신의 능력을 발전시키고 성장해 나가는 것을 중요하게 여긴다는 것을 나타냅니다.
                         </td></tr><tr><th scope="row">도전성</th> <td class="align_left">“도전성” 가치가 높을수록 실패를 두려워하지 않고 새로운 일에 도전하는 것을 중요하게 여긴다는 것을 나타냅니다.
                         </td></tr><tr><th scope="row">영향력</th> <td class="align_left">“영향력” 가치가 높을수록 다른 사람에게 영향을 미치고 사람들을 이끄는 것을 중요하게 여긴다는 것을 나타냅니다.
                         </td></tr><tr><th scope="row">사회적 기여</th> <td class="align_left">“사회적 기여” 가치가 높을수록 다른 사람들의 행복과 복지에 기여하는 것을 중요하게 여긴다는 것을 나타냅니다.
                         </td></tr><tr><th scope="row">성취</th> <td class="align_left">“성취” 가치가 높을수록 목표의식이 뚜렷하고, 자신의 능력을 발휘하여 목표한 바를 달성하는 것을 나타냅니다.
                         </td></tr><tr><th scope="row">사회적 인정</th> <td class="align_left">“사회적 인정” 가치가 높을수록 다른 사람들에게 인정받고 존경받는 것을 중요하게 여긴다는 것을 나타냅니다.
                         </td></tr><tr><th scope="row">자율성</th> <td class="align_left">“자율성” 가치가 높을수록 일의 내용과 환경을 스스로 결정하고 선택하는 것을 중요하게 여긴다는 것을 나타냅니다.
                         </td></tr></tbody></table></div> <strong class="tit_intro_item">사. 표본</strong> <p class="txt_intro">
                 전국의 중학교 1~3학년과 고등학교 1~3학년을 대표할 수 있도록 전국의 61개 중학교와 121개 고등학교에서 각 학년 한 학급씩 참여하였습니다. 모집단의 학교 성별 비율을 고려한 비율 유층 표집을 한 결과 중학생 3,755명, 고등학생 7,037명이 참여하여, 총10,792명의 데이터를 최종 분석에 사용하였습니다.

              </p> <strong class="tit_intro_item">아. 신뢰도</strong> <p class="txt_intro">
                 직업가치관 검사 신뢰도 검사 결과 중학생의 경우 Cronbach’s  0.930, 고등학생의 경우 Cronbach’s  0.931로 분석되어 문항 내적일관성이 높은 수준으로 나타났습니다. 검사-재검사 신뢰도 분석 결과에서도 중학생의 경우 모든 영역에서 0.30이상의 상관을 보였고, 고등학생의 경우 모든 영역에서 0.40이상의 상관을 보여 검사 결과가 안정적으로 나타났습니다.

              </p> <strong class="tit_intro_item">자. 타당도</strong> <p class="txt_intro">
                 직업가치관 검사의 타당성을 검토하기 위해 중학생용과 고등학생용 각각 집중 타당성 검사 결과, 모든 문항에서 Estimates와 AVE가 0.5를 상회하였으며, 개념 신뢰도의 경우 0.7을 상회하였으므로, 모든 문항에서 타당성이 확보된 것으로 나타났습니다. 또한, 재검사에 응답한 학생들을 대상으로 직업에 대한 가치기준 검사와 직업능력개발원의 직업가치관 검사에 대해 분석을 진행한 결과 타당성이 확보된 것으로 나타났습니다.

              </p> <strong class="tit_intro_item">차. 검사활용안내</strong> <em class="tit_intro_sub">검사대상 :중학교 1학년 – 고등학교 3학년에 해당하는 청소년</em> <p class="txt_intro">
                 기본적으로 중·고등학생에 적용될 수 있는 가치들을 중심으로 구성되었으나, 대학생 이상의 성인들도 사용할 수 있습니다.<br>
                 - 교사 및 상담자 : 학생 및 내담자가 중요하게 생각하는 가치가 무엇이며, 어떤 가치지향 유형에 해당되는지에 대한 정보를 얻음으로써 적성검사 및 흥미검사와 함께 종합적으로 자기이해를 할 수 있도록 안내하는데 활용할 수 있습니다.
              </p> <em class="tit_intro_sub">검사시간 : 15~20분(시간제한 없음)</em> <em class="tit_intro_sub">검사결과 활용 방법</em> <p class="txt_intro">
                 첫째, 12가지 가치관 중 개인이 중요시하는 가치를 확인합니다.<br>
                 둘째, 4가지 가치지향 유형 중 어떤 유형에 속하는 지 확인합니다.<br>
                 셋째, 자신의 가치지향 유형이 직업선택 시 어떻게 적용될 수 있는지 생각해봅니다.

              </p>
              
              <div class="col-lg-6 col-xl-3">
                       <div class="card mb-5 mb-xl-0 test-cont-wrap">
                     <button class="purple-btn" style="margin-top: 10"  onclick="location='/whou/aptitude/itrstkAptitude?qnum=25'">검사시작</button>
                  </div>
               </div>
              </div>
         </c:if>
         <c:if test="${qnum == 27}">
            <div class="cont_test_intro"><h3 id="top" class="tit_test_intro">진로개발역량검사 소개</h3> <div class="panel_intro_stat"><dl class="desc_stat stat_type1"><dt>
                                    예상소요시간
                                </dt> <dd>
                                    20분(시간제한없음)
                                </dd></dl><dl class="desc_stat stat_type3"><dt>
                                    총 문항수
                                </dt> <dd>
                                    53
                                </dd></dl></div> <strong class="tit_intro_item">가. 검사 개요</strong> <p class="txt_intro">
                    진로개발역량 검사는 여러분의 진로개발역량 수준을 객관적으로 진단하고 이를 기반으로 지속적이고 효과적으로 진로개발역량을 함양할 수 있도록 돕기 위한 검사입니다. 진로개발역량은 진로를 합리적인 방식으로 결정하고 계획하여 효과적으로 실천해 나가는데 필요한 역량인 진로설계역량과 자신의 진로를 효과적으로 준비하고 관리하는데 필요한 역량인 진로준비역량으로 구성되어 있습니다. 진로개발역량은 자신이 진로와 관련하여 어떤 역량이 발달되어 있고, 추후 어떤 역량을 더 개발해야 하는지 이해하는 데 도움이 될 것입니다.
                </p> <strong class="tit_intro_item">나. 검사 항목</strong> <div class="wrap_table_guide table_guide_type2"><table class="tbl_guide"><caption>&lt;표&gt; 검사 항목</caption> <thead><tr><th scope="col">진로설계역량</th> <th scope="col">진로준비역량</th></tr></thead> <tbody><tr><td>
                                자기이해<br>
                                직업이해<br>
                                진로탐색<br>
                                진로계획
                            </td> <td>
                                낙관성<br>
                                지속성<br>
                                호기심<br>
                                유연성<br>
                                도전성<br>
                                의사소통
                            </td></tr></tbody></table></div> <strong class="tit_intro_item">다. 검사 결과</strong> <p class="txt_intro">
                    각 개인별 진로개발역량 유형(자기주도 진로개발자, 성실한 진로개발자, 멈춰있는 진로개발자, 잠재력 있는 진로개발자)이 제시됩니다.<br>
                    진로개발역량 검사 결과가 그래프로 제시되며, 진로설계역량과 진로준비역량 각각의 하위역량별 점수와 해석이 제시됩니다.
                </p> <strong class="tit_intro_item">라. 검사 실시요령</strong> <p class="txt_intro">
                    각 문항에 대해 자신의 생각과 가장 일치한다고 생각하는 항목에 응답해주십시오.
                </p> <strong class="tit_intro_item">마. 목적 및 필요성</strong> <p class="txt_intro">
                    진로개발역량은 삶의 전체적인 맥락에서 진로를 개발하는데 요구되는 역량을 의미합니다. 이지연 외(2009)는 진로개발역량을 삶의 지향점을 설정하고 진로를 선택하며, 그러한 선택이 실제로 구현될 수 있도록 준비하고 노력하는 과정에서 필요한 지식, 기술, 태도, 가치와 성향으로 정의하고 있습니다.<br><br>
                    진로개발역량에는 자기이해 및 긍정적 자아개념 형성 역량, 대인관계 및 의사소통 역량, 교육기회 탐색 역량, 직업정보 탐색 역량, 진로의사결정 역량, 진로설계와 준비 역량 등이 포함될 수 있습니다(한국직업능력연구원, 2016). 나아가 4차 산업혁명으로 인공지능 활용 직업 등장 등 직업형태가 변화하고 다양해짐에 따라 미래 직업세계에 건설적으로 대처할 수 있는 역량이 강조되고 있습니다(이민화, 2016).<br><br>
                    진로개발역량 검사는 개인의 진로개발역량 수준에 대한 정보를 제공함으로써 진로계획과 진로선택에 도움을 줍니다.
                </p> <strong class="tit_intro_item">바. 검사의 하위요소</strong> <div class="wrap_table_guide table_guide_type2"><table class="tbl_guide"><caption>&lt;표&gt; 역량(진로설계역량, 진로준비역량)의 하위역량과 내용으로 구성</caption> <colgroup><col style="width: 20%;"> <col style="width: 10%;"> <col></colgroup> <thead><tr><th scope="col">역량</th> <th scope="col">하위역량</th> <th scope="col">내용</th></tr></thead> <tbody><tr><th rowspan="4" scope="row">진로설계역량</th> <td>자기이해</td> <td class="align_left">진로와 관련된 자신의 특성에 대해서 이해하는 역량</td></tr> <tr><td>직업이해</td> <td class="align_left">관심 있는 직업에 대해 이해하는 역량</td></tr> <tr><td>진로탐색</td> <td class="align_left">진로와 관련된 다양한 정보를 탐색하고 활용하는 역량</td></tr> <tr><td>진로계획</td> <td class="align_left">진로목표를 달성하기 위한 계획을 수립하고 구체적인 행동으로 실천하는 역량</td></tr> <tr><th rowspan="6" scope="row">진로준비역량</th> <td>낙관성</td> <td class="align_left">자신의 미래와 진로에 대해서 긍정적인 관점을 유지하는 역량</td></tr> <tr><td>지속성</td> <td class="align_left">진로를 준비하는 과정에서 실패나 좌절에도 불구하고 노력을 계속해가는 역량</td></tr> <tr><td>호기심</td> <td class="align_left">미래와 직업세계에 대해 관심을 가지고, 새로운 기회를 끊임없이 탐색하는 역량</td></tr> <tr><td>유연성</td> <td class="align_left">불확실한 상황에서 자신의 태도와 행동을 적응적으로 변화시키는 역량</td></tr> <tr><td>도전성</td> <td class="align_left">결과가 분명하지 않은 상황에서도 계획을 행동으로 옮기는 역량</td></tr> <tr><td>의사소통</td> <td class="align_left">다른 사람을 이해하고, 자신의 의사를 효과적으로 전달하여, 타인과 협력하는 역량</td></tr></tbody></table></div> <strong class="tit_intro_item">사. 표본</strong> <p class="txt_intro">
                    전국의 중학교 1~3학년과 고등학교 1~3학년을 대표할 수 있도록 전국의 39개 중학교와 59개 고등학교에서 각 학년 한 학급씩 참여하였습니다. 모집단의 학교 성별 비율을 고려한 비율 유층 표집을 한 결과 중학생 5,278명, 고등학생 7,244명이 참여하여, 총12,522명의 데이터를 최종 분석에 사용하였습니다.
                </p> <strong class="tit_intro_item">아. 신뢰도</strong> <p class="txt_intro">
                    진로개발역량 검사 신뢰도 검사 결과 진로설계 역량의 경우 Cronbach’s  0.953, 진로준비역량의 경우 Cronbach’s  0.953으로 분석되어 문항 내적일관성이 높은 수준으로 나타났습니다. 각 구인별 검사-재검사 신뢰도 분석 결과에서도 모든 영역에서 0.60이상의 상관을 보여 검사 결과가 안정적으로 나타났습니다.
                </p> <strong class="tit_intro_item">자. 타당도</strong> <p class="txt_intro">
                    진로개발역량 검사의 타당성을 검토하기 위해 집중 타당성 검사 결과, 모든 문항에서 Estimates와 AVE가 0.5를 상회하였고 개념 신뢰도의 경우 0.7을 상회하였으므로, 모든 문항에서 타당성이 확보된 것으로 나타났습니다. 또한, 재검사에 응답한 학생들을 대상으로 임효신, 정철영(2015)이 개발한 검사도구, Kim 등(2014)의 계획된 우연 척도에 대해 분석을 진행한 결과 타당성이 확보된 것으로 나타났습니다.
                </p> <strong class="tit_intro_item">차. 검사 활용안내</strong> <em class="tit_intro_sub">검사대상 : 중학교 1학년 - 고등학교 3학년에 해당하는 청소년(14-19세)</em> <p class="txt_intro">
                    기본적으로 중·고등학생에 적용될 수 있는 가치들을 중심으로 구성되었으나, 대학생 이상의 성인들도 사용할 수 있습니다.
                </p> <p class="txt_intro">
                    교사 및 상담자 : 학생 및 내담자의 진로개발역량 수준을 측정함으로써, 적성검사 및 흥미검사, 직업가치관 검사와 함께 종합적으로 자기이해를 할 수 있도록 안내하는데 활용하고 진로계획 및 선택에 도움을 줄 수 있습니다.
                </p> <em class="tit_intro_sub">검사시간 : 20분(시간제한 없음)</em> <em class="tit_intro_sub">검사결과 활용 방법</em> <p class="txt_intro">
                    첫째, 4가지 진로개발역량 유형 중 어떤 유형에 속하는지 확인합니다.<br>
                    둘째, 진로설계역량 및 진로준비역량의의 하위역량별 점수와 해석을 확인합니다.<br> 셋째, 진로설계역량 검사 결과가 진로계획 및 선택에 어떻게 적용될 수 있는지 생각해봅니다.
                </p>
                
                   <div class="col-lg-6 col-xl-3">
                       <div class="card mb-5 mb-xl-0 test-cont-wrap">
                     <button class="purple-btn" style="margin-top: 10"  onclick="location='/whou/aptitude/itrstkAptitude?qnum=27'">검사시작</button>
                  </div>
               </div>
                </div>
         </c:if>
         <c:if test="${qnum == 31}">
            <div class="cont_test_intro">
               <h3 id="introTop" class="tit_test_intro">직업흥미검사 소개</h3>
               <div class="panel_intro_stat">
                  <dl class="desc_stat stat_type1">
                     <dt>예상소요시간</dt>
                     <dd>15~20분(시간제한없음)</dd>
                  </dl>
                  <dl class="desc_stat stat_type3">
                     <dt>총 문항수</dt>
                     <dd>153문항</dd>
                  </dl>
               </div>
               <strong class="tit_intro_item">가. 검사 개요</strong>
               <p class="txt_intro">흥미란 어떤 종류의 활동에 대해서 개인이 가지고 있는 쾌, 불쾌, 수락,
                  거부의 경향성을 말하며 특히 직업흥미는 직업의 선택, 지속, 직업에서의 만족감, 성공 등과 관련됩니다. 이 검사는
                  다양한 직업에서 이루어지는 활동들에 대해 얼마나 흥미를 느끼고 있는가를 알아봄으로써, 장래에 자신에게 알맞은 직업군을
                  탐색하는 데 도움을 주기 위한 것입니다.</p>
               <strong class="tit_intro_item">나. 검사 항목</strong>
               <ol class="list_subject">
                  <li>자연과학</li>
                  <li>AI·소프트웨어</li>
                  <li>공학</li>
                  <li>법률·행정</li>
                  <li>복지</li>
                  <li>교육</li>
                  <li>예술·미디어</li>
                  <li>스포츠</li>
                  <li>마케팅</li>
                  <li>금융·경영</li>
                  <li>여가·관광</li>
                  <li>보건의료</li>
                  <li>농생명</li>
                  <li>환경</li>
                  <li>제조</li>
                  <li>물류·운송·유통</li>
                  <li>설계·건축·토목</li>
               </ol>
               <strong class="tit_intro_item">다. 검사 결과</strong>
               <p class="txt_intro">
                  각 직업영역별 흥미 정도를 나타내는 프로파일이 제공됩니다.<br> 그 중 상대적으로 높은 흥미를 보이는
                  직업영역이 제시되고, 관련 직업이 추천됩니다.
               </p>
               <strong class="tit_intro_item">라. 검사 실시요령</strong>
               <p class="txt_intro">
                  내가 그 활동을 얼마나 좋아하는가 만을 생각하여 솔직히 답해 주십시오.<br> 혹시 여러분이 평소에 생각해
                  보지 않았던 활동이 적혀 있더라도 그 활동에 대한 여러분의 대략적인 느낌에 따라서 답해 주십시오.
               </p>
               <strong class="tit_intro_item">마. 검사의 특징</strong>
               <p class="txt_intro indent">
                  <span>-</span>직업흥미검사는 중학생 및 고등학생들이 직업과 관련하여 자신의 흥미를 파악하고, 다양한
                  진로분야와 직업군들 중에서<br>자신이 관심을 갖는 직업을 탐색하는 데도움을 주기 위해 제작되었습니다.
                  여러분이 자신의 직업을 선택할 때 고려해야 하는 것 중의 하나가 흥미입니다.<br> 왜냐하면 사람들은 자신이
                  좋아하는 일을 할 때 좀 더 잘해보고자 하는 의욕을 느낄 수 있고 삶의 보람을 찾을 수 있기 때문입니다. <br>
                  <br> <span>-</span>직업흥미검사 K형은 쿠더(Kuder, G. F)의 직업흥미 이론, 즉 특정
                  직업군에서 동질적 내용의 활동들로 구성되는 문항에 대한 선호도로<br>직업흥미유형을 조사하는 이론을 바탕으로
                  6개 분야 총 17개의 직업흥미 영역을 분류하였습니다.
               </p>
               <div class="wrap_table_guide">
                  <table class="tbl_guide">
                     <caption>분야, 직업흥미군, 하는 일(설명문)으로 구성된 표</caption>
                     <colgroup>
                        <col width="150">
                        <col width="200">
                        <col>
                     </colgroup>
                     <thead>
                        <tr>
                           <th scope="col">분야</th>
                           <th scope="col">직업흥미영역</th>
                           <th scope="col">하는 일(설명문)</th>
                        </tr>
                     </thead>
                     <tbody>
                        <tr>
                           <td rowspan="3">과학 기술</td>
                           <td class="align_left">자연과학</td>
                           <td class="align_left">물리학, 화학, 지구과학, 천문학, 생명과학 등 자연계에서
                              일어나는 현상을 연구하거나 관련 지식을 활용하는 일을 한다.</td>
                        </tr>
                        <tr>
                           <td class="align_left">AI·소프트웨어</td>
                           <td class="align_left">인공지능을 갖춘 컴퓨터 시스템이나 컴퓨터를 사용하기 위한
                              프로그램을 연구하고 활용하는 일을 한다.</td>
                        </tr>
                        <tr>
                           <td class="align_left">공학</td>
                           <td class="align_left">기계공학, 에너지공학, 전기전자공학 등의 분야에서 응용할 수
                              있는 과학적 지식과 기술을 연구하거나 활용하는 일을 한다.</td>
                        </tr>
                        <tr>
                           <td rowspan="3">행정 복지</td>
                           <td class="align_left">법률·행정</td>
                           <td class="align_left">국가와 사회 운영에 필요한 법이나 제도를 만들고 적용하며, 국내
                              및 국제 관계를 유지·발전시키는 일을 한다.</td>
                        </tr>
                        <tr>
                           <td class="align_left">복지</td>
                           <td class="align_left">사회 구성원들의 행복과 삶의 질을 개선하고, 신체적, 정신적으로
                              어려움에 처한 사람들을 돕기 위한 사회적, 제도적 일을 한다.</td>
                        </tr>
                        <tr>
                           <td class="align_left">교육</td>
                           <td class="align_left">사람들에게 필요한 지식이나 기술을 가르치고 바람직한 인성을
                              길러주기 위해 교육, 교육상담, 교육환경 조성 등의 일을 한다.</td>
                        </tr>
                        <tr>
                           <td rowspan="2">예체능</td>
                           <td class="align_left">예술·미디어</td>
                           <td class="align_left">음악, 미술, 디자인, 영화, 방송, 문학 등의 예술․미디어
                              분야에서 개인적 재능을 발휘하고, 해당 분야와 관련된 일을 한다.</td>
                        </tr>
                        <tr>
                           <td class="align_left">스포츠</td>
                           <td class="align_left">운동선수로 활약하거나 경기 진행, 선수 지도 및 기타 서비스
                              제공 등 스포츠와 관련된 일을 한다.</td>
                        </tr>
                        <tr>
                           <td rowspan="3">경영 서비스</td>
                           <td class="align_left">마케팅</td>
                           <td class="align_left">소비자에게 상품이나 서비스를 효율적으로 제공하기 위한 홍보
                              활동을 하며, 고객을 유치하고 유지·관리하는 일을 한다.</td>
                        </tr>
                        <tr>
                           <td class="align_left">금융·경영</td>
                           <td class="align_left">기업, 조직 및 개인의 자산을 관리하거나 운용하며, 재무,
                              회계관리, 인사관리 등 회사 경영과 관련된 일을 한다.</td>
                        </tr>
                        <tr>
                           <td class="align_left">여가·관광</td>
                           <td class="align_left">여행, 관광, 행사 등의 분야에서 상품의 기획, 개발 및 진행
                              등과 관련된 일을 한다.</td>
                        </tr>
                        <tr>
                           <td rowspan="3">바이오</td>
                           <td class="align_left">보건의료</td>
                           <td class="align_left">국민의 건강을 보호하고 증진하는 활동을 하며, 환자를 진단,
                              치료, 간호하거나 의료 시스템을 지원하는 일을 한다.</td>
                        </tr>
                        <tr>
                           <td class="align_left">농생명</td>
                           <td class="align_left">농․축․수산물 등 식량 자원을 생산․가공․관리하거나 산림, 반려
                              동식물 관리 등과 관련된 일을 한다.</td>
                        </tr>
                        <tr>
                           <td class="align_left">환경</td>
                           <td class="align_left">공기나 수질, 날씨, 바다 등 지구 환경을 조사․분석하고,
                              보전하거나 개선하는 일을 한다.</td>
                        </tr>
                        <tr>
                           <td rowspan="3">제조 물류 건설</td>
                           <td class="align_left">제조</td>
                           <td class="align_left">자동차, 가전제품, 가구 등 완제품 및 부품을 생산하거나 관리
                              또는 수리하는 분야에서 일을 한다.</td>
                        </tr>
                        <tr>
                           <td class="align_left">물류·운송·유통</td>
                           <td class="align_left">사람의 이동 또는 상품의 배송을 위한 자동차, 비행기, 선박
                              등의 운행 및 통제에 관련된 일을 한다.</td>
                        </tr>
                        <tr>
                           <td class="align_left">설계·건축·토목</td>
                           <td class="align_left">건물이나 구조물, 도로, 철도, 항만 등을 설계하고 만들며, 그
                              과정을 관리하거나 보수하는 일을 한다.</td>
                        </tr>
                     </tbody>
                  </table>
               </div>
               <strong class="tit_intro_item">바. 타당도 및 신뢰도</strong><em
                  class="tit_intro_sub">타당도란?</em>
               <p class="txt_intro">
                  타당도란 검사가 재고자 하는 특성을 얼마나 적절히 재고 있느냐의 문제입니다. 본 직업흥미검사는 이 분야의 전문가와
                  검사전문가들의 수 차례에 걸친 협의와 <br> 직업흥미에 대한 광범위한 이론적 탐색을 통하여 높은 안면타당도와
                  내용타당도를 확보하였습니다.
               </p>
               <em class="tit_intro_sub">신뢰도란?</em>
               <p class="txt_intro">
                  신뢰도란 검사가 재고자 하는 특성을 얼마나 신뢰롭게 또는 정확하게 측정하고 있느냐의 문제입니다. 본 검사는 17개의
                  직업영역에 대한 개인의 흥미 정도를 <br> 측정하는 것이므로 여기서 신뢰도의 문제는 각 직업흥미영역의
                  검사점수가 얼마나 일관성 있느냐의 문제로 귀착됩니다.
               </p>
               <div class="wrap_table_guide">
                  <table class="tbl_guide">
                     <caption>&lt;표&gt; 검사의 내적 일치도 지수</caption>
                     <thead>
                        <tr>
                           <th scope="col">6대 분야</th>
                           <th scope="col">17개 직업흥미군</th>
                           <th scope="col">중학생</th>
                           <th scope="col">고등학생</th>
                        </tr>
                     </thead>
                     <tbody>
                        <tr>
                           <td rowspan="3">과학기술</td>
                           <td class="align_left">자연 과학</td>
                           <td>.945</td>
                           <td>.937</td>
                        </tr>
                        <tr>
                           <td class="align_left">AI·소프트웨어</td>
                           <td>.955</td>
                           <td>.971</td>
                        </tr>
                        <tr>
                           <td class="align_left">공학</td>
                           <td>.954</td>
                           <td>.954</td>
                        </tr>
                        <tr>
                           <td rowspan="3">행정 복지</td>
                           <td class="align_left">법률·행정</td>
                           <td>.924</td>
                           <td>.941</td>
                        </tr>
                        <tr>
                           <td class="align_left">복지</td>
                           <td>.932</td>
                           <td>.937</td>
                        </tr>
                        <tr>
                           <td class="align_left">교육</td>
                           <td>.934</td>
                           <td>.939</td>
                        </tr>
                        <tr>
                           <td rowspan="2">예체능</td>
                           <td class="align_left">예술·미디어</td>
                           <td>.896</td>
                           <td>.929</td>
                        </tr>
                        <tr>
                           <td class="align_left">스포츠</td>
                           <td>.930</td>
                           <td>.934</td>
                        </tr>
                        <tr>
                           <td rowspan="3">경영 서비스</td>
                           <td class="align_left">마케팅</td>
                           <td>.924</td>
                           <td>.935</td>
                        </tr>
                        <tr>
                           <td class="align_left">금융·경영</td>
                           <td>.952</td>
                           <td>.942</td>
                        </tr>
                        <tr>
                           <td class="align_left">여가·관광</td>
                           <td>.932</td>
                           <td>.939</td>
                        </tr>
                        <tr>
                           <td rowspan="3">바이오</td>
                           <td class="align_left">보건의료</td>
                           <td>.939</td>
                           <td>.946</td>
                        </tr>
                        <tr>
                           <td class="align_left">농생명</td>
                           <td>.908</td>
                           <td>.915</td>
                        </tr>
                        <tr>
                           <td class="align_left">환경</td>
                           <td>.944</td>
                           <td>.945</td>
                        </tr>
                        <tr>
                           <td rowspan="3">제조 물류 건설</td>
                           <td class="align_left">제조</td>
                           <td>.925</td>
                           <td>.938</td>
                        </tr>
                        <tr>
                           <td class="align_left">물류·운송·유통</td>
                           <td>.942</td>
                           <td>.929</td>
                        </tr>
                        <tr>
                           <td class="align_left">설계·건축·토목</td>
                           <td>.922</td>
                           <td>.943</td>
                        </tr>
                     </tbody>
                  </table>
               </div>
               <strong class="tit_intro_item">사. 검사 활용안내</strong><em
                  class="tit_intro_sub">검사대상 : 중학교 1학년부터 고등학교 3학년</em>
               <p class="txt_intro">본 검사는 중학교 1학년부터 실시가 가능하되, 중학교 2학년부터 고등학교
                  3학년까지 실시할 때 가장 적합합니다.</p>
               <em class="tit_intro_sub">검사시간 : 15~20분(시간제한 없음)</em><em
                  class="tit_intro_sub">검사결과 활용 방법</em>
               <p class="txt_intro">
                  본 검사는 개인 및 학교, 각종 청소년 상담기관에서 온라인 및 오프라인을 통한 검사 실시와 해석이 가능하며, 검사
                  결과는<br> 다양한 진로교육 및 상담 자료로 활용될 수 있습니다.<br> 첫째, 백분위 그래프를
                  보고 흥미도의 순서를 확인합니다.<br> 둘째, 각 개인별 높은 흥미를 나타내는 상위 2개의 분야와 3개
                  직업군을 확인합니다.<br> 셋째, 상위 직업군에 제시된 직업들의 정보를 커리어넷 직업정보에서 찾아봅니다.
               </p>
               
               <div class="col-lg-6 col-xl-3">
                       <div class="card mb-5 mb-xl-0 test-cont-wrap">
                     <button class="purple-btn" style="margin-top: 10"  onclick="location='/whou/aptitude/itrstkAptitude?qnum=31'">검사시작</button>
                  </div>
               </div>
            </div>
         </c:if>
      </div>
        <div class="tab-pane fade" id="nav-result" role="tabpanel" aria-labelledby="nav-result-tab" tabindex="0">
            <div class="cont_test_intro">
	            <!-- 검사결과예시 내용 작성 -->
	            <h2 class="tit_test_intro">검사결과예시</h2>
	            <div>
	            	<img style="width: 100%;" src="/whou/resources/img/ex.png">
	            </div>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap core JS-->
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    let load = "${load}";
    const link = $(".nav-link");
    if (load == 1) {
        $(".nav-link").removeClass("active");
        $(".tab-pane").removeClass("active show");
        $("#nav-intro").show();
        $("#nav-intro-tab").addClass("active");
        $("#nav-intro").addClass("active show");
    } else if (load == 2) {
        $(".nav-link").removeClass("active");
        $(".tab-pane").removeClass("active show");
        $("#nav-intro").hide();
        $("#nav-result").show();
        $("#nav-result-tab").addClass("active");
        $("#nav-result").addClass("active show");
    }
    
    link.click(function() {
        $(".nav-link").removeClass("active");
        $(".tab-pane").removeClass("active show").hide(); // 이전 탭의 내용 숨김
        $(this).addClass("active");
        const targetTab = $($(this).data("bs-target"));
        targetTab.show(); // 클릭한 탭의 내용을 보이게 설정
        targetTab.addClass("active show");
    });
    </script>
</body>
        
</html>