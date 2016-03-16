<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html target="question_frame">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title> questionnaire  generating</title>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link rel="stylesheet" href="dist/css/bootstrap-select.css">

	
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


    <script type="text/javascript" src="myjs/newquestion1.js"></script>
    <script type="text/javascript"></script>
    
    <style type="text/css">  
    .scroll {  
		width: 100%;                                     /*宽度*/  
        height: 200px;                                  /*高度*/  
        color: ;                                        /*颜色*/  
        font-family: ;                                  /*字体*/  
        padding-left: 10px;                             /*层内左边距*/  
        padding-right: 10px;                            /*层内右边距*/  
        padding-top: 10px;                              /*层内上边距*/  
        padding-bottom: 10px;                           /*层内下边距*/  
        overflow-x: scroll;                             /*横向滚动条(scroll:始终出现;auto:必要时出现;具体参考CSS文档)*/  
        overflow-y: scroll;                             /*竖向滚动条*/  
          
        scrollbar-face-color: #D4D4D4;                  /*滚动条滑块颜色*/  
        scrollbar-hightlight-color: #ffffff;                /*滚动条3D界面的亮边颜色*/  
        scrollbar-shadow-color: #919192;                    /*滚动条3D界面的暗边颜色*/  
        scrollbar-3dlight-color: #ffffff;               /*滚动条亮边框颜色*/  
        scrollbar-arrow-color: #919192;                 /*箭头颜色*/  
        scrollbar-track-color: #ffffff;                 /*滚动条底色*/  
        scrollbar-darkshadow-color: #ffffff;                /*滚动条暗边框颜色*/  
    }  
    </style>  
    
    
