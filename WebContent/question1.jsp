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


    <script type="text/javascript" src="myjs/question1.js"></script>
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
   		<li ><a href="javascript:;" data-toggle="modal" data-target="#confirmModal2"><font id="shuoming">第一轮调查说明</font></a></li>
   		<li ><a href="javascript:;" data-toggle="modal" data-target="#confirmModal3">填写规则</a></li>
   		<li class="active"><a href="question1.jsp" > 重大疾病选择</a></li>
   		<li ><a href="javascript:;" >重大疾病评价</a></li>
	</ul>
	<hr>
	 <div >
	 <div class="form-group">
	 	<div class="col-sm-offset-4 ">
    	<font color="black" id="warning" size="3" >
    	请选择您认为的<strong>20项</strong>重大疾病和健康问题。
    	<!-- 请从左侧一级指标中选择您希望评价的<strong>20项</strong>疾病，右上方<font color="red">红色数字</font>会提示您一共选择的数量哦。 -->
 
    	</font>
    	<a id="view_sick1" href="javascript:;" data-toggle="modal"  data-target="#modal_viewsick" role="button" style="display:none" class="btn btn-success btn-sm">查看第一轮所选择重大疾病和健康问题</a>
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
		
		
		<div class="col-md-5" >
			<div class="text-center">
			
			<h5>
			<strong>备选重大疾病和健康问题</strong>
			</h5>
			<br>
			</div>
			
			<hr>
			<!-- 
			<div class="col-md-6" id="secondLevelDivTest" style="display:none">
			
				<div class="pull-right">
				<h6 ><font id="name"> name</font><font style="display:none" id="id"> id</font> <span id="secondLevelClick" class="btn label label-success"><strong>→</strong></span></h6>
				
				</div>
			</div>
			 -->
			<div class="table-bordered scroll" style="height:370px" >
				<div id="secondLevelDiv">
				<div class="checkbox col-md-offset-1" id="secondLevelDivTest" style="display:none" >
  					<label>
    						<input type="checkbox" value="" id="secondLevelCheckBox">
    						&nbsp;
    						<font size="3" id="name">name</font>
    						<font style="display:none" id="id"> id</font>
    						
    						<font style="display:none" id="totalImportance"> id</font>
    						<font style="display:none" id="totalFamiliar"> id</font>
    						<font style="display:none" id="totalControll"> id</font>
    						<font style="display:none" id="ave"> id</font>
    						<font style="display:none" id="area_ave"> id</font>
    						<font style="display:none" id="ave_im"> id</font>
    						<font style="display:none" id="area_ave_im"> id</font>
    						<font style="display:none" id="ave_con"> id</font>
    						<font style="display:none" id="area_ave_con"> id</font>
    						<font style="display:none" id="percentage"> id</font>
    						&nbsp;&nbsp;&nbsp;&nbsp;
    						<font size="3" color="red" id="alert1">已有</font>
    						<font size="3" color="red" id="count"></font>
    						<font size="3" color="red" id="alert2">人选择</font>
  					</label>
				</div>
				</div>
				<div id="hiddenadd" style="display:none">
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
		
		<div class="col-md-4" id="selectedDiv">
			<div class="text-center">
				
				<h5>
					<strong>已选重大疾病和健康问题<font id="countNumberAll" size="3" color="red">3</font>项</strong>
				</h5>
				<br>
			</div>
			<hr>
			<div class="table-bordered scroll" style="height:370px" id="selectedDivTest">		 
				<!-- /input-group -->
			
			<!-- 已经选择的二级病症 -->
			<div  class="alert alert-warning alert-dismissible" role="alert" id="selectedItrmTest" style="display:none; padding-bottom: 2px;padding-top: 2px;padding-left: 2px;margin-bottom: 2px;">
  				
  				<button id="disappear" type="button" class="close" data-dismiss="alert" aria-label="Close" >
  				<span aria-hidden="true">&times;</span></button>
  				<strong>
  				<font id="name" size="1"></font>
  				&nbsp;&nbsp;&nbsp;
  				<font style="display:none" id="percentage" size="1">10%</font>
  				&nbsp;&nbsp;&nbsp;
  				<font style="display:none" id="correct" size="1" color="red">√</font>
  				<font style="display:none" id="id">0</font>
  				<font style="display:none" id="selectedFirstlevelid">0</font>
  				<font style="display:none" id="isManualAdd">-1</font>
  				<font style="display:none" id="count">0</font>
    			<font style="display:none" id="totalImportance">0</font>
    			<font style="display:none" id="totalFamiliar">0</font>
    			<font style="display:none" id="totalControll">0</font>
    			<font style="display:none" id="ave">0</font>
    			<font style="display:none" id="area_ave">0</font>
    			<font style="display:none" id="ave_im">0</font>
    			<font style="display:none" id="area_ave_im">0</font>
    			<font style="display:none" id="ave_con">0</font>
    			<font style="display:none" id="area_ave_con">0</font>
    			
  				</strong> 
  				
			</div>
			<font color="red">删除已选疾病，请点击名称后面的“×”</font>
		</div>
		</div>
	</div>

</div>
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
		      <input style="display:none" type="text" id="isManualAddinput" name="isManualAdd">

		           <input style="display:none" type="text" id="avearr" name="ave">
		            <input style="display:none" type="text" id="areaavearr" name="areaave">
		            <input style="display:none" type="text" id="aveimarr" name="aveim">
		            <input style="display:none" type="text" id="areaaveimarr" name="areaaveim">
		            <input style="display:none" type="text" id="aveconarr" name="avecon">
		            <input style="display:none" type="text" id="areaaveconarr" name="areaavecon">
		            <input style="display:none" type="text" id="versionhidden" name="version">
 
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
                      <th>选择的百分比</th>
                      
                      
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
		<div class="span12">
			
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