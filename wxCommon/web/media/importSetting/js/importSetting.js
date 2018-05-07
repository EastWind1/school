var q=1;
$(function(){
var  str="<select name='selectss'  id='customerType' class='selectshort'  >";
var htmls="";
var d=0;
var sd="";
 var select=["请选择","姓名","年龄"];
  var selectValue=["","name","age"]
 for(var i=0;i<select.length;i++)
 {
 str += '<option value='+selectValue[i]+'>'+select[i]+'</option>'; 
 }
  str+="</select>";
  var p=$.Params.create();
  p.ajax("AssetImport.action?list",function (data)
			{
		// alert(data.rows.length);
		 $.each(data.rows,function(i,val){
		 htmls="";
		 var  str="<select name='selectss'  id='customerType"+i+"' class='selectshort' onchange='select("+i+")'  >";
		 for(var h=0;h<select.length;h++)
			 {
			 str += '<option value='+selectValue[h]+'>'+select[h]+'</option>'; 
			 }
		  str+="</select>";
		  htmls+="<tr id='tr"+i+"' ><td style='display:none'>第列</td><td colspan='2'> "+str+"</td><td > <a class='btn mini purple'  onclick='delet("+i+")'>删除</a></td></tr>";
		   d=i;
		   q=i;
		   sd=val.fieldName;
		   $("table tbody").append(htmls); 
		  $("#customerType"+d).val(sd);
		   //App.init();
		 });
		 
 
		 });

 $("#sample_editable_1_new").click(function (){
 htmls="";
 q=q+1;
  var  str="<select name='selectss'  id='customerType"+q+"' class='selectshort' onchange='select("+q+")'  >";
		 for(var a=0;a<select.length;a++)
			 {
			 str += '<option value='+selectValue[a]+'>'+select[a]+'</option>'; 
			 }
		  str+="</select>";
 htmls+="<tr id='tr"+q+"'  ><td style='display:none' >第"+q+"列</td>"+
 "<td  colspan='2'>"+str+"</td><td ><a class='btn mini purple'  onclick='delet("+q+")'>删除</a> </td></tr>"
 $("table tbody").append(htmls);
 })  
 
	  
});
function delet(value)
{
//$(value).parent().remove();
$("#tr"+value).remove();
q--;
}
//选中事件
function select(value)
{
 var selectVlue= $("#customerType"+value).val();
 //alert(selectVlue);
 var gh=document.getElementsByName("selectss");
 var s=0;
for(var d=0;d<gh.length;d++)
 {
 //alert($(gh[d]).find("option:selected").val());
 if(selectVlue==$(gh[d]).find("option:selected").val())
 {
 if(s==1)
 {
 alert("已经选择，请选择其他列");
  $("#customerType"+value).val("");
   App.init();
  }
  s=s+1;
 }
 }

}
function save()
{

 var gh=document.getElementsByName("selectss");
 var columNm="";
 //alert(gh.length);
 for(var d=0;d<gh.length;d++)
 {
 if($(gh[d]).find("option:selected").text()=="请选择")
 {
 alert("请选择导出的列！");
 return;
 }
 columNm+=$(gh[d]).find("option:selected").text()+"|";
 }
 if(columNm!="")
 {
 $("#columNm").val(columNm);
  var params=$("#editform").serialize();
	      $.ajax({
                     	dataType:"json",
                     	type:"post",
                     	url:"AssetImport.action?save",
                     	data: params,
                     	success:function(data){
                     	alert(data.msg);
                     	}
                    });
              }else
              {
              alert("请选择导入的列！");
              }
 
}


