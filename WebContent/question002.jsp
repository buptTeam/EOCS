<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title> questionnaire  generating</title>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link rel="stylesheet" href="dist/css/bootstrap-select.css">
	<!-- <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> -->
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
   		<li class="active"><a href="question002.jsp" >第二轮调查说明</a></li>
   		<li ><a href="javascript:;" id="question0">填写规则</a></li>
   		<li ><a href="javascript:;" id="question1_a">重大疾病选择</a></li>
   		<li id="litesrt"><a href="javascript:;" id="question2_a">重大疾病评价</a></li>
 
	</ul>
<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<dl>
				<dd>
					<br>
					<br>
					<p class="MsoNormal">
						&nbsp;&nbsp;&nbsp;&nbsp;<span>随着我国社会经济的快速发展，</span><span>工业化</span><span>、城镇化、老龄化、信息化、</span><span>全球化不断</span><span>加速</span><span>。这些变化在给</span><span>居民生活水平</span><span>带来</span><span>实质性</span><span>改善的同时</span><span>，也带来了环境恶化、生活方式西化</span><span>、</span><span>人口老化和疾病谱变化。</span><span>与</span><span>改革开放初期相比，</span><span>我国</span><span>居民所面临的重大健康问题</span><span>已发生</span><span>了</span><span>根</span><span>本性的转变</span><span>。面对</span><span>这一局面，如何</span><span>科学筛选</span><span>可</span><span>预防</span><span>的</span><span>重大疾病</span><span>和健康</span><span>问题</span><span>，对于我国</span><span>重新规划</span><span>公共卫生体系</span><span>，</span><span>确定</span><span>投入</span><span>方向和重点，高效发挥</span><span>其</span><span>预防疾病和维护健康</span><span>的</span><span>功能具有重大的指导意义。</span><span>为此</span><span>，中国工程院决定</span><span>开展</span><span>“</span><span>我国未来可预防重大疾病问卷调查</span><span>”</span><span>，</span><span>采用德尔菲专家调查法向</span><span>中国</span><span>工程院（医学学部）</span><span>全体</span><span>院士</span><span>、</span><span>院士</span><span>候选人</span><span>及特邀专家</span><span>提出咨询，</span><span>在</span><span>专家意见的基础上科学凝练出当前的重大健康问题</span><span>及其</span><span>可</span><span>预防</span><span>性</span><span>，向</span><span>国家提出相应政策建议</span><span>。</span>
						
					</p>
					<p class="MsoNormal">
						&nbsp;&nbsp;&nbsp;&nbsp;<span>本研究</span><span>计划进行2轮</span><span>调查</span><span>，每轮大约</span><span>需要</span><span>20</span><span>-30</span><span>分钟</span><span>，</span><span>采用网络调查的形式</span><span>。</span><span>为此所设计的系统</span><span>将确保您</span><span>提供的信息</span><span>在</span><span>导出给</span><span>分析人员时已经过匿名化处理，</span><span>而</span><span>负责</span><span>发放</span><span>咨询费的</span><span>财务人员</span><span>不能得到你提供的</span><span>专业</span><span>咨询</span><span>信息</span><span>。</span><span>咨询费</span><span>将在收到第</span><span>2轮</span><span>调查回复后一次性发放</span><span>。</span><span>除了</span><span>财务人员</span><span>，其他人都不会接触到您的私人信息包括姓名、电话和身份证号码等。</span>
						
					</p>
					<p class="MsoNormal">
						&nbsp;&nbsp;&nbsp;&nbsp;<span>第一轮</span><span>调查内容包括</span><span>专家咨询问卷</span><span>和</span><span>专家</span><span>信息收集表</span><span>。</span><span>请您在</span><span>2015</span><span>年</span><span>X</span><span>月</span><span>X</span><span>日</span><span>之前，</span><span>登陆中国</span><span>工程院如下网址进行网上调查</span><span>回复</span><span>。</span><span>我们将在</span><span>总结了所有专家第一轮调查结果后，</span><span>发放第二轮调查</span><span>咨询问卷。届时，</span><span>我们也</span><span>将同时</span><span>发放第一轮专家意见的</span><span>分析结果</span><span>供大家参考。</span>
						
					</p>
					<p class="MsoNormal">
						&nbsp;&nbsp;&nbsp;&nbsp;<span>请</span><span>登陆网址：</span><a href="http://www.cae.cn/cae/html/main/index.html"><span class="15">http://www.cae.cn/cae/html/main/index.html</span></a><span>，请点击“</span><span>我国未来可预防重大疾病问卷调查</span><span>”</span><span>，进行问卷调查。</span>
						
					</p>
					<p class="MsoNormal">
						&nbsp;&nbsp;&nbsp;&nbsp;<span>万分感谢</span><span>您</span><span>的参与和配合</span><span>！</span>
					</p>
				</dd>
				
			</dl>
		</div>
	</div>
</div>
<hr>
<div class="checkbox col-md-offset-4" id="readrules">
  					<label>
    					<input type="checkbox" id="readrulesCheck">
    						&nbsp;
    						<strong><font size="3" >我已经了解填写规则</font></strong>
    						
  					</label>
  					<a id="toConfirm" href="javascript:;" data-toggle="modal"  role="button" class="btn btn-success btn-sm col-sm-offset-5">前往填写规则</a>
</div>
<hr>
  <script type="text/javascript">

  $("#toConfirm").click(function(){
  	if($("#readrulesCheck").attr("checked")){
  		var backURL="question0.jsp";
  		var url = 'window.location.href="' + backURL+'"';
			setTimeout(url, 100);
  	}else{
  		$.messager.show({
		        title:'warning',
		        msg:'<font size="3">请确认您已阅读了调查说明</font>',
		        timeout:1500,
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
  		var backURL="question002.jsp";
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
  		var backURL="question002.jsp";
  		var url = 'window.location.href="' + backURL+'"';
			setTimeout(url, 100);
  	}else{
  		$.messager.show({
		        title:'warning',
		        msg:'请勾选"我已经了解调查说明",并点击按钮"前往填写规则"',
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
  		var backURL="question002.jsp";
  		var url = 'window.location.href="' + backURL+'"';
			setTimeout(url, 100);
  	}else{
  		$.messager.show({
		        title:'warning',
		        msg:'请勾选"我已经了解调查说明",并点击按钮"前往填写规则"',
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
    
  </script>
</body>
</html>