</head>
<body>
	
	<ul id="questionTab" class="nav nav-tabs">
		<li ><a href="javascript:;" data-toggle="modal" data-target="#confirmModal1">第一轮调查结果</a></li>  
   		<li ><a href="javascript:;" data-toggle="modal" data-target="#confirmModal2">第二轮调查说明</a></li>
   		<li ><a href="javascript:;" data-toggle="modal" data-target="#confirmModal3">第二轮填写规则</a></li>
   		<li class="active"><a href="question1.jsp" > 重大疾病选择</a></li>
   		<li ><a href="javascript:;" >重大疾病评价</a></li>
	</ul>
	<hr>
	 <div >
	 <div class="form-group">
	 	
	 </div>
	 <div class="form-group">
		
	 	<div class="col-sm-offset-2 ">
    	<font color="black" id="warning" size="3" >
    	请选择您认为的<strong>20项</strong>重大疾病和健康问题。已选择&nbsp;<font id="countNumberAll" style="font-weight:bold;color:red;"></font>&nbsp;项
    	<a id="view_sick1" style="display:none" href="javascript:;" data-toggle="modal"  data-target="#modal_viewsick" role="button"  class="btn btn-success btn-sm">查看第一轮所选择重大疾病和健康问题</a>
    	<br>
    	红色对勾代表您第一轮的选择。
    	<!-- 请从左侧一级指标中选择您希望评价的<strong>20项</strong>疾病，右上方<font color="red">红色数字</font>会提示您一共选择的数量哦。 -->
 
    	</font>
    	
    	</div>
    	
    	<!-- 
    	<div class="col-sm-offset-7"> 
    	 <a href="javascript:;" id="view_rule_1" data-toggle="modal" data-target="#confirmModal2"  class="col-sm-6" style="display:none"><font size="3" color="black"><strong>查看第一轮调查说明</strong></font></a>
    	<a href="javascript:;" id="view_rule_2" data-toggle="modal" data-target="#confirmModal4"  class="col-sm-6" style="display:none"><font size="3" color="black"><strong>查看第二轮调查说明</strong></font></a>
    	<a href="javascript:;" id="view_rule" data-toggle="modal" data-target="#confirmModal3" class="col-sm-6" style="display:none"><font size="3" color="black"><strong>查看填写规则</strong></font></a>
    	
    	</div>
    	-->
    </div>
    	
    	
    </div>
    <hr>
	<div class="container-fluid">
	<div class="row-fluid">
	<!--  
		<div class="col-md-3">
			<div class="text-center">
			
			<h5 >
				<strong >请点击领域</strong>
				
			</h5>
			
			<h6>
				<strong>（领域右侧数字为已选中疾病的数目）</strong>
			</h6>
			</div>
			<hr>
			<div class="list-group" id="firstLeveDiv">
  				<button style="display:none" type="button" id="firstLeveDivTest" class="list-group-item" ><font id="firstLeveItemName">第一个</font><font style="display:none" id="firstLeveItemid">第一个</font> <span id="countNumber" class="badge">14</span></button>

			</div>
			
		</div>
		
		-->
		<div class="col-md-10 col-md-offset-1" >
			<!-- 
			<div class="text-center">
			
			<h5>
			<strong>选择重大疾病和健康问题</strong>
			</h5>
			<br>
			</div>
			
			<hr>
			 -->
			<!-- 
			<div class="col-md-6" id="secondLevelDivTest" style="display:none">
			
				<div class="pull-right">
				<h6 ><font id="name"> name</font><font style="display:none" id="id"> id</font> <span id="secondLevelClick" class="btn label label-success"><strong>→</strong></span></h6>
				
				</div>
			</div>
			 -->
			<div class="table-bordered scroll" style="height:500px" >
				<div>
				<table class="table table-hover">
								<thead>
                    				<tr>
                      					<th >序号</th>
                      					<th>是否选择</th>
                      					<th>重大疾病和健康问题</th>
                      					<th>综合指数</th>
                      					<th style="text-align:center">您的第一轮选择</th>
                      					
                    				</tr>
                  				</thead>
                  				<tbody id="treleSicktable">
                  					<tr class="alltrsClass" id="treleSick2" style="display:none">
                  					<th id="showid" style="">1</th>
                  						<th id="id" style="display:none">1</th>
                  						<th><input type="checkbox" value="" id="secondLevelCheckBox" style="width: 19px;height: 25px;"><font style="display:none" id="ProtectiveAve"></font>
                  						<font style="display:none" id="ImportanceAve"></font>
                  						<font style="display:none" id="ismanul">0</font>
                  						
                  						</th>
                  						<th id="name">糖尿病</th>
                  						<th id="zhonghe">0.45</th>
                  						<th id="select" style="color:red;text-align:center">√</th>
                  						
                  					</tr>
                  				</tbody>
							</table>
				</div>
				<div id="hiddenadd" >
					<font color="red">如果您认为仍有重大问题未列入，请在此处添加：</font>
					<div class="input-group" >
						<input type="text" id="addSickText" class="form-control" placeholder="请自行填写上述遗漏重大疾病或健康问题">
      					<span class="input-group-btn">
       	 				<button class="btn btn-default" id="addSickBtn" type="button">添加</button>
						</span>
					</div>
				</div>
							
		</div>
		

</div>
<br>
<br>
<a id="toConfirm" href="javascript:;" data-toggle="modal"  role="button" class="btn btn-success btn-sm col-sm-offset-5">提交已选择选项</a>


<form   class="form-horizontal" action="question2.jsp" method="post" onsubmit="return fillContent()">			
        <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
              </div>
              <div class="modal-body" >
              <input style="display:none" type="text" id="allids" name="allids">
               <input style="display:none" type="text" id="firstidarrs" name="firstidarrs">
		      <input style="display:none" type="text" id="allnames" name="allnames">
		      <input style="display:none" type="text" id="ImportanceAvearr" name="ImportanceAvearr">
		      <input style="display:none" type="text" id="ProtectiveAvearr" name="ProtectiveAvearr">
		       <input style="display:none" type="text" id="isManualAddzrr" name="isManualAddzrr">
                                                     请问确认提交已选择的<span></span>20项重大疾病或健康问题吗？
  				<br>
  				提交后将不能修改！
  				
              
              
              <div class="modal-footer">
               
                <button type="submit" id="accountConfirmBtn" class="btn btn-success" >提交</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
              </div>
            </div>
          </div>
        </div>
        </div>
