<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 상세 정보</title>

<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link type="text/css" href="css/css.css" rel="stylesheet" />

<style>
	
<!-- 지우지 말 것 -->	
.widget-chart ul li {
	width: 31.5%;
	display: inline-block;
	padding: 0px;
}
.moon{
	display : block;
	margin-left:auto; 
	margin-right:auto;
}
</style>

</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	

	<div id="detail">
		<div class="container">
			<h1 class="text-center"><span class="high_light">제품 정보</span></h1>
			<br>
			<div class="row">
				<div class="col-md-3" id="food_img">
					<img src="${foodview.img}" height="250px" width="250px">
				</div>
				<div class="col-md-9">
					<jsp:include page="foodByF.jsp"></jsp:include>
					<table id="food_desc" class="table">
						<tbody>
							<tr>
								<td width="150px"><b>음식명</b></td>
								<td>${foodview.name}</td>
							</tr>
							<tr>
								<td><b>성분</b></td>
								<td>${foodview.material}</td>
							</tr>
							<tr>
								<td><b>알레르기 성분</b></td>
								<td id="al"></td>
							</tr>
						</tbody>
					</table>
					<input type="hidden" name="fname" id="fname" value="${foodview.code}"/>
					<input type="button" id="add" class="btn btn-default" value="장바구니에 추가" />
				</div>
			</div>
			<div class="container">
				<h2 class='high_light text-center'>유사영양상품 리스트</h2>
				<table class="table">
					<tbody id="slist">
						
					</tbody>				
				</table>
			</div>
			<br>
			<br>
			<h1 class="text-center"><span class="high_light">제품 영양성분</span></h1>
			<br>
			<hr>
			<div class="row">
				<div class="col-md-9">
					<canvas id="myDoughnutChart"></canvas>
				</div>

				<div class="col-md-3">
					<table id="food_nutri2" class="table table-hover">
						<tbody>
							<tr>
								<td><span class="high_light" ><b>제품명</b></span></td>
								<td>${foodview.name}</td>
							</tr>
							<tr>
								<td><span class="high_light"><b>칼로리</b></span></td>
								<td>${foodview.calory}</td>
							</tr>
							<tr>
								<td><span class="high_light"><b>탄수화물</b></span></td>
								<td>${foodview.carbo}</td>
							</tr>
							<tr>
								<td><span class="high_light"><b>단백질</b></span></td>
								<td>${foodview.protein}</td>
							</tr>
							<tr>
								<td><span class="high_light"><b>지방</b></span></td>
								<td>${foodview.fat}</td>
							</tr>
							<tr>
								<td><span class="high_light"><b>섵탕</b></span></td>
								<td>${foodview.sugar}</td>
							</tr>
							<tr>
								<td><span class="high_light"><b>나트륨</b></span></td>
								<td>${foodview.natrium}</td>
							</tr>
							<tr>
								<td><span class="high_light"><b>콜레스테롤</b></span></td>
								<td>${foodview.chole}</td>
							</tr>
							<tr>
								<td><span class="high_light"><b>포화지방산</b></span></td>
								<td>${foodview.fattyacid}</td>
							</tr>
							<tr>
								<td><span class="high_light"><b>트랜스지방</b></span></td>
								<td>${foodview.transfat}</td>
							</tr>
						</tbody>
					</table>
			
				</div>
				<!-- 표들어갈곳 -->
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>

