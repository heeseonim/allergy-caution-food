<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN - SAFEFOOD</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="css/css.css">

<style>
#login {
	width: 350px;
	height: 350px;
}

.middle {
	text-align: center;
}

.btn-max {
	width: 100%;
}

.sp {
	height: 10px;
}
</style>

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div id="login_form" class="login container">
		<form class="form-horizontal">

			<div class="row bo">

				<div class="col-sm-4 col-sm-offset-4">
					<h3 class="middle">비밀번호 찾기</h3>
					<div class="form-group has-feedback">
						<label class="control-label" for="inputSuccess2">ID</label><input
							type="text" class="form-control" id="inputSuccess2"
							aria-describedby="inputSuccess2Status" name="id"><span
							id="inputSuccess2Status" class="sr-only">(success)</span>
					</div>
					<div class="form-group has-feedback">
						<label class="control-label" for="passSuccess2">답변리스트</label> 
						<br>
						<select class="form-control" >
							<option>고르세요</option>
							<option>부모님성함</option>
							<option>초등학교 이름</option>
							<option>좌우명</option>
							<option>기타</option>
						</select> <span id="inputSuccess2Status" class="sr-only">(success)</span>
					</div>
					<div class="form-group has-feedback">
						<label class="control-label" for="passfind">답변</label><input
							type="text" class="form-control" id="passfind"
							aria-describedby="passfindStatus" name="ans"><span
							id="inputSuccess2Status" class="sr-only">(success)</span>
					</div>
					<div class="form-group middle" id="login_buttons">
						<div class="row">
							<div class="col-sm-12">
								<button type="button" id="findpass"
									class="btn btn-default btn-max">비밀번호찾기</button>
							</div>
						</div>
					</div>

				</div>
			</div>
		</form>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script>
	$("#findpass").on("click", (e)=>{
		e.preventDefault();
		let id = $("#inputSuccess2").val();
		let ans = $("#passfind").val();
		console.log(id);
		$.ajax({
			url:"/Findpass/"+id+"/"+ans,
			type:"get",
			success:function(res){
				if(res.status){
					alert("비밀번호는 : "+res.data+" 입니다");
				}else{
					alert("답변이 틀렸습니다 확인해보세요");
				}
			},
			error:function(xhr){
				console.log(xhr);
			}
		})
	})
	
</script>
</html>
