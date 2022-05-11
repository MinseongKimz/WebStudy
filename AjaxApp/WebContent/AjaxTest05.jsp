<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AjaxTest05.jsp</title>
<link rel="stylesheet" href="<%=cp%>/css/main.css" type="text/css">
<style type="text/css">
	#search
	{
		width:500px;
	}
	#list
	{
		border: 1px solid gray;
		width: 504px;
		
		position: absolute;
		left: 68px;
		top : 134px; 
		
		display : none;
	}
	
	#list .item
	{
		padding: 3px;
	}
	#list #footer
	{
		height : 14px; 
		background-color: #DDD;
		text-align: right;
		padding: 5px;
		font-size: small; 
	}
	
</style>

<script type="text/javascript" src="<%=cp%>/js/ajax.js"></script>

<script type="text/javascript">
	
	// 검색창에서 키보드를 누를 때 마다..
	// 그 때 까지의 입력된 단어를 서버로 전송하고
	// 전송된 단어에 맞는 추천 검색어를 받아올 수 있도록 처리
	function search()
	{
		//alert("sdad");
		
		// 데이터 수집(입력된 값 얻어오기)
		var search = document.getElementById("search").value;
		
		//alert(search);
		
		// 서버로 전송하기 전에 유효성 검사 --------------------------
		
		// ① 검색어가 존재할 경우에만 서버로 전송할 수 있도록 처리
		if (search.replace(" ", "")=="")
		{
			document.getElementById("list").style.display = "none";
			return;
		}
		
		// ② 입력된 검색어가 완성형 한글일 경우에만 검색 키워드를 전송할 수 있도록 처리
		//    → 정규표현식 사용
		
		var regEx = /^[가-힣]{1,}$/;
		
		if (!regEx.test(search))
		{
			return;
		}
		
		//  -------------------------- 서버로 전송하기 전에 유효성 검사
		
		// URL 구성
		var url = "test05.do?search=" + search;
		
		// XMLHttpRequest 객체 생성
		ajax = createAjax();
		
		ajax.open("GET", url, true);
		
		ajax.onreadystatechange = function()
		{
			if (ajax.readyState == 4 && ajax.status == 200)
			{
				callBack(); // 업무내용 함수 호출
			}
		}
		
		ajax.send("");
	}

	
	// 업무 내용
	// XML 목록으로 받아온 검색어들을
	// 적당한 리스트로 생성해서 화면에 출력할 수 있도록 처리
	function callBack()
	{
		// XML 문서 객체
		var doc = ajax.responseXML;
		
		var root = doc.documentElement;
		
		var itemList = root.getElementsByTagName("item");
		
		// 추천 검색어 노출 지점 초기화
		document.getElementById("items").innerHTML = "";
		
		// 수신한 추천 검색어 삽입하기
		for (var i=0; i<itemList.length; i++)
		{
			var word = itemList[i].firstChild.nodeValue;
			
			// items(노출지점) 에 추가
			document.getElementById("items").innerHTML
			    += "<div class= 'item'>" + word + "</div>"
		}
		
		
		// 최종적으로 목록을 화면에 보일수 있도록 랜더링
		document.getElementById("list").style.display = "block";
	}
	
	
</script>

</head>
<body>

<div>
	<h1>AJAX 실습 - 추천 검색어</h1>
	<hr />
</div>

<div>
	검색어
	<input type="text" id="search" class="control"
	 placeholder="검색어를 입력하세요" onkeyup="search()">
</div>

<div id="list">
	<div id="items">
		<div class="item">가다랑어</div>
		<div class="item">가마</div>
		<div class="item">가사</div>		
		<div class="item">가위</div>		
		<div class="item">가지</div>		
		<div class="item">가치</div>		
		<div class="item">가풍</div>		
		<div class="item">가훈</div>		
	</div>
	<div id="footer">
		추천 검색어
	</div>
	
</div>


<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />

</body>
</html>

















