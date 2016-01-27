
personInit = function() {
//	$.ajax({
//		url : "hello/getFirstLevel.php",
//		dataType : "json",
//		success : function(data) {
//			autoFill();
////			getfirstlevel('#area1Majorfirst', data.entity);
////			getfirstlevel('#area2Majorfirst', data.entity);
////			getfirstlevel('#area3Majorfirst', data.entity);
////			getfirstlevel('#area4Majorfirst', data.entity);
////			getfirstlevel('#area5Majorfirst', data.entity);
//		}
//	});

	$('#personalBtn').click(function() {
	/*
		if($("#goodatArea1").val == null){
			$("#goodatArea1").val(0);
		}*/
		personalBtnClick();
	});

};


function check() {
	//console.info("check");
	var flag = true;
	var result = "";
	
	//console.info("xuanl1111");

	if($('#otherradio').attr('checked')){
		//console.info("xuanl");
		if($('#othertext').val()==""){
			result = result + "没有填写技术职称";
			flag = false;
			//$("#area5Year").focus();
			show(result);

			return flag;
		}
	}
	
	var name = document.getElementById("name").value;
	//console.info("check" + name);
	var age = document.getElementById("age").value;
//	var mail = document.getElementById("mail").value;
//	var education = document.getElementById("education").value;
//	var telephone = document.getElementById("telephone").value;
	var workPlace = document.getElementById("workPlace").value;
//	var postcode = document.getElementById("postcode").value;
//	var techLevel = document.getElementById("techLevel").value;
	var techWorkYears = document.getElementById("techWorkYears").value;
	var administrationDuty = document.getElementById("administrationDuty").value;
	var administrationWorkYear = document
			.getElementById("administrationWorkYear").value;
	
	
	
//
//	var nameResult = $("#nameResult").html();
   // if(!($('#othertext')=='')){
    	$('#otherradio').val($('#othertext').val());
   // }
	if (name == null || name == '') {
		result = result + "您的用户名不能为空";
		flag = false;
		$("#name").focus();
		show(result);
		return flag;
	}
	
	if (age == null || age == '0' || age == '') {
		result = result + "您的年龄不能为空,且必须大于0";
		flag = false;
		$("#age").focus();
		show(result);

		return flag;
	}
	reg =/^[0-9]*$/;
	if(!reg.test(age) ){
		result = result + "无效的年龄格式";
		flag = false;
		$("#age").focus();
		show(result);

		return flag;
	}
/*
	if (education == null || education == '') {
		result = result + "您的学历不能为空";
		flag = false;
		$("#education").focus();
		show(result);

		return flag;
	}
	
	if (telephone == null || telephone == '') {
		result = result + " 您的联系方式不能为空";
		flag = false;
		$("#telephone").focus();
		show(result);

		return flag;
	}
	var reg =/^(13|15|18|17)\d{9}$/;
	if(!reg.test(telephone) ){
		result = result + "无效的电话号码";
		flag = false;
		$("#telephone").focus();
		show(result);

		return flag;
	}
	*/
	if (workPlace == null || workPlace == '') {
		result = result + " 您的工作单位不能为空";
		flag = false;
		$("#workPlace").focus();
		show(result);

		return flag;
	}
	/*
	if (postcode == null || postcode == '') {
		result = result + " 您的工作地邮编不能为空";
		flag = false;
		$("#postcode").focus();
		show(result);

		return flag;
	}
	reg =/^[0-9]*$/;
	if(!reg.test(postcode) ){
		result = result + "无效的邮政编码";
		flag = false;
		$("#postcode").focus();
		show(result);

		return flag;
	}
*/
/*	if (techLevel == null || techLevel == '') {
		result = result + " 您的技术职称不能为空";
		flag = false;
		$("#techLevel").focus();
		show(result);

		return flag;
	}*/
	if (techWorkYears == null || techWorkYears == '0' || techWorkYears == '') {
		result = result + "您的技术任职时间不能为空,且必须大于0";
		flag = false;
		$("#age").focus();
		show(result);

		return flag;
	}
	reg =/^[0-9]*$/;
	if(!reg.test(techWorkYears) ){
		result = result + "技术任职时间为无效的时间格式";
		flag = false;
		$("#techWorkYears").focus();
		show(result);

		return flag;
	}
	
//	if (administrationDuty == null || administrationDuty == '') {
//		result = result + " 您的行政职称不能为空";
//		flag = false;
//		$("#administrationDuty").focus();
//		show(result);
//
//		return flag;
//	}
//	if (administrationWorkYear == null || administrationWorkYear == '' || administrationWorkYear == '0') {
//		result = result + " 您的行政任职时间不能为空,且必须大于0";
//		flag = false;
//		$("#administrationWorkYear").focus();
//		show(result);
//
//		return flag;
//	}
	reg =/^[0-9]*$/;
	if(!reg.test(administrationWorkYear) ){
		result = result + "行政任职时间为无效的时间格式";
		flag = false;
		$("#administrationWorkYear").focus();
		show(result);

		return flag;
	}
	var jishu=0;
	if($("#goodatArea1").attr("checked") ){
		jishu=1;
		if($("#area1Major").val() == null || $("#area1Major").val() == ""){
			result = result + "您选择的公共卫生领域的专业信息尚未填写";
			flag = false;
			$("#area1Major").focus();
			show(result);

			return flag;
		}
		if($("#area1Year").val() == null || $("#area1Year").val() == "" || $("#area1Year").val() == "0"){
			result = result + "您选择的公共卫生领域的从事年数尚未填写";
			flag = false;
			$("#area1Year").focus();
			show(result);

			return flag;
		}
		reg =/^[0-9]*$/;
		if(!reg.test($("#area1Year").val()) ){
			result = result + "专业从事年数为无效的时间格式";
			flag = false;
			$("#area1Year").focus();
			show(result);

			return flag;
		}
	}
	
	if($("#goodatArea2").attr("checked")){
		jishu=1;
		if($("#area2Major").val() == null || $("#area2Major").val() == "" ){
			result = result + "您选择的临床医疗领域的专业信息尚未填写";
			flag = false;
			$("#area2Major").focus();
			show(result);

			return flag;
		}
		if($("#area2Year").val() == null || $("#area2Year").val() == ""|| $("#area2Year").val() == "0"){
			result = result + "您选择的临床医疗领域的从事年数尚未填写";
			flag = false;
			$("#area2Year").focus();
			show(result);

			return flag;
		}
		reg =/^[0-9]*$/;
		if(!reg.test($("#area2Year").val()) ){
			result = result + "专业从事年数为无效的时间格式";
			flag = false;
			$("#area2Year").focus();
			show(result);

			return flag;
		}
	}
	
	if($("#goodatArea3").attr("checked") ){
		jishu=1;
		if($("#area3Major").val() == null || $("#area3Major").val() == ""){
			result = result + "您选择的行政管理领域的专业信息尚未填写";
			flag = false;
			$("#area3Major").focus();
			show(result);

			return flag;
		}
		if($("#area3Year").val() == null || $("#area3Year").val() == ""||$("#area3Year").val() == "0"){
			result = result + "您选择的行政管理领域的从事年数尚未填写";
			flag = false;
			$("#area3Year").focus();
			show(result);

			return flag;
		}
		reg =/^[0-9]*$/;
		if(!reg.test($("#area3Year").val()) ){
			result = result + "专业从事年数为无效的时间格式";
			flag = false;
			$("#area3Year").focus();
			show(result);

			return flag;
		}
	}
	
	if($("#goodatArea4").attr("checked")){
		jishu=1;
		if($("#area4Major").val() == null || $("#area4Major").val() == ""){
			result = result + "您选择的科学研究领域的专业信息尚未填写";
			flag = false;
			$("#area4Major").focus();
			show(result);

			return flag;
		}
		if($("#area4Year").val() == null || $("#area4Year").val() == ""||$("#area4Year").val() == "0"){
			result = result + "您选择的科学研究领域的从事年数尚未填写";
			flag = false;
			$("#area4Year").focus();
			show(result);

			return flag;
		}
		reg =/^[0-9]*$/;
		if(!reg.test($("#area4Year").val()) ){
			result = result + "专业从事年数为无效的时间格式";
			flag = false;
			$("#area4Year").focus();
			show(result);

			return flag;
		}
	}
	if($("#goodatArea5").attr("checked")){
		jishu=1;
		if($("#area5Major").val() == null || $("#area5Major").val() == ""){
			result = result + "您选择的医学教育领域的专业信息尚未填写";
			flag = false;
			$("#area5Major").focus();
			show(result);

			return flag;
		}
		if($("#area5Year").val() == null || $("#area5Year").val() == ""||$("#area5Year").val() == "0"){
			result = result + "您选择的医学教育领域的从事年数尚未填写";
			flag = false;
			$("#area5Year").focus();
			show(result);

			return flag;
		}
		reg =/^[0-9]*$/;
		if(!reg.test($("#area5Year").val()) ){
			result = result + "专业从事年数为无效的时间格式";
			flag = false;
			$("#area5Year").focus();
			show(result);

			return flag;
		}
		
		
	}
	if(jishu==0){
		result = result + "至少选择一个专业领域";
		flag = false;
		
		show(result);

		return flag;
	}
	
	
	
/*
	if (mail == null || mail == '') {
		result = result + "您的电子邮箱不能为空";
		flag = false;
		$("#mail").focus();
		show(result);

		return flag;
	}
	reg =/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/ ;
	if(!reg.test(mail) ){
		result = result + "无效的邮箱格式";
		flag = false;
		$("#mail").focus();
		show(result);

		return flag;
	}
	 
	*/
	// console.info("check"+flag);

	// alert(result);

	return flag;
}

