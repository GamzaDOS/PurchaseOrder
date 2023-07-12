<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="/resources/css/apexcharts.css"
	type="text/css" />
<link rel="stylesheet" href="/resources/css/core/flag-icon.min.css"
	type="text/css" />
<title>현황관리 리포트</title>
<script type="text/javascript" src="/resources/js/navbar-scripts.js"></script>
<script type="text/javascript" src="/resources/js/apexcharts.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>	
 <style>
    select option[value=""][disabled] {
     display: none;
    }
</style>
<!-- 샘플 스타일 -->
    <style>
      canvas {
        display: block;
        margin: 20px auto;
        max-width: 1000px;
        max-height: 500px;
      }
    </style>
</head>
<body>
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

	<div class="container">
		<form action="report">
			<div class="tab-content">
				<div class="tab-pane fade show active" id="reportByItem"
					role="tabpanel" aria-labelledby="txn-tab"></div>
				<div class="tab-pane fade" id="reportByDate" role="tabpanel"
					aria-labelledby="invoice-tab"></div>
			</div>
		</form>
	</div>
	
	
		<canvas id="chart" class="chart-container" style="width: 100%; height: 500px;"></canvas>
		
		
	<input type="hidden" value="4" id="flag">

	<script src="/resources/js/core/popper.min.js" type="text/javascript"></script>
	<script src="/resources/js/core/bootstrap-5.min.js"
		type="text/javascript"></script>
	<script>
	if (document.getElementById("flag").value == 4) {
		document.getElementById("report").style.backgroundColor = "#fff";
		document.getElementById("report").style.color = "#000000";
		document.getElementById("report").style.fontWeight = "bold";
		document.getElementById("order").style.backgroundColor = "#fff";
		document.getElementById("order").style.color = "#000000";
		document.getElementById("order").style.fontWeight = "bold";

	}
	</script>
	<script type="text/javascript">
	var itemReport = `
	<div class="card">
		<div class="card-header">
		<b>현황관리 리포트</b>
	</div>
	<form action="report">
		<div class="card-body">
		<div class="row g-3">
			<div class="col-md-3">
				<div class="input-group mb-3">
					<span class="input-group-text">From</span> <input type="date"
						id="startDate" class="form-control datepicker"
						name="startDate" aria-label="Reported Date (From)" value="${cri.startDate}">
					<span class="input-group-text"><img
						src="/resources/img/calendar3.svg" alt="" width="16"
						height="16" title="calendar" /></span>
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
			<button type="submit" class="btn btn-primary"
				>조회</button>
			</div>
		</div>
	</div>
	</form>
</div>`;

		$(document).ready(function() {

				$('#reportByItem').html(itemReport);
				$('#item-tab').click(function(){
					$('#reportByDate').text('');
					$('#reportByItem').html(itemReport);
				});
				
				$('#date-tab').click(function(){
					$('#reportByItem').text('');
					$('#reportByDate').html(dateReport);
				});
		})

</script>
    <script>
      // 테이블 데이터 개수 가져오기 (가상의 데이터로 예시 작성)
      const data = [
        { table: "완료된조달계획", count: ${count1} },
        { table: "진척검수중", count: ${count5} },
        { table: "진척검수완료", count: ${count6} },
        { table: "발주서진행중", count: ${count3} },
        { table: "발주서마감완료", count:${count4} },
      ];

      // 데이터 가공
      const labels = data.map((item) => item.table);
      const counts = data.map((item) => item.count);

      // 그래프 생성
      const ctx = document.getElementById("chart").getContext("2d");
      new Chart(ctx, {
        type: "bar",
        data: {
          labels: labels,
          datasets: [
            {
              label: "발주진행",
              data: counts,
              backgroundColor: "rgba(75, 192, 192, 0.8)",
              borderColor: "rgba(75, 192, 192, 1)",
              borderWidth: 1,
            },
          ],
        },
        options: {
          responsive: true,
          scales: {
            y: {
              beginAtZero: true,
              precision: 0,
              stepSize: 1,
            },
          },
          plugins: {
              tooltip: {
                callbacks: {
                  title: function () {
                    return ""; // 제목
                  },
                  label: function (tooltipItem) {
                      const dataIndex = tooltipItem.dataIndex;
                      const title = data[dataIndex].table;
                      return title + ": " + tooltipItem.formattedValue;
                  },
                },
              },
            },
          },
        });
    </script>



</body>
</html>
