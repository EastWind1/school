$(function(){	
	var eid=GetQueryString("eid");
	
	
	var p=$.Params.create();
	
	p.addParams("id",eid); 
	
	p.ajax(getIP()+"product.action?list",function(data){
		var html="";
		var val=data.rows[0];
		$("#name").val(val.name);
		$("#color").val(val.color);
		$("#price").val(val.price);
		$("#weight").val(val.weight);
	})
	
	/*详情页修改事件*/
	$("#modifyVal").on("click",function(){
		var name=$("#name").val();
		var color=$("#color").val();
		var price=$("#price").val();
		var weight=$("#weight").val();

		var update=$.Params.create();
		update.addParams("name",name);
		update.addParams("color",color);
		update.addParams("price",price);
		update.addParams("weight",weight);
		update.addParams("id",eid);
				update.ajax(getIP()+"product.action?updMoreByPkId",function (data){
					if(data.success){
						alert(data.msg);
						window.location.href="media/product/productList.jsp";
					}else{
						alert(data.msg);
						return false;
					}

				});
						
		})
		
		
		

	
})