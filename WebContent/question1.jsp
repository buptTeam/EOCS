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
		<li ><a href="javascript:;" data-toggle="modal" data-target="#confirmModal2">第二轮调查说明</a></li>
		<li ><a href="javascript:;" data-toggle="modal" data-target="#confirmModal1">第一轮调查结果</a></li>  
   		
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
    	候选的重大疾病和健康问题按照综合指数从高到低进行显示。
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
		<div class="col-md-6 col-md-offset-2" >
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
                  						<th id="select" style="color:red;display:none;text-align:center">√</th>
                  						
                  					</tr>
                  				</tbody>
							</table>
				</div>
				<!-- 
				<div id="hiddenadd" >
					<font color="red">如果您认为仍有重大问题未列入，请在此处添加：</font>
					<div class="input-group" >
						<input type="text" id="addSickText" class="form-control" placeholder="请自行填写上述遗漏重大疾病或健康问题">
      					<span class="input-group-btn">
       	 				<button class="btn btn-default" id="addSickBtn" type="button">添加</button>
						</span>
					</div>
				</div>
				 -->
							
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
	
	<br>
		<div class="span12">
			<p>
				<strong><span style="font-size:17px;line-height:180%">第一步：选出20项未来可预防重大疾病或健康问题</span></strong>
			</p>
			<p>
				<span style="font-size:17px;line-height:180%">系统将第一轮专家选择率大于10%的56项重大疾病或健康问题一一列出，供您从中选择。系统同时列出其各自第一轮调查的综合指数供您参考。</span>
			</p>
			<p>
				<span style="font-size:17px;line-height:180%">本轮选择，你仅需要对认定的重大疾病或健康问题前面对应的方框点击即可做出选择。如再次点击，则取消选择。所有20项选择完毕后，请点击屏幕下方的“提交已选择选项”按钮进行提交。</span>
			</p>
			<p>
				<span style="font-size:17px;line-height:180%">本轮调查仍限定选择的重大疾病或健康问题总数为20项（多于20项或少于20项均为无效问卷）。</span>
			</p>
			<p>
				<strong><span style="font-size:17px;line-height:180%">第二步：对选定的项目的重大程度和可预防程度评分</span></strong>
			</p>
			<p>
				<span style="font-size:17px;line-height:180%">当您确定并提交了20项重大疾病或健康问题后，系统将自动进入到评价页面，您需要对所选出的每一项重大疾病或健康问题的熟悉程度、重大程度、可预防程度进行量化评价。在重大程度打分框和可预防程度打分框后面，我们分别列出了该项目第一轮调查的得分均值，供您参考。</span>
			</p>
			<p>
				<span style="font-size:17px;line-height:180%">具体填表方法如下：</span>
			</p>
			<p>
				<span style="font-size:17px;line-height:180%">1）熟悉程度：采用尺度调查法。0表示“最不熟悉”，9表示“最熟悉”，请根据自己对该疾病（或问题）的熟悉程度填写0-9之间的任意数字。</span>
			</p>
			<p>
				<span style="font-size:17px;line-height:180%">2）重大程度：0表示“最不重大”，9表示“最重大”。</span>
			</p>
			<p>
				<span style="font-size:17px;line-height:180%">3）可预防程度：0表示“完全不可预防”，9表示“完全可以预防”。</span>
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
                     
                      <th>重大程度<br>加权均值</th>
                      
                      <th>可预防程度<br>加权均值</th>
                      <th>综合指数</th>
                    </tr>
                  </thead>
                 	<tbody id="tbodytest">
                  		<tr><th id="no">1</th><th id="illName"><font color="goldenrod">糖尿病</font></th><th id="choose">73</th><th id="imJE">5.0</th><th id="proJE">4.3</th><th id="all">1.32</th></tr>
