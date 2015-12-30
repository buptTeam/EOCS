
RegisterInit = function() {
	// createNewImg();
	
	$('#registerBtn').click(function() {
		//console.info("ff");
		checkRegister();
	});
//	$('#usr').keyup(function() {
//		$('#usr_blank').css('display','none');
//	});
//	$('#usr').change(function() {
//		$('#usr_blank').css('display','none');
//	});
//	$('#pwd').keyup(function() {
//		$('#pwd_blank').css('display','none');
//		$('#incorrect').css('display','none');
//		
//	});
//	$('#pwd').change(function() {
//		$('#pwd_blank').css('display','none');
//		$('#incorrect').css('display','none');
//		
//	});
	
};

//����
function fnKeyDown(evt) {
	evt = (evt) ? evt : ((window.event) ? window.event : "");
	var key = evt.keyCode ? evt.keyCode : evt.which;
	if (key == 13) {
		$('#registerBtn').click();
	}
}

//�ύ
doregisterBtn = function() {
	
//console.info("click");
	$('#registerForm').form('submit',{
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
				url : 'hello/ExpertRegistry.php',
				success : function(data) {
					var obj = $.parseJSON(data);
					//console.info(obj);
					backURL="login.jsp";
					if (obj.status =="1") {
						var infoId= obj.entity[0].id;
						//console.info(infoId);
						backURL="login.jsp";
						$.messager.show({
					        title:'warning',
					        msg:'注册成功！',
					        timeout:1500,
					        showType:'slide',
					        style:{
					            right:'',
					           
					            bottom:''
					        }
					    });
						var url = 'window.location.href="' + backURL+'"';
						setTimeout(url, 1500);
					} else{
						$.messager.show({
					        title:'warning',
					        msg:'注册失败',
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
};

checkRegister=function(){
	var flag=1;
	//console.info("hello"+$('#username').val());
	if($('#username').val()==''){
		$.messager.show({
	        title:'warning',
	        msg:'用户名不能为空',
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
	$.ajax({
		url : "hello/LoginNameIsExist.php",
		dataType : "json",
		data: {"LoginName" : $('#username').val()},
		success : function(data) {
			if(data.status=="1"){
				doregisterBtn();
			}else{
				$.messager.show({
			        title:'warning',
			        msg:'该用户名已被注册！',
			        timeout:1500,
			        showType:'slide',
			        style:{
			            right:'',
			           
			            bottom:''
			        }
			    });
				return 0;
			}
		}
	});
	return 1;
};
