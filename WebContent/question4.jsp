<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title> questionnaire  fill</title>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link rel="stylesheet" href="dist/css/bootstrap-select.css">
	
	<script src="js/jquery-2.0.3.js"></script>
	
	<!-- <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script> -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
   
    <script src="dist/js/bootstrap-select.js"></script>
    <script src="dist/js/bootstrap-select-backup.js"></script>
  
    <link rel="stylesheet" type="text/css" href="easyui/themes/gray/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
  
 	<script type="text/javascript" src="easyui/jquery.min.js"></script>
   	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>


    <script type="text/javascript" src="myjs/question4.js"></script>
    <script type="text/javascript"></script>
</head>
<body>
   <ul id="questionTab" class="nav nav-tabs">
   		
   		
   		<li class="active"><a href="javascript:;" >第二轮调查您填写的结果</a></li> 
	</ul>
              
              
              <div class="table-responsive">
               
               
                <table class="table table-striped table-hover table-bordered  table-condensed">
                  <thead>
                    <tr>
                      <th>#</th>
                      <th>重大疾病和健康问题</th>
                      <th>熟悉程度</th>
                      <th>重大程度</th>
                      <th>可预防程度</th>
                      
                    </tr>
                  </thead>
                 	<tbody id="tbodytest">
                  		<tr id="tbodytrtest" style="display:none">
                      		<th id="no">1</th>
                      		<th id="illname">肺癌</th>
                      		<th id="familiar">9</th>
                      		<th id="importance">1</th>
                      		<th id="control">3</th>
                      
                    	</tr>
                    		
                 </tbody>
                </table>
               
              </div>
              

</body>
</html>