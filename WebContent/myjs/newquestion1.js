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
		//$("#shuoming").text("第二轮调查说明");
		//initialThirdDiv();
		//initialnotselect();
		//$('#view_sick1').show();
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
		if(flag == true){
			$("#toConfirm").attr("data-target","#confirmModal");
		}
		
		
	});
	//console.info("nihao" + $('#accountConfirmBtn').size());
	$('#accountConfirmBtn').click(function() {
		//console.info("accountConfirmBtn");

		//accountConfirmBtnClick();
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


initialFirstDiv=function(){
	$.ajax({
		url : "hello/getAllSick.php",
		dataType : "json",
		success : function(data) {
			var entity=data.entity;
			var firstDiv=$('#treleSicktable');
			var tanchuDiv=$('#tbodytestnotselect');
			var j=1;
			for(var i=0;i<entity.length;i++){
				if(entity[i].isSeleted==1){
					//console.info("hellk");
					var ele1=$('#tbodytrtestnotselet').clone(true);
					ele1.attr("id","tbodytrtestnotseletFormal");
					ele1.find('#no').text(j+"");
					j+=1;
					ele1.find('#illname').text(entity[i].SecondName);
					ele1.find('#illpercent').text(entity[i].Zonghe);
					ele1.css("display","");
					tanchuDiv.append(ele1);
				}
				if(entity[i].show==1){
					var ele=$('#treleSick2').clone(true);
					ele.attr("id","treleSick2Formal");
					ele.find('#id').text(entity[i].SecondId);
					ele.find('#showid').text(i+1);
					ele.find('#name').text(entity[i].SecondName);
					ele.find('#zhonghe').text(entity[i].Zonghe);
					ele.find('#ProtectiveAve').html(entity[i].ProtectiveAve);
					ele.find('#ImportanceAve').html(entity[i].ImportanceAve);
					if(entity[i].isSeleted==0||i>=20)
						ele.find('#select').text("");
					
					//ele.find('#countNumber').attr("id","countNumber"+(i+1));
					ele.css("display","");
					firstDiv.append(ele);
				}
				
			}
			
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
				total_select+=1;
				$('#countNumberAll').text(total_select);
			}
		}
		else{
					total_select-=1;
					$('#countNumberAll').text(total_select);
		}
		
		
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
				
				var all=$('.alltrsClass');
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
				var ele=$('#treleSick2').clone(true);
				ele.attr("id","treleSick2Formal");
				//ele.find('#id').text(entity[i].SecondId);
				ele.find('#showid').text($('.alltrsClass').size());
				//$('.alltrsClass')
				ele.find('#name').text(currentName);
				ele.find('#zhonghe').text("");
				ele.find('#ProtectiveAve').html("0");
				ele.find('#select').html("");
				ele.find('#ImportanceAve').html("0");
				ele.find('#secondLevelCheckBox').attr("checked",true);
				
				ele.find('#ismanul').html("1");
				
				ele.css("display","");
				$('#treleSicktable').append(ele);
				
				//$('#selectedDivTest').append(ele);
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
		var all=$('.alltrsClass');
		var allids="";
		var firstidarrs="";
		var allnames="";
		var isManualAddzrr="";
		var ImportanceAvearr="";
		var ProtectiveAvearr="";
		//console.info($('.alert-dismissible').size());
		for(var i=1;i<all.size();i++){
			if(all.eq(i).find('#secondLevelCheckBox').attr("checked")){
				allids+=","+all.eq(i).find('#id').text();
				firstidarrs+=",0";
				allnames+=","+all.eq(i).find('#name').text();
				ImportanceAvearr+=","+all.eq(i).find('#ImportanceAve').text();
				ProtectiveAvearr+=","+all.eq(i).find('#ProtectiveAve').text();
				isManualAddzrr+=","+all.eq(i).find('#ismanul').text();
				
			}
		}
		$('#allids').val(allids);
		$('#firstidarrs').val(firstidarrs);
		$('#allnames').val(allnames);
		$('#ImportanceAvearr').val(ImportanceAvearr);
		$('#ProtectiveAvearr').val(ProtectiveAvearr);
		$('#isManualAddzrr').val(isManualAddzrr);
		return true;
	}
};