<script>	
function showal() {
	if("${foodview.allergy}"){
		let f1 = "${foodview.allergy}";
		let m1 = "${member.al}";
		let f = f1.split(" ");
		let m = m1.split(",");
		for(let i=0; i<f.length; i++) {
			var flag = true;
			for(let j=0; j<m.length; j++) {
				if (f[i] == m[j]) {
					$("#al").append("<span style='color:red'>"+f[i]+" </span>");
					flag = false;
				}
			}
			if(flag)
				$("#al").append("<span>"+f[i]+" </span>");
		}
	}
}
showal();
	$("#add").on('click', () => {
		let jcode = ${foodview.code};
		let jid = '${member.id}';
		let jjim = {id:jid, code:jcode};
		console.log("애드",jjim);
		$.ajax({
			url:"/JJim",
			type:"post",
			data:JSON.stringify(jjim),		// 객체 ==> 문자열
			contentType:"application/json",	// 이제 json 형태로 보낼거다.
			success:function(res){
				console.log(res);
				if(res.status){
					alert("추가완료");
				}else{
					alert(res.data);
				}
			},
			error:function(xhr){
				alert("정보 저장 실패");
				console.log(xhr);
			}
		})
	});


	function similar(){
		$.ajax({
			url:"foodsimilar.do",
			method:"post",
			data:"fname="+$("#fname").val(),
			success:function(res){
				$("#slist").empty();
				let jsonData = JSON.parse(res);
				
				console.log(jsonData);
				let tr1 = document.createElement("tr"); 
				let tr2 = document.createElement("tr");
				
				jsonData.forEach((food)=>{
	                let td1 = document.createElement("td"); 
	                
	                td1.innerHTML = '<div><img class="moon" src="'+ food.img +'" height="100px" width="100px" /></div>';
	                td1.width="20%";
	                tr1.appendChild(td1);
	                
	                let td2 = document.createElement("td"); 
	                td2.innerHTML = food.name;
	                td2.style.textAlign="center";
	                tr2.appendChild(td2);
				})
	                $("#slist").append(tr1);
	                $("#slist").append(tr2);
			},
			error:function(){
	
			}
		});
	}
	similar();
	
	function graphs() {
		let SERVING_WT = "${foodview.name}";
		let NUTR_CONT1 = "${foodview.calory}";
		let NUTR_CONT2 = "${foodview.carbo}";
		let NUTR_CONT3 = "${foodview.protein}";
		let NUTR_CONT4 = "${foodview.fat}";
		let NUTR_CONT5 = "${foodview.sugar}";
		let NUTR_CONT6 = "${foodview.natrium}";
		let NUTR_CONT7 = "${foodview.chole}";
		let NUTR_CONT8 = "${foodview.fattyacid}";
		let NUTR_CONT9 = "${foodview.transfat}";
		let BGN_YEAR = "안쓰는 데이터";
		let ANIMAL_PLANT = "${foodview.maker}";
		let ctx = $('#myDoughnutChart');
		let myDoughnutChart = new Chart(ctx,
				{
					type : 'doughnut',

					data : {
						labels : [ '칼로리', '탄수화물', '단백질', '지방', '당류', '나트륨',
								'콜레스테롤', '포화지방산', '트랜스지방' ],
						datasets : [ {
							label : '# of Votes',
							data : [ NUTR_CONT1, NUTR_CONT2, NUTR_CONT3,
									NUTR_CONT4, NUTR_CONT5, NUTR_CONT6,
									NUTR_CONT7, NUTR_CONT8, NUTR_CONT9 ],
							backgroundColor : [ 'rgba(255, 99, 132, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(255, 206, 86, 1)',
									'rgba(75, 192, 192, 1)',
									'rgba(153, 102, 255, 1)',
									'rgba(255, 159, 64, 1)',
									'rgba(186, 253, 255, 1)',
									'rgba(255, 224, 224, 1)',
									'rgba(209, 0, 129, 1)', ],
							borderColor : [ 'rgba(255, 99, 132, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(255, 206, 86, 1)',
									'rgba(75, 192, 192, 1)',
									'rgba(153, 102, 255, 1)',
									'rgba(255, 159, 64, 1)',
									'rgba(186, 253, 255, 1)',
									'rgba(255, 224, 224, 1)',
									'rgba(209, 0, 129, 1)', ],
							borderWidth : 1
						} ]
					},

				// These labels appear in the legend and in the tooltips when hovering different arcs    
				});

		let trs = document.createElement("tr");
		let trs2 = document.createElement("tr");
		let trs3 = document.createElement("tr");
		let trs4 = document.createElement("tr");
		let trs5 = document.createElement("tr");
		let trs6 = document.createElement("tr");
		let trs7 = document.createElement("tr");
		let trs8 = document.createElement("tr");
		let trs9 = document.createElement("tr");
		let trs10 = document.createElement("tr");

		var tds20 = document.createElement("td");
		tds20.innerHTML = "<span class='high_light'><b>제품명</b></span>";
		var tds21 = document.createElement("td");
		tds21.innerHTML = SERVING_WT;

		var tds = document.createElement("td");
		tds.innerHTML = "<span class='high_light'><b>칼로리</b></span>";
		var tds1 = document.createElement("td");
		tds1.innerHTML = NUTR_CONT1;

		var tds2 = document.createElement("td");
		tds2.innerHTML = "<span class='high_light'><b>탄수화물</b></span>";
		var tds3 = document.createElement("td");
		tds3.innerHTML = NUTR_CONT2;

		var tds4 = document.createElement("td");
		tds4.innerHTML = "<span class='high_light'><b>단백질</b></span>";
		var tds5 = document.createElement("td");
		tds5.innerHTML = NUTR_CONT3;

		var tds6 = document.createElement("td");
		tds6.innerHTML = "<span class='high_light'><b>지방</b></span>";
		var tds7 = document.createElement("td");
		tds7.innerHTML = NUTR_CONT4;

		var tds8 = document.createElement("td");
		tds8.innerHTML = "<span class='high_light'><b>당류</b></span>";
		var tds9 = document.createElement("td");
		tds9.innerHTML = NUTR_CONT5;

		var tds10 = document.createElement("td");
		tds10.innerHTML = "<span class='high_light'><b>나트륨</b></span>";
		var tds11 = document.createElement("td");
		tds11.innerHTML = NUTR_CONT6;

		var tds12 = document.createElement("td");
		tds12.innerHTML = "<span class='high_light'><b>콜레스테롤</b></span>";
		var tds13 = document.createElement("td");
		tds13.innerHTML = NUTR_CONT7;

		var tds14 = document.createElement("td");
		tds14.innerHTML = "<span class='high_light'><b>포화지방산</b></span>";
		var tds15 = document.createElement("td");
		tds15.innerHTML = NUTR_CONT8;

		var tds16 = document.createElement("td");
		tds16.innerHTML = "<span class='high_light'><b>트랜스지방</b></span>";
		var tds17 = document.createElement("td");
		tds17.innerHTML = NUTR_CONT9;

		trs.appendChild(tds);
		trs.appendChild(tds1);
		trs2.appendChild(tds2);
		trs2.appendChild(tds3);
		trs3.appendChild(tds4);
		trs3.appendChild(tds5);
		trs4.appendChild(tds6);
		trs4.appendChild(tds7);
		trs5.appendChild(tds8);
		trs5.appendChild(tds9);
		trs6.appendChild(tds10);
		trs6.appendChild(tds11);
		trs7.appendChild(tds12);
		trs7.appendChild(tds13);
		trs8.appendChild(tds14);
		trs8.appendChild(tds15);
		trs9.appendChild(tds16);
		trs9.appendChild(tds17);
		trs10.appendChild(tds20);
		trs10.appendChild(tds21);

		$('#food_nutri').append(trs10);
		$('#food_nutri').append(trs);
		$('#food_nutri').append(trs2);
		$('#food_nutri').append(trs3);
		$('#food_nutri').append(trs4);
		$('#food_nutri').append(trs5);
		$('#food_nutri').append(trs6);
		$('#food_nutri').append(trs7);
		$('#food_nutri').append(trs8);
		$('#food_nutri').append(trs9);

		return;
	}
	
	graphs();
</script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</html>