<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title> set person</title>
	<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link rel="stylesheet" href="../dist/css/bootstrap-select.css">
	
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
	<script type="text/javascript" charset="utf-8" src="../myjs/createPerson.js"></script>
    <script type="text/javascript"></script>
</head>
<body>
<form  id="ceatePersonForm" class="form-horizontal" >			
        <div  id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">请输入人员信息</h4>
                
              </div>
              <div class="modal-body" >
              
 
   <div class="form-group">
      <label for="name" class="col-sm-4 control-label">用&nbsp&nbsp户&nbsp名</label>
      <div class="col-sm-4 ">
      <input type="text" class="form-control" id="LoginName" name="LoginName" placeholder="请输入用户名" >
       </div> 
      
   </div>
   
   <div class="form-group">
    	<label for="age" class="col-sm-4 control-label "  >密&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp码</label>
      	<div class="col-sm-4 ">
      		<input type="password" class="form-control easyui-validatebox"  id="password" name="password"  placeholder="请输入密码" >
      	</div>
      	
       	
   </div>
   
   <div class="form-group">
      <label for="name" class="col-sm-4 control-label">权限设置</label>
      <div class="col-sm-4 ">
      		<select id="selectType" class="selectpicker" name="userType" >
   			   		<option value="0" placeholder="请输入密码">请设置用户权限</option>
    				<option value="2">财务人员</option>
    				<option value="3">研究人员</option>    				
  			  </select>
       </div>  
   </div>
   
   
              
  
              <div class="modal-footer">
               
                <button type="button" id="ceatePersonBtn" class="btn btn-success" >提交</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
              </div>
            </div>
          </div>
        </div>
</form>
</body>
</html>