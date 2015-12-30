$(function(){
	$("#toConfirm").click(function(){
	$.ajax({
		url : "../hello/exportData.php",

		data: {"type": 3},
		dataType : "json",
		success : function(data) {
			var status=data.status;
			if (status == 1){
				$.messager.show({
					title : '提示！',
					msg : '数据生成成功，请到点击“下载数据”按钮进行下载',
					timeout : 2500,
					showType : 'slide',
					style : {
						right : '',
						
						bottom : ''
					}
				});
			}else{
				$.messager.show({
					title : '提示！',
					msg : '数据导出失败，请联系管理员',
					timeout : 2500,
					showType : 'slide',
					style : {
						right : '',
						
						bottom : ''
					}
				});
			}			
		}
	});
	});
	
	bind();
	itemInit();
});
bind=function(){
	$('#createBtn').click(function(){
		backURL="create_person.jsp";
		var url = 'window.location.href="' + backURL+'"';
		setTimeout(url, 100);
	});
	$('#adminchangePasswordBtn').click(function(){
		//console.info("hello"+$('#admininputUsername').val());
		$.ajax({
			url : "../hello/adminGetUserPasswd.php",
			data: {"userName": $('#admininputUsername').val()},
			dataType : "json",
			success : function(data) {
				//console.info(data);
				var entity=data.entity;
				//console.info(entity);
				if(entity.length==0){
					$('#adminUserPassword').text("没有该用户，请重新输入");
				}else{
					$('#adminUserPassword').text("用户密码："+entity[0].password);
				}
			}
		});
	});
	$('#adminResetUsersPasswordBtn').click(function(){
		//console.info("hello"+$('#admininputUsername').val());
		if($('#adminResetUsersPassword').val()==''){
			$('#resetinfo').text("密码不能为空");
		}else{
			$.ajax({
				url : "../hello/adminResetUserPasswd.php",
				data: {"password": $('#adminResetUsersPassword').val()},
				dataType : "json",
				success : function(data) {
					if(data.status=="1"){
						$('#resetinfo').text("密码重置成功");
					}else{
						$('#resetinfo').text("密码重置失败");
					}
				}
			});
		}
			
		
	});
	
	
};
itemInit=function(){
	$.ajax({
		url : "../hello/getOterUserInfo.php",
		dataType : "json",
		success : function(data) {
			//console.info(data);
			var entity=data.entity;
			
			for(var i=0;i<entity.length;i++){
				//console.info("hello"+i);
				var ele=$('#itemTest').clone(true);
				ele.attr("id","itemFormal");
				ele.find('#name').html(entity[i].loginName);
				ele.find('#password').html(entity[i].password);
				if(entity[i].type==2){
					ele.find('#type').html("财务人员");
				}else if(entity[i].type==3){
					ele.find('#type').html("研究人员");
				}
				ele.find('#userid').html(entity[i].id);
				//ele.css("display",'');
				ele.show();
				$('#itemtbody').append(ele);
				
				//ele.insertAfter($('#itemTest'));
			}
			$('#itemTest').hide();
		}
	});
};


