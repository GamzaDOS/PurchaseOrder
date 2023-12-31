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
<title>구매발주서 마감</title>
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
					<form action="close" method="get">
					       <input type="hidden" name="poCodeInput" value="">
					  <div class="modal-content">
					    <h4>결과입력</h4>
					    <div id="modalContent">
					      <textarea id="noteInput" rows="4" cols="50"></textarea>
					      <br>
					      <input type="submit" id="go1" value="저장" onclick="saveNote()">
					      <button onclick="closeModal()">닫기</button>
					    </div>
					  </div>
					</form>
						</div>								
		<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ모달창 끝ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->	
	<div>
		<div>
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark"
				style="position: relative;">
				<div class="container-fluid">
					<a class="navbar-brand" onclick="location.href='/'">
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
					<li class="has-subnav" style="font-size: 10px;"><a href="/registerinfo/subcontractor"
						style="height: 50px;" id="procurement">
							<div class="nav-text" style="position: relative; left: 10px;">
								조달 관리</div>
					</a></li>
					<li class="has-subnav" style="font-size: 10px;"><a href="/purchaseorder/issue"
						style="height: 50px;" id="order">
							<div class="nav-text" style="position: relative; left: 10px;">
								발주 관리</div>
					</a></li>
					<li class="has-subnav" style="font-size: 10px;"><a href="/stockmanagement/inbound"
						style="height: 50px;" id="stock">
							<div class="nav-text" style="position: relative; left: 10px;">
								자재 관리</div>
					</a></li>
					<li class="has-subnav" style="font-size: 10px;"><a href="/registerinfo/subcontractor"
						style="height: 50px;" id="stock">
							<div class="nav-text" style="position: relative; left: 10px;">
								정보 등록</div>
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
						<b>구매발주서 조회 가자가자가자가작ㅈ갖가작작작작</b>
					</div>
					<form action="close">
						<div class="card-body">
							<div class="row g-3">
								<div class="col-md-3">
									<div class="input-group mb-3">
										<span class="input-group-text">From</span> <input
											type="date" id="startDate" class="form-control datepicker"
											name="startDate" aria-label="Reported Date (From)" value="${cri.startDate}"> <span
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
											name="endDate" aria-label="Reported Date (To)" value="${cri.endDate}"> <span
											class="input-group-text"><img
											src="/resources/img/calendar3.svg" alt="" width="16"
											height="16" title="calendar" /></span>
									</div>
								</div>							
								<div class="col-md-3">
									<div class="input-group mb-3">
										<span class="input-group-text">품목명</span> <input type="text"
											name="item_name" list="productName"
											style="border: 1px solid #ced4da;" value="${cri.item_name}">
									</div>
								</div>
								<div class="col-md-3">
									<button type="submit" class="btn btn-primary"
										>조회</button>
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
						<button class="btn btn-primary" style="position: absolute; left: 1190px;" onclick="openModal(document.querySelector('[name=poCodeInput]:checked').value)">결과 입력</button>
					
						<thead class="table-dark">
							<tr>
								<th scope="col" style="text-align: center;"></th>
								<th scope="col" style="text-align: center;">순번</th>
								<th scope="col" style="text-align: center;">발주코드</th>
								<th scope="col" style="text-align: center;">품목명</th>
								<th scope="col" style="text-align: center;">납품현장</th>
								<th scope="col" style="text-align: center;">결제조건</th>
								<th scope="col" style="text-align: center;">현장담당자</th>
								<th scope="col" style="text-align: center;">등록일</th>
								<th scope="col" style="text-align: center;">마감상태</th>
							
							</tr>
							
						</thead>
						<tbody>
							<c:set value="0" var="no" />
							<c:forEach var="list" items="${closelist}">
								<tr>
									<td style="text-align: center;width: 50px;">
									  <input type="checkbox" class="form-check-input" id="${list.po_code}"
									  value="${list.po_code}" name="poCodeInput" onclick="check(this)" />
									</td>
									<td style="text-align: center; width: 70px;">${no = no+1}</td>
									<td style="text-align: center; width: 80px;"><span>${list.po_code}</span></td>
									<td style="text-align: center;"><span>${list.item_name}</span></td>
									<td style="text-align: center;"><span>${list.delivery_place}</span></td>
									<td style="text-align: center;"><span>${list.payment}</span></td>
									<td style="text-align: center;"><span>${list.delivery_person}</span></td>
									<td style="text-align: center;"><span><fmt:formatDate
												value="${list.po_date}"
												pattern="yyyy-MM-dd " /></span></td>
									<td style="text-align: center;"><span style="color: ${(list.close_status == 1) ? 'red' : 'black'}">
									  ${(list.close_status == 0) ? '미완료' : '완료'}
									</span></td>								
								</tr>
								</c:forEach>
								</tbody>
								</table>
								
								<br>
								</div>
							</div>
						</div>
						
	
<input type="hidden" value="2" id="flag">
<script src="/resources/js/core/popper.min.js" type="text/javascript"></script>
<script src="/resources/js/core/bootstrap-5.min.js"
		type="text/javascript">
</script>
				<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ배너 스크립트ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->		
<script>
		if (document.getElementById("flag").value == 2) {
			document.getElementById("close").style.backgroundColor = "#fff";
			document.getElementById("close").style.color = "#000000";
			document.getElementById("close").style.fontWeight = "bold";
			document.getElementById("order").style.backgroundColor = "#fff";
			document.getElementById("order").style.color = "#000000";
			document.getElementById("order").style.fontWeight = "bold";
		}
</script>
				<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ조회 스크립트ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
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
});
</script>
				<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ모달창 스크립트ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
<script>
function openModal(poCode) {
	  var hiddenInput = document.querySelector('input[name="poCodeInput"]');
	  hiddenInput.value = poCode;
	  var zeta = document.querySelector('[name="poCodeInput"]:checked');
	  var poCodeValue = zeta.value;
	  document.getElementById("modal").style.display = "block";
	  console.log('poCode의 값:', poCodeValue);
	}

  function closeModal() {
    var modal = document.getElementById("modal");
    modal.style.display = "none";

    var noteInput = document.getElementById(`noteInput-${list.po_code}`);
    noteInput.value = ""; // 내용 초기화
  }

  function saveNote() {

    closeModal();
  }    
</script>



<!--  체크박스 중복 제거 -->

<script>
function check(checkbox) {
    var checkboxes = document.getElementsByName("poCodeInput");
    for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i] !== checkbox) {
            checkboxes[i].checked = false;
        } else {
            if (checkbox.checked) {
                var itemName = checkbox.id; // 체크된 체크박스의 아이템 이름 가져오기
                console.log("선택된 아이템 이름: " + itemName);
            }
        }
    }
}
</script>



</body> 
</html>