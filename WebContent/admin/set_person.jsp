<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title> set person</title>
	<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link rel="stylesheet" href="../dist/css/bootstrap-select.css">
	<!-- <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> -->
	<script src="../js/jquery-2.0.3.js"></script>
	
	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>
   
    <script src="../dist/js/bootstrap-select.js"></script>
    <script src="../dist/js/bootstrap-select-backup.js"></script>
  
    <link rel="stylesheet" type="text/css" href="../easyui/themes/gray/easyui.css">
    <link rel="stylesheet" type="text/css" href="../easyui/themes/icon.css">
  
 	<script type="text/javascript" src="../easyui/jquery.min.js"></script>
   	<script type="text/javascript" src="../js/jquery.js"></script>
	<script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../myjs/setPerson.js"></script>
    <script type="text/javascript">
    
    </script>
</head>
<body>
	
	
	
	<div class="container">
		<font class="col-sm-3 " size="2" color="red" >请选择您要上传的人员名单</font>
	</div>
	<form id="form1" name="form1" method="post" action="../hello/uploadFile.php?type=1"  enctype="multipart/form-data">
	
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
	<%if(request.getSession().getAttribute("msg")!=null){ %>
	<strong><strong><%=request.getSession().getAttribute("msg") %></strong></strong>

<%} %>
	</form>
	
	
	<hr>

	<font size="2" color="red">请点击“生成数据”，在点击“下载数据”(专家基本信息数据)</font>
	<a id="toConfirm" href="javascript:;" role="button" class="btn btn-success btn-sm col-sm-offset-1">生成数据</a> 
	<a id="todownload" href="../download/expert_info_data.xls" download="expert_info_data.xls" role="button" class="btn btn-success btn-sm col-sm-offset-2">下载数据</a>
	<hr>
	<input class="span2" id="admininputUsername" type="text" placeholder="请输入要查询专家用户名">
    
	<button type="button" id="adminchangePasswordBtn"  class="btn btn-success btn-sm" align="center">查询专家密码</button>
	&nbsp;&nbsp;&nbsp;&nbsp;
	
	<font id="adminUserPassword"></font>
	<hr>
	
	<input class="span2" id="adminResetUsersPassword" type="text" placeholder="请输入要重置成的专家密码">
    
	<button type="button" id="adminResetUsersPasswordBtn"  class="btn btn-success btn-sm" align="center">重置专家密码</button>
	&nbsp;&nbsp;&nbsp;&nbsp;
	
	<font id="resetinfo"></font>
	<hr>
	
	
	<button type="button" id="createBtn"  class="btn btn-success btn-sm" align="center">创建新的人员</button>
	<hr>
	<table class="table table-striped table-hover table-bordered" >
    	<thead>
        	<tr>
            	<td>用户名</td>
                <td>密码</td>
               	<td>权限类别</td>
                
            </tr>
         </thead>
         <tbody id="itemtbody">
         <tr id="itemTest" >
         		<td id="name">小平</td>
         		<td id="password">wjp123456</td>
         		<td id="type">财务人员</td>
         		
         </tr>
         </tbody>
     </table>
     
</body>
</html>
