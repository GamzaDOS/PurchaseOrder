<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html class="no-js" lang="">

<head>
    <meta charset="utf-8">
    <title>구매발주서</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="/resources/css/modern-normalize.css">
    <link rel="stylesheet" href="/resources/css/web-base.css">
    <link rel="stylesheet" href="/resources/css/invoice.css">
    <script type="text/javascript" src="/resources/js/scripts.js"></script>

    <style>

        body {
            font-family: Arial, sans-serif;
            padding: 20px;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: center;
        }

        thead {
            background-color: #f2f2f2;
        }

        .header-info {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .header-info > div {
            flex-basis: 50%;
        }

        .footer {
            margin-top: 20px;
            text-align: center;
        }
        .small-table {
        width: 70%; 
        margin: 0 auto; 

    }
	    .no-border {
	  border: none;
	  outline: none;
	}
	
	#pri1::placeholder,
	#pri2::placeholder,
	#pri3::placeholder,
	#pri4::placeholder,
	#pri5::placeholder,
	#pri6::placeholder,
	#pri7::placeholder {
	  color: red;
	  font-weight: bold;
	  font-size: 120%;
	}

    </style>
</head>

<body>
  
        <div class="logo-container">
            <h1>구매발주서</h1>
        </div>
        
	<form action="/purchaseorder/print" method="post" id="printform">
	
    <div class="web-container">
        <table class="line-items-container">
            <tr style="background-color: #f2f2f2;">
                <td class="sub_title_left"><strong>수신처</strong></td>
                <td style="background-color: white;" class="my_content">우리 회사</td>
                <td class="sub_title_right"><strong>발주처</strong></td>
                <td style="background-color: white;" class="my_content">${resultList[0].subcontractor_name}</td>
            </tr>
            <tr>
                <td class="sub_title_left" style="background-color: #f2f2f2;"><strong>사업장 주소</strong></td>
                <td class="my_content">우리 회사 주소</td>
                <td class="sub_title_right" style="background-color: #f2f2f2;"><strong>납품현장</strong></td>
                <td class="my_content"> <input type="text" name="delivery_place" id="pri1" placeholder="여기에 입력해주세요" class="no-border"></td>
            </tr>
            <tr>
                <td class="sub_title_left" style="background-color: #f2f2f2;"><strong>전화번호</strong></td>
                <td class="my_content">031-000-0000</td>
                <td class="sub_title_right" style="background-color: #f2f2f2;"><strong>납품현장 전화번호</strong></td>
                <td class="my_content">  <input type="text" name="delivery_tel" id="pri2" placeholder="여기에 입력해주세요" class="no-border"></td>
            </tr>
            <tr>
                <td class="sub_title_left" style="background-color: #f2f2f2;"><strong>발주 담당자</strong></td>
                <td class="my_content">담당자</td>
                <td class="sub_title_right" style="background-color: #f2f2f2;"><strong>납품현장 담당자</strong></td>
                <td class="my_content"> <input type="text" name="delivery_person" id="pri3" placeholder="여기에 입력해주세요" class="no-border"></td>
            </tr>
            <tr>
                <td class="sub_title_left" style="background-color: #f2f2f2;"><strong>인도조건</strong></td>
                <td class="my_content"> <input type="text" name="ex_works" id="pri4" placeholder="여기에 입력해주세요" class="no-border"></td>
                <td class="sub_title_right" style="background-color: #f2f2f2;"><strong>검수방법 :</strong></td>
                <td class="my_content"> <input type="text"  name="inspection_method" id="pri5" placeholder="여기에 입력해주세요" class="no-border"></td>
            </tr>
            <tr>
                <td class="sub_title_left" style="background-color: #f2f2f2;"><strong>결제조건</strong></td>
                <td class="my_content"> <input type="text" name="payment" id="pri6" placeholder="여기에 입력해주세요" class="no-border"></td>
                <td class="sub_title_right" style="background-color: #f2f2f2;"><strong>특이사항</strong></td>
                <td class="my_content"> <input type="text" name="po_text" id="pri7" placeholder="여기에 입력해주세요" class="no-border"></td>
                <td class="my_content" hidden> <input type="text" name="po_code"  value="${resultList[0].po_code}" class="no-border" ></td>
                <td class="my_content" hidden> <input type="text" name="pp_code"  value="${resultList[0].pp_code}" class="no-border" ></td>
                <td class="my_content" hidden> <input type="text" name="contract_code" value="${resultList[0].contract_code}" class="no-border" ></td>
            </tr>
        </table>
        </div>
        
        <div class="alpha">
        <table class="line-items-container">
             <tr style="background-color: #f2f2f2;">
                <td class="client-name main_title"><strong>품명</strong></td>
                <td class="client-name main_title"><strong>품목코드</strong></td>
                <td class="client-name main_title"><strong>소요량</strong></td>
                <td class="client-name main_title"><strong>단가</strong></td>
            </tr>
             <tr >
                <td class="client-name main_title">${resultList[0].item_name}</td>
                <td class="client-name main_title">${resultList[0].item_code}</td>
                <td class="client-name main_title">${resultList[0].consumption}</td>
                <td class="client-name main_title">${resultList[0].supply_price}</td>
                <td class="client-name main_title" hidden>${resultList[0].pp_code}</td>
               <td class="client-name main_title" hidden>${resultList[0].contract_code}</td>

            </tr>
        
        </table>
        
        </div>


        <div class="footer">
            <div class="footer-info">
                <button type="button" id="gogo2" onclick="gogo()">출력 및 통보</button> 
                <button type="button" onclick="location.href='/purchaseorder/issue'">닫기</button>
            </div>
        </div>
        </form>
    

    <script>
        document.getElementById('date').valueAsDate = new Date();
    </script>

    <script>
        function gogo() {  	
            console.log("출력 및 통보 버튼 누름");
            var pri1 = document.getElementById("pri1").value.trim();
            var pri2 = document.getElementById("pri2").value.trim();
            var pri3 = document.getElementById("pri3").value.trim();
            var pri4 = document.getElementById("pri4").value.trim();
            var pri5 = document.getElementById("pri5").value.trim();
            var pri6 = document.getElementById("pri6").value.trim();
            var pri7 = document.getElementById("pri7").value.trim();
            
		    if (
		    		pri1 === "" || 
		    		pri2 === "" ||
		    		pri3 === "" ||
		    		pri4 === "" ||
		    		pri5 === "" ||
		    		pri6 === "" ||
		    		pri7 === ""
				    ) {
				      alert("빈칸을 모두 채워주세요");
				      return;
				    } else {
				      alert("정상적으로 통보되었습니다");
				      
				    }                 
            
            window.print();
			gamma1();

            
            
        }
    </script>
    
    <script>
        function gamma1(){
            var form = document.getElementById("printform");
            form.submit();        	
        }
    </script>

</body>
</html>