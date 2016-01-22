<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<%if(request.getSession().getAttribute("userId")==null||((Integer)request.getSession().getAttribute("type"))!=4){ %>
<jsp:forward page="login.jsp"/>
<%} %>
<!DOCTYPE html>
<head>
 <meta http-equiv=Content-Type content="text/html;charset=utf-8">
 <meta http-equiv=X-UA-Compatible content="IE=edge,chrome=1">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <meta content=always name=referrer>
  <meta charset="utf-8">
  <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
  <title>专家咨询系统</title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="viewport" content="width=device-width">        
  <link rel="stylesheet" href="css/templatemo_main.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/gray/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
	
	
  
 
<script type="text/javascript">
    function autoHeight1(){
        var iframe = document.getElementById("personal_frame");//这里括号内的"runtime"其实就是上面的ID，要改成自己上面填写的ID。
        if(iframe.Document){//ie自有属性
            iframe.style.height = iframe.Document.documentElement.scrollHeight;
        }else if(iframe.contentDocument){//ie,firefox,chrome,opera,safari
            iframe.height = iframe.contentDocument.body.offsetHeight ;
        }
    }
</script>
<script type="text/javascript">
    function autoHeight2(){
        var iframe = document.getElementById("question_frame");//这里括号内的"runtime"其实就是上面的ID，要改成自己上面填写的ID。
        if(iframe.Document){//ie自有属性
            iframe.style.height = iframe.Document.documentElement.scrollHeight;
        }else if(iframe.contentDocument){//ie,firefox,chrome,opera,safari
            iframe.height = iframe.contentDocument.body.offsetHeight ;
        }
    }
</script>
<script type="text/javascript">
    function autoHeight3(){
        var iframe = document.getElementById("account_frame");//这里括号内的""其实就是上面的ID，要改成自己上面填写的ID。
        if(iframe.Document){//ie自有属性
            iframe.style.height = iframe.Document.documentElement.scrollHeight;
        }else if(iframe.contentDocument){//ie,firefox,chrome,opera,safari
            iframe.height = iframe.contentDocument.body.offsetHeight ;
        }
    }
</script>
<script type="text/javascript">
    function autoHeight4(){
        var iframe = document.getElementById("completed_question_frame1");//这里括号内的"runtime"其实就是上面的ID，要改成自己上面填写的ID。
        if(iframe.Document){//ie自有属性
            iframe.style.height = iframe.Document.documentElement.scrollHeight;
        }else if(iframe.contentDocument){//ie,firefox,chrome,opera,safari
            iframe.height = iframe.contentDocument.body.offsetHeight ;
        }
    }
    function autoHeight5(){
        var iframe = document.getElementById("completed_question_frame2");//这里括号内的"runtime"其实就是上面的ID，要改成自己上面填写的ID。
        if(iframe.Document){//ie自有属性
            iframe.style.height = iframe.Document.documentElement.scrollHeight;
        }else if(iframe.contentDocument){//ie,firefox,chrome,opera,safari
            iframe.height = iframe.contentDocument.body.offsetHeight ;
        }
    }
</script>

<style>
    
    #confirmModal {position: absolute;left:50%;top:50%; margin-left:-200px;margin-top:-100px} 
</style>