<tr><th id="no">2</th><th id="illName"><font color="goldenrod">肺癌</font></th><th id="choose">73</th><th id="imJE">5.0</th><th id="proJE">3.4</th><th id="all">1.28</th></tr>
<tr><th id="no">3</th><th id="illName"><font color="goldenrod">病毒性肝炎</font></th><th id="choose">67</th><th id="imJE">4.3</th><th id="proJE">4.0</th><th id="all">1.25</th></tr>
<tr><th id="no">4</th><th id="illName"><font color="goldenrod">新发突发传染病</font></th><th id="choose">65</th><th id="imJE">3.9</th><th id="proJE">2.5</th><th id="all">1.15</th></tr>
<tr><th id="no">5</th><th id="illName"><font color="goldenrod">艾滋病</font></th><th id="choose">62</th><th id="imJE">3.8</th><th id="proJE">3.3</th><th id="all">1.15</th></tr>
<tr><th id="no">6</th><th id="illName"><font color="goldenrod">高血压</font></th><th id="choose">60</th><th id="imJE">4.4</th><th id="proJE">3.7</th><th id="all">1.10</th></tr>
<tr><th id="no">7</th><th id="illName"><font color="goldenrod">冠心病/心肌梗死</font></th><th id="choose">58</th><th id="imJE">4.1</th><th id="proJE">3.5</th><th id="all">1.06</th></tr>
<tr><th id="no">8</th><th id="illName"><font color="goldenrod">脑卒中</font></th><th id="choose">56</th><th id="imJE">3.9</th><th id="proJE">3.2</th><th id="all">1.02</th></tr>
<tr><th id="no">9</th><th id="illName"><font color="goldenrod">肝癌</font></th><th id="choose">56</th><th id="imJE">3.7</th><th id="proJE">2.8</th><th id="all">0.98</th></tr>
<tr><th id="no">10</th><th id="illName"><font color="goldenrod">吸烟</font></th><th id="choose">54</th><th id="imJE">4.1</th><th id="proJE">3.9</th><th id="all">1.03</th></tr>
<tr><th id="no">11</th><th id="illName"><font color="goldenrod">抑郁症</font></th><th id="choose">53</th><th id="imJE">2.9</th><th id="proJE">2.3</th><th id="all">0.91</th></tr>
<tr><th id="no">12</th><th id="illName"><font color="goldenrod">空气污染</font></th><th id="choose">47</th><th id="imJE">3.1</th><th id="proJE">2.8</th><th id="all">0.90</th></tr>
<tr><th id="no">13</th><th id="illName"><font color="goldenrod">老年痴呆</font></th><th id="choose">46</th><th id="imJE">2.8</th><th id="proJE">1.6</th><th id="all">0.79</th></tr>
<tr><th id="no">14</th><th id="illName"><font color="goldenrod">肺结核</font></th><th id="choose">45</th><th id="imJE">2.8</th><th id="proJE">2.5</th><th id="all">0.82</th></tr>
<tr><th id="no">15</th><th id="illName"><font color="goldenrod">农药、激素及抗生素等残留</font></th><th id="choose">43</th><th id="imJE">2.6</th><th id="proJE">2.4</th><th id="all">0.80</th></tr>
<tr><th id="no">16</th><th id="illName"><font color="goldenrod">乳腺癌</font></th><th id="choose">42</th><th id="imJE">2.7</th><th id="proJE">2.0</th><th id="all">0.74</th></tr>
<tr><th id="no">17</th><th id="illName"><font color="goldenrod">道路交通伤害</font></th><th id="choose">41</th><th id="imJE">2.6</th><th id="proJE">2.5</th><th id="all">0.76</th></tr>
<tr><th id="no">18</th><th id="illName"><font color="goldenrod">胃癌</font></th><th id="choose">38</th><th id="imJE">2.7</th><th id="proJE">1.7</th><th id="all">0.66</th></tr>
<tr><th id="no">19</th><th id="illName"><font color="goldenrod">水污染</font></th><th id="choose">37</th><th id="imJE">2.4</th><th id="proJE">2.2</th><th id="all">0.70</th></tr>
<tr><th id="no">20</th><th id="illName"><font color="goldenrod">不健康饮食（高盐、高脂、少蔬菜水果等）</font></th><th id="choose">37</th><th id="imJE">2.7</th><th id="proJE">2.8</th><th id="all">0.70</th></tr>
<tr><th id="no">21</th><th id="illName"><font color="goldenrod">结直肠癌</font></th><th id="choose">36</th><th id="imJE">2.5</th><th id="proJE">1.8</th><th id="all">0.64</th></tr>
<tr><th id="no">22</th><th id="illName"><font color="goldenrod">非法使用食品添加剂</font></th><th id="choose">34</th><th id="imJE">2.0</th><th id="proJE">1.9</th><th id="all">0.63</th></tr>
<tr><th id="no">23</th><th id="illName"><font color="goldenrod">超重肥胖</font></th><th id="choose">33</th><th id="imJE">2.3</th><th id="proJE">2.2</th><th id="all">0.61</th></tr>
<tr><th id="no">24</th><th id="illName"><font color="goldenrod">血脂异常</font></th><th id="choose">33</th><th id="imJE">2.3</th><th id="proJE">2.2</th><th id="all">0.61</th></tr>
<tr><th id="no">25</th><th id="illName"><font color="goldenrod">土壤污染</font></th><th id="choose">31</th><th id="imJE">2.0</th><th id="proJE">1.7</th><th id="all">0.58</th></tr>
<tr><th id="no">26</th><th id="illName"><font color="goldenrod">身体活动不足</font></th><th id="choose">28</th><th id="imJE">2.2</th><th id="proJE">2.3</th><th id="all">0.55</th></tr>
<tr><th id="no">27</th><th id="illName"><font color="goldenrod">白血病</font></th><th id="choose">27</th><th id="imJE">1.7</th><th id="proJE">1.0</th><th id="all">0.46</th></tr>
<tr><th id="no">28</th><th id="illName"><font color="goldenrod">重大环境污染事故</font></th><th id="choose">23</th><th id="imJE">1.4</th><th id="proJE">1.4</th><th id="all">0.44</th></tr>
<tr><th id="no">29</th><th id="illName"><font color="goldenrod">宫颈癌</font></th><th id="choose">21</th><th id="imJE">1.3</th><th id="proJE">1.2</th><th id="all">0.38</th></tr>
<tr><th id="no">30</th><th id="illName"><font color="goldenrod">食管癌</font></th><th id="choose">21</th><th id="imJE">1.4</th><th id="proJE">1.0</th><th id="all">0.36</th></tr>
<tr><th id="no">31</th><th id="illName"><font  >过量饮酒</font></th><th id="choose">20</th><th id="imJE">1.4</th><th id="proJE">1.5</th><th id="all">0.37</th></tr>
<tr><th id="no">32</th><th id="illName"><font  >新技术、新材料带来的环境污染</font></th><th id="choose">20</th><th id="imJE">1.1</th><th id="proJE">1.0</th><th id="all">0.36</th></tr>
<tr><th id="no">33</th><th id="illName"><font  >流行性感冒（简称流感）</font></th><th id="choose">20</th><th id="imJE">1.3</th><th id="proJE">1.1</th><th id="all">0.36</th></tr>
<tr><th id="no">34</th><th id="illName"><font  >传染性非典型肺炎</font></th><th id="choose">19</th><th id="imJE">1.1</th><th id="proJE">0.8</th><th id="all">0.34</th></tr>
<tr><th id="no">35</th><th id="illName"><font >慢性阻塞性肺病</font></th><th id="choose">18</th><th id="imJE">1.2</th><th id="proJE">1.0</th><th id="all">0.32</th></tr>
<tr><th id="no">36</th><th id="illName"><font  >人感染致病性禽流感</font></th><th id="choose">18</th><th id="imJE">1.0</th><th id="proJE">0.8</th><th id="all">0.32</th></tr>
<tr><th id="no">37</th><th id="illName"><font  >焦虑症</font></th><th id="choose">18</th><th id="imJE">1.0</th><th id="proJE">0.9</th><th id="all">0.31</th></tr>
<tr><th id="no">38</th><th id="illName"><font  >肌肉骨骼损伤（例如颈椎病、腰椎病、肩腕综合征等）</font></th><th id="choose">17</th><th id="imJE">1.0</th><th id="proJE">1.0</th><th id="all">0.31</th></tr>
<tr><th id="no">39</th><th id="illName"><font  >慢性肾病</font></th><th id="choose">17</th><th id="imJE">1.0</th><th id="proJE">0.8</th><th id="all">0.30</th></tr>
<tr><th id="no">40</th><th id="illName"><font  >自杀</font></th><th id="choose">17</th><th id="imJE">0.7</th><th id="proJE">0.6</th><th id="all">0.28</th></tr>
<tr><th id="no">41</th><th id="illName"><font  >室内环境污染</font></th><th id="choose">16</th><th id="imJE">1.0</th><th id="proJE">0.9</th><th id="all">0.30</th></tr>
<tr><th id="no">42</th><th id="illName"><font  >药物滥用与药物依赖</font></th><th id="choose">16</th><th id="imJE">0.9</th><th id="proJE">0.9</th><th id="all">0.29</th></tr>
<tr><th id="no">43</th><th id="illName"><font  >先天性心脏病</font></th><th id="choose">16</th><th id="imJE">1.0</th><th id="proJE">0.8</th><th id="all">0.27</th></tr>
<tr><th id="no">44</th><th id="illName"><font  >不安全性行为</font></th><th id="choose">14</th><th id="imJE">0.8</th><th id="proJE">0.8</th><th id="all">0.25</th></tr>
<tr><th id="no">45</th><th id="illName"><font  >登革热</font></th><th id="choose">14</th><th id="imJE">0.8</th><th id="proJE">0.7</th><th id="all">0.24</th></tr>
<tr><th id="no">46</th><th id="illName"><font >狂犬病</font></th><th id="choose">13</th><th id="imJE">0.8</th><th id="proJE">0.8</th><th id="all">0.23</th></tr>
<tr><th id="no">47</th><th id="illName"><font  >前列腺癌</font></th><th id="choose">13</th><th id="imJE">0.8</th><th id="proJE">0.6</th><th id="all">0.21</th></tr>
<tr><th id="no">48</th><th id="illName"><font  >胰腺癌</font></th><th id="choose">13</th><th id="imJE">0.8</th><th id="proJE">0.4</th><th id="all">0.21</th></tr>
<tr><th id="no">49</th><th id="illName"><font  >食物中毒</font></th><th id="choose">12</th><th id="imJE">0.8</th><th id="proJE">0.8</th><th id="all">0.22</th></tr>
<tr><th id="no">50</th><th id="illName"><font  >麻疹</font></th><th id="choose">12</th><th id="imJE">0.7</th><th id="proJE">0.8</th><th id="all">0.21</th></tr>
<tr><th id="no">51</th><th id="illName"><font  >疟疾</font></th><th id="choose">12</th><th id="imJE">0.7</th><th id="proJE">0.6</th><th id="all">0.21</th></tr>
<tr><th id="no">52</th><th id="illName"><font  >精神分裂症</font></th><th id="choose">12</th><th id="imJE">0.6</th><th id="proJE">0.4</th><th id="all">0.19</th></tr>
<tr><th id="no">53</th><th id="illName"><font  >老年失能</font></th><th id="choose">12</th><th id="imJE">0.7</th><th id="proJE">0.4</th><th id="all">0.19</th></tr>
<tr><th id="no">54</th><th id="illName"><font  >鼠疫</font></th><th id="choose">11</th><th id="imJE">0.7</th><th id="proJE">0.7</th><th id="all">0.19</th></tr>
<tr><th id="no">55</th><th id="illName"><font  >手足口病</font></th><th id="choose">11</th><th id="imJE">0.7</th><th id="proJE">0.7</th><th id="all">0.19</th></tr>
<tr><th id="no">56</th><th id="illName"><font  >甲型H1N1流感</font></th><th id="choose">11</th><th id="imJE">0.6</th><th id="proJE">0.6</th><th id="all">0.19</th></tr>

                    	
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
				<strong><span style="font-size:17px;line-height:180%">第一步：选出20项未来可预防重大疾病或健康问题</span></strong>
			</p>
			<p>
				<span style="font-size:17px;line-height:180%">系统将第一轮专家选择率大于10%的56项重大疾病或健康问题一一列出，供您从中选择。系统同时列出其各自第一轮调查的综合指数供您参考。</span>
			</p>
			<p>
				<span style="font-size:17px;line-height:180%">本轮选择，你仅需要对认定的重大疾病或健康问题前面对应的方框点击即可做出选择。如再次点击，则取消选择。所有20项选择完毕后，请点击屏幕下方的“提交已选择选项”按钮进行提交。</span>
			</p>
			<p>
				<span style="font-size:17px;line-height:180%">本轮调查仍限定选择的重大疾病或健康问题总数为20项（多于20项或少于20项均为无效问卷）。</span>
			</p>
			<p>
				<strong><span style="font-size:17px;line-height:180%">第二步：对选定的项目的重大程度和可预防程度评分</span></strong>
			</p>
			<p>
				<span style="font-size:17px;line-height:180%">当您确定并提交了20项重大疾病或健康问题后，系统将自动进入到评价页面，您需要对所选出的每一项重大疾病或健康问题的熟悉程度、重大程度、可预防程度进行量化评价。在重大程度打分框和可预防程度打分框后面，我们分别列出了该项目第一轮调查的得分均值，供您参考。</span>
			</p>
			<p>
				<span style="font-size:17px;line-height:180%">具体填表方法如下：</span>
			</p>
			<p>
				<span style="font-size:17px;line-height:180%">1）熟悉程度：采用尺度调查法。0表示“最不熟悉”，9表示“最熟悉”，请根据自己对该疾病（或问题）的熟悉程度填写0-9之间的任意数字。</span>
			</p>
			<p>
				<span style="font-size:17px;line-height:180%">2）重大程度：0表示“最不重大”，9表示“最重大”。</span>
			</p>
			<p>
				<span style="font-size:17px;line-height:180%">3）可预防程度：0表示“完全不可预防”，9表示“完全可以预防”。</span>
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
				<span style="font-size:17px;line-height:180%">中国工程院医药学部 “新型国家预防医学体系建立的研究”课题组开展的“全民健康与医药卫生事业国家发展战略研究”重大课题针对“我国未来20年可预防重大疾病和健康问题”的第一轮德尔菲专家法调查工作现已完成。按调查方法所述，其中仅有11项超过50%专家选择。为了进一步集中专家意见，课题组决定开展第二轮德尔菲专家法调查（下称“第二轮调查”）。</span>
			</p>
			<p>
				<span style="font-size:17px;line-height:180%">第二轮调查仅邀请第一轮调查问卷回复有效的95位专家参加。</span>
			</p>
			<p>
				<span style="font-size:17px;line-height:180%">第二轮调查大约需要20-30分钟，采用网络调查和纸质问卷相结合的形式。系统从设计上确保他人无法得知您的咨询意见，包括管理和财务人员。</span>
			</p>
			<p>
				<span style="font-size:17px;line-height:180%">第二轮调查候选项目清单仅限于第一轮调查中专家选择百分比超过10%的重大疾病或健康问题（共计56项）。专家只能从中选择，不能额外添加。</span>
			</p>
			<p>
				<span style="font-size:17px;line-height:180%">同时，我们将这56个项目的实际调查结果按照选择率从高到低的顺序提供给各位专家，供您在回复第二轮调查时参考。期望第二轮调查专家们的选择能够相对集中，便于我们总结提出我国未来20年可预防的重大疾病和健康问题。</span>
			</p>
			<p>
				<span style="font-size:17px;line-height:180%">请您在2016年4月30日前，完成网上问卷调查。</span>
			</p>
			<p>
				<span style="font-size:17px;line-height:180%">您的参与攸关我国未来预防医学体系建设。万分感谢您的参与和配合！</span>
			</p>
			
		</div>
		<div>
			<p style="float:right">
				&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:17px;line-height:180%">中国工程院医药学部 “新型国家预防医学体系建立的研究”课题组</span>
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