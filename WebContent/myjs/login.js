
LoginInit = function() {
	// createNewImg();
	
	$('#loginBtn').click(function() {
		dologinBtn();
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
		$('#loginBtn').click();
	}
}

//�ύ
dologinBtn = function() {
	

	$('#LoginForm').form('submit',{
//				onSubmit : function(param) {
//				var isValid = $(this).form('validate');
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
//				return isValid;
//			    },
				url : 'hello/login.php',
				success : function(data) {
					var obj = $.parseJSON(data);
				//	console.info(obj);
					
					if (obj.status =="1") {
						var infoId= obj.entity[0].id;
						//console.info(infoId);
						backURL="home.jsp";
						$.messager.show({
					        title:'warning',
					        msg:'登录成功!',
					        timeout:1500,
					        showType:'slide',
					        style:{
					            right:'',
					           
					            bottom:''
					        }
					    });
						if(obj.entity[0].type==1){
							backURL="admin/adminhome.jsp";
						}else if(obj.entity[0].type==2){
							backURL="financial/financialhome.jsp";
						}
						else if(obj.entity[0].type==3){
							backURL="researcher/researchhome.jsp";
						}
						var url = 'window.location.href="' + backURL+'"';
						setTimeout(url, 1500);
					} else if(obj.status =="7"){
						
						$.messager.alert("操作提示",'因为没有进入第一轮调查，您没有权限进入第二轮调查。','info',function () {
//							var url = 'window.location.href="' + backURL + '"';
//							setTimeout(url, 1500);
				        });
						
//						$.messager.show({
//					        title:'warning',
//					        msg:'因为没有进入第一轮调查，您没有权限进入第二轮调查。',
//					        timeout:1500,
//					        showType:'slide',
//					        style:{
//					            right:'',
//					           
//					            bottom:''
//					        }
//					    });
						
						
					}else{

						$.messager.show({
					        title:'warning',
					        msg:'用户名或密码不正确',
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
