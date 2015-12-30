$(function() {
	
	var currentver = getSysCurrentVersion();
//	if(currentver == 1){
//		var trs=$('.tr');
//		for(var i=0;i<trs.size();i++){
//			trs.eq(i).find("#warning").css("display","none");
//			trs.eq(i).find("#div_familiarave").css("display","none");
//			trs.eq(i).find("#div_importanceave").css("display","none");
//			trs.eq(i).find("#div_controlave").css("display","none");
//		}
////		$("#warning").css("display","none");
////		$("#div_familiarave").css("display","none");
////		$("#div_importanceave").css("display","none");
////		$("#div_controlave").css("display","none");
//	}else 
		if(currentver == 2){
			$("#shuoming").text("第二轮调查说明");
			var trs=$('.tr');
			for(var i=0;i<trs.size();i++){
				
				trs.eq(i).find("#div_familiarave").css("display","");
				trs.eq(i).find("#div_importanceave").css("display","");
				trs.eq(i).find("#div_controlave").css("display","");
			}
		$("#warning").css("display","");
//		$("#div_familiarave").css("display","");
//		$("#div_importanceave").css("display","");
//		$("#div_controlave").css("display","");
		//fillaverage();
	}
	
	$('#submitremarkBtn').click(function() {
		check();
		
		var currentVersion = getSysCurrentVersion();
		$.ajax({
			url : "hello/getUserInfo.php",
			
			dataType : "json",
			success : function(data) {
				//console.info("this is oncheck");
				//console.info(data);
				var entity=data.entity;
				var has_filled = entity[0].hasFillSurvey;
				//console.info("has filled  "+ has_filled);
				if (has_filled == 0 ||(has_filled ==1 && currentVersion == 2)){
					dosubmitremarkBtn();
					
					
				}
				if(has_filled ==1 && currentVersion == 1){
					$.messager.show({
						title : 'warning',
						msg : '<font size="3">您已经提交问卷，不可再次提交！</font>',
						
						
						timeout : 1500,
						showType : 'slide',
						
						style : {
							
							right : '',
							
							bottom : ''
						}
					});
					backURL="question3.jsp";
					var url = 'window.location.href="' + backURL + '"';
					setTimeout(url, 1500);
					
				}
				//加上版本二的逻辑。
				if(has_filled == 2 && currentVersion == 2){
					$.messager.show({
						title : 'warning',
						msg : '<font size="3">您已经提交问卷，不可再次提交！</font>',
						timeout : 1500,
						showType : 'slide',
						style : {
							right : '',
							
							bottom : ''
						}
					});
					backURL="question3.jsp";
					var url = 'window.location.href="' + backURL + '"';
					setTimeout(url, 1500);
				}
				
			}
			
		});
		
		
	});
	
});

check = function(){
	var flag = true;
	var result = "";
	var entity = $(".form-control");
	var length = $(".form-control").size();
	//console.info("this is  form-control  " );
	
	//console.info(entity.eq(0).attr("value") );
	reg =/^[0-9]$/;
	for (var i=0; i<length; i++){
		entity.eq(i).removeClass("alert alert-warning");
	}
	for (var i=0; i<length; i++){
		if(entity.eq(i).attr("value") == null || entity.eq(i).attr("value") == ''){
			result = result + "您的输入为空，不能提交问卷！";
			flag = false;
			entity.eq(i).addClass("alert alert-warning");
			show(result);
			return flag;
		}else if(!reg.test(entity.eq(i).attr("value"))){
			result = result + "您的输入非法，请输入0-9之间的数字！";
			flag = false;
			entity.eq(i).addClass("alert alert-warning");
			show(result);
			return flag;
		}
	}
	
};

function show(result) {
	$.messager.show({
		title : 'warning',
		msg : '<font size="3">' +result + '</font>',
		timeout : 1500,
		
		
		
		showType : 'fade',
		style : {
			 right:'',
             bottom:''
		}
	});
};

dosubmitremarkBtn = function() {
	$('#submitremarkForm').form(
			'submit',
			{
				onSubmit : function(param) {
				//var isValid = $(this).form('validate');
				//			if(isValid==0){
				//				var kon="";
				//				
				//				if($('#usr')[0].value==kon){
				//					//console.info("mobilefdf");
				//					$('#usr_blank').css('display','block');
				//				}
				//					
				//				if($('#pwd')[0].value==kon){
				//					//console.info("passwdkon");
				//					$('#pwd_blank').css('display','block');
				//				}
				//					
				//			}
				return check();
				},
				
				url : 'hello/submitremark.php',
				success : function(data) {
					var obj = $.parseJSON(data);
					//console.info(obj);
					backURL = "question3.jsp";
					if (obj.status == "1") {
						var currentVersion = getSysCurrentVersion();
						if(currentVersion==1){
							$.messager.alert("操作提示",'恭喜您，问卷提交成功!请点击左侧导航，进入账户信息填写','info',function () {
								if(obj.entity==2)
									backURL = "question4.jsp";
								var url = 'window.location.href="' + backURL + '"';
								setTimeout(url, 1500);
					        });
						}else{
							$.messager.alert("操作提示",'恭喜您，问卷提交成功，请登出系统！','info',function () {
								if(obj.entity==2)
									backURL = "question4.jsp";
								var url = 'window.location.href="' + backURL + '"';
								setTimeout(url, 1500);
					        });
						}
						
						
						
//						$.messager.show({
//							title : 'warning',
//							msg : '恭喜您，问卷提交成功!请点击左侧导航，进入账户信息填写',
//							timeout : 1500,
//							showType : 'slide',
//							style : {
//								right : '',
//								
//								bottom : ''
//							}
//						});
						//console.info("return version"+ obj.entity);
						

					}

				}
			});
};

getSysCurrentVersion = function(){
	var currentVersion = null;
	$.ajax({
		url : "hello/getsysVersion.php",
		async:false,
		dataType : "json",
		success : function(data) {
			var entity=data.entity;
			var version = entity[0].version;
			//console.info("currentVersion  : "+currentVersion);
			currentVersion = version;		
		}
	});
	return currentVersion;
};


fillaverage=function(){
	var trs=$('.tr');
	//console.info("xuanzede "+trs.size());
	for(var i=0;i<trs.size();i++){
		//console.info("size"+trs.eq(i).find("#familiarave").size());
		$.ajax({
			url : "hello/getScores.php",
			async:false,
			data : {"sickId" : trs.eq(i).find("#secondLevelId").val()},
			dataType : "json",
			success : function(data) {
				var entity=data.entity;
				//console.info(entity);
				var count = Number(entity[0].count);
				var totalFamiliar = Number(entity[0].totalFamiliar);
				var totalImportance =Number( entity[0].totalImportance);
				var totalControll = Number(entity[0].totalControll);
				if(count==0){
					//console.info("countweio");
					trs.eq(i).find("#familiarave").text(0);
					trs.eq(i).find("#importanceave").text(0);
					trs.eq(i).find("#controlave").text(0);
					
				}else{
					//console.info("count"+(totalFamiliar*1.0/count).toFixed(2));
					//console.info("size"+trs.eq(i).find("#familiarave").size());
					trs.eq(i).find("#familiarave").text((totalFamiliar*1.0/count).toFixed(2));
					trs.eq(i).find("#importanceave").text((totalImportance*1.0/count).toFixed(2));
					trs.eq(i).find("#controlave").text((totalControll*1.0/count).toFixed(2));
				}
				//console.info("currentVersion  : "+currentVersion);
					
			}
		});
	}
};