</form>


<div class="modal fade" id="modal_viewsick" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
              <button id="closechPwdBtn" type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
              </div>
              <div class="modal-body" >
              
 
  				<table class="table table-striped table-hover table-bordered  table-condensed">
                  <thead>
                    <tr>
                      <th>编号</th>
                      <th>重大疾病和健康问题</th>
                      <th>综合指数</th>
                      
                      
                    </tr>
                  </thead>
                 	<tbody id="tbodytestnotselect">
                  		<tr id="tbodytrtestnotselet" style="display:none" >
                      		<th id="no">1</th>
                      		<th id="illname">肺癌</th>
                      		<th id="illpercent">10%</th>
                      		
                      
                    	</tr>
                    		
                 </tbody>
                </table>
  				
              
              
              <div class="modal-footer">
               
                
              </div>
            </div>
          </div>
        </div>
        </div>

<div class="modal fade" id="confirmModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
			<button id="closechPwdBtn" type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
			<h4 class="modal-title" id="myModalLabel">第二轮调查说明</h4>
		</div>
		<div class="modal-body" >
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
			
		</div>
        <div class="modal-footer">
			<!-- 
			<button type="button" id="changPwdBtn"  class="btn btn-success" >确认</button>
			<button id="cancelBtn" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        	 -->
        </div>
	</div>
	</div>
</div>

<div class="modal fade" id="confirmModal1" tabindex="-1"  aria-labelledby="myModalLabel" aria-hidden="true" >
	<div class="modal-dialog" style="width: 900px;">
		<div class="modal-content">
			<div class="modal-header">
			<button id="closechPwdBtn" type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
			<h4 class="modal-title" id="myModalLabel">第一轮调查结果</h4>
		</div>
		<div class="modal-body" >
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
		</div>
        <div class="modal-footer">
			<!-- 
			<button type="button" id="changPwdBtn"  class="btn btn-success" >确认</button>
			<button id="cancelBtn" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        	 -->
        </div>
	</div>
	</div>
</div>



<div class="modal fade" id="confirmModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
			<button id="closechPwdBtn" type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
			<h4 class="modal-title" id="myModalLabel">填写规则说明</h4>
		</div>
		<div class="modal-body" >
<div class="container-fluid">
	<div class="row-fluid">
	
	<br>
		<div class="span12">
			<p>
				&nbsp;&nbsp;&nbsp;&nbsp;<strong><span style="font-size:17px;line-height:180%">为了方便您的选择，我们预先将第一轮专家评提出的125种重大疾病或健康问题一一列出，供您选择。本轮调查仍限定您可选择的重大疾病和健康问题数目总计为20项，不能多也不能少。</span></strong>
			</p>
			<p>
				&nbsp;&nbsp;&nbsp;&nbsp;<strong><span style="font-size:17px;line-height:180%">在125个重大疾病或健康问题清单中，每一个后面都列有其在第一轮评价中获得的综合指数；系统同时采用红色对勾（√）的形式标示了那些您第一轮曾经做过的选择或建议。这些信息供您在本次做出选择时参考。对您认为是我国未来可预防的重大疾病和健康问题，请点击其前面对应的方框做出标记。如再次点击，则取消选择。所有20项选择完毕后，请点击屏幕下方的“提交已选择选项”按钮进行提交。</span></strong>
			</p>
			<p>
				&nbsp;&nbsp;&nbsp;&nbsp;<strong><span style="font-size:17px;line-height:180%">当您确定并提交了20项重大疾病和健康问题后，系统将自动进入到重大疾病或健康问题评价页面，您需要对所选出的20个重大疾病（或健康问题）的熟悉程度、重大程度、可预防程度进行打分。在重大程度打分框和可预防程度打分框后面，我们分别列出了该疾病在第一轮调查中的重大程度均值和可预防程度均值，供您参考。</span></strong>
			</p>
			<p>
				&nbsp;&nbsp;&nbsp;&nbsp;<strong><span style="font-size:17px;line-height:180%">具体填表方法如下：</span></strong>
			</p>
			<p>
				&nbsp;&nbsp;&nbsp;&nbsp;<strong><span style="font-size:17px;line-height:180%">1）熟悉程度：采用尺度调查法。0表示“最不熟悉”，9表示“最熟悉”，请根据自己对该疾病（或问题）的熟悉程度填写0-9之间的任意数字。</span></strong>
			</p>
			<p>
				&nbsp;&nbsp;&nbsp;&nbsp;<strong><span style="font-size:17px;line-height:180%">2）重大程度：0表示“最不重大”，9表示“最重大”。</span></strong>
			</p>
			<p>
				&nbsp;&nbsp;&nbsp;&nbsp;<strong><span style="font-size:17px;line-height:180%">3）可预防程度：0表示“完全不可预防”，9表示“完全可以预防”。</span></strong>
			</p>
		</div>
	</div>