</head>
<body>
   <div class="navbar navbar-inverse" role="navigation" style="height: 80px;">
  	
     <!--  <div class="navbar avbar-default navbar-static-top" role="navigation" style="height: 80px;"> -->
      <div class="navbar-header" style="text-align:center">
         <!--<div class="logo" style="text-align:center"><h1>我国可预防的重大疾病问题的专家咨询系统</h1></div>-->
         <center>
				<br>
					<strong><font face="微软雅黑" color="white" >未来20年我国可预防重大疾病或健康问题专家咨询系统</font>
					</strong>
			</center>
			
			<a href="javascript:;" id="password_change" data-toggle="modal" data-target="#confirmModal2" class="col-sm-offset-10"><font size="3" color="white"><strong>修改密码</strong></font></a>
      </div> 
       
         
    </div>
    <div class="template-page-wrapper">
      <div class="navbar-collapse collapse templatemo-sidebar">
        <ul class="templatemo-sidebar-menu">
          <!--  
          <li>
            <form class="navbar-form">
              <input type="text" class="form-control" id="templatemo_search_box" placeholder="Search...">
              <span class="btn btn-default">Go</span>
            </form>
           
          </li>
           -->
           <li><font size="3">&nbsp;&nbsp;&nbsp;&nbsp;欢迎<strong><%=request.getSession().getAttribute("loginName") %></strong>登录系统</font></li>
           <br>
          <li class="active" id="personal_tab" style="display:none"><a href="#" id="personal_link"><i class="fa fa-male"></i>填写(修改)个人信息</a></li>
          
          <li id="question_tab" style="display:none"><a href="#" id="question_link"><i class="fa fa-pencil-square-o"></i>填写问卷</a></li>
          <li id="scan_question1_tab" style="display:none" ><a href="#" id="scan_question_link1"><i class="fa fa-pencil-square-o"></i>查看问卷（版本1）</a></li>
          <li id="scan_question2_tab" style="display:none"><a href="#" id="scan_question_link2"><i class="fa fa-pencil-square-o"></i>查看问卷（版本2）</a></li>
          <li id="account_tab" style="display:none"><a href="#" id="account_link"><i class="fa fa-cny"></i>账户信息填写</a></li>
          <li id="signout_tab" style="display:none"><a href="javascript:;" id="signout_link" ><i class="fa fa-sign-out"></i>登出系统</a></li>
        </ul>
      </div><!--/.navbar-collapse -->

      <div class="templatemo-content-wrapper">
        <div class="templatemo-content">
         
         	<div id="personal" style="display:block">
				<iframe  id="personal_frame" name="personal_frame" src="personal.jsp" frameborder="0" scrolling="no" style="border:0px;width:100%;" onload="autoHeight1();"></iframe> 
			</div>
			<div id="question" style="display:none;">
				<iframe id="question_frame"  name="question_frame" src="question00.jsp" frameborder="0" scrolling="auto" style="border:0px;width:100%;" onload="autoHeight2();"></iframe>
			</div>
			<div id="question_version2" style="display:none;">
				<iframe id="question2_frame"  name="question_frame" src="question002_1.jsp" frameborder="0" scrolling="auto" style="border:0px;width:100%;" onload="autoHeight2();"></iframe>
			</div>
			<div id="scan_question1" style="display:none;">
				<iframe id="completed_question_frame1"  name="completed_question_frame2" src="question3.jsp" frameborder="0" scrolling="auto" style="border:0px;width:100%;" onload="autoHeight4();"></iframe>
			</div>
			<div id="scan_question2" style="display:none;">
				<iframe id="completed_question_frame2"  name="completed_question_frame2" src="question4.jsp" frameborder="0" scrolling="auto" style="border:0px;width:100%;" onload="autoHeight5();"></iframe>
			</div>
         	<div id="account" style="display:none;">
				<iframe id="account_frame" name="account_frame" src="account.jsp" frameborder="0" scrolling="no" style="border:0px;width:100%;" onload="autoHeight3();"></iframe>
			</div>

         
        </div>
      </div>
      
        <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel" color="red"></h4>
                
                <h4 class="modal-title" >您确定要退出系统吗？</h4>
              </div>
              <div class="modal-footer">
                <a href="login.jsp" class="btn btn-primary" id="signouta">Yes</a>
                
                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
              </div>
            </div>
          </div>
        </div>
      
      <!-- 修改密码 -->
      <form  id="changePasswordForm" class="form-horizontal" >			
        <div class="modal fade" id="confirmModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button id="closechPwdBtn" type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">请修改您的系统密码，如不修改请点击“取消”</h4>
                
              </div>
              <div class="modal-body" >
              
 
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
   
   
 <!-- <button type="button" id="personalBtn" class="btn btn-success btn-sm" align="center" >提交</button> -->



              </div>
              
              
              <div class="modal-footer">
               
                <button type="button" id="changPwdBtn"  class="btn btn-success" >确认</button>
                <button id="cancelBtn" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
              </div>
            </div>
          </div>
        </div>
</form>
      
      
      <footer class="templatemo-footer">
        <div class="templatemo-copyright">
          <p>最终解释权归 <a href="http://www.bjmu.edu.cn/" target="_blank" ><font color="yellow">中国工程院</font></a>&nbsp;所有</p>
        </div>
      </footer>
    </div>

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/Chart.min.js"></script>
    <script src="js/templatemo_script.js"></script>
    
   <script type="text/javascript" src="easyui/jquery.min.js"></script>
   	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
   	  
   <script type="text/javascript" src="myjs/personal.js"></script>
   <script type="text/javascript" src="myjs/home.js"></script>
</body>
</html>