function show(result) {
	$.messager.show({
		title : 'warning',
		msg : result,
		timeout : 1500,
		showType : 'slide',
		style : {
			right : '',
			
			bottom : ''
		}
	});
}
/*
getfirstlevel = function(firstSelectId, entity) {

	// console.info(data);

	$(firstSelectId).empty();
	// $(firstSelectId).parent().find('.btn-group').find('.open').find('.inner').
	// console.info(
	// $(firstSelectId).parent().find('.inner').children().size());
	var children = $(firstSelectId).parent().find('.inner').children();
	for (i = 1; i < children.size(); i++) {
		children[i].remove();

	}
	$(firstSelectId).append(
			"<option value='" + 1 + "'>" + "请选择一级专业" + "</option>");

	for (i = 0; i < entity.length; i++) {
		$(firstSelectId).append(
				"<option value='" + (entity[i].id + 1) + "'>" + entity[i].name
						+ "</option>");
		// .info(children.eq(0));

		var one = $(firstSelectId).parent().find('.inner').children().eq(0)
				.clone();
		var initial = $(firstSelectId).parent().find('.inner').children().eq(0);

		one.attr("data-original-index", entity[i].id);
		one.find(".text").text(entity[i].name);
		$(firstSelectId).parent().find('.inner').append(one);

		initial.click(function() {
			getsecondlevel(firstSelectId.replace("first", "second"), 0);
			$(firstSelectId.replace("first", "")).val('');
		});
		one.click(function() {

			$(firstSelectId.replace("first", "")).val(
					$(this).find(".text").text());
			var firstLevelId = Number($(this).attr("data-original-index"));
			//console.info(firstLevelId);
			var button_view = $(firstSelectId.replace("first", "second"))
					.parent().find('.dropdown-toggle');
			// console.info("zxl look button value");
			// console.info(button_view.attr("title"));
			button_view.attr("title", "请选择二级专业");

			button_view.find(".pull-left").text("请选择二级专业");
			getsecondlevel(firstSelectId.replace("first", "second"),
					firstLevelId);

		});

		// $(firstSelectId).parent().find('.inner').children()

	}
	// children[0].remove();

	// $(firstSelectId).parent().find('.bootstrap-select').css("width","170px");
};
*/

