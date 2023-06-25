<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Suraj">
<!--meta name="_csrf" th:content="${_csrf.token}"/>
    <meta name="_csrf_header" th:content="${_csrf.headerName}"/-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/css/core/bootstrap-5.min.css"
	type="text/css" />
<link rel="stylesheet" href="/resources/css/custom.css" type="text/css" />
<link rel="stylesheet" href="/resources/css/core/flag-icon.min.css"
	type="text/css" />
<title>출고처리</title>
<script type="text/javascript" src="/resources/js/navbar-scripts.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
</head>
<style>
.modal {
  display: none;
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
  background-color: #fefefe;
  margin: 15% auto;
  padding: 20px;
  border: 1px solid #888;
  width: 23%;
}


.form-group {
  margin-bottom: 20px;
}

label {
  display: inline-block;
  width: 120px;
  font-weight: bold;
}



button[id="s1"] {
  padding: 10px 20px;
  background-color: #4CAF50;
  color: #fff;
  border: none;
  cursor: pointer;
}

button[id="s1"]:hover {
  background-color: #45a049;
}
</style>


<body>
		<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ모달창ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->	
						<div id="modal" class="modal">
						  <div class="modal-content">						   
						    <h4>비고</h4>
					        <div id="modalContent">
					            <textarea id="noteInput" rows="4" cols="50"></textarea>
					            <br>
					            <button onclick="saveNote()">저장</button>
					            <button onclick="closeModal()">닫기</button>
					        </div>
						  </div>
						</div>								
		<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ모달창 끝ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->	
	<div>
		<div>
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark"
				style="position: relative;">
				<div class="container-fluid">
					<a class="navbar-brand" onclick="location.href='index1'">
						<h2>
							<b>조달구매시스템</b>
						</h2>
					</a>
				</div>
				<div class="collapse navbar-collapse" id="navbarSupportedContent"
					style="position: absolute; left: 250px; top: 40px;">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item" style="margin-left: 10px;"><a
							class="nav-link" href="issue" id="issue">구매발주서 발행</a></li>
						<li class="nav-item" style="margin-left: 10px;"><a
							class="nav-link" href="inspection" id="inspection">진척검수 처리</a>
						</li>
						<li class="nav-item" style="margin-left: 10px;"><a
							class="nav-link" href="close" id="close">구매발주서 마감</a></li>
						<li class="nav-item" style="margin-left: 10px;"><a
							class="nav-link" href="report" id="report">현황관리 리포트(발주진행)</a></li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</nav>
			<div class="area"></div>
			<nav class="main-menu">
				<ul>
					<li class="has-subnav" style="font-size: 10px;"><a href="#"
						style="height: 50px;" id="procurement">
							<div class="nav-text" style="position: relative; left: 10px;">
								조달 관리</div>
					</a></li>
					<li class="has-subnav" style="font-size: 10px;"><a href="#"
						style="height: 50px;" id="order">
							<div class="nav-text" style="position: relative; left: 10px;">
								발주 관리</div>
					</a></li>
					<li class="has-subnav" style="font-size: 10px;"><a href="#"
						style="height: 50px;" id="stock">
							<div class="nav-text" style="position: relative; left: 10px;">
								자재 관리</div>
					</a></li>
				</ul>
			</nav>
			<br />
		</div>
	</div>
	<div style="position: relative;">
		<div class="container"
			style="position: absolute; left: 250px; width: 3000px;">
			<div class="wrap">
				<div class="card">
					<div class="card-header">
						<b>구매발주서 조회</b>
					</div>
					<form action="inspection">
						<div class="card-body">
							<div class="row g-3">
								<div class="col-md-3">
									<div class="input-group mb-3">
										<span class="input-group-text">From</span> <input
											type="date" id="startDate" class="form-control datepicker"
											name="startDate" aria-label="Reported Date (From)"> <span
											class="input-group-text"><img
											src="/resources/img/calendar3.svg" alt="" width="16"
											height="16" title="calendar" /></span> <b
											style="position: relative; left: 10px; font-size: x-large;">~</b>
									</div>
								</div>
								<div class="col-md-3">
									<div class="input-group mb-3">
										<span class="input-group-text">To</span> <input
											type="date" id="endDate" class="form-control datepicker"
											name="endDate" aria-label="Reported Date (To)"> <span
											class="input-group-text"><img
											src="/resources/img/calendar3.svg" alt="" width="16"
											height="16" title="calendar" /></span>
									</div>
								</div>
								<div class="col-md-3">
									<div class="input-group mb-3">
										<span class="input-group-text">품목명</span> <input type="text"
											name="word" list="productName"
											style="border: 1px solid #ced4da;">
										<datalist id="productName"
											style="border: 1px solid #DBE0E4;">
											<c:forEach var="list" items="${pnList }">
												<option value="${list.product_name }"></option>
											</c:forEach>
										</datalist>
									</div>
								</div>
								<div class="col-md-3">
									<button type="submit" class="btn btn-primary"
										onclick="search()">조회</button>
								</div>
							</div>
						</div>
					</form>
				</div>
				<br /> <br />
				<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
		                <symbol id="check-circle-fill" fill="currentColor"
						viewBox="0 0 16 16">
		                    <path
						d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z" />
		                </symbol>
		                <symbol id="info-fill" fill="currentColor"
						viewBox="0 0 16 16">
		                    <path
						d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z" />
		                </symbol>
		                <symbol id="exclamation-triangle-fill"
						fill="currentColor" viewBox="0 0 16 16">
		                    <path
						d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
		                </symbol>
		            </svg>

					<table id='myTable'
						class="table table-bordered table-striped table-hover caption-top">
						<caption style="color: black;">
							<b>조달계획 목록</b>
						</caption>

						<button class="btn btn-primary" style="position: absolute; left: 1250px;">완료</button>
	
							
							
						<thead class="table-dark">
							<tr>
								<th scope="col" style="text-align: center;"></th>
								<th scope="col" style="text-align: center;">회사명</th>
								<th scope="col" style="text-align: center;">품목명</th>
								<th scope="col" style="text-align: center; width: 110px;">발주담당자</th>
								<th scope="col" style="text-align: center;">등록일</th>
								<th scope="col" style="text-align: center; width: 100px;">완료여부</th>
								<th scope="col" style="text-align: center;">계획명</th>
								<th scope="col" style="text-align: center;">검수일</th>
								<th scope="col" style="text-align: center;">담당자</th>
								<th scope="col" style="text-align: center; width: 100px;">완료율</th>								
								<th scope="col" style="text-align: center; width: 100px;"></th>
								<th scope="col" style="text-align: center; width: 100px;"></th>
							</tr>
							
						</thead>
						<tbody>
							<c:set value="0" var="no" />
							<c:forEach var="list" items="${pilist}">
								<tr>
									<td style="text-align: center;width: 50px;"><input type="checkbox" class="form-check-input" id="itemCodeCheck" 
									name="itemCodeCheck" onclick='check(this)' /></td>
									<td style="text-align: center;"><span>${list.subcontractor_name}</span></td>
									<td style="text-align: center;"><span>${list.item_name}</span></td>
									<td style="text-align: center;"><span>${list.employee_name}</span></td>
									<td style="text-align: center;"><span><fmt:formatDate
												value="${list.po_date}"
												pattern="yyyy-MM-dd " /></span></td>
									<td style="text-align: center;"><span>${(list.pi_status == 0) ? '미완료' : '완료'}</span></td>							
									<td style="text-align: center; " ><input type="text" id="input1" size="10" /></td>
									<td style="text-align: center; "><input type="date" id="input2" size="10" /></td>
									<td style="text-align: center;"><input type="text" id="input3" size="10" /></td>		
									<td style="text-align: center;"><input type="number" id="input4" style="width: 100px;"/></td>
									<td style="text-align: center;"><span><button id ="isave">저장</button></span></td>		
									<td style="text-align: center;"><span><button id ="alpha">진척계획</button></span></td>		
											
								</tr>
								</c:forEach>
								</tbody>
								</table>
								<br>
								
			<table id="secondTable" style="display: none;">
			  <thead class="table-dark">
			  <tr>
				<th scope="col" style="text-align: center; width: 300px;">검수계획명</th>
				<th scope="col" style="text-align: center;">검수일</th>
				<th scope="col" style="text-align: center;">담당자</th>
				<th scope="col" style="text-align: center;">완료율</th>
				<th scope="col" style="text-align: center;"></th>
			    </tr>
			  </thead>
			  <tbody>
			    <c:set value="0" var="no" />
			    <c:forEach var="list" items="${pislist}">
			      <tr>
				<td style="text-align: center;"><span>${list.pis_name}</span></td>
				<td style="text-align: center;"><span>${list.pis_date}</span></td>
				<td style="text-align: center;"><span>${list.employee_name}</span></td>
				<td style="text-align: center;"><span>${list.completion_rate}</span></td>
				<td style="text-align: center; width: 70px;"><span><button onclick="openModal()">비고</button></span></td>
			      </tr>
			    </c:forEach>
			  </tbody>
			</table>

			</div>
		</div>
	</div>
	<input type="hidden" value="2" id="flag">

