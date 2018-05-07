$(function(){	
	var eid=GetQueryString("eid");
	var p=$.Params.create();
	p.addParams("id",eid); 
	
	p.ajax(getIP()+"houseType.action?list",function(data){
		var html="";
		var val=data.rows[0];
		$("#name").val(val.name);
		$("#minprice").val(val.minprice);
		$("#maxPrice").val(val.maxPrice);
   		})
		
	
	
	
	/*详情页修改事件*/
	$("#modifyVal").on("click",function(){
		var name=$("#name").val();
		var minprice=$("#minprice").val();
		var maxPrice=$("#maxPrice").val();
		if(name==""){
			alert("请填写房型！");
			return false;
		}
		if(minprice==""){
			alert("请填写对低价格！");
			return false;
		}
		if(maxPrice==""){
			alert("请填写最高价格！");
			return false;
		}
	
	
		var add=$.Params.create();
		add.addParams("id",eid);
		add.addParams("name",name);
		add.addParams("minprice",minprice);
		add.addParams("maxPrice",maxPrice);
		add.ajax(getIP()+"houseType.action?update",function(data){
			if(data.success){
				window.location.href="media/houseType/houseTypeList.jsp";
			}else{
				alert(data.msg);
				return false;		
			}
		});
	})
		
		
		

	
})