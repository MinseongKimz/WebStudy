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
<title>네이버 쇼핑 api</title>
<link rel="stylesheet" href="<%=cp%>/css/main.css" type="text/css">
<style type="text/css">
	.image{
		width: 100px;
		height: 100px;
	
	}
	.price{
		color: red;
		font-weight: bold;
	}
	.caption{
		color: red;
		font-size: small;
		font-weight: bold;
	}

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">

	$(function()
		{
			$("#loadBtn").click(function()
			{
				var name = $("#name").val();
				
				$.get("search.do", {name : name}, function(args)
				{
					var searchXml = $.parseXML(args); // 텍스트로 받아온걸 XML 로 다시 변환;
					var txt = "";
					var priceArr 
					var arr = []; 
					var tprice = 0;  // 검색 결과 나온 물품들의 누적 합 
					$(searchXml).find('item').each(function(index) // 각 상품은 <item> 태그로 묶여있다.
					{
						var name = $(this).find('title').text(); // 타이틀 : 물건 이름
						var price = $(this).find('lprice').text();	// lprice : 각 항목의 최저가 → 최고가는 안나오는듯..?
						var image = $(this).find('image').text();	// image : 각 항목의 사진 
						
						txt += "<img class='image' src='" + image +"' >"+"<p>" + name + " 최소가 : [" + price + "]</p><br>";
						arr[index] = Number(price);	
					});
					
					for (var i = 0; i < arr.length; i++)
					{
						tprice += Number(arr[i]); // 누적 실행
					}
					
					var avgPrice = (tprice/arr.length);  // 누적합 / 물품갯수
					
					
					for (var i = 0; i < arr.length; i++)
					{
						if (arr[i] < (avgPrice * 1.1 ) && arr[i] > (avgPrice * 0.98)) // 물품중에 평균 가격 범위안에 들어왔다면
						{
							arr.splice(i, 1);
							i--;
						}
					}
					
					var tprice2 = 0; // 거른 것들을 누적합 하기위해 만든 변수 
					
					//alert(arr.length)
					
					for(var i=0; i<arr.length; i++)
					{
						tprice2 += arr[i]; 
						console.log(tprice2);
						
					}
					//console.log(tprice2);
					var realAvgPrice = (tprice2/arr.length) * 0.65;
					
					//alert(avgPrice);
					//alert(realAvgPrice);
					
					if (arr.length==0)
					{
						$("#result").html("<p>검색결과가 없습니다.ㅠ</p>");
					} 
					else
					{
						var txt2 = "<p class='price'>추천중고가격은 : " + realAvgPrice + " 입니다</p>" 
						 + "<p class='caption'>이 가격은 단지 참고용이며 절대적이지 않습니다.<br>제품명을 정확히 적으면 정확도가 올라갑니다.</p>";
						$("#result").html(txt2 + txt);
					}
					
				});
				
			});
			
			$("#clearBtn").click(function()
			{
				$("#result").empty();
			});
			
		});
</script>



</head>
<body>


<div class="head">
	<p>네이버 쇼핑 검색 api</p>
	<hr>
</div> 

<div class="body">
	<input type="text" id="name" > 
	<br>
	<button id="loadBtn" class="btn">검색하기</button>
	<button type="button" id="clearBtn" class="btn">지우기</button>
</div>

<div id="result">


</div>


</body>
</html>