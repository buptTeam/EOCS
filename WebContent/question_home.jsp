<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
   <title> questionnaire  home</title>
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
    function autoHeight1(){
        var iframe = document.getElementById("question0_frame");//这里括号内的"runtime"其实就是上面的ID，要改成自己上面填写的ID。
        if(iframe.Document){//ie自有属性
            iframe.style.height = iframe.Document.documentElement.scrollHeight;
        }else if(iframe.contentDocument){//ie,firefox,chrome,opera,safari
            iframe.height = iframe.contentDocument.body.offsetHeight ;
        }
    }
	</script>
	<script type="text/javascript">
    function autoHeight2(){
        var iframe = document.getElementById("question1_frame");//这里括号内的"runtime"其实就是上面的ID，要改成自己上面填写的ID。
        if(iframe.Document){//ie自有属性
            iframe.style.height = iframe.Document.documentElement.scrollHeight;
        }else if(iframe.contentDocument){//ie,firefox,chrome,opera,safari
            iframe.height = iframe.contentDocument.body.offsetHeight ;
        }
    }
	</script>
	<script type="text/javascript">
    function autoHeight3(){
        var iframe = document.getElementById("question2_frame");//这里括号内的""其实就是上面的ID，要改成自己上面填写的ID。
        if(iframe.Document){//ie自有属性
            iframe.style.height = iframe.Document.documentElement.scrollHeight;
        }else if(iframe.contentDocument){//ie,firefox,chrome,opera,safari
            iframe.height = iframe.contentDocument.body.offsetHeight ;
        }
    }
	</script>
</head>
<body>

<ul id="questionTab" class="nav nav-tabs">
   <li class="active"><a href="question0.jsp" data-toggle="tab">
     	 了解规则</a>
   </li>
   <li><a href="question1.jsp" data-toggle="tab">
     	 生成调查问卷</a>
   </li>
   <li id="litesrt"><a href="question2.jsp" data-toggle="tab">填写调查问卷</a></li>
 
</ul>
<!-- 
<div id="myTabContent" class="tab-content">
   <br>
   <div class="tab-pane fade in active" id="questionnaire_home" >
	  <iframe  id="question0_frame" name="question0_frame" src="question0.jsp" frameborder="0" scrolling="no" style="border:0px;width:100%;" onload="autoHeight1();"></iframe> 
   </div>
   <div class="tab-pane fade" id="questionnaire_generating">
      <iframe  id="question1_frame" name="question1_frame" src="question1.jsp" frameborder="0" scrolling="no" style="border:0px;width:100%;" ></iframe> 
   </div>
   <div class="tab-pane fade" id="questionnaire_fill">
      <iframe  id="question2_frame" name="question2_frame" src="question2.jsp" frameborder="0" scrolling="no" style="border:0px;width:100%;" ></iframe> 
   </div>

</div>
 -->
<!--  
<script type="text/javascript">
  
	$("#question0_frame").load(function () {
   	var mainheight = $(this).contents().find("html").css("height")  ;

   	 //console.info("find height");
   	 //console.info(mainheight);
   	 
   	 $(this).css("height",mainheight);
   });
   
   $("#question1_frame").load(function () {
   	var mainheight = $(this).contents().find(".container-fluid").height()  + 30;
   	//console.info(mainheight);
   	 $(this).height(mainheight);
   });
   $("#question2_frame").load(function () {
	   	var mainheight = $(this).contents().find(".container-fluid").height()  + 30;
	   	//console.info(mainheight);
	   	 $(this).height(mainheight);
	   });
</script>
-->
</body>
</html>