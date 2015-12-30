<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%if(request.getSession().getAttribute("userId")==null||((Integer)request.getSession().getAttribute("type"))!=3){ 
response.sendRedirect("../login.jsp");
} %>
<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
  <title>专家咨询系统</title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="viewport" content="width=device-width">        
  <link rel="stylesheet" href="../css/templatemo_main.css">

 
<script type="text/javascript">
    function autoHeight1(){
        var iframe = document.getElementById("research_info_frame");//这里括号内的"runtime"其实就是上面的ID，要改成自己上面填写的ID。
        if(iframe.Document){//ie自有属性
            iframe.style.height = iframe.Document.documentElement.scrollHeight;
        }else if(iframe.contentDocument){//ie,firefox,chrome,opera,safari
            iframe.height = iframe.contentDocument.body.offsetHeight ;
        }
    }
</script>

</head>
<body>
   <div class="navbar navbar-inverse" role="navigation" style="height: 80px;">
  	
     <!--  <div class="navbar avbar-default navbar-static-top" role="navigation" style="height: 80px;"> -->
      <div class="navbar-header" style="text-align:center">
         <!--<div class="logo" style="text-align:center"><h1>我国可预防的重大疾病问题的专家咨询系统</h1></div>-->
         <center>
				<br>
					<strong><font face="微软雅黑" color="white" >未来20年我国可预防的重大疾病或健康问题的专家咨询系统</font>
					</strong>
			</center>
			
      </div> 
       
         
    </div>
    <div class="template-page-wrapper">
      <div class="navbar-collapse collapse templatemo-sidebar">
        <ul class="templatemo-sidebar-menu">

          <li class="active" id="research_info_tab"><a href="#" id="financial_info_link"><i class="fa fa-male"></i>查看专家问卷信息</a></li>
          
         
          
          <li id="signout_tab"><a href="javascript:;" data-toggle="modal" data-target="#confirmModal"><i class="fa fa-sign-out"></i>登出系统</a></li>
        </ul>
      </div><!--/.navbar-collapse -->

      <div class="templatemo-content-wrapper">
        <div class="templatemo-content">
         
         	<div id="admin_person" style="display:block">
				<iframe  id="research_info_frame" name="research_info_frame" src="research_info.jsp" frameborder="0" scrolling="auto" style="border:0px;width:100%;" onload="autoHeight1();"></iframe> 
			</div>
			
       
        </div>
      </div>
      
        <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">您确定要退出系统吗？</h4>
              </div>
              <div class="modal-footer">
                <a href="../login.jsp" class="btn btn-primary" id="signouta">Yes</a>
                
                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
              </div>
            </div>
          </div>
        </div>
      
      <footer class="templatemo-footer">
        <div class="templatemo-copyright">
          <p>最终解释权归 <a href="http://www.bjmu.edu.cn/" target="_blank"><font color="yellow">中国工程院</font></a>&nbsp;所有</p>
        </div>
      </footer>
    </div>

    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/Chart.min.js"></script>
    <script src="../js/templatemo_script.js"></script>
    <script type="text/javascript">
       $("#research_info_frame").load(function () {
    	var height = $(this).contents().find("body").height()  + 30;
    	//console.info(mainheight);
    	$(this).height( height < 800 ? 800 : height ); 
    	//console.info("financial_info_frame");
    	//console.info($(this).contents().find("html").height());
    	//console.info($(this).height());
    	});
       $(function(){
    	   $("#signouta").click(function(){
       		$.ajax({
       			url : "../hello/cleanSession.php",
       			dataType : "json",
       			//async:false,
       			success : function(data) {
       				//console.info(data.entity[0]);
       				
       				//hasFilledSurvey = info.hasFillSurvey;
       			}
       		});
       	});
       });
       </script>
</body>
</html>