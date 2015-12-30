<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title> set person</title>
	<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link rel="stylesheet" href="../dist/css/bootstrap-select.css">
	<!-- <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> -->
	<script src="../js/jquery-2.0.3.js"></script>
	
	<!-- <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script> -->
    <script src="../bootstrap/js/bootstrap.min.js"></script>
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
    <script src="../dist/js/bootstrap-select.js"></script>
    <script src="../dist/js/bootstrap-select-backup.js"></script>
  	<script src="../js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../easyui/themes/gray/easyui.css">
    <link rel="stylesheet" type="text/css" href="../easyui/themes/icon.css">
  
 	<script type="text/javascript" src="../easyui/jquery.min.js"></script>
   	<script type="text/javascript" src="../js/jquery.js"></script>
	<script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../myjs/research_info.js"></script>
</head>
<body>
	<font size="2" color="red">疾病信息：请点击“生成数据”，在点击“下载数据”</font>
	<a id="toConfirm_ill" href="javascript:;" role="button" class="btn btn-success btn-sm col-sm-offset-1">生成数据</a> 
	<a id="todownload" href="../download/ill_data.xls" role="button" class="btn btn-success btn-sm col-sm-offset-2">下载数据</a>
			
	<hr>
	
	<div class="container">
		<font class="col-sm-3 " size="2" color="red" >请选择您要上传的疾病信息</font>
	</div>
	<form id="form1" name="form1" method="post" action="../hello/uploadFile.php?type=2"  enctype="multipart/form-data">
	
	<div class="container">
      <label for="name" class="col-sm-2 control-label"><font size="2" color="red">上传文件：</font></label>
      <div class="col-sm-2 ">
      	<input name="file" type="file" size="10" accept=".xls" >
       </div> 

    </div>
    <div class="container">
    &nbsp;&nbsp;&nbsp;
	<input class="btn btn-success btn-sm col-sm-offset-2" type="submit" name="submit" value="提交" >
    <input class="btn btn-success btn-sm col-sm-offset-1" type="reset" name="reset" value="重置" >
	</div>
	<%if(request.getSession().getAttribute("msgsick")!=null){ %>
	<strong><strong><%=request.getSession().getAttribute("msgsick") %></strong></strong>

<%} %>
	</form>
	
	
	<hr>
	
	
	
	<div class="container">
		<font class="col-sm-3 " size="2" color="red" >请选择您要上传的top20疾病信息</font>
	</div>
	<form id="form1" name="form1" method="post" action="../hello/uploadFile.php?type=3"  enctype="multipart/form-data">
	
	<div class="container">
      <label for="name" class="col-sm-2 control-label"><font size="2" color="red">上传文件：</font></label>
      <div class="col-sm-2 ">
      	<input name="file" type="file" size="10" accept=".xls" >
       </div> 

    </div>
    <div class="container">
    &nbsp;&nbsp;&nbsp;
	<input class="btn btn-success btn-sm col-sm-offset-2" type="submit" name="submit" value="提交" >
    <input class="btn btn-success btn-sm col-sm-offset-1" type="reset" name="reset" value="重置" >
	</div>
	<%if(request.getSession().getAttribute("msgtop")!=null){ %>
	<strong><strong><%=request.getSession().getAttribute("msgtop") %></strong></strong>

<%} %>
	</form>
	
	
	<hr>
	
	<font size="2" color="red">查看TOP20疾病：请点击“生成数据”，在点击“下载数据”</font>
	<a id="toConfirm_top20" href="javascript:;" role="button" class="btn btn-success btn-sm col-sm-offset-1">生成数据</a> 
	<a id="todownload" href="../download/top_20.xls" role="button" class="btn btn-success btn-sm col-sm-offset-2">下载数据</a>
	<hr>
	
	<font size="2" color="red">版本一数据：请点击“生成数据”，在点击“下载数据”</font>
	<a id="toConfirm" href="javascript:;" role="button" class="btn btn-success btn-sm col-sm-offset-1">生成数据</a> 
	<a id="todownload" href="../download/expert_research_data_1.xls" role="button" class="btn btn-success btn-sm col-sm-offset-2">下载数据</a>
	<hr>
	
	
	<font size="2" color="red">版本二数据：请点击“生成数据”，在点击“下载数据”</font>
	<a id="toConfirm2" href="javascript:;" role="button" class="btn btn-success btn-sm col-sm-offset-1">生成数据</a> 
	<a id="todownload2" href="../download/expert_research_data_2.xls" role="button" class="btn btn-success btn-sm col-sm-offset-2">下载数据</a>
			<hr>
			
			<div class="accordion" id="accordion2" >
                <div class="accordion-group" id="itemTest" style="display:none">
                  <div class="accordion-heading">
                    <a class="accordion-toggle collapsed btn btn-default btn-block" id="info0" data-toggle="collapse" data-parent="#accordion2" href="#collapse" style="text-align:left;">
                      		<font id="id"> 1</font>    
                      		<font id="name">翁建平</font>，
                      		<font id="mail">123456@mail.com</font>  
                      		                		
                    </a>
                  </div>
                  <div id="collapse" class="accordion-body collapse" style="height: 0px;">
                    <div class="accordion-inner">
                    	<table class="table table-striped table-hover table-bordered">
                  		<thead>
                    		<tr>
                      		<th>#</th>
                      		<th>二级指标</th>
                      		<th>熟悉程度</th>
                      		<th>重大程度</th>
                      		<th>可防控性</th>
                      
                    		</tr>
                  		</thead>
                  		<tbody id="tbodytest">
                  			<tr id="tbodytrtest" style="display:none">
                      		<th id="no">1</th>
                      		<th id="illname">肺癌</th>
                      		<th id="familiar">9</th>
                      		<th id="importance">1</th>
                      		<th id="control">3</th>
                      
                    		</tr>
                    		
                  		</tbody>
                	</table>
                   </div>
                  </div>
                </div>
               

              </div>


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

</body>
</html>