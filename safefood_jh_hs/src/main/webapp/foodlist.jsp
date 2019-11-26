<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>안전 먹거리</title>

<link type="text/css" href="css/css.css" rel="stylesheet" />

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
.fly {
	float: right;
}
</style>

</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>


	<div id="detail">
		<div id="result" class="container">
			<h2 class="high_light middle">
				<b>상품 정보</b>
				
			</h2>

			<div class="dropdown fly">
				<jsp:include page="foodByF.jsp"></jsp:include>
				<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
					정렬 <span class="caret"></span>
				</button>
				<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
					<li role="presentation"><a role="menuitem" tabindex="-1" href="#" id = "view">View</a></li>
				</ul>
			</div>
			<br>
			<div id="print">
			<c:forEach items="${foods}" var="food">
				<div class="row">
					<div class="col-md-3">
						<img src="${food.img}" height="200px" width="200px" />
					</div>
					<div class="col-md-9">
						<!-- ?? -->
						<table id="" class="table" onclick="javascript:moveFoodInfo('${food.code}')">
							<tr>
								<td><h3 class="high_light">${food.name}</h3>
									<span><b>${food.maker}</b></span><span class="fly">&nbsp;${food.frequency}</span>
									<span class="glyphicon glyphicon-eye-open fly"></span></td>
							</tr>
							<tr>
								<td>${food.material}</td>
							</tr>
						</table>
					</div>
				</div>
				<br>
			</c:forEach>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>

</body>

<script>

/* jshint esversion: 6 */
// name, maker, material

let moveFoodInfo = (code) => {
	location.href="./foodview.do?code="+code;
}

$("#view").on("click", ()=>{
    $.ajax({
        url:"foodsortlist.do",
        type:"post",
        data:"",
        dataType:"json",
        success:(res)=>{
        	$("#print").html("");
        	for(key in res){
        		let t = res[key];
        		console.log(t);
        		
        		//div
        		let divrow = document.createElement("div");	
        		divrow.className = "row";

        		let div3 = document.createElement("div");
        		div3.className = "col-md-3";
        		div3.innerHTML = '<img src="'+ t.img +'" height="200px" width="200px" />';
        		
        		let div9 = document.createElement("div");	
				div9.className = "col-md-9";    
				
				//테이블
				let foodtable = document.createElement("table");
				foodtable.className="table";
				
				foodtable.onclick = () => {moveFoodInfo(t.code)};
				console.log(t.code);
				
				let tr1 = document.createElement("tr");
				let tr2 = document.createElement("tr");
				
				let td1 = document.createElement("td");
				td1.innerHTML = '<h3 class="high_light">'+t.name+'</h3><span><b>'+t.maker+'</b></span><span class="fly">&nbsp;'+t.frequency+'</span><span class="glyphicon glyphicon-eye-open fly"></span>';

				let td2 = document.createElement("td");
				td2.innerHTML = t.material;
				
				tr1.appendChild(td1);
				tr2.appendChild(td2);
				
				foodtable.appendChild(tr1);
				foodtable.appendChild(tr2);
				
				div9.appendChild(foodtable);
				
				divrow.appendChild(div3);
				divrow.appendChild(div9);
        		
        		$("#print").append(divrow);
        	}
        },
        error:()=>{}
    });	
	
	
})

</script>

<script src="search.js"></script>

</html>