/*
getsecondlevel = function(secondSelectId, firstlevelID) {
	//console.info(secondSelectId + " " + firstlevelID);
	$
			.ajax({
				url : "hello/getSecondLevel.php",
				dataType : "json",
				data : {
					"fitstLevelId" : firstlevelID
				},
				success : function(data) {
					// console.info(data);
					var entity = data.entity;

					$(secondSelectId).empty();
					// $(firstSelectId).parent().find('.btn-group').find('.open').find('.inner').
					// console.info(
					// $(secondSelectId).parent().find('.inner').children().size());
					var children = $(secondSelectId).parent().find('.inner')
							.children();

					for (i = 1; i < children.size(); i++) {
						children[i].remove();

					}
					$(secondSelectId).append(
							"<option value='" + 1 + "'>" + "请选择二级专业"
									+ "</option>");
					for (i = 0; i < entity.length; i++) {
						$(secondSelectId).append(
								"<option value='" + (entity[i].id + 1) + "'>"
										+ entity[i].name + "</option>");
						// console.info(children.eq(0));
						var one = $(secondSelectId).parent().find('.inner')
								.children().eq(0).clone();
						var initial = $(secondSelectId).parent().find('.inner')
								.children().eq(0);

						one.attr("data-original-index", entity[i].id);
						one.find(".text").text(entity[i].name);
						$(secondSelectId).parent().find('.inner').append(one);

						initial
								.click(function() {
									// getsecondlevel(firstSelectId.replace("first","second"),0);
									var button_view = $(secondSelectId)
											.parent().find('.dropdown-toggle');
									// console.info("zxl look button value");
									// console.info(button_view.attr("title"));
									button_view.attr("title", "请选择二级专业");
									button_view.find(".pull-left").text(
											"请选择二级专业");
									$(secondSelectId.replace("second", ""))
											.val(
													$(
															secondSelectId
																	.replace(
																			"second",
																			"first"))
															.parent()
															.find(
																	'.dropdown-toggle')
															.find(".pull-left")
															.text());
								});

						one.click(function() {
							var button_view = $(secondSelectId).parent().find(
									'.dropdown-toggle');
							// console.info("zxl look button value");
							// console.info(button_view.attr("title"));
							button_view.attr("title", $(this).find(".text")
									.text());
							button_view.find(".pull-left").text(
									$(this).find(".text").text());

							$(secondSelectId.replace("second", "")).val(
									$(this).find(".text").text());
						});
						// $(firstSelectId).parent().find('.inner').children()

					}
					// children[0].remove();
				}
			});
};
*/


