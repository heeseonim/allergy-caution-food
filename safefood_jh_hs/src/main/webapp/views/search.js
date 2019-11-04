let search="전체";

$(".c1").on("click", ()=>{
	$("#cat").html('전체<span class="caret"></span>');
	search = "전체";
	$("#stype").val("all");
	console.log("${food}");
});
$(".c2").on("click", ()=>{
	$("#cat").html('상품명<span class="caret"></span>');
	search = "상품명";
	$("#stype").val("name");
});
$(".c3").on("click", ()=>{
	$("#cat").html('제조사<span class="caret"></span>');
	search = "제조사";
	$("#stype").val("maker");
});
$(".c4").on("click", ()=>{
	$("#cat").html('재료<span class="caret"></span>');
	search = "재료";
	$("#stype").val("material");
});
