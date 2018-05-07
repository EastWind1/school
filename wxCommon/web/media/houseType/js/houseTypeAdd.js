
$(function(){
	$("#modifyVal").on("click",function(){
		var name=$("#name").val();
		var minprice=$("#minprice").val();
		var maxPrice=$("#maxPrice").val();
		if(name==""){
			alert("请填写户型！");
			return false;
		}
		if(minprice==""){
			alert("请填最低价格！");
			return false;
		}
		if(maxPrice==""){
			alert("请填最高价格！");
			return false;
		}
	
	
		var add=$.Params.create();
		add.addParams("name",name);
		add.addParams("minprice",minprice);
		add.addParams("maxPrice",maxPrice);
		add.ajax(getIP()+"houseType.action?add",function(data){
			if(data.success){
				window.location.href="media/houseType/houseTypeList.jsp";
			}else{
				alert(data.msg);
				return false;		
			}
		});
		
	})
	
})