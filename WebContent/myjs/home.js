

$(document).ready(function(){
	//var personalbtn = $("#personal_frame").contents().find("#personalBtn").size();
	//console.info("this is " + personalbtn);
	//$("#personalBtn", document.frames("personal_frame").document)
	
	$('#changPwdBtn').click(function(){
	    	if($('#password').val()==''){
	    		$.messager.show({
	    	        title:'warning',
	    	        msg:'<font size="3">密码不能为空</font>',
	    	        timeout:1500,
	    	        showType:'slide',
	    	        style:{
	    	            right:'',
	    	           
	    	            bottom:''
	    	        }
	    	    });
	    		return 0;
	    	}
	    	var str=$('#password').val();
	    	if(str.length<6){
	    		$.messager.show({
	    	        title:'warning',
	    	        msg:'<font size="3">密码长度不能小于6位</font>',
	    	        timeout:1500,
	    	        showType:'slide',
	    	        style:{
	    	            right:'',
	    	           
	    	            bottom:''
	    	        }
	    	    });
	    		return 0;
	    	}
	    	var number=0;
	    	var letter=0;
	    	for(var i=0;i<str.length;i++){
	    	   if( str[i]>=0&&str[i]<=9)
	    		   number+=1;
	    	   if( str[i]>='a'&&str[i]<='z'||str[i]>='A'&&str[i]<='Z')
	    		   letter+=1;
	    	}
	    	if(number<1){
	    		$.messager.show({
	    	        title:'warning',
	    	        msg:'<font size="3">密码至少包含一个数字</font>',
	    	        timeout:1500,
	    	        showType:'slide',
	    	        style:{
	    	            right:'',
	    	            
	    	            bottom:''
	    	        }
	    	    });
	    		return 0;
	    	}
	    	if(letter<1){
	    		$.messager.show({
	    	        title:'warning',
	    	        msg:'<font size="3">密码至少包含一个字母</font>',
	    	        timeout:1500,
	    	        showType:'slide',
	    	        style:{
	    	            right:'',
	    	            
	    	            bottom:''
	    	        }
	    	    });
	    		return 0;
	    	}
	    	if($('#password').val()==''){
	    		$.messager.show({
	    	        title:'warning',
	    	        msg:'<font size="3">密码不能为空</font>',
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
	    	        msg:'<font size="3">两次密码不相同！</font>',
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
				url : 'hello/changePwd.php',
				success : function(data) {
					var obj = $.parseJSON(data);
					$('#cancelBtn').css('display','');
					$('#closechPwdBtn').css('display','');
					if (obj.status =="1") {
						$.messager.show({
					        title:'warning',
					        msg:'<font size="3">密码修改成功</font>',
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
					        msg:'<font size="3">密码修改失败</font>',
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
	    $.ajax({
			url : "hello/haschangPwd.php",
			dataType : "json",
			//async:false,
			success : function(data) {
				//console.info(data.entity[0]);
				if(data.entity[0].hasChanged==0){
					//console.info("hekkkkkk"+$('#password_change').size());
					document.getElementById("password_change").click();
					//$('#cancelBtn').css('display','none');
				//	$('#closechPwdBtn').css('display','none');
					
				}
				//hasFilledSurvey = info.hasFillSurvey;
			}
		});
	    
	  
	
	    
	    
    	var info = checkFlow();
		//var name = info.name;
		var hasFilledSurvey1 = info.hasFillSurvey;
		var hasFilledSurvey2 = info.hasFillSurvey2;
		//var hasFillBankinfo = info.hasFillBankinfo;
		var currentVersion = getSysCurrentVersion();
		//console.info("hasFilledSurvey1:"+hasFilledSurvey1);
		//console.info("hasFilledSurvey2:"+hasFilledSurvey2);
		//console.info("currentVersion:"+currentVersion);
		
		if(currentVersion == 1 && hasFilledSurvey1 == 0){
			
			$("#scan_question1_tab").css("display","none");
			$("#scan_question2_tab").css("display","none");
			$("#question_tab").css("display","");
			
			$("#personal_tab").css("display","");
			$("#account_tab").css("display","");
			$("#signout_tab").css("display","");
			
		}else if(currentVersion == 1 && hasFilledSurvey1 == 1){
			$("#personal_tab").css("display","");
			$("#account_tab").css("display","");
			$("#signout_tab").css("display","");
			
			$("#scan_question1_tab").css("display","");
			$("#scan_question2_tab").css("display","none");
			$("#question_tab").css("display","none");
		}else if(currentVersion == 2 && hasFilledSurvey2 == 0){
			//console.info("naaaaaaaaininini"+$("#scan_question1_tab").size());
			$("#question_tab").addClass("active");
			$("#question_tab").show();
			$("#personal_tab").css("display","none");
			$("#account_tab").css("display","none");
			$("#scan_question1_tab").css("display","none");
			$("#scan_question2_tab").css("display","none");
			$("#personal").css("display","none");
			$("#question_version2").css("display","");
			$("#signout_tab").css("display","");
			
		}else{
			//console.info("nininini");
			$("#scan_question2_tab").addClass("active");			
			$("#scan_question2_tab").show();
			$("#personal_tab").css("display","none");
			$("#scan_question1_tab").css("display","none");			
			$("#question_tab").css("display","none");
			$("#account_tab").css("display","none");
			
			
			$("#personal").css("display","none");
			
			$("#scan_question2").css("display","");
			$("#signout_tab").css("display","");
		}
		
    	$('#signout_link').click(function(){
    		var info = checkFlow();
    		var name = info.name;
    		var hasFilledSurvey1 = info.hasFillSurvey;
    		var hasFilledSurvey2 = info.hasFillSurvey2;
    		var hasFillBankinfo = info.hasFillBankinfo;
    		var currentVersion = getSysCurrentVersion();
    		//console.info("this is sign out : "+hasFilledSurvey2);
			var warning_info = null;
			if(name == '' || name == null ){
				warning_info = "您的基本信息没有填写！";
			}else if(hasFilledSurvey1 == 0 && currentVersion == 1){
				warning_info = "您的问卷没有提交！";
			}else if(hasFilledSurvey2 == 0 && currentVersion == 2){
				warning_info = "您的版本二的问卷没有提交！";
			}else if(hasFillBankinfo == 0){
				warning_info = "您的转账信息没有填写！";
			}else if(currentVersion==2&&hasFilledSurvey2 == 1){
				warning_info = "感谢您完成第二轮调查！";
			}else{
				warning_info = "感谢您的积极参与！";
			}
			$("#myModalLabel").text(warning_info);
			 $.messager.confirm('操作提示', warning_info+"确定登出系统请点击“Ok”！", function(r){
	                if (r){
	                	$.ajax({
	            			url : "hello/cleanSession.php",
	            			dataType : "json",
	            			//async:false,
	            			success : function(data) {
	            				//console.info(data.entity[0]);
	            				backURL="login.jsp";
	        					var url = 'window.location.href="' + backURL + '"';
	        					setTimeout(url, 500);
	            				//hasFilledSurvey = info.hasFillSurvey;
	            			}
	            		});
	                }
	            });
    	});
    	$("#signouta").click(function(){
    		$.ajax({
    			url : "hello/cleanSession.php",
    			dataType : "json",
    			//async:false,
    			success : function(data) {
    				//console.info(data.entity[0]);
    				
    				//hasFilledSurvey = info.hasFillSurvey;
    			}
    		});
    	});
    	
    	$('#personal_link').click(function(){
			$('#personal_tab').addClass("active");
			$('#question_tab').removeClass("active");
			$('#account_tab').removeClass("active");
			$('#scan_question1_tab').removeClass("active");
			$('#scan_question2_tab').removeClass("active");
			
			$('#question').css("display","none");
			$('#account').css("display","none");
			$('#scan_question1').css("display","none");
			$('#scan_question2').css("display","none");
			
			if(!$('#personal').is(":visible")){
				$('#personal').toggle();
			}
		});
    	
    	$('#scan_question_link1').click(function(){
			$('#personal_tab').removeClass("active");
			$('#question_tab').removeClass("active");
			$('#account_tab').removeClass("active");
			$('#scan_question1_tab').addClass("active");
			$('#scan_question2_tab').removeClass("active");
			
			$('#personal').css("display","none");
			$('#question').css("display","none");
			$('#account').css("display","none");
			//$('#scan_question1').css("display","none");
			$('#scan_question2').css("display","none");
			
			if(!$('#scan_question1').is(":visible")){
				$('#scan_question1').toggle();
			}
		});
    	
    	$('#scan_question_link2').click(function(){
			$('#personal_tab').removeClass("active");
			$('#question_tab').removeClass("active");
			$('#account_tab').removeClass("active");
			$('#scan_question2_tab').addClass("active");
			$('#scan_question1_tab').removeClass("active");
			
			$('#personal').css("display","none");
			$('#question').css("display","none");
			$('#account').css("display","none");
			//$('#scan_question1').css("display","none");
			$('#scan_question1').css("display","none");
			
			if(!$('#scan_question2').is(":visible")){
				$('#scan_question2').toggle();
			}
		});
    	
		$('#question_link').click(function(){
			//var name = checkFlow(1);
			//var hasFilledSurvey = checkFlow(2);
			//var currentVersion= getSysCurrentVersion();
			var info = checkFlow();
			var name = info.name;
			
			if(name == '' || name == null){
				var result = "您的基本信息没有填写，请填写！";
				show(result);
			}else{
				
				$('#personal_tab').removeClass("active");
				$('#question_tab').addClass("active");
				$('#account_tab').removeClass("active");
				$('#scan_question1_tab').removeClass("active");
				$('#scan_question2_tab').removeClass("active");
				
				$('#scan_question1').css("display","none");
				$('#scan_question2').css("display","none");
				$('#personal').css("display","none");
				$('#account').css("display","none");
				if(!$('#question').is(":visible")){
					$('#question').toggle();
				}
				//加上了版本二的控制，基本逻辑：版本二能够重新在提交一次。
				
				//else if( hasFilledSurvey1 == 1 && currentVersion == 1){
				//	if(!$('#completed_question').is(":visible")){
				//		$('#completed_question').toggle();
				//	}
				//}else if(hasFilledSurvey2 == 0 && currentVersion == 2){
				//	if(!$('#question').is(":visible")){
				//		$('#question').toggle();
				//	}
				//}else{
				//	if(!$('#completed_question2').is(":visible")){
				//		$('#completed_question2').toggle();
				//	}
				//}
				
			}
			
		});
		$('#account_link').click(function(){
			//var name = checkFlow(1);
			//var hasFilledSurvey = checkFlow(2);
			var info = checkFlow();
			var name = info.name;
			var hasFilledSurvey1 = info.hasFillSurvey;
			//var hasFilledSurvey2 = info.hasFillSurvey2;
			//var hasFillBankinfo = info.hasFillBankinfo;
			//var currentVersion = getSysCurrentVersion();
			if(name == '' || name == null ){
				var result = "您的基本信息没有填写，请填写！";
				show(result);
			}else if(hasFilledSurvey1 == '' || hasFilledSurvey1 == 0){
				var result = "您的问卷尚未提交，无法进行账户信息填写！";
				show(result);
			}else{
				$('#personal_tab').removeClass("active");
				$('#question_tab').removeClass("active");
				$('#account_tab').addClass("active");
				
				$('#scan_question1_tab').removeClass("active");
				$('#scan_question2_tab').removeClass("active");
				
				$('#scan_question1').css("display","none");
				$('#scan_question2').css("display","none");
				$('#personal').css("display","none");
				$('#question').css("display","none");
				
				if(!$('#account').is(":visible")){
					$('#account').toggle();
				}
			}
			
			
		});
		
		 
	});



function show(result) {
	$.messager.show({
		title : 'warning',
		msg : '<font size="3">'+ result +'</font>',
		timeout : 1500,
		showType : 'slide',
		style : {
			right : '',
			
			bottom : ''
		}
	});
};


$("#personal_frame").load(function(){ 
	var height = $(this).contents().find("body").height() + 40; 
	//这样给以一个最小高度 
	if(height<500){
		height=700;
	}else if(height > 2000){
		height= 700;
	}
	$(this).height( height); 
});

$("#question_frame").load(function () {
	var height = $(this).contents().find("body").height()  + 30;
	//console.info(mainheight);
	$(this).height( height < 800 ? 800 : height ); 
	//console.info("question_frame");
	//console.info($(this).contents().find("html").height());
	//console.info($(this).height());
});

$("#question2_frame").load(function () {
	var height = $(this).contents().find("body").height()  + 30;
	//console.info(mainheight);
	$(this).height( height < 800 ? 800 : height ); 
	//console.info("question_frame");
	//console.info($(this).contents().find("html").height());
	//console.info($(this).height());
});

$("#account_frame").load(function(){ 
	var height = $(this).contents().find("body").height() + 40; 
	//这样给以一个最小高度 
	if(height<500){
		height=700;
	}else if(height > 2000){
		height= 700;
	}
	$(this).height( height); 
}); 
	
	


checkFlow = function() {
	//console.info("checkFlow");
	//var name = null;
	//var hasFilledSurvey = null;
	var info = null;
	$.ajax({
		url : "hello/getUserInfo.php",
		dataType : "json",
		async:false,
		success : function(data) {
			//console.info(data.entity[0]);
			var ent = data.entity[0];
			info = ent;
			//hasFilledSurvey = info.hasFillSurvey;
		}
	});
	return info;
};

getSysCurrentVersion = function(){
	$.ajax({
		url : "hello/getsysVersion.php",
		async:false,
		dataType : "json",
		success : function(data) {
			//console.info("hellofanhui");
			var entity=data.entity;
			var version = entity[0].version;
			//console.info("currentVersion  : "+currentVersion);
			currentVersion = version;		
		}
	});
	return currentVersion;
};
