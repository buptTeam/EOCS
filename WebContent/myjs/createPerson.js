$(function(){
	bind();
});
bind=function(){
	$('#ceatePersonBtn').click(function(){
		
		check();
  		
	});
};

check=function(){
	if($('#LoginName').val()==""){
		$.messager.show({
	        title:'warning',
	        msg:'登陆名不能为空',
	        timeout:1500,
	        showType:'slide',
	        style:{
	            right:'',
	            
	            bottom:''
	        }
	    });
		return false;
	}
	if($('#password').val()==""){
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
		return false;
	}
	if($('#selectType').val()=="0"){
		$.messager.show({
	        title:'warning',
	        msg:'请选择用户类别',
	        timeout:1500,
	        showType:'slide',
	        style:{
	            right:'',
	          
	            bottom:''
	        }
	    });
		return false;
	}
	$.ajax({
		url : "../hello/LoginNameIsExist.php",
		dataType : "json",
		data: {"LoginName" : $('#LoginName').val()},
		success : function(data) {
			if(data.status=="1"){
				submitCreatePerson();
			}else{
				$.messager.show({
			        title:'warning',
			        msg:'该用户名已被使用',
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
	
};

submitCreatePerson=function(){

	$('#ceatePersonForm').form('submit',{
//		onSubmit : function(param) {
//		var isValid = $(this).form('validate');
//		if(isValid==0){
//			var kon="";
//			
//			if($('#usr')[0].value==kon){
//				//console.info("mobilefdf");
//				$('#usr_blank').css('display','block');
//			}
//				
//			if($('#pwd')[0].value==kon){
//				//console.info("passwdkon");
//				$('#pwd_blank').css('display','block');
//			}
//				
//		}
//		return check();
//	    },
		url : '../hello/addOtherUser.php',
		success : function(data) {
			var obj = $.parseJSON(data);
			//console.info(obj);
			backURL="set_person.jsp";
			if (obj.status =="1") {
				$.messager.show({
			        title:'warning',
			        msg:'添加用户成功',
			        timeout:1500,
			        showType:'slide',
			        style:{
			            right:'',
			            
			            bottom:''
			        }
			    });
				var url = 'window.location.href="' + backURL+'"';
				setTimeout(url, 1500);
			} 
			
		}
	});

};