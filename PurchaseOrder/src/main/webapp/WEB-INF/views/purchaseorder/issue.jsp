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
<title>구매발주서 발행</title>
<script type="text/javascript" src="/resources/js/navbar-scripts.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
</head>
<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ모달 창 스타일ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
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
  width: 50%;
}

.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
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

button[id="s2"] {
  padding: 10px 20px;
  background-color: #45a049;
  color: #fff;
  border: none;
  cursor: pointer;
  float: right;
}

.v1{
 color: blue;
}

</style>

<body>

	<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ모달 창ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->						
							
						<div id="modal" class="modal">
						  <div class="modal-content">
						    <h3>구매발주서 발행</h3>				
						       
						    <form>						    
						      <div class="form-group">
						        <label for="deliverySite">납품현장 :</label>
						        <input type="text" id="deliverySite" name="deliverySite" placeholder="납품현장을 입력하세요" required>
						      </div>
						      <div class="form-group">
						        <label for="phoneNumber">전화번호 :</label>
						        <input type="tel" id="phoneNumber" name="phoneNumber" placeholder="전화번호를 입력하세요" required>
						      </div>
						      <div class="form-group">
						        <label for="contractperson">계약담당 :</label>
						        <input type="text" id="contractperson" name="contractperson" placeholder="담당자를 입력하세요" required>
						      </div>
						      <div class="form-group">
						        <label for="deliveryCondition">인도조건 :</label>
						        <input type="text" id="deliveryCondition" name="deliveryCondition" placeholder="인도조건을 입력하세요" required>
						      </div>
						      <div class="form-group">
						        <label for="inspectionMethod">검수방법 :</label>
						        <input type="text" id="inspectionMethod" name="inspectionMethod" placeholder="검수방법을 입력하세요" required>
						      </div>
						      <div class="form-group">
						        <label for="specialNotes">특이사항 :</label>
						        <input type="text" id="specialNotes" name="specialNotes" placeholder="특이사항을 입력하세요" required>
						      </div>
						      <div class="form-group">
						        <label for="paymentCondition">결제조건 :</label>
						        <input type="text" id="paymentCondition" name="paymentCondition" placeholder="결제조건을 입력하세요" required>
						      </div>
							  <div class="form-group">
    							 <button type="submit" id="s1" onclick="submitForm()" class="left-button">협력사 통보</button>
    							 <button type="submit" id="s1" onclick="submitForm()" class="left-button">출력</button>
     	 						<button type="button" id="s2" onclick="submitForm1()" class="right-button close-button">닫기</button>
							  </div>
    							 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;< 1 / 1 >
							</form>
						</div>
						</div>
														
	<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ모달 창 끝ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
	
	
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
						<b>조달계획 조회</b>
					</div>
					<form action="issue">
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
		            
					<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 리스트 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
					
					
		<table id="myTable" class="table table-bordered table-striped table-hover caption-top">
		  <caption style="color: black;">
		    <b>조달계획 목록</b>
		  </caption>
		  <button class="btn btn-primary" style="position: absolute; left: 1180px;" onclick="gogo()">구매발주서발행</button>
		  
		  <thead class="table-dark">
		    <tr>
		      <th scope="col" style="text-align: center;">순번</th>
		      <th scope="col" style="text-align: center;">품목코드</th>
		      <th scope="col" style="text-align: center;">품목명</th>
		      <th scope="col" style="text-align: center;">소요량</th>
		      <th scope="col" style="text-align: center;">조달납기</th>
		      <th scope="col" style="text-align: center;">생산일</th>
		      <th scope="col" style="text-align: center;">등록일</th>
		      <th scope="col" style="text-align: center;">자재소요공정</th>
		      <th scope="col" style="text-align: center;">계약서</th>
		    </tr>
		  </thead>
		  <tbody>
		    <c:set value="0" var="no" />
		    <c:forEach var="list" items="${completelist}">
		      <tr id="dada">		      
		        <td style="text-align: center;">${no = no+1}</td>
		        <td style="text-align: center;"><span>${list.item_code}</span></td>
		        <td style="text-align: center;"><span>${list.item_name}</span></td>
		        <td style="text-align: center;"><span>${list.consumption}</span></td>
		        <td style="text-align: center;">
		          <span>
		            <fmt:formatDate value="${list.procurement_date}" pattern="yyyy-MM-dd" />
		          </span>
		        </td>
		        <td style="text-align: center;">
		          <span>
		            <fmt:formatDate value="${list.production_date}" pattern="yyyy-MM-dd" />
		          </span>
		        </td>
		        <td style="text-align: center;">
		          <span>
		            <fmt:formatDate value="${list.pp_date}" pattern="yyyy-MM-dd" />
		          </span>
		        </td>
		        <td style="text-align: center;"><span>${list.process}</span></td>
		        <td style="text-align: center;"><span><button class="alpha" id="${list.item_code}" >계약서선택</button></span></td>
		      </tr>
		    </c:forEach>
		  </tbody>			  
		</table>


      
	<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 리스트 끝 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
			</div>
		</div>
	</div>
	<input type="hidden" value="2" id="flag">
	<script src="/resources/js/core/popper.min.js" type="text/javascript"></script>
	<script src="/resources/js/core/bootstrap-5.min.js"
		type="text/javascript"></script>
	<script>
		if (document.getElementById("flag").value == 2) {
			document.getElementById("issue").style.backgroundColor = "#fff";
			document.getElementById("issue").style.color = "#000000";
			document.getElementById("issue").style.fontWeight = "bold";
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


		});
	</script>
	
	<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ모달 창 스크립트ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
	
	<script>
		function openModal() {
		  document.getElementById("modal").style.display = "block";
		}

		function closeModal() {
			  document.getElementById("modal").style.display = "none";
			  var inputs = document.querySelectorAll("#modal input");
			  for (var i = 0; i < inputs.length; i++) {
			    inputs[i].value = "";
			  }
			}

		  function submitForm() {
			    var deliverySite = document.getElementById("deliverySite").value.trim();
			    var phoneNumber = document.getElementById("phoneNumber").value.trim();
			    var siteManager = document.getElementById("siteManager").value.trim();
			    var deliveryCondition = document.getElementById("deliveryCondition").value.trim();
			    var inspectionMethod = document.getElementById("inspectionMethod").value.trim();
			    var specialNotes = document.getElementById("specialNotes").value.trim();
			    var paymentCondition = document.getElementById("paymentCondition").value.trim();

			    if (
			      deliverySite === "" || // =3은 일치 연산자("==="는 값의 타입과 값을 모두 비교하며, 타입이 다른 경우에는 false를 반환)
			      phoneNumber === "" || // ||은 논리 or연산자, 앞의 조건식이 true이면 전체 조건문은 true가됨
			      siteManager === "" ||
			      deliveryCondition === "" ||
			      inspectionMethod === "" ||
			      specialNotes === "" ||
			      paymentCondition === ""
			    ) {
			      alert("빈칸을 모두 채워주세요");
			    } else {
			      alert("정상적으로 통보되었습니다");
			      closeModal();
			    }
			  }
						
		function submitForm1() {
			  closeModal();
			}
		
	</script>
	<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 테이블 스크립트ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->




