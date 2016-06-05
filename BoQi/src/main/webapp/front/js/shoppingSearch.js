charset='uft-8';
//搜索的商品
function search(){
	if($(".search").val()=="" || $(".search").val()==null){
		alert("请输入商品关键词");
	}else{
		var ci = $(".search").val();
		var ye = 1;
		
		//ci=encodeURI(encodeURI(ci));
		window.location.href="proSearch_findSearchPro?order=proid&op=searchBy&ci="+ci+"&ye="+ye;
	}
}
function search2(){
	if($(".search2").val()=="" || $(".search2").val()==null){
		alert("请输入商品关键词");
	}else{
		var ci = $(".search2").val();
		var ye = 1;
		ci=encodeURI(encodeURI(ci));
		window.location.href="../productServlet?order=proid&op=searchBy&ci="+ci+"&ye="+ye;
	}
}