$(function(){
   //保存按钮事件
  $("#save").click(function(){
      
      $.ajax({
        url:getIP()+"product.action?insert",
        data:$("#form").serialize(),
        type:"post",
        dataType:"json",
        success:function(data)
        {
          alert(data.msg);
          window.location.href="media/product/productList.jsp";
        }
      })
      
  })
   
})