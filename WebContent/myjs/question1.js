var total_select=0;
var current_firstLeve_id=0;


$(function() {
//	$("#confirmModal").modal().css({
//        "margin-top": function () {
//            return - ($(this).height() / 2);
//       }
//    });
	total_select=0;
	var currentver = getSysCurrentVersion();
	$('#versionhidden').val(currentver);
	if(currentver == 2){
		$("#shuoming").text("第二轮调查说明");
		initialThirdDiv();
		initialnotselect();
		$('#view_sick1').show();
//		$("#view_rule_2").css("display","");
//		$("#view_rule").css("display","");
	}
//	else{
//		$("#view_rule_1").css("display","");
//		$("#view_rule").css("display","");
//	}
	
	$('#countNumberAll').text(total_select);
	bindClick();
	initialFirstDiv();
	$('#toConfirm').click(function() {
		var flag = true;
		if(Number($('#countNumberAll').text())<20){
			$.messager.show({
				title : 'warning',
				msg : '<font size="3">您需要选择20项重大疾病或健康问题才能前往填写问卷</font>',
				timeout : 1500,
				showType : 'fade',
				style : {
					 right:'',
		             bottom:''
				}
			});
			flag = false;
		}else{
			flag = true;
		}
	//	console.info("this is toconfirm: "+ flag);
		if(flag == true){
			$("#toConfirm").attr("data-target","#confirmModal");
		}
		
		
	});
	//console.info("nihao" + $('#accountConfirmBtn').size());
	$('#accountConfirmBtn').click(function() {
		//console.info("accountConfirmBtn");

		accountConfirmBtnClick();
	});
	
	
});

function show(result) {
	$.messager.show({
		title : 'warning',
		msg : result,
		timeout : 1500,
		showType : 'fade',
		style : {
			 right:'',
             bottom:''
		}
	});
}

//submitinfoTOconfirm = function() {
//	$('#idCardNumber').val($('#idCardNumber0').val());
//	$('#duty').val($('#duty0').val());
//	$('#bankCardNumber').val($('#bankCardNumber0').val());
//	$('#bankName').val($('#bankName0').val());
//};

accountConfirmBtnClick = function() {
	//console.info("function account");
	//console.info($('#accountConfirmBtn').size());
	$('#personalForm1').form(
			'submit',
			{
				//onSubmit : function(param) {
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
				//return check();
				//},
				url : 'hello/updateExpertBankInfo.php',
				success : function(data) {
					var obj = $.parseJSON(data);
					//console.info(obj);
					backURL = "home.jsp";
					if (obj.status == "1") {
						$.messager.show({
							title : 'warning',
							msg : 'fd',
							timeout : 1500,
							showType : 'fade',
							style : {
								 right:'',
					             bottom:''
							}
						});
						var url = 'window.location.href="' + backURL + '"';
						setTimeout(url, 1500);

					}

				}
			});
};
initialFirstDiv=function(){
	$.ajax({
		url : "hello/getFirstLevel.php",
		dataType : "json",
		success : function(data) {
			var entity=data.entity;
			var firstDiv=$('#firstLeveDiv');
			for(i=0;i<entity.length;i++){
				var ele=$('#firstLeveDivTest').clone(true);
				ele.attr("id","firstLeveDivTestFormal");
				ele.find('#firstLeveItemName').text(entity[i].name);
				ele.find('#firstLeveItemid').text(entity[i].id);
				ele.find('#countNumber').text(0);
				ele.find('#countNumber').attr("id","countNumber"+(i+1));
				ele.css("display","");
				firstDiv.append(ele);
			}
			
		}
	});
};
initialThirdDiv=function(){
	$.ajax({
		url : "hello/getTop20List.php",
		dataType : "json",
		success : function(data) {
			//console.info(data);
			var entity=data.entity;
			for(var i=0;i<entity.length;i++){
				var ele=$('#selectedItrmTest').clone(true);
				ele.attr("id","selectedItrmFormal");
				ele.find('#name').text(entity[i].name);
				ele.find('#id').text(entity[i].id);
				//ele.find('#count').text(entity[i].name);
				ele.find('#ave').text(entity[i].ave);
				ele.find('#area_ave').text(entity[i].areaAve);
				ele.find('#ave_im').text(entity[i].aveIm);
				ele.find('#area_ave_im').text(entity[i].areaAveIm);
				ele.find('#ave_con').text(entity[i].aveCon);
				ele.find('#area_ave_con').text(entity[i].areaAveCon);
				ele.find('#percentage').text(entity[i].percentage+"%");
				ele.find('#percentage').css("display","");
				if(entity[i].selected==1)
					ele.find('#correct').css("display","");
			//	ele.find('#totalControll').text(totalControll);
				
				ele.find('#isManualAdd').text(0);
				ele.find('#selectedFirstlevelid').text(entity[i].firstLevelId);
				updatecount(entity[i].firstLevelId,1);
				ele.css('display','');
				$('#selectedDivTest').append(ele);
			}
			total_select=20;
			$('#countNumberAll').text(total_select);
			
			
			
		}
	});
};