</body>
	<script src="/resources/js/core/popper.min.js" type="text/javascript"></script>
	<script src="/resources/js/core/bootstrap-5.min.js"
		type="text/javascript"></script>
	<script>
		if (document.getElementById("flag").value == 2) {
			document.getElementById("inspection").style.backgroundColor = "#fff";
			document.getElementById("inspection").style.color = "#000000";
			document.getElementById("inspection").style.fontWeight = "bold";
			document.getElementById("order").style.backgroundColor = "#fff";
			document.getElementById("order").style.color = "#000000";
			document.getElementById("order").style.fontWeight = "bold";
		}
	</script>
	<script>
		$(document).ready(function() {
			$('#startDate').change(function() {
				if ($('#startDate').val() != ''){
					$('#endDate').attr('required', true);
					console.log("시작일 값 있음");
				}
				else{
					$('#endDate').attr('required', false);
					console.log("시작일 값 없음");
				}
			});
			$('#endDate').change(function() {
				if ($('#endDate').val() != ''){
					$('#startDate').attr('required', true);
					console.log("종료일 값 있음");
				}
				else{
					$('#startDate').attr('required', false);
					console.log("종료일 값 없음");
				}
			});
			$('#amount').change(function() {
				if ($('#amount').val() != ''){
					$('#date').attr('required', true);
					console.log("출고량 값 있음");
				}
				else{
					$('#date').attr('required', false);
					console.log("출고량 값 없음");
				}
			});
			$('#date').change(function() {
				if ($('#date').val() != ''){
					$('#amount').attr('required', true);
					console.log("출고일 값 있음");
				}
				else{
					$('#amount').attr('required', false);
					console.log("출고일 값 없음");
				}
			});

		});
	</script>
	<!-- 모달창 스크립트 -->
	    <script>
        function openModal() {
            document.getElementById("modal").style.display = "block";
        }

        function closeModal() {
            document.getElementById("modal").style.display = "none";
        }

        function saveNote() {
            var note = document.getElementById("noteInput").value;
            closeModal();
        }
    </script>
    <!-- 테이블 스크립트 -->
    	<script>
    	  function toggleTable() { 
    		    var table = document.getElementById("secondTable");
    		    var display = table.style.display;
    		    if (display === "none") {
    		      table.style.display = "block";
    		    } else {
    		      table.style.display = "none";
    		    }
    		  }

    		  var alphaButton = document.getElementById("alpha");
    		  alphaButton.addEventListener("click", toggleTable);
	</script>
	<!--  체크박스 중복 제거 -->

<script>
function check(checkbox) {
  var checkboxes = document.getElementsByName("itemCodeCheck");
  for (var i = 0; i < checkboxes.length; i++) {
    if (checkboxes[i] !== checkbox) {
      checkboxes[i].checked = false;
    }
  }
}
</script>
</html>