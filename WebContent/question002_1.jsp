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
   		<li class="active"><a href="question002_1.jsp" >第一轮调查结果</a></li>
   		<li ><a href="javascript:;" id="question002">第二轮调查说明</a></li>
   		<li ><a href="javascript:;" id="question0">第二轮填写规则</a></li>
   		<li ><a href="javascript:;" id="question1_a">重大疾病选择</a></li>
   		<li id="litesrt"><a href="javascript:;" id="question2_a">重大疾病评价</a></li>
 		<a id="view_sick1" href="javascript:;" data-toggle="modal"  data-target="#modal_viewsick" role="button" style="display:none" class="btn btn-success btn-sm"  algin="right">查看第一轮所选择重大疾病和健康问题</a>
	</ul>
<div class="container-fluid">
	<div class="row-fluid">
	
	<br>
		<div class="span12">
			<p>
				&nbsp;&nbsp;&nbsp;&nbsp;<strong><span style="font-size:17px;line-height:180%">中国工程院 “我国未来可预防重大疾病问卷调查”第一轮调查工作已于2015年11月30日结束。共有95位专家做出了有效回复，提出可预防重大疾病和健康问题共计125个。现将其中按照综合指数排名最靠前的30个列于下表，供您在第二轮调查选择时参考。各项指标的意义和计算方法见表下的注释。</span></strong>
			</p>
			
		</div>
	</div>
</div>

