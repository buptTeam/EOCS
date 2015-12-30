<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title> questionnaire  generating</title>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link rel="stylesheet" href="dist/css/bootstrap-select.css">
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<script src="js/jquery-2.0.3.js"></script>
	
	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
  
    <script src="dist/js/bootstrap-select.js"></script>
    <script src="dist/js/bootstrap-select-backup.js"></script>
  
    <link rel="stylesheet" type="text/css" href="easyui/themes/gray/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
  
 	<script type="text/javascript" src="easyui/jquery.min.js"></script>
   	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>


    <script type="text/javascript" src="myjs/personal.js"></script>
    <script type="text/javascript"></script>
     <script type="text/javascript" src="myjs/global.js"></script>
    <script type="text/javascript">
    $(function(){
    	//console.info("woshi version"+currentVersion);
    	if(currentVersion==2){
    	var ele=	$("#litesrt").clone(true);
    	ele.find('a').attr("href","question3.jsp");
    	ele.find('a').html("查看已填问卷");
    	$('#questionTab').append(ele);
    	}
    });
    </script>
</head>
<body>
   <ul id="questionTab" class="nav nav-tabs">
   		<li ><a href="javascript:;" ><font id="shuoming">第一轮调查说明</font></a></li>
   		<li class="active"><a href="question0.jsp" >填写规则</a></li>
   		<li ><a href="javascript:;" id="question1_a">重大疾病选择</a></li>
   		<li id="litesrt"><a href="javascript:;" id="question2_a">重大疾病评价</a></li>
 
	</ul>
<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<br>
			<br>
			<p>
			<font size="3">
				&nbsp;&nbsp;&nbsp;&nbsp;为了方便您的选择，我们预先将106种重大疾病和健康问题按照9个领域分别列出，供您选择。您也可以在各领域内添加新的重大疾病和健康问题。需要注意的是，为了保证资料分析的客观、公正，避免调查偏倚，本次调查限定您可选择的重大疾病和健康问题数目总计为20项，不能多也不能少。
			</font>
			</p>
			<p>
			<font size="3">
				&nbsp;&nbsp;&nbsp;&nbsp;当您确定并提交了20项重大疾病和健康问题后，仍需进入到重大疾病或健康问题评价页面，对该疾病（或健康问题）的熟悉程度、重大程度、可预防程度进行量化评价。
			</font>
			</p>
			<p>
			<font size="3">
				&nbsp;&nbsp;&nbsp;&nbsp;具体填表方法如下：
			</font>
			</p>
			<p>
			<font size="3">
				&nbsp;&nbsp;&nbsp;&nbsp;1）<strong>熟悉程度：</strong>采用尺度调查法。0表示“最不熟悉”，9表示“最熟悉”，请根据自己对该疾病（或问题）的熟悉程度填写0-9之间的任意数字。
			</font>
			</p>
			<p>
			<font size="3">
				&nbsp;&nbsp;&nbsp;&nbsp;2）<strong>重大程度：</strong>0表示“最不重大”，9表示“最重大”。
			</font>
			</p>
			<p>
			<font size="3">
				&nbsp;&nbsp;&nbsp;&nbsp;3）<strong>可预防程度：</strong>0表示“完全不可预防”，9表示“完全可以预防”。
			</font>
			</p>
			
		</div>
	</div>
</div>
<hr>
<div class="checkbox col-md-offset-4" id="readrules">
  					<label>
    					<input type="checkbox" id="readrulesCheck">
    						&nbsp;
    						<strong><font size="3" >我已经了解规则</font></strong>
    						
  					</label>
  					<a id="toConfirm" href="javascript:;" data-toggle="modal"  role="button" class="btn btn-success btn-sm col-sm-offset-5">前往重大疾病选择</a>
</div>
<hr>
  <script type="text/javascript">
	$(function(){
		var currentver = getSysCurrentVersion();
		if(currentver == 2){
			$("#shuoming").text("第二轮调查说明");
		}
	});
	getSysCurrentVersion = function(){
		$.ajax({
			url : "hello/getsysVersion.php",
			async:false,
			dataType : "json",
			success : function(data) {
				//console.info("hellofanhui");
				var entity=data.entity;
				var version = entity[0].version;
				//console.info("currentVersion  : "+currentVersion);
				currentVersion = version;		
			}
		});
		return currentVersion;
	}; 
    $("#toConfirm").click(function(){
    	if($("#readrulesCheck").attr("checked")){
    		var backURL="question1.jsp";
    		var url = 'window.location.href="' + backURL+'"';
			setTimeout(url, 100);
    	}else{
    		$.messager.show({
		        title:'warning',
		        msg:'<font size="3">请确认您已阅读了填写问卷的规则</font>',
		        timeout:1500,
		        showType:'slide',
		        style:{
		            right:'',
		           
		            bottom:''
		        }
		    });
    	}
    });	
    
    $("#question1_a").click(function(){
    	if($("#readrulesCheck").attr("checked")){
    		var backURL="question1.jsp"
    		var url = 'window.location.href="' + backURL+'"';
			setTimeout(url, 100);
    	}else{
    		$.messager.show({
		        title:'warning',
		        msg:'<font size="3">请勾选"我已经了解规则",并点击按钮"前往重大疾病选择"</font>',
		        timeout:2000,
		        showType:'slide',
		        style:{
		            right:'',
		           
		            bottom:''
		        }
		    });
    	}
    });
    $("#question2_a").click(function(){
    	if($("#readrulesCheck").attr("checked")){
    		var backURL="question1.jsp"
    		var url = 'window.location.href="' + backURL+'"';
			setTimeout(url, 100);
    	}else{
    		$.messager.show({
		        title:'warning',
		        msg:'<font size="3">请勾选"我已经了解规则",并点击按钮"前往重大疾病选择"</font>',
		        timeout:2000,
		        showType:'slide',
		        style:{
		            right:'',
		            
		            bottom:''
		        }
		    });
    	}
    });	
    
  </script>
</body>
</html>
