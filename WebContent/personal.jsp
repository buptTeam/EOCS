<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>pernal_information</title>
<style>
.unnamed1 {
border-top-width: 1px;
border-right-width: 1px;
border-bottom-width: 1px;
border-left-width: 1px;
border-top-style: solid;
border-right-style: solid;
border-bottom-style: solid;
border-left-style: solid;
border-top-color: #FFFFFF;
border-right-color: #FFFFFF;
border-bottom-color: #000000;
border-left-color: #FFFFFF;
}

</style>
</head>
<body>
    <div >
    	<font color="red" id="result">
    	
    	</font>
    </div>
<form  id="personalForm" class="form-horizontal" >
   <div class="col-sm-offset-1">
   <font color="red">提示：</font><font>* 为必填项，另外请至少选填一个领域</font>
   </div>
   <hr>
   <div class="form-group">
      <label for="name" class="col-sm-2 control-label">姓&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp名</label>
      <div class="col-sm-3 ">
      <input type="text" class="form-control" id="name" name="name" placeholder="请输入您的姓名" readonly="readonly">
       </div> 
      <font color="red" id="nameResult" style="float:left; " class="col-sm-1">*</font>
      
      <label for="age" class="col-sm-2 control-label">年&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp龄</label>
      <div class="col-sm-3 ">
      <input type="text" class="form-control" id="age" name="age" placeholder="请输入您的年龄">
      </div>
       <font color="red" id="ageResult"  class="col-sm-1" >*</font>

   </div>
   <div class="form-group">
      <label for="name" class="col-sm-2 control-label" style="display:none">学&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp历</label>
      <div class="col-sm-3 ">
      <input type="text" class="form-control" id="education" name="education" style="display:none" placeholder="请输入您的学历">
       </div> 
      <font color="red" id="educationResult" style="display:none;" class="col-sm-1">*</font>
      
      <label for="age" class="col-sm-2 control-label col-sm-offset-1" style="display:none" >联系方式</label>
      <div class="col-sm-3 ">
      <input type="text" class="form-control easyui-validatebox" data-options="validType:['mobile']" id="telephone" name="telephone" style="display:none" placeholder="请输入您的联系方式">
      </div>
       <font color="red" id="telephoneResult"  class="col-sm-1" style="display:none;">*</font>

   </div>
   
   
   
      <div class="form-group">
      <label for="name" class="col-sm-2 control-label">技术职称</label>
      <div class="col-sm-3 ">
      <!--  <input type="text" class="form-control" id="techLevel"  name="techLevel" placeholder="请输入您的技术职称">-->
       	<label><input name="techLevel" type="radio" value="院士" />院士 </label> 
		<label><input name="techLevel" type="radio" value="教授/研究员/主任医师" />教授/研究员/主任医师 </label> <br>
		<label><input id="otherradio" name="techLevel" type="radio" value="其它" />其它 </label>
		<input id="othertext" type="text" class="unnamed1"  />
       </div> 
      <font color="red" id="techLevelResult" class="col-sm-1">*</font>
      
      <label for="age" class="col-sm-2 control-label ">技术职称任职年数</label>
      <div class="col-sm-3 ">
      <input type="text" class="form-control" id="techWorkYears" name="techWorkYears"  placeholder="请输入任职年数">
      </div>
       <font color="red" id="techWorkYearsResult"  class="col-sm-1">*</font>

   </div>
   
   <div class="form-group">
      <label for="name" class="col-sm-2 control-label">行政职务</label>
      <div class="col-sm-3 ">
      <input type="text" class="form-control" id="administrationDuty" name="administrationDuty" placeholder="请输入您的行政职称">
       </div> 
      <font color="red" id="administrationDutyResult"  class="col-sm-1"></font>
      
      <label for="age" class="col-sm-2 control-label ">行政职务任职年数</label>
      <div class="col-sm-3 ">
      <input type="text" class="form-control" id="administrationWorkYear" name="administrationWorkYear"  placeholder="请输入任职年数">
      </div>
       <font color="red" id="administrationWorkYearResult" class="col-sm-1"></font>

   </div>
   
     <div class="form-group">
      <label for="name" class="col-sm-2 control-label" style="display:none">电子邮箱</label>
      <div class="col-sm-3 ">
      <input type="text" class="form-control" id="mail" name="mail" style="display:none" placeholder="请输入您的电子邮箱">
       </div> 
      <font color="red" id="mailResult" style="display:none;" style="display:none" class="col-sm-1">*</font>
      
   </div>
   <div class="form-group">
      <label for="name" class="col-sm-2 control-label">工作单位</label>
      <div class="col-sm-3 ">
      <input type="text" class="form-control" id="workPlace" name="workPlace" placeholder="请输入您的工作单位">
       </div> 
      <font color="red" id="workPlaceResult"  class="col-sm-1">*</font>
      
      <label for="age" class="col-sm-2 control-label col-sm-offset-1" style="display:none" >邮政编码</label>
      <div class="col-sm-3 ">
      <input type="text" class="form-control" id="postcode" name="postcode"  style="display:none" placeholder="请输入所在地邮编">
      </div>
       <font color="red" id="postcodeResult"  class="col-sm-1" style="display:none;">*</font>

   </div>
	<hr />
	<div class="form-group">
		<div style="text-align:center">
			<label for="name" >请填写您所从事的领域和专业（可多选）</label>
		</div>
	</div> 
	
	

	
	<div class="form-group">
		<label for="age" class="col-sm-1 control-label">领域：</label>
		<div class="col-sm-2 checkbox">
      		
      		<label >
      			<input type="checkbox" id="goodatArea1" name="goodatArea1" value="1" > 公共卫生
      		</label>
     
   		</div>
   		<div class="col-sm-5">
   			
   			<div class="col-sm-4 " style="display:none">
   			   <select class="selectpicker" id="area1Majorfirst" name="area1Majorfirst">
   			   		<option>请选择一级专业</option>
    				
    				
  			  </select>
   			</div>
   		
   			<div class="col-sm-8 " style="display:none">
   				<select class="selectpicker" id="area1Majorsecond" name="area1Majorsecond" >
    					<option>请选择二级专业</option>   				
 			 	</select>
   			</div>
   		
   		
   			<!--  <input id="area1Major" name="area1Major" style="display:none"/>-->
   			<label for="age" class="col-sm-4 control-label "  >请填写：</label>
  			 <div class="col-sm-8">
  			 <input type="text" class="form-control" id="area1Major" name="area1Major"  placeholder="专业信息" readonly="readonly"> 
   			</div>
   		</div>
   		<label for="age" class="col-sm-2 control-label">从事年数</label>
      	<div class="col-sm-1 ">
      		<input type="text" class="form-control" id="area1Year"  name="area1Year" value="0" readonly="readonly">
      
     	 </div>
     
	</div>
	
	<div class="form-group">
	<label for="age" class="col-sm-1 control-label">领域：</label>
		<div class="col-sm-2 checkbox">
      		<label>
      			<input type="checkbox" id="goodatArea2" name="goodatArea2" value="1" > 临床医疗
     		 </label>
     
  		 </div>
  		 
  		<div class="col-sm-5">   		
   		<div class="col-sm-4 "style="display:none">
   			   <select class="selectpicker" id="area2Majorfirst" name="area2Majorfirst" >
   			   		<option>请选择一级专业</option>
    				
    				
  			  </select>
   		</div>
   		
   		<div class="col-sm-4 " style="display:none">
   			<select class="selectpicker" id="area2Majorsecond" name="area2Majorsecond" >
    					<option>请选择二级专业</option>
      					
    				
 			 </select>
   		</div>
   			<label for="age" class="col-sm-4 control-label "  >请填写：</label>
   			<div class="col-sm-8" >
  			 <input type="text" class="form-control" id="area2Major" name="area2Major"  placeholder="专业信息" readonly="readonly"> 
   			</div>
   		</div>
   	  <label for="age" class="col-sm-2 control-label">从事年数</label>
      <div class="col-sm-1 ">
      <input type="text" class="form-control" id="area2Year"  name="area2Year" value="0"  placeholder="" readonly="readonly">
      </div>
       
	</div>

	<div class="form-group">
	<label for="age" class="col-sm-1 control-label">领域：</label>
		<div class="col-sm-2 checkbox">
      		<label>
      			<input type="checkbox" id="goodatArea3" name="goodatArea3" value="1" > 行政管理
     		 </label>
     
  		 </div>
  		<div class="col-sm-5">   		
   		<div class="col-sm-4 " style="display:none">
   			   <select class="selectpicker" id="area3Majorfirst" name="area3Majorfirst" >
   			   		<option>请选择一级专业</option>
    				
    				
  			  </select>
   		</div>
   		
   		<div class="col-sm-4 " style="display:none">
   			<select class="selectpicker" id="area3Majorsecond" name="area3Majorsecond" >
    					<option>请选择二级专业</option>
      					
    				
 			 </select>
   		</div>
   		<label for="age" class="col-sm-4 control-label "  >请填写：</label>
   		   	<div class="col-sm-8">
  			 <input type="text" class="form-control" id="area3Major" name="area3Major"  placeholder="专业信息" readonly="readonly"> 
   			</div>
   		</div> 
   	  <label for="age" class="col-sm-2 control-label" >从事年数</label>
      <div class="col-sm-1 ">
      <input type="text" class="form-control"  id="area3Year"  name="area3Year" value="0"  placeholder="" readonly="readonly">
      </div>
       	
	</div>	
	
	<div class="form-group">
	<label for="age" class="col-sm-1 control-label">领域：</label>
		<div class="col-sm-2 checkbox">
      		<label>
      			<input type="checkbox" id="goodatArea4" value="1" name="goodatArea4"> 科学研究
     		 </label>
     
  		 </div>
  		<div class="col-sm-5">     		
   		<div class="col-sm-4 " style="display:none">
   			   <select class="selectpicker" id="area4Majorfirst" name="area4Majorfirst" >
   			   		<option>请选择一级专业</option>
    				
    				
  			  </select>
   		</div>
   		
   		<div class="col-sm-4 " style="display:none">
   			<select class="selectpicker" id="area4Majorsecond" name="area4Majorsecond" >
    					<option>请选择二级专业</option>
      					
    				
 			 </select>
   		</div>
   		<label for="age" class="col-sm-4 control-label "  >请填写：</label>
   		   	<div class="col-sm-8">
  			 <input type="text" class="form-control" id="area4Major" name="area4Major"  placeholder="专业信息" readonly="readonly"> 
   			</div>
   		</div>
   	  <label for="age" class="col-sm-2 control-label">从事年数</label>
      <div class="col-sm-1 ">
      <input type="text" class="form-control"  id="area4Year"  name="area4Year"  value="0" placeholder="" readonly="readonly">
      </div>
       	
	</div>	
	
	
   	<div class="form-group">
   	<label for="age" class="col-sm-1 control-label">领域：</label>
		<div class="col-sm-2 checkbox">
      		<label>
      			<input type="checkbox" id="goodatArea5" name="goodatArea5" value="1" >医学教育
     		 </label>
     
  		 </div>
  		
  		<div class="col-sm-5">    		
   		
   		<div class="col-sm-4 " style="display:none">
   			   <select class="selectpicker" id="area5Majorfirst" name="area5Majorfirst" >
   			   		<option>请选择一级专业</option>
    				
    				
  			  </select>
   		</div>
   		
   		<div class="col-sm-4 " style="display:none">
   			<select class="selectpicker" id="area5Majorsecond" name="area5Majorsecond" >
    					<option>请选择二级专业</option>
      					
    				
 			 </select>
   		</div>
   		<label for="age" class="col-sm-4 control-label "  >请填写：</label>
   		   	<div class="col-sm-8">
  			 <input type="text" class="form-control" id="area5Major" name="area5Major"  placeholder="专业信息" readonly="readonly"> 
   			</div>
   			 
   			 
   		</div>
   		
   		 
   	  <label for="age" class="col-sm-2 control-label">从事年数</label>
      <div class="col-sm-1 ">
      <input type="text" class="form-control"  id="area5Year"  name="area5Year" value="0"  placeholder="" readonly="readonly">
      </div>
       	
	</div>	
	
	
	

   <br>
   <button type="button" id="personalBtn" class="col-sm-offset-5 btn btn-success " style="text-align:center">&nbsp;&nbsp;提&nbsp;交&nbsp;&nbsp;</button>
</form>
</body>
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


    <script type="text/javascript" src="myjs/personal.js"></script>
    <script type="text/javascript">
	$(function(){
  
    personInit();
	});
    </script>
</html>
