<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <meta charset="utf-8">

    
    <title>菜单-menu</title>
		<meta name="keywords" content="" />
  		<meta name="description" content="" />
  		<meta name="viewport" content="width=device-width">   
		<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
		<script src="../js/jquery-2.0.3.js"></script>
		<script src="../bootstrap/js/bootstrap.min.js"></script>
		<script src="../js/templatemo_script.js"></script>
		<script src="../js/jquery.min.js"></script>
</head>
<body>
      <div class="navbar-collapse collapse templatemo-sidebar">
        <ul class="templatemo-sidebar-menu">

          <li class="active" id="personal_tab"><a href="#" id="personal_link"><i class="fa fa-male"></i>填写个人信息</a></li>
          
          <li id="question_tab"><a href="#" id="question_link"><i class="fa fa-pencil-square-o"></i>填写问卷</a></li>
          <li id="account_tab"><a href="#" id="account_link"><i class="fa fa-cny"></i>账户信息填写</a></li>
          <li id="signout_tab"><a href="javascript:;" data-toggle="modal" data-target="#confirmModal"><i class="fa fa-sign-out"></i>Sign Out</a></li>
        </ul>
      </div><!--/.navbar-collapse -->
      
      
      <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">Are you sure you want to sign out?</h4>
              </div>
              <div class="modal-footer">
                <a href="sign-in.html" class="btn btn-primary">Yes</a>
                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
              </div>
            </div>
          </div>
        </div>
        
        

  <script type="text/javascript">

    
    $(document).ready(function(){
		$('#personal_link').click(function(){
			$('#personal_tab').addClass("active");
			$('#question_tab').removeClass("active");
			$('#account_tab').removeClass("active");
			
		});
		$('#question_link').click(function(){
			$('#personal_tab').removeClass("active");
			$('#question_tab').addClass("active");
			$('#account_tab').removeClass("active");
			
		});
		$('#account_link').click(function(){
			$('#personal_tab').removeClass("active");
			$('#question_tab').removeClass("active");
			$('#account_tab').addClass("active");
			
		});
	});
    
  </script>

</body>
<!--
<body bgcolor="#E0EEEE">

<div id="my_menu" class="sdmenu">
	<div>
		<span>量表管理</span>
		<a href="testPaper/setpaper_step1.jsp" target="myframe">新建量表</a>
		<a href="testPaper/paperselect.jsp" target="myframe">量表查询</a>
		<a href="testPaper/paperselect.jsp" target="myframe">量表操作</a>
	</div>
	<div>
		<span>统计管理</span>
		<a href="stat/stat.jsp" target="myframe">统计查询</a>
	</div>
	<div>
		<span>学生管理</span>
		<a href="stat/studentselect.jsp" target="myframe">学生信息查看</a>
	</div>
	<div>
		<span>咨询预约</span>
		<a href="http://localhost:8080/reserve"  target="_top">进入咨询预约后台</a>
		<a href="http://localhost:8080/reserve/test.jsp"  target="myframe">查看已预约记录</a>
	</div>
	<div>
		<span>操作</span>
		<a href="mainpage/right.html" target="myframe">返回首页</a>
	</div>
</div>
-->

</html>