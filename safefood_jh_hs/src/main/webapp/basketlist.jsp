<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 상세 정보</title>

<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link type="text/css" href="css/css.css" rel="stylesheet" />
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
<!--
지우지 말 것 -->.widget-chart ul li {
	width: 31.5%;
	display: inline-block;
	padding: 0px;
}

.moon {
	display: block;
	margin-left: auto;
	margin-right: auto;
}
</style>

</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div id="detail">
		<div class="container" style="width: 800px">
			<h1 class="text-center">
				<span class="high_light">장바구니</span>
			</h1>
			<br>
			<form id="jjimform" class="form-horizontal">
				<table class="table table-hover">
					<tr>
						<th>이미지</th>
						<th>상품명</th>
						<th>수량</th>
						<th>선택</th>
					</tr>
					<tbody id="basketlist">
						
					</tbody>

				</table>
				<span>선택한 상품의 총 칼로리는 ?</span>
				<span id="bar">0</span>
				<span>Kcal</span>
				<hr>
				<button type="button" id="add" class="btn btn-default">구매</button>
				<button type="button" id="deletebasket" class="btn btn-default">삭제</button>
			</form>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>

<script>
	let array = [];

	let jid = '${member.id}';
	function showbasket(){
		$.ajax({
			url:"/JJim/"+jid,
			type:"get",
			success:function(res){
				if(res.status){
					$("#basketlist").empty();
					let data = res.data;
					$(data).each(function(idx, item){
						$("#basketlist").append("<tr><td><img src=/"+item.img+" height='100px' width='100px'></td><td>"+item.name+"</td><td><input type='number' class='form-control' style='width:15%' placeholder='1' value='1' id='num"+item.code+"'></td><td><input type='checkbox' name='jjimcheck' id='jjimcheck' value="+item.code+","+item.name+","+item.calory+"></td></tr>");
						array.push(item);
					});
				}else {
					alert("비어있습니다.");
				}
			},
			error:function(e){
				alert("목록 조회 실패");
				console.log(e);
			}
		});
	};
	showbasket();
	
	
	$("#deletebasket").on("click", ()=>{
		console.log($("input:checkbox[name=jjimcheck]:checked"));
		$('input:checkbox[name=jjimcheck]:checked').each(function() {
	         console.log($(this).val());
	         let p = [];
			 p = $(this).val().split(",");
			 let jcode = p[0];
	         $.ajax({
	 			url:"/JJim/"+jid+"/"+jcode,
	 			type:"delete",
	 			success:function(res){
	 				console.log(res);
	 			},
	 			error:function(e){
	 				console.log(e);
	 			},
	 			complete : function() {
	 		       showbasket();    
	 		    }
	 		});
	     });
	});
	
	$("#add").click(function() {
		let product="";
		$('input[name=jjimcheck]:checked').each(function(i) {
			let p = [];
			p = $(this).val().split(",");
			product += p[1] + ", ";
		})
		
		let result = product.substring(0, product.length-2);
		
		
		let hid = '${member.id}';
		let date = '2000-01-01';
		let history = {id : hid, regdate : date, s_name : result};
		$.ajax({
			url	: "/insertHistory",
			type : "post",
			data:JSON.stringify(history),
			contentType:"application/json",
			success:function(res) {
				if(res.status) {
					alert("추가완료");
				} else {
					alert("오류");
				}
			},
			error:function(xhr) {
				alert("실패");
			}
		})
	});
	
	// 칼로리 계산 함수
	let sum = 0;	
	$("#basketlist").on("click", 'input:checkbox', function() {
		let p = [];
		p = $(this).val().split(",");
		
		if ($(this).is(":checked")) {
			var n = document.getElementById("num"+p[0]).value;
			sum += Math.floor(Number(p[2])) * n;
			$("#bar").empty();
			$("#bar").append(sum);
		} else {
			var n = document.getElementById("num"+p[0]).value;
			sum -= Math.floor(Number(p[2])) * n;
			$("#bar").empty();
			$("#bar").append(sum);
		}	
	});
	
	
</script>
</html>