bind = function(checkboxId) {
	$(checkboxId)
			.click(
					function() {
						
						var major = checkboxId.replace("goodatA", "a")
						+ "Major";
						var year = checkboxId.replace("goodatA", "a") + "Year";
						
						if ($(this).attr("checked")) {
							//console.info("checked");

							$(major).attr("readonly", false);
							$(year).attr("readonly", false);
						} else {
							//console.info("unchecked");
							$(major).val("");
							$(year).val(0);
							$(major).attr("readonly", true);
							$(year).attr("readonly", true);
						
						}
						
						//console.info("click");
						/*var first = checkboxId.replace("goodatA", "a")
								+ "Majorfirst";
						var second = checkboxId.replace("goodatA", "a")
								+ "Majorsecond";
						var year = checkboxId.replace("goodatA", "a") + "Year";
						if ($(this).attr("checked")) {
							//console.info("checked");

							$(first).attr("disabled", false);
							$(first).parent().find('.bootstrap-select')
									.removeClass('disabled');
							$(first).parent().find('.dropdown-toggle')
									.removeClass('disabled');
							$(second).attr("disabled", false);
							$(second).parent().find('.bootstrap-select')
									.removeClass('disabled');
							$(second).parent().find('.dropdown-toggle')
									.removeClass('disabled');
							$(year).attr("readonly", false);
						} else {
							//console.info("unchecked");
							$(first).attr("disabled", true);
							$(first).parent().find('.dropdown-toggle')
									.addClass('disabled');
							$(first).parent().find('.bootstrap-select')
									.addClass('disabled');
							$(second).attr("disabled", true);
							$(second).parent().find('.bootstrap-select')
									.addClass('disabled');
							$(second).parent().find('.dropdown-toggle')
									.addClass('disabled');
							$(year).attr("readonly", true);
						
						}*/
						
					});
};

initial = function(id, info) {
	bind(id);
	var ss = id.replace("#", ""); 
	if (info[ss] == 0 || info[ss] == null) {
		$(id).trigger("click");
		$(id).attr("checked", false);
	} else {
		$(id).attr("checked", true);
		var major = id.replace("goodatA", "a") + "Major";
		$(major).val(info[major.replace("#", "")]);
		$(major).attr("readonly", false);
		var year = major.replace("Major", "Year");
		$(year).val(info[year.replace("#", "")]);
		$(year).attr("readonly", false);
	}

};