initialnotselect=function(){
	$.ajax({
		url : "hello/getNotIntop20.php",
		dataType : "json",
		success : function(data) {
			//console.info(data);
			var entity=data.entity;
			for(var i=0;i<entity.length;i++){
				var ele=$('#tbodytrtestnotselet').clone(true);
				ele.attr("id","tbodytrformalnotselet");
				ele.find('#no').text(i+1);
				ele.find('#illname').text(entity[i].name);
				//ele.find('#count').text(entity[i].name);
				ele.find('#illpercent').text(entity[i].percentage+"%");
				
				ele.show();
				$('#tbodytestnotselect').append(ele);
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

bindClick=function(){
	$('#firstLeveDivTest').click(function(){
		$('#hiddenadd').css("display","none");
		var btn = $('#firstLeveDiv .active');
		var l = btn.size();
		for(var i=0; i<l; i++){
			btn.eq(i).removeClass("active");
		}
		$(this).addClass("active");
		current_firstLeve_id=Number($(this).find('#firstLeveItemid').text());
		while($('#secondLevelDivFormal').size()>0){
			$('#secondLevelDivFormal').eq(0).remove();
		}
		$.ajax({
			url : "hello/getSecondLevel.php",
			data: {"fitstLevelId" : $(this).find('#firstLeveItemid').text()},
			dataType : "json",
			success : function(data) {
				var entity=data.entity;
				var secondDiv=$('#secondLevelDiv');
			//	var version = getSysCurrentVersion();
				//console.info("this is 00 version   " + version);
				for(i=0;i<entity.length;i++){
					var ele=$('#secondLevelDivTest').clone(true);
					ele.attr("id","secondLevelDivFormal");
					ele.find('#name').text(entity[i].name);
					ele.find('#id').text(entity[i].id);
					ele.find('#count').text(entity[i].count);
					//ele.find('#totalImportance').text(entity[i].totalImportance);
					//ele.find('#totalFamiliar').text(entity[i].totalFamiliar);
					//ele.find('#totalControll').text(entity[i].totalControll);
					ele.find('#ave').text(entity[i].ave);
					ele.find('#area_ave').text(entity[i].areaAve);
					ele.find('#ave_im').text(entity[i].aveIm);
					ele.find('#area_ave_im').text(entity[i].areaAveIm);
					ele.find('#ave_con').text(entity[i].aveCon);
					ele.find('#area_ave_con').text(entity[i].areaAveCon);
					ele.find('#percentage').text(entity[i].percentage);
					
						ele.find('#count').css("display","none");
						ele.find('#alert1').css("display","none");
						ele.find('#alert2').css("display","none");
					
					ele.css("display","");
					ele.addClass("lableClass");
					var all=$('.alert-dismissible');
					//console.info($('.alert-dismissible').size());
					for(var j=0;j<all.size();j++){
						var lookFor=all.eq(j).find('#id').text();
						//console.info(lookFor+currentId);
						if(entity[i].id==Number(lookFor)){
							ele.find("#secondLevelCheckBox").attr("checked",true);
						}
					}
					
					secondDiv.append(ele);
				}
				$('#hiddenadd').css("display","");
				
			}
		});
	});
	
	$('#secondLevelCheckBox').click(function(){
		if ($(this).attr("checked")) {
			if(Number($('#countNumberAll').text())==20){
				$.messager.show({
					title : 'warning',
					msg : '<font size="3">至多选择20项</font>',
					timeout : 1500,
					showType : 'fade',
					style : {
						 right:'',
			             bottom:''
					}
				});
				$(this).attr("checked",false);
				
			}else{
				var currentId=$(this).parent().find('#id').text();
				var currentName=$(this).parent().find('#name').text();
			//	var count=$(this).parent().find('#count').text();
				
				var ave=$(this).parent().find('#ave').text();
				var area_ave=$(this).parent().find('#area_ave').text();
				var ave_im=$(this).parent().find('#ave_im').text();
				var area_ave_im=$(this).parent().find('#area_ave_im').text();
				var ave_con=$(this).parent().find('#ave_con').text();
				var area_ave_con=$(this).parent().find('#area_ave_con').text();
				var percentage=$(this).parent().find('#percentage').text();
				var all=$('.alert-dismissible');
				//console.info($('.alert-dismissible').size());
				for(var i=0;i<all.size();i++){
					var lookFor=all.eq(i).find('#name').text();
					//console.info(lookFor+currentId);
					if(currentName==lookFor){
						$.messager.show({
							title : 'warning',
							msg : '<font size="3">已有该疾病</font>',
							timeout : 1500,
							showType : 'fade',
							style : {
								 right:'',
					             bottom:''
							}
						});
						$(this).attr("checked",false);
						return 0;
					}
				}
				var ele=$('#selectedItrmTest').clone(true);
				ele.attr("id","selectedItrmFormal");
				ele.find('#name').text(currentName);
				ele.find('#id').text(currentId);
				//ele.find('#count').text(count);
				//ele.find('#totalImportance').text(totalImportance);
				//ele.find('#totalFamiliar').text(totalFamiliar);
				//ele.find('#totalControll').text(totalControll);
				ele.find('#ave').text(ave);
				ele.find('#area_ave').text(area_ave);
				ele.find('#ave').text(ave_im);
				ele.find('#area_ave').text(area_ave_im);
				ele.find('#ave').text(ave_con);
				ele.find('#area_ave').text(area_ave_con);
				ele.find('#percentage').text(percentage);
				ele.find('#isManualAdd').text(0);
				ele.find('#selectedFirstlevelid').text(current_firstLeve_id);
				
				ele.css('display','');
				$('#selectedDivTest').append(ele);
				total_select+=1;
				$('#countNumberAll').text(total_select);
//				for(var i=0;i<$('#selectedItrmTest').size();i++){
//					console.info()
//				}
				updatecount(current_firstLeve_id,1);
			}
		}
		else{
			var currentId=$(this).parent().find('#id').text();
			//var currentName=$(this).parent().find('#name').text();
			var all=$('.alert-dismissible');
			//console.info($('.alert-dismissible').size());
			for(var i=0;i<all.size();i++){
				var lookFor=all.eq(i).find('#id').text();
				//console.info(lookFor+currentId);
				if(currentId==lookFor){
					all.eq(i).remove();
					total_select-=1;
					$('#countNumberAll').text(total_select);
					
				}
			}
			updatecount(current_firstLeve_id,0);
		}
		
		
	});
	
	$('#disappear').click(function(){
		//console.info("hello");
		total_select-=1;
		var current_secondid=Number($(this).parent().find('#id').text());
		$('#countNumberAll').text(total_select);
		if(Number($(this).parent().find('#selectedFirstlevelid').text())==current_firstLeve_id){
			//console.info("gaodian");
			var lable=$('#secondLevelDiv .lableClass');
			for(var i=0;i<lable.size();i++){
				if(Number(lable.eq(i).find('#id').text())==current_secondid){
					lable.eq(i).find('#secondLevelCheckBox').attr("checked",false);
				}
			}
		}
		if($(this).parent().find('#isManualAdd').text()=="0")
		updatecount(Number($(this).parent().find('#selectedFirstlevelid').text()),0);
	});
	
	$('#addSickBtn').click(function(){
		var empty="";
		//console.info("hello"+$('#addSickText').val());
		if($('#addSickText').val()==empty){
			$.messager.show({
				title : 'warning',
				msg : '<font size="3">请输入要添加的疾病名称</font>',
				timeout : 1500,
				showType : 'fade',
				style : {
					 right:'',
		             bottom:''
				}
			});
		}else{
			if(Number($('#countNumberAll').text())==20){
				$.messager.show({
					title : 'warning',
					msg : '<font size="3">至多有20项</font>',
					timeout : 1500,
					showType : 'fade',
					style : {
						 right:'',
			             bottom:''
					}
				});
				$(this).attr("checked",false);
				
			}else{
				
				var currentName=$('#addSickText').val();
				
				var all=$('.alert-dismissible');
				//console.info($('.alert-dismissible').size());
				for(var i=1;i<all.size();i++){
					var lookFor=all.eq(i).find('#name').text();
					//console.info(lookFor+currentId);
					if(currentName==lookFor){
						$.messager.show({
							title : 'warning',
							msg : '<font size="3">已有该疾病</font>',
							timeout : 1500,
							showType : 'fade',
							style : {
								 right:'',
					             bottom:''
							}
						});
						return 0;
					}
					
				}
				var ele=$('#selectedItrmTest').clone(true);
				ele.attr("id","selectedItrmFormal");
				ele.find('#name').text(currentName);
				ele.find('#isManualAdd').text(1);
				//ele.find('#id').text(currentId);
				ele.find('#selectedFirstlevelid').text(current_firstLeve_id);
				ele.css('display','');
				$('#selectedDivTest').append(ele);
				total_select+=1;
				$('#countNumberAll').text(total_select);
				$('#addSickText').val("");
				$.ajax({
					url : "hello/addsecondLeveSick.php",
					data: {"sickNmae" : currentName},
					dataType : "json",
					success : function(data) {
						//console.info(data.entity);
						ele.find('#id').text(data.entity);
					}
				});
				
//				for(var i=0;i<$('#selectedItrmTest').size();i++){
//					console.info()
//				}
				
			}
		}
	});
};

fillContent=function(){
	if(Number($('#countNumberAll').text())<20){
		$.messager.show({
			title : 'warning',
			msg : '<font size="3">您需要选择20项重大疾病或健康问题才能前往填写问卷</font>',
			timeout : 1500,
			showType : 'fade',
			style : {
				 right:'',
	             bottom:''
			}
		});
		return false;
	}
	else{
		var all=$('.alert-dismissible');
		var allids=all.eq(1).find('#id').text();
		var firstidarrs=all.eq(1).find('#selectedFirstlevelid').text();
		var allnames=all.eq(1).find('#name').text();
		var isManualAddzrr=all.eq(1).find('#isManualAdd').text();
	
		
		var ave=all.eq(1).find('#ave').text();
		var areaave=all.eq(1).find('#area_ave').text();
		var aveim=all.eq(1).find('#ave_im').text();
		var areaaveim=all.eq(1).find('#area_ave_im').text();
		var avecon=all.eq(1).find('#ave_con').text();
		var areaavecon=all.eq(1).find('#area_ave_con').text();
		
		//console.info($('.alert-dismissible').size());
		for(var i=2;i<all.size();i++){
			allids+=","+all.eq(i).find('#id').text();
			firstidarrs+=","+all.eq(i).find('#selectedFirstlevelid').text();
			allnames+=","+all.eq(i).find('#name').text();
			isManualAddzrr+=","+all.eq(i).find('#isManualAdd').text();
			
			
			ave+=","+all.eq(i).find('#ave').text();
			areaave+=","+all.eq(i).find('#area_ave').text();
			aveim+=","+all.eq(i).find('#ave_im').text();
			areaaveim+=","+all.eq(i).find('#area_ave_im').text();
			avecon+=","+all.eq(i).find('#ave_con').text();
			areaavecon+=","+all.eq(i).find('#area_ave_con').text();
			
			//console.info(lookFor+currentId);
		}
		$('#allids').val(allids);
		$('#firstidarrs').val(firstidarrs);
		$('#allnames').val(allnames);
		$('#isManualAddinput').val(isManualAddzrr);
		$('#avearr').val(ave);
		$('#areaavearr').val(areaave);
		$('#aveimarr').val(aveim);
		$('#areaaveimarr').val(areaaveim);
		$('#aveconarr').val(avecon);
		$('#areaaveconarr').val(areaavecon);
		
		return true;
	}
};
updatecount=function(id,op){
	
		var nid= "#countNumber"+id;
		if(op==0)
		$(nid).text(Number($(nid).text())-1);
		else
		$(nid).text(Number($(nid).text())+1);
	
};