<div class="table-responsive">
               
               
                <table class="table table-striped table-hover table-bordered  table-condensed">
                  <thead>
                    <tr>
                      <th>序号</th>
                      <th>重大疾病和健康问题</th>
                      <th>选择<br>(%)</th>
                      <th>重大程度<br>均值</th>
                      <th>重大程度<br>加权均值</th>
                      <th>可预防程度<br>均值</th>
                      <th>可预防程度<br>加权均值</th>
                      <th>综合指数</th>
                    </tr>
                  </thead>
                 	<tbody id="tbodytest">
                  		<tr  >
                      		<th id="no">1</th>
                      		<th id="illName">糖尿病</th>
                      		<th id="choose">73</th>
                      		<th id="imE">5.8</th>
                      		<th id="imJE">5.0</th>
                      		<th id="proE">4.9</th>
                      		<th id="proJE">4.3</th>
                      		<th id="all">1.32</th>
                      	                     		
                    	</tr>
                    	<tr>
                      		<th id="no">2</th>
                      		<th id="illName">肺癌</th>
                      		<th id="choose">73</th>
                      		<th id="imE">6.0</th>
                      		<th id="imJE">5.0</th>
                      		<th id="proE">4.0</th>
                      		<th id="proJE">3.4</th>
                      		<th id="all">1.28</th>                      	                     		
                    	</tr>
                    	<tr>
                      		<th id="no">3</th>
                      		<th id="illName">病毒性肝炎</th>
                      		<th id="choose">67</th>
                      		<th id="imE">5.4</th>
                      		<th id="imJE">4.3</th>
                      		<th id="proE">5.0</th>
                      		<th id="proJE">4.0</th>
                      		<th id="all">1.25</th>                      	                     		
                    	</tr>
                    	<tr>
                      		<th id="no">4</th>
                      		<th id="illName">新发突发传染病</th>
                      		<th id="choose">65</th>
                      		<th id="imE">5.5</th>
                      		<th id="imJE">3.9</th>
                      		<th id="proE">3.4</th>
                      		<th id="proJE">2.5</th>
                      		<th id="all">1.15</th>                      	                     		
                    	</tr>
                   		<tr>
                      		<th id="no">5</th>
                      		<th id="illName">艾滋病</th>
                      		<th id="choose">62</th>
                      		<th id="imE">5.0</th>
                      		<th id="imJE">3.8</th>
                      		<th id="proE">4.4</th>
                      		<th id="proJE">3.3</th>
                      		<th id="all">1.15</th>                      	                     		
                    	</tr>
                    	<tr>
                      		<th id="no">6</th>
                      		<th id="illName">高血压</th>
                      		<th id="choose">60</th>
                      		<th id="imE">5.0</th>
                      		<th id="imJE">4.4</th>
                      		<th id="proE">4.1</th>
                      		<th id="proJE">3.7</th>
                      		<th id="all">1.10</th>                      	                     		
                    	</tr>
                    	<tr>
                      		<th id="no">7</th>
                      		<th id="illName">冠心病/心肌梗死</th>
                      		<th id="choose">58</th>
                      		<th id="imE">4.7</th>
                      		<th id="imJE">4.1</th>
                      		<th id="proE">4.0</th>
                      		<th id="proJE">3.5</th>
                      		<th id="all">1.06</th>                      	                     		
                    	</tr>
                    	<tr>
                      		<th id="no">8</th>
                      		<th id="illName">吸烟</th>
                      		<th id="choose">54</th>
                      		<th id="imE">4.5</th>
                      		<th id="imJE">4.1</th>
                      		<th id="proE">4.3</th>
                      		<th id="proJE">3.9</th>
                      		<th id="all">1.03</th>                      	                     		
                    	</tr>
                    	<tr>
                      		<th id="no">9</th>
                      		<th id="illName">脑卒中</th>
                      		<th id="choose">56</th>
                      		<th id="imE">4.6</th>
                      		<th id="imJE">3.9</th>
                      		<th id="proE">3.8</th>
                      		<th id="proJE">3.2</th>
                      		<th id="all">1.02</th>                      	                     		
                    	</tr>
                    	<tr>
                      		<th id="no">10</th>
                      		<th id="illName">肝癌</th>
                      		<th id="choose">56</th>
                      		<th id="imE">4.4</th>
                      		<th id="imJE">3.7</th>
                      		<th id="proE">3.3</th>
                      		<th id="proJE">2.8</th>
                      		<th id="all">0.98</th>                      	                     		
                    	</tr>
                    	<tr>
                      		<th id="no">11</th>
                      		<th id="illName">抑郁症</th>
                      		<th id="choose">53</th>
                      		<th id="imE">3.9</th>
                      		<th id="imJE">2.9</th>
                      		<th id="proE">3.0</th>
                      		<th id="proJE">2.3</th>
                      		<th id="all">0.91</th>                      	                     		
                    	</tr>
                    	<tr>
                      		<th id="no">12</th>
                      		<th id="illName">空气污染</th>
                      		<th id="choose">47</th>
                      		<th id="imE">4.1</th>
                      		<th id="imJE">3.1</th>
                      		<th id="proE">3.6</th>
                      		<th id="proJE">2.8</th>
                      		<th id="all">0.90</th>                      	                     		
                    	</tr>
                    	<tr>
                      		<th id="no">13</th>
                      		<th id="illName">肺结核</th>
                      		<th id="choose">45</th>
                      		<th id="imE">3.5</th>
                      		<th id="imJE">2.8</th>
                      		<th id="proE">3.1</th>
                      		<th id="proJE">2.5</th>
                      		<th id="all">0.82</th>                      	                     		
                    	</tr>
                    	<tr>
                      		<th id="no">14</th>
                      		<th id="illName">农药、激素及抗生素等残留</th>
                      		<th id="choose">43</th>
                      		<th id="imE">3.5</th>
                      		<th id="imJE">2.6</th>
                      		<th id="proE">3.2</th>
                      		<th id="proJE">2.4</th>
                      		<th id="all">0.80</th>                      	                     		
                    	</tr>
                    	<tr>
                      		<th id="no">15</th>
                      		<th id="illName">老年痴呆</th>
                      		<th id="choose">46</th>
                      		<th id="imE">3.7</th>
                      		<th id="imJE">2.8</th>
                      		<th id="proE">2.1</th>
                      		<th id="proJE">1.6</th>
                      		<th id="all">0.79</th>                      	                     		
                    	</tr>
                    	<tr>
                      		<th id="no">16</th>
                      		<th id="illName">道路交通伤害</th>
                      		<th id="choose">41</th>
                      		<th id="imE">3.2</th>
                      		<th id="imJE">2.6</th>
                      		<th id="proE">3.1</th>
                      		<th id="proJE">2.5</th>
                      		<th id="all">0.76</th>                      	                     		
                    	</tr>
                    	<tr>
                      		<th id="no">17</th>
                      		<th id="illName">乳腺癌</th>
                      		<th id="choose">42</th>
                      		<th id="imE">3.3</th>
                      		<th id="imJE">2.7</th>
                      		<th id="proE">2.5</th>
                      		<th id="proJE">2.0</th>
                      		<th id="all">0.74</th>                      	                     		
                    	</tr>
                    	<tr>
                      		<th id="no">18</th>
                      		<th id="illName">水污染</th>
                      		<th id="choose">37</th>
                      		<th id="imE">3.1</th>
                      		<th id="imJE">2.4</th>
                      		<th id="proE">2.9</th>
                      		<th id="proJE">2.2</th>
                      		<th id="all">0.70</th>                      	                     		
                    	</tr>
                    	<tr>
                      		<th id="no">19</th>
                      		<th id="illName">不健康饮食（高盐、高脂、少蔬菜水果等）</th>
                      		<th id="choose">37</th>
                      		<th id="imE">2.9</th>
                      		<th id="imJE">2.7</th>
                      		<th id="proE">3.0</th>
                      		<th id="proJE">2.8</th>
                      		<th id="all">0.70</th>                      	                     		
                    	</tr>
                    	<tr>
                      		<th id="no">20</th>
                      		<th id="illName">胃癌</th>
                      		<th id="choose">38</th>
                      		<th id="imE">3.0</th>
                      		<th id="imJE">2.7</th>
                      		<th id="proE">2.0</th>
                      		<th id="proJE">1.7</th>
                      		<th id="all">0.66</th>                      	                     		
                    	</tr>
                    	<tr>
                      		<th id="no">21</th>
                      		<th id="illName">结直肠癌</th>
                      		<th id="choose">36</th>
                      		<th id="imE">2.9</th>
                      		<th id="imJE">2.5</th>
                      		<th id="proE">2.1</th>
                      		<th id="proJE">1.8</th>
                      		<th id="all">0.64</th>                      	                     		
                    	</tr>
                    	<tr>
                      		<th id="no">22</th>
                      		<th id="illName">非法使用食品添加剂</th>
                      		<th id="choose">34</th>
                      		<th id="imE">2.7</th>
                      		<th id="imJE">2.0</th>
                      		<th id="proE">2.6</th>
                      		<th id="proJE">1.9</th>
                      		<th id="all">0.63</th>                      	                     		
                    	</tr>
                    	<tr>
                      		<th id="no">23</th>
                      		<th id="illName">超重肥胖</th>
                      		<th id="choose">33</th>
                      		<th id="imE">2.6</th>
                      		<th id="imJE">2.3</th>
                      		<th id="proE">2.5</th>
                      		<th id="proJE">2.2</th>
                      		<th id="all">0.61</th>                      	                     		
                    	</tr>
                    	<tr>
                      		<th id="no">24</th>
                      		<th id="illName">血脂异常</th>
                      		<th id="choose">33</th>
                      		<th id="imE">2.6</th>
                      		<th id="imJE">2.3</th>
                      		<th id="proE">2.5</th>
                      		<th id="proJE">2.2</th>
                      		<th id="all">0.61</th>                      	                     		
                    	</tr>
                    	<tr>
                      		<th id="no">25</th>
                      		<th id="illName">土壤污染</th>
                      		<th id="choose">31</th>
                      		<th id="imE">2.6</th>
                      		<th id="imJE">2.0</th>
                      		<th id="proE">2.3</th>
                      		<th id="proJE">1.7</th>
                      		<th id="all">0.58</th>                      	                     		
                    	</tr>
                    	<tr>
                      		<th id="no">26</th>
                      		<th id="illName">身体活动不足</th>
                      		<th id="choose">28</th>
                      		<th id="imE">2.3</th>
                      		<th id="imJE">2.2</th>
                      		<th id="proE">2.4</th>
                      		<th id="proJE">2.3</th>
                      		<th id="all">0.55</th>                      	                     		
                    	</tr>
                    	<tr>
                      		<th id="no">27</th>
                      		<th id="illName">白血病</th>
                      		<th id="choose">27</th>
                      		<th id="imE">2.1</th>
                      		<th id="imJE">1.7</th>
                      		<th id="proE">1.2</th>
                      		<th id="proJE">1.0</th>
                      		<th id="all">0.46</th>                      	                     		
                    	</tr>
                    	<tr>
                      		<th id="no">28</th>
                      		<th id="illName">重大环境污染事故</th>
                      		<th id="choose">23</th>
                      		<th id="imE">1.9</th>
                      		<th id="imJE">1.4</th>
                      		<th id="proE">1.8</th>
                      		<th id="proJE">1.4</th>
                      		<th id="all">0.44</th>                      	                     		
                    	</tr>
                    	<tr>
                      		<th id="no">29</th>
                      		<th id="illName">宫颈癌</th>
                      		<th id="choose">21</th>
                      		<th id="imE">1.6</th>
                      		<th id="imJE">1.3</th>
                      		<th id="proE">1.5</th>
                      		<th id="proJE">1.2</th>
                      		<th id="all">0.38</th>                      	                     		
                    	</tr>
                    	<tr>
                      		<th id="no">30</th>
                      		<th id="illName">过量饮酒</th>
                      		<th id="choose">20</th>
                      		<th id="imE">1.6</th>
                      		<th id="imJE">1.4</th>
                      		<th id="proE">1.6</th>
                      		<th id="proJE">1.5</th>
                      		<th id="all">0.37</th>                      	                     		
                    	</tr>
                    	
                 </tbody>
                </table>
               
              </div>
             <p contenteditable="false"><small><span style="font-size: 14px; line-height: 20px;"> &nbsp;&nbsp;注：这30项疾病或健康问题按照综合指数从高到低的顺序进行展示。</span></small></p>