<script>

$(document).ready(function(){
    $(document).on("click", ".alpha", function(){
 
        var aa = $(this).attr("id");
        console.log(aa);
        
        var bb=$(this);
        
        
        if(bb.hasClass("togle")){
        
        	bb.removeClass("togle");
        	bb.closest("tr").next().remove(); 
        }
        else{
        	bb.addClass("togle");
        
        $.ajax({
            url: "/api/issue2?aa="+aa,
            method: "GET",
            dataType: "json",
            success: function(response){
            	
            	console.log("성공",response);// 불러옴
            	var str="";
            	
            		for(var i=0; i<response.length;i++){
            	    str += "<tr>" +"<td style='text-align: center;'>" +
                    "<input type='radio' name='itemCodeCheck' onclick='check(this)' />" +
                    
                    "</td>"+  "<td id='z1' style='text-align: center'; hidden>" + response[i].contract_code + "</td>" +
                    "</td>"+  "<td style='text-align: center;'>" + response[i].subcontractor_name + "</td>" +
                    "</td>"+  "<td style='text-align: center'; hidden>" + response[i].item_code + "</td>" +
                     "<td style='text-align: center;'>" + response[i].supply_price + "</td>"+ "<tr>"  ;
            		} 
            		            	           	
                var rowrow = "<tr>" +
                "<td colspan='9'>" +
                "<table id='secondTable' style='text-align: right;'>" +
                "<thead class='table-dark'>" +
                "<tr>" +
                "<th scope='col' style='text-align: center;' class='v1'></th>" +
                "<th scope='col' style='text-align: center;' class='v1'>협력업체명</th>" +
                "<th scope='col' style='text-align: center;' class='v1'>단가</th>" +
                "</tr>" +
                "</thead>" +
                "<tbody>"                
                + 
                str+
                    "</tr>"          
            + "</tbody>" +
                "</table>" +
                "</tr>";
	 		console.log(rowrow);	 		          
	 		bb.closest("tr").after(rowrow);
               
            }//function

          
   	 });//ajax
    } //else
  }); //click  
    
}); //document ready
</script>

<script>

function gogo() {
	var gogo2 = $("input[name='itemCodeCheck']:checked").closest("tr").find(".z1").text();
	console.log(gogo2);
	
    var ball = [];	
    console.log('1?',ball);

	$("input[name='itemCodeCheck']:checked").closest("table").find("tbody tr").each(function() { // 체크박스 근처 검사 
		
	    var radio1 = $(this).find("td:first-child input[type='radio']").is(":checked"); // 부모 요소 안의 첫번째 라디오체크의 선택자
	    
	    if (radio1) {
	        var find1 = $(this).find("td");
	        var contract_code = $(find1[1]).text();
	        var itemcode = $(find1[3]).text();

	        ball.push(contract_code);
	        ball.push(itemcode);
	    }
	});
	
	if( ball[0] !== undefined && ball[1] !== undefined){
    var url = "/purchaseorder/print?contract_code=" + encodeURIComponent(ball[0]) + "&itemcode=" + encodeURIComponent(ball[1]);
    window.open(url);	
	}else{
		alert("계약서를 선택해주세요");
		return;
	}
}



</script>




</body>
</html>