<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SIGNUP - SAFEFOOD</title>
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
<link type="text/css" href="css/css.css" rel="stylesheet" />

<script src="search.js"></script>
<style>
	.mybutton{
		width:100%;
	}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="login_form" class="login container">
		<form class="form-horizontal" method="post" id="fm">
			<div class="login_title">
				<h3 class="high_light middle">회원정보</h3>
			</div>
			<hr>
			
			<div class="row form-group">
				<label for="inputid3" class="col-sm-4 control-label">아이디</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="id" value="${member.id }"
						placeholder="ID" readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label for="inputid3" class="col-sm-4 control-label">비밀번호</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="pw" value="${member.pw }">
				</div>
			</div>
			<div class="form-group">
				<label for="inputid3" class="col-sm-4 control-label">이름</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="name" value="${member.name }"
						placeholder="Name">
				</div>
			</div>
			<div class="form-group">
				<label for="inputid3" class="col-sm-4 control-label">전화번호</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="phone" value="${member.phone }"
						placeholder="Phone">
				</div>
			</div>
			<div class="form-group">
				<label for="inputid3" class="col-sm-4 control-label">이메일</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="email" value="${member.email }"
						placeholder="Email">
				</div>
			</div>
			<div class="form-group">
				<label for="inputid3" class="col-sm-4 control-label">현재 알러지</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" value="${member.al }" readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label for="inputid3" class="col-sm-4 control-label">알러지</label>
				<div class="col-sm-5">
					<div class="checkbox">
					<label> <input type="checkbox" name="allergy" value="대두">대두&nbsp;&nbsp; </label>
					<label> <input type="checkbox" name="allergy" value="땅콩">땅콩&nbsp;&nbsp; </label>
					<label> <input type="checkbox" name="allergy" value="우유">우유&nbsp;&nbsp; </label>
					<label> <input type="checkbox" name="allergy" value="게">게&nbsp;</label>
					<label> <input type="checkbox" name="allergy" value="새우">새우&nbsp;&nbsp; </label>
					<label> <input type="checkbox" name="allergy" value="참치">참치&nbsp;&nbsp; </label>
					<label> <input type="checkbox" name="allergy" value="연어">연어&nbsp;&nbsp; </label>
					<label> <input type="checkbox" name="allergy" value="쑥">쑥&nbsp;</label><br>
					<label> <input type="checkbox" name="allergy" value="소고기">소고기 </label>
					<label> <input type="checkbox" name="allergy" value="닭고기">닭고기 </label>
					<label> <input type="checkbox" name="allergy" value="돼지고기">돼지고기&nbsp;</label>
					<label> <input type="checkbox" name="allergy" value="복숭아">복숭아 </label>
					<label> <input type="checkbox" name="allergy" value="민들레">민들레 </label>
					<label> <input type="checkbox" name="allergy" value="계란흰자">계란흰자 </label>
					</div>
				</div>
			</div>
			<div class="form-group" id="login_buttons">
				<div style="height: 10px"></div>
				<div class="row">
					<div class="col-sm-4"></div>
					<div class="col-sm-1">
						<button type="button" onclick="updatemember()"  class="btn btn-default" id="update">정보수정</button>
					</div>
					<div class="col-sm-1">
						<button type="button" onclick="deletemember()" class="btn btn-default" id="delete">회원탈퇴</button>
					</div>
				</div>
			</div>

		</form>
	</div>
	
	<div id="detail">
		<div class="container" style="width:800px">
			<h1 class="text-center">
				<span class="high_light">섭취내역</span>
			</h1>
			<br>
			<form id="jjimform" class="form-horizontal">
				<table class="table table-hover">
					<tr>
						<th>섭취날짜</th>
						<th>섭취상품</th>
						<th></th>
						<th></th>
					</tr>
					<tbody id="historyList">
					
					</tbody>
				</table>
			</form>
		</div>
	</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	function updatemember(){
	  	console.log("업데이트할까?");
		let $form = $("#fm");
		$form.attr("action","update.do");
		$form.submit();
	}

	function deletemember(){
		let $form = $("#fm");
		$form.attr("action","delete.do");
		$form.submit();
	}
	
	let hid = '${member.id}';
	function showHistory(){
		$.ajax({
			url:"/selectHistory/"+hid,
			type:"get",
			success:function(res){
				if(res.status){
					$("#historyList").empty();
					let data = res.data;
					$(data).each(function(idx, item){
						$("#historyList").append("<tr><td>"+item.regdate+"</td><td>"+item.s_name
								+"</td><td></td><td></td></tr>");
					});
				}else{
					alert("비어있습니다.");
				}
			},
			error:function(e){
				alert("목록 조회 실패");
				console.log(e);
			}
		});
	};
	showHistory();
	
</script>
</html>