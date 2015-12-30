
validationInit = function() {
	// createNewImg();
	
	$('#submitBut').click(function() {
		doValidatton();
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
		$('#submitBut').click();
	}
}

//�ύ
doValidatton = function() {
	

	$('#validationForm').form('submit',{
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
				url : 'hello/checkInfo.php',
				success : function(data) {
					var obj = $.parseJSON(data);
					//console.info(obj);
					backURL="register.jsp";
					if (obj.status =="1") {
						var infoId= obj.entity[0].id;
						//console.info(infoId);
						backURL="register.jsp?infoId="+infoId;
						$.messager.show({
					        title:'warning',
					        msg:'认证成功,可以注册!',
					        timeout:1500,
					        showType:'slide',
					        style:{
					            right:'',
					            
					            bottom:''
					        }
					    });
						var url = 'window.location.href="' + backURL+'"';
						setTimeout(url, 1500);
					} else if(obj.status =="2"){
						$.messager.show({
				        title:'warning',
				        msg:'此信息已被注册！',
				        timeout:1500,
				        showType:'slide',
				        style:{
				            right:'',
				            
				            bottom:''
				        }
				    });
					}else{
						$.messager.show({
					        title:'warning',
					        msg:'认证信息不正确！',
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