<hr>
<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<img alt="140x140" src="imgs/kpi.png" class="img-rounded" />
		</div>
	</div>
</div>
<hr>
<div class="checkbox col-md-offset-4" id="readrules">
  					<label>
    					<input type="checkbox" id="readrulesCheck">
    						&nbsp;
    						<strong><font size="3" >我已了解第一轮调查结果</font></strong>
    						
  					</label>
  					<a id="toConfirm" href="javascript:;" data-toggle="modal"  role="button" class="btn btn-success btn-sm col-sm-offset-5">前往第二轮调查说明
  					</a>
</div>
<hr>
  <script type="text/javascript">

  $("#toConfirm").click(function(){
  	if($("#readrulesCheck").attr("checked")){
  		var backURL="question002.jsp";
  		var url = 'window.location.href="' + backURL+'"';
			setTimeout(url, 100);
  	}else{
  		$.messager.show({
		        title:'warning',
		        msg:'<font size="3">请确认您已阅读了第一轮调查结果</font>',
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
  $("#question002").click(function(){
	  	if($("#readrulesCheck").attr("checked")){
	  		var backURL="question002.jsp";
	  		var url = 'window.location.href="' + backURL+'"';
				setTimeout(url, 100);
	  	}else{
	  		$.messager.show({
			        title:'warning',
			        msg:'<font size="3">请勾选"我已了解第一轮调查结果",并点击按钮"前往第二轮调查说明"</font>',
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
  		var backURL="question002.jsp";
  		var url = 'window.location.href="' + backURL+'"';
			setTimeout(url, 100);
  	}else{
  		$.messager.show({
		        title:'warning',
		        msg:'<font size="3">请勾选"我已了解第一轮调查结果",并点击按钮"前往第二轮调查说明"</font>',
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
		        msg:'<font size="3">请勾选"我已了解第一轮调查结果",并点击按钮"前往第二轮调查说明"</font>',
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
		        msg:'<font size="3">请勾选"我已了解第一轮调查结果",并点击按钮"前往第二轮调查说明"</font>',
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
