<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%if(request.getSession().getAttribute("userId")==null||((Integer)request.getSession().getAttribute("type"))!=1){ 
response.sendRedirect("../login.jsp");
} %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
  <title>专家咨询系统</title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="viewport" content="width=device-width">        
  <link rel="stylesheet" href="../css/templatemo_main.css">

 
<script type="text/javascript">
    function autoHeight1(){
        var iframe = document.getElementById("admin_person_frame");//这里括号内的"runtime"其实就是上面的ID，要改成自己上面填写的ID。
        if(iframe.Document){//ie自有属性
            iframe.style.height = iframe.Document.documentElement.scrollHeight;
        }else if(iframe.contentDocument){//ie,firefox,chrome,opera,safari
            iframe.height = iframe.contentDocument.body.offsetHeight ;
        }
    }
</script>
<script type="text/javascript">
    function autoHeight2(){
        var iframe = document.getElementById("admin_version_frame");//这里括号内的"runtime"其实就是上面的ID，要改成自己上面填写的ID。
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
			<a href="javascript:;" id="password_change" data-toggle="modal" data-target="#confirmModal2" class="col-sm-offset-10"><font size="3" color="white"><strong>修改密码</strong></font></a>
      </div> 
       
         
    </div>
    <div class="template-page-wrapper">
      <div class="navbar-collapse collapse templatemo-sidebar">
        <ul class="templatemo-sidebar-menu">

          <li class="active" id="admin_person_tab"><a href="#" id="admin_person_link"><i class="fa fa-male"></i>查看系统人员</a></li>
          
          <li id="admin_version_tab"><a href="#" id="admin_version_link"><i class="fa fa-pencil-square-o"></i>设置版本号</a></li>
          
          <li id="signout_tab"><a href="javascript:;" data-toggle="modal" data-target="#confirmModal"><i class="fa fa-sign-out"></i>登出系统</a></li>
        </ul>
      </div><!--/.navbar-collapse -->

      <div class="templatemo-content-wrapper">
        <div class="templatemo-content">
         
         	<div id="admin_person" style="display:block">
				<iframe  id="admin_person_frame" name="admin_person_frame" src="set_person.jsp" frameborder="0" scrolling="no" style="border:0px;width:100%;" onload="autoHeight1();"></iframe> 
			</div>
			<div id="admin_version" style="display:none;">
				<iframe id="admin_version_frame" name="admin_version_frame" src="set_version.jsp" frameborder="0" scrolling="no" style="border:0px;width:100%;" onload="autoHeight2();"></iframe>
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
      
      
      
           <form  id="changePasswordForm" class="form-horizontal" >			
        <div class="modal fade" id="confirmModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button id="closechPwdBtn" type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">请修改您的系统登录密码</h4>
                
              </div>
              <div class="modal-body" >
              
 
   <div class="form-group">
      <label for="password" class="col-sm-4 control-label"><font size="4">登录密码</font></label>
      <div class="col-sm-5 ">
      <input type="password"  class="form-control" id="password" name="password" placeholder="请输入您的密码" >
       </div> 
      
   </div>
   
   <div class="form-group">
    	<label for="confirmpassword" class="col-sm-4 control-label "  ><font size="4">确认密码</font></label>
      	<div class="col-sm-5 ">
      	<input type="password"  class="form-control easyui-validatebox"  id="password1" name="confirmpassword"  placeholder="请再次输入您的密码" >
      	</div>
       	
   </div>
   
   
 <!-- <button type="button" id="personalBtn" class="btn btn-success btn-sm" align="center" >提交</button> -->



              </div>
              
              
              <div class="modal-footer">
               
                <button type="button" id="changPwdBtn"  class="btn btn-success" >确认</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
              </div>
            </div>
          </div>
        </div>
</form>
      
      
      
      
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
    <link rel="stylesheet" type="text/css" href="../easyui/themes/gray/easyui.css">
    <link rel="stylesheet" type="text/css" href="../easyui/themes/icon.css">
   <script type="text/javascript" src="../easyui/jquery.min.js"></script>
   	<script type="text/javascript" src="../js/jquery.js"></script>
	<script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript">

    
    $(document).ready(function(){
    	
    	$('#changPwdBtn').click(function(){
	    	if($('#password').val()==''){
	    		$.messager.show({
	    	        title:'warning',
	    	        msg:'密码不能为空',
	    	        timeout:1500,
	    	        showType:'slide',
	    	        style:{
	    	            right:'',
	    	            
	    	            bottom:''
	    	        }
	    	    });
	    		return 0;
	    	}
	    	if(!($('#password').val()==$('#password1').val())){
	    		$.messager.show({
	    	        title:'warning',
	    	        msg:'两次密码不相同！',
	    	        timeout:1500,
	    	        showType:'slide',
	    	        style:{
	    	            right:'',
	    	            
	    	            bottom:''
	    	        }
	    	    });
	    		return 0;
	    	}
	    	$('#changePasswordForm').form('submit',{
//				onSubmit : function(param) {
//				//var isValid = $(this).form('validate');
//					
//				if(isValid==0){
//					var kon="";
//					
//					if($('#usr')[0].value==kon){
//						//console.info("mobilefdf");
//						$('#usr_blank').css('display','block');
//					}
//						
//					if($('#pwd')[0].value==kon){
//						//console.info("passwdkon");
//						$('#pwd_blank').css('display','block');
//					}
//						
//				}
//				
//				return checkRegister();
//			    },
				url : '../hello/changePwd.php',
				success : function(data) {
					var obj = $.parseJSON(data);
					
					if (obj.status =="1") {
						$.messager.show({
					        title:'warning',
					        msg:'密码修改成功',
					        timeout:1500,
					        showType:'slide',
					        style:{
					            right:'',
					            
					            bottom:''
					        }
					    });
					$('#closechPwdBtn').click();
					
					} else{
						$.messager.show({
					        title:'warning',
					        msg:'密码修改失败',
					        timeout:1500,
					        showType:'slide',
					        style:{
					            right:'',
					           
					            bottom:''
					        }
					    });
					}
					
				}
			});
	    });
    	
    	
    	
    	
		$('#admin_person_link').click(function(){
			$('#admin_person_tab').addClass("active");
			$('#admin_version_tab').removeClass("active");
			
			$('#admin_version').css("display","none");

			if(!$('#admin_person').is(":visible")){
				$('#admin_person').toggle();
			}
		});
		$('#admin_version_link').click(function(){
			$('#admin_person_tab').removeClass("active");
			$('#admin_version_tab').addClass("active");			
			$('#admin_person').css("display","none");
			if(!$('#admin_version').is(":visible")){
				$('#admin_version').toggle();
			}
		});	
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
   
    $("#admin_person_frame").load(function () {
 	var height = $(this).contents().find("body").height()  + 30;
 	//console.info(mainheight);
 	$(this).height( height < 800 ? 800 : height ); 
 	//console.info("financial_info_frame");
 	//console.info($(this).contents().find("html").height());
 	//console.info($(this).height());
 	});
    
    
   
  </script>
</body>
</html>