</div>
			
		</div>
        <div class="modal-footer">
			<!-- 
			<button type="button" id="changPwdBtn"  class="btn btn-success" >确认</button>
			<button id="cancelBtn" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        	 -->
        </div>
	</div>
	</div>
</div>





<div class="modal fade" id="confirmModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
			<button id="closechPwdBtn" type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
			<h4 class="modal-title" id="myModalLabel">第二轮调查说明</h4>
		</div>
		<div class="modal-body" >
<div class="container-fluid">
	<div class="row-fluid">
	
	<br>
		<div class="span12">
			<p>
				&nbsp;&nbsp;&nbsp;&nbsp;<strong><span style="font-size:17px;line-height:180%">中国工程院医药卫生学部“我国未来可预防重大疾病问卷调查”第二轮调查仅限于参加过第一轮调查的专家，大约需要20-30分钟，采用网络调查的形式。系统从设计上确保他人无法得知您的咨询意见，包括管理和财务人员。</span></strong>
			</p>
			<p>
				&nbsp;&nbsp;&nbsp;&nbsp;<strong><span style="font-size:17px;line-height:180%">第二轮调查将在得知第一轮调查主要结果的基础上，邀请您对我国未来可预防重大疾病或健康问题再次做出选择和打分。仍采用问卷形式。请您在2016年X月X日前，登陆网址：http://www.cae.cn/cae/html/main/index.html，点击“我国未来可预防重大疾病问卷调查”，进行网上问卷调查。</span></strong>
			</p>
			<p>
				&nbsp;&nbsp;&nbsp;&nbsp;<strong><span style="font-size:17px;line-height:180%">您的参与攸关我国未来预防医学体系建设。万分感谢您的参与和配合！</span></strong>
			</p>
		</div>
	</div>
</div>
			<!-- 
			
			<div class="form-group">
				<label for="password" class="col-sm-4 control-label"><font size="4">设置新密码</font></label>
				<div class="col-sm-5 ">
					<input type="password"  class="form-control" id="password" name="password" placeholder="请输入您的密码" >
				</div> 
			</div>
			<div class="form-group">
				<label for="confirmpassword" class="col-sm-4 control-label "  ><font size="4">确认新密码</font></label>
				<div class="col-sm-5 ">
					<input type="password"  class="form-control easyui-validatebox"  id="password1" name="confirmpassword"  placeholder="请再次输入您的密码" >
				</div>
			</div>
			<div class="form-group">
				<font color="red" size="3" style="float:left; " class="col-sm-offset-3 col-sm-8">密码至少6位且必须由数字和字母组成!</font>
				<br>
				<font color="red" size="3" style="float:left; " class="col-sm-offset-3 col-sm-8">请牢记新密码，丢失无法找回！</font>
			</div>
			 -->
		</div>
        <div class="modal-footer">
			<!-- 
			<button type="button" id="changPwdBtn"  class="btn btn-success" >确认</button>
			<button id="cancelBtn" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        	 -->
        </div>
	</div>
	</div>
</div>

<script type="text/javascript">

	
</script>
</body>
</html>