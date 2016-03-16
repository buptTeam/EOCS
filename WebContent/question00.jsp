<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title> questionnaire  generating</title>

    <script type="text/javascript">

    </script>
</head>
<body>
   <ul id="questionTab" class="nav nav-tabs">
   		<li class="active"><a href="question00.jsp" >第一轮调查说明</a></li>
   		<li ><a href="javascript:;" id="question0">填写规则</a></li>
   		<li ><a href="javascript:;" id="question1_a">重大疾病选择</a></li>
   		<li id="litesrt"><a href="javascript:;" id="question2_a">重大疾病评价</a></li>
 
	</ul>
<div class="container-fluid">
	<div class="row-fluid">
		<br>
		<br>
		<div class="span12">
			<p>
			<font size="3">
				&nbsp;&nbsp;&nbsp;&nbsp;与改革开放初期相比，我国居民所面临的重大疾病和健康问题已发生了根本性的转变，包括健康状况、疾病谱、疾病负担和变化趋势等。 这种变化还在继续。 为了准确预测未来20年我国可预防的重大疾病或重大健康问题，以问题为导向， 提出我国新型预防医学体系建设的框架和建议，“<strong>全民健康与医药卫生事业国家发展战略研究</strong>”重大课题“<strong>新型国家预防医学体系建立的研究</strong>”课题组， 决定采用德尔菲专家调查法，开展“<strong>未来20年我国可预防的重大疾病或健康问题问卷调查</strong>”。 为此，我们特向中国工程院医药学部全体院士、2015年度医药学部院士候选人及特邀专家提出咨询，在专家意见的基础上，科学凝练出20项未来20年我国可预防的重大疾病和健康问题。
			</font>
			</p>
			<p>
			<font size="3">
				&nbsp;&nbsp;&nbsp;&nbsp;这是第一次以中国工程院医药学部院士和院士候选人为咨询主体，开展的对未来20年我国居民将要面临的可预防的重大疾病和健康问题的预测性咨询研究，咨询结果将会对我们新型预防医学体系建设发挥重要作用，产生社会影响。鉴于您对我国医学事业的重要贡献和学术影响，我们特邀请您参与咨询。您的建议将会对我国未来预防医学体系建设发挥重要作用。
			</font>
			</p>
			<p>
			<font size="3">
				&nbsp;&nbsp;&nbsp;&nbsp;本研究计划进行2轮调查，每轮大约需要20-30分钟，采用网络调查的形式。系统从设计上确保他人无法得知您的咨询意见，包括管理和财务人员。
			</font>
			</p>
			<p>
			<font size="3">
				&nbsp;&nbsp;&nbsp;&nbsp;第一轮调查内容包括专家咨询问卷和专家信息收集表。请您在<strong>2015年9月30日</strong>之前，完成本次调查。我们将在总结了所有专家第一轮调查结果后，发放第二轮调查咨询问卷，包括第一轮专家意见的分析结果。
			</font>
			</p>
			<p>
			<font size="3">
				&nbsp;&nbsp;&nbsp;&nbsp;您的参与攸关我国未来预防医学体系建设。
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
    						<strong><font size="3" >我已经了解调查说明</font></strong>
    						
  					</label>
  					<button id="toConfirm"  data-toggle="modal"   class="btn btn-success btn-sm col-sm-offset-5">下一步</button>
</div>
<hr>
 
</body>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link rel="stylesheet" href="dist/css/bootstrap-select.css">
	<!--  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>-->
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
 <script type="text/javascript">
$(function(){
	$("#toConfirm").click(function(){
    	
    	if($("#readrulesCheck").attr("checked")){
    		var backURL="question0.jsp";
    		var url = 'window.location.href="' + backURL+'"';
			setTimeout(url, 100);
    	}else{
    		
    		
    		
    		$.messager.show({
		        title:'warning',
		        msg:'<font size="3">请确认您已阅读了调查说明</font>',
		        timeout:2000,
		        showType:'slide',
		        style:{
		            right:'',
		           top:"0",
		            bottom:''
		        }
		    });
    	}
    });	
    $("#question0").click(function(){
    	if($("#readrulesCheck").attr("checked")){
    		var backURL="question00.jsp";
    		var url = 'window.location.href="' + backURL+'"';
			setTimeout(url, 100);
    	}else{
    		$.messager.show({
		        title:'warning',
		        msg:'<font size="3">请勾选"我已经了解调查说明",并点击按钮"前往填写规则"</font>',
		        timeout:2000,
		        showType:'slide',
		        style:{
		            right:'',
		            top:"0",
		            bottom:''
		        }
		    });
    	}
    });
    $("#question1_a").click(function(){
    	if($("#readrulesCheck").attr("checked")){
    		var backURL="question00.jsp";
    		var url = 'window.location.href="' + backURL+'"';
			setTimeout(url, 100);
    	}else{
    		$.messager.show({
		        title:'warning',
		        msg:'<font size="3">请勾选"我已经了解调查说明",并点击按钮"前往填写规则"</font>',
		        timeout:2000,
		        showType:'slide',
		        style:{
		            right:'',
		            top:"0",
		            bottom:''
		        }
		    });
    	}
    });
    $("#question2_a").click(function(){
    	if($("#readrulesCheck").attr("checked")){
    		var backURL="question00.jsp";
    		var url = 'window.location.href="' + backURL+'"';
			setTimeout(url, 100);
    	}else{
    		$.messager.show({
		        title:'warning',
		        msg:'<font size="3">请勾选"我已经了解调查说明",并点击按钮"前往填写规则"</font>',
		        timeout:2000,
		        showType:'slide',
		        style:{
		            right:'',
		            top:"0",
		            bottom:''
		        }
		    });
    	}
    });	
    
});
    
  </script>


</html>