personalBtnClick = function() {
	$('#personalForm').form(
			'submit',
			{
				onSubmit : function(param) {
					// var isValid = $(this).form('validate');
					// if(isValid==0){
					// var kon="";
					//				
					// if($('#usr')[0].value==kon){
					// //console.info("mobilefdf");
					// $('#usr_blank').css('display','block');
					// }
					//					
					// if($('#pwd')[0].value==kon){
					// //console.info("passwdkon");
					// $('#pwd_blank').css('display','block');
					// }
					//					
					// }
					return check();
				},
				url : 'hello/updateExpertBasicInfo.php',
				success : function(data) {
					var obj = $.parseJSON(data);
					//console.info(obj);
					backURL = "question00.jsp";
					if (obj.status == "1") {
						$.messager.alert("操作提示",'信息提交成功！请点击左侧导航，进入填写问卷！','info',function () {
							//$("#scan_question1_tab").click();
							//var url = 'window.location.href="' + backURL + '"';
							//console.info($('#personal_tab').size());
							//test();
//								$('#personal_tab').removeClass("active");
//								$('#question_tab').removeClass("active");
//								$('#account_tab').removeClass("active");
//								$('#scan_question1_tab').addClass("active");
//								$('#scan_question2_tab').removeClass("active");
//								
//								$('#personal').css("display","none");
//								$('#question').css("display","none");
//								$('#account').css("display","none");
//								//$('#scan_question1').css("display","none");
//								$('#scan_question2').css("display","none");
//								
//								if(!$('#scan_question1').is(":visible")){
//									$('#scan_question1').toggle();
//								}
							
							//setTimeout(url, 1500);
				        });
//						$.messager.show({
//							title : 'warning',
//							msg : '信息提交成功！请点击左侧导航，进入填写问卷！',
//							timeout : 1500,
//							showType : 'slide',
//							style : {
//								right : '',
//								
//								bottom : ''
//							}
//						});
						
					} else if (obj.status == "2") {
						$.messager.show({
							title : 'warning',
							msg : '此信息已被注册！',
							timeout : 1500,
							showType : 'slide',
							style : {
								right : '',
								
								bottom : ''
							}
						});
					} else {
						$.messager.show({
							title : 'warning',
							msg : '认证信息不正确！',
							timeout : 1500,
							showType : 'slide',
							style : {
								right : '',
								
								bottom : ''
							}
						});
					}

				}
			});
};

setdivStyle = function(id) {
	//console.info("set set");
	//console.info($(id).parent().find('.bootstrap-select').size());
	$(id).parent().find('.bootstrap-select').css("width", "170px");
};

autoFill = function() {
	$.ajax({
		url : "hello/getUserInfo.php",
		dataType : "json",
		success : function(data) {
			//console.info(data.entity[0]);
			var info = data.entity[0];
			$('#name').val(info.name);
			$('#age').val(info.age);
			$('#education').val(info.education);
			$('#telephone').val(info.telephone);
			$('#workPlace').val(info.workPlace);
			$('#postcode').val(info.postcode);
			$('#techLevel').val(info.techLevel);
			if(info.techLevel=="院士"){
				//$('input[@name=items]
						 $("input[name='techLevel'][value='院士']").attr("checked",'checked');
						 //console.info("woshiyuanshi");
			}
			else if(info.techLevel=="教授/研究员/主任医师"){
				//$('input[@name=items]
				//console.info("woshi教授/研究员/主任医师");
						 $("input[name='techLevel'][value='教授/研究员/主任医师']").attr("checked",'checked');
			}else {
				$("input[name='techLevel'][value='其它']").attr("checked",'checked');
				$('#othertext').val(info.techLevel);
			}
			
			//$("input[name='techLevel'][value='其它']").attr("checked",'checked');
			$('#techWorkYears').val(info.techWorkYears);
			$('#administrationDuty').val(info.administrationDuty);
			$('#administrationWorkYear').val(info.administrationWorkYear);
			$('#mail').val(info.mail);
			initial("#goodatArea1", info);
			initial("#goodatArea2", info);
			initial("#goodatArea3", info);
			initial("#goodatArea4", info);
			initial("#goodatArea5", info);
		}
	});
};
