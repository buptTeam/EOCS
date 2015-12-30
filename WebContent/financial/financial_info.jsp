<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title> set person</title>
	<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link rel="stylesheet" href="../dist/css/bootstrap-select.css">

	<script src="../js/jquery-2.0.3.js"></script>
	
	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="../dist/js/bootstrap-select.js"></script>
    <script src="../dist/js/bootstrap-select-backup.js"></script>
  	<script src="../js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../easyui/themes/gray/easyui.css">
    <link rel="stylesheet" type="text/css" href="../easyui/themes/icon.css">
  
 	<script type="text/javascript" src="../easyui/jquery.min.js"></script>
   	<script type="text/javascript" src="../js/jquery.js"></script>
	<script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../myjs/financial_info.js"></script>
    
</head>
<body>
	
	<font size="2" color="red">请点击“生成数据”，在点击“下载数据”</font>
	<a id="toConfirm" href="javascript:;" role="button" class="btn btn-success btn-sm col-sm-offset-1">生成数据</a> 
	<a id="todownload" href="../download/expert_financial_data.xls" role="button" class="btn btn-success btn-sm col-sm-offset-2">下载数据</a>
	<hr>
	
	<table class="table table-striped table-hover table-bordered">
    	<thead>
        	<tr>
        		
            	<td>姓名</td>
            	<td>工作单位</td>
                <td>职务</td>
               	<td>身份证号</td>
                <td>银行卡号</td>
                <td>开户银行全称</td>
                <td>收款人姓名</td>
                <td>收款人身份证号</td>
                <td>收款人手机号</td>
                <td>收款地址</td>
                <td>邮编</td>
                
                
            </tr>
         </thead>
         <tbody id="itemtbody">
         	<tr id="itemTest" style="display:none">
         		
         		<td id="name">lily</td>
         		<td id="workplace">儿童研究院</td>
         		<td id="duty">调查员</td>
         		
         		<td id="idCard">1234567890</td>
         		<td id="bankCard">0123456789</td>
         		<td id="bankName">北京市紫荆公寓中国银行</td>
         		<td id="pname">收款人姓名</td>
                <td id="pidcardnumber">收款人身份证号</td>
                <td id="ptelephone">收款人手机号</td>
                <td id="paddress">收款地址</td>
                <td id="ppostcard">邮编</td>
         	</tr>
         	
         	
         </tbody>
     </table>
    <!--   
     <div class="pagination">
  		<ul id="page"></ul>
	</div>
	--> 
<nav>
  <ul class="pager">
  	<li id="firstPage"><a href="#">首页</a></li>
    
    <li id="prePage"><a href="#"><span aria-hidden="true">&larr;</span> 上一页</a></li>
    <li ><label>第  <font id="currentpage">1</font>/<font id="totalpages">1</font> 页</label></li>
    <li id="nextPage"><a href="#">下一页 <span aria-hidden="true">&rarr;</span></a></li>
  	<li id="lastPage"><a href="#">尾页</a></li>
  	<li>
  			
              <input class="span2" id="toPageInput" type="text">
              <button id="toPageBtn" class="btn" type="button">Go!</button>
           
		
  	</li>
  </ul>
</nav>

	
	
	
<script src="../js/bootstrap-paginator.js"></script>
<script src="../js/qunit-1.11.0.js"></script>
<script type="text/javascript">

    $(function(){
        test("Test bootstrap v3 rendering", function(){

            var element = $('#page');

            var options = {
                bootstrapMajorVersion:3,
                currentPage: 1,
                numberOfPages: 10,
                totalPages:10
            }

            element.bootstrapPaginator(options);

            var element = $('#page');

            ok(!element.hasClass('pagination-lg'),"Root element shouldn't have pagination-lg class");

            ok(!element.hasClass('pagination-sm'),"Root element shouldn't have pagination-sm class");

            var list = element.children();

            for(var i=0;i < list.length;i++)
            {
                var item = $(list[i]);

                ok(item.is("li"),"Element "+i+" should be li");
            }

           
        })
    });
	
</script>
</body>
</html>