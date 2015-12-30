<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title> set version</title>
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
    <script type="text/javascript"></script>
</head>
<body>
	
	<font size="2" color="red" class="col-sm-offset-4">请确认已完成版本1的信息采集，再进行版本切换。</font>
     	
     	<hr>
	<div class="form-group">
		<label for="name" class="col-sm-2 control-label col-sm-offset-1" >当前版本号为：</label>
      	<div class="col-sm-2 ">
      		<input type="text" class="form-control" id="currentVersion" name="currentVersion" readonly="readonly">
       
       
       </div>
     
     </div>
   	 	
     <div class="form-group">
     	
     	<form>
       <label for="age" class="col-sm-2 control-label col-sm-offset-1">设置版本号为：</label>
       <div class="col-sm-2 ">
      		<select class="selectpicker"  id="versionSelect">
   			   		<option value="0">请设置版本号</option>
    				<option value="1">1</option>
    				<option value="2">2</option>    				
  			  </select>
		</div>
		<!-- <input type="text" class="form-control" id="newVersion" name="newVersion" style="display:none"> -->
  	 </div>
  	<br>
  	<br>
  	<br>
  	<br>
  	 <button type="button" id="sysVersionBtn" class="btn btn-success btn-sm col-sm-offset-5" style="text-align:center">提交</button>

    <script type="text/javascript">
	
	$(function(){
		$.ajax({
			url : "../hello/getsysVersion.php",

			dataType : "json",
			success : function(data) {
				var entity=data.entity;
				var currentVersion = entity[0].version;
				$("#currentVersion").val(currentVersion);			
			}
		});
		$("#sysVersionBtn").click(function(){
			//console.info($("#versionSelect").val());
			$.ajax({
				url : "../hello/setsysVersion.php",
				data:{"isVersion": $("#versionSelect").val()},
				dataType : "json",
				success : function(data) {
					var status=data.status;
					if(status == 1){
						$.messager.show({
							title : 'warning',
							msg : '版本号设置成功',
							timeout : 1500,
							showType : 'slide',
							style : {
								right : '',
								
								bottom : ''
							}
						});
						
						$.ajax({
							url : "../hello/getsysVersion.php",

							dataType : "json",
							success : function(data) {
								var entity=data.entity;
								var currentVersion = entity[0].version;
								$("#currentVersion").val(currentVersion);			
							}
						});
						
					}else{
						$.messager.show({
							title : 'warning',
							msg : '版本号设置失败！',
							timeout : 1500,
							showType : 'slide',
							style : {
								right : '',
								
								bottom : ''
							}
						});
					}
					//$("#currentVersion").val(currentVersion);			
				}
			});
		});

	});
    </script>
</body>
</html>