$(function() {

	$('#toConfirm').click(function() {
		submitbankinfoTOconfirm();
	});
	$('#toConfirmpost').click(function() {
		submitpostinfoTOconfirm();
	});
	$('#accountConfirmBtn').click(function() {
		//console.info("accountConfirmBtn");

		accountConfirmBtnClick();
	});
	$('#postConfirmBtn').click(function() {
		//console.info("postConfirmBtn");

		postConfirmBtnClick();
	});
	autofill();
});

function check1() {
	//console.info("check");
	var flag = true;
	var result = "";
	var idCardNumber = document.getElementById("idCardNumber").value;
	//var duty = document.getElementById("duty").value;
	var bankCardNumber = document.getElementById("bankCardNumber").value;
	var bankName = document.getElementById("bankName").value;

	//var nameResult = $("#nameResult").html();

	if (idCardNumber == null || idCardNumber == '') {
		result = result + "身份证不能为空 ";
		flag = false;
		$("#idCardNumber").focus();
		show(result);
		return flag;
	}
//	reg =/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
//	if(!reg.test(idCardNumber0) ){
//		result = result + "无效的身份证号";
//		flag = false;
//		$("#idCardNumber0").focus();
//		show(result);
//
//		return flag;
//	}
	
//	if (duty == null || duty == '') {
//		result = result + "职务不能为空";
//		flag = false;
//		$("#duty").focus();
//		show(result);
//		return flag;
//	}
	
	if (bankCardNumber == null || bankCardNumber == '') {
		result = result + "银行卡号不能为空";
		flag = false;
		$("#duty").focus();
		show(result);
		return flag;
	}
	reg =/^[0-9]*$/;
	if(!reg.test(bankCardNumber) ){
		result = result + "无效的银行卡号";
		flag = false;
		$("#bankCardNumber").focus();
		show(result);

		return flag;
	}

	if (bankName == null || bankName == '') {
		result = result + "银行名称不能为空";
		flag = false;
		$("#bankName").focus();
		show(result);
		return flag;
	}

	return flag;
}


function check2() {
	//console.info("check");
	var flag = true;
	var result = "";
	var name = document.getElementById("name").value;
	//var duty = document.getElementById("duty").value;
	var address = document.getElementById("address").value;
	var postCard = document.getElementById("postCard").value;

	//var nameResult = $("#nameResult").html();

	if (name == null || name == '') {
		result = result + "收款人姓名不能为空 ";
		flag = false;
		$("#idCardNumber").focus();
		show(result);
		return flag;
	}
//	reg =/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
//	if(!reg.test(idCardNumber0) ){
//		result = result + "无效的身份证号";
//		flag = false;
//		$("#idCardNumber0").focus();
//		show(result);
//
//		return flag;
//	}
	
//	if (duty == null || duty == '') {
//		result = result + "职务不能为空";
//		flag = false;
//		$("#duty").focus();
//		show(result);
//		return flag;
//	}
	
	if (address == null || address == '') {
		result = result + "收款地址人不能为空";
		flag = false;
		$("#duty").focus();
		show(result);
		return flag;
	}
//	reg =/^[0-9]*$/;
//	if(!reg.test(bankCardNumber) ){
//		result = result + "无效的银行卡号";
//		flag = false;
//		$("#bankCardNumber").focus();
//		show(result);
//
//		return flag;
//	}

	if (postCard == null || postCard == '') {
		result = result + "邮政编码不能为空";
		flag = false;
		$("#bankName").focus();
		show(result);
		return flag;
	}

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

submitbankinfoTOconfirm = function() {
	$('#idCardNumber').val($('#idCardNumber0').val());
	$('#duty').val($('#duty0').val());
	$('#bankCardNumber').val($('#bankCardNumber0').val());
	$('#bankName').val($('#bankName0').val());
};
submitpostinfoTOconfirm = function() {
	$('#name').val($('#name0').val());
	$('#telephone').val($('#telephone0').val());
	$('#idCard').val($('#idCard0').val());
	$('#address').val($('#address0').val());
	$('#postCard').val($('#postCard0').val());
};

accountConfirmBtnClick = function() {
	//console.info("function account");
	//console.info($('#accountConfirmBtn').size());
	$('#personalForm1').form(
			'submit',
			{
				onSubmit : function(param) {
				return check1();
				},
				url : 'hello/updateExpertBankInfo.php',
				success : function(data) {
					var obj = $.parseJSON(data);
					//console.info(obj);
					backURL = "account.jsp";
					if (obj.status == "1") {
						
						$.messager.alert("操作提示",'信息提交成功！感谢您的参与，请点击左侧导航，登出系统','info',function () {
							var url = 'window.location.href="' + backURL + '"';
							setTimeout(url, 1500);
				        });
						
//						$.messager.show({
//							title : 'warning',
//							msg : '信息提交成功！感谢您的参与，请点击左侧导航，登出系统',
//							timeout : 1500,
//							showType : 'slide',
//							style : {
//								
//								right : '',
//								
//								bottom : ''
//							}
//						});
//						var url = 'window.location.href="' + backURL + '"';
//						setTimeout(url, 1500);

					}

				}
			});
};

postConfirmBtnClick = function() {
	//console.info("function account");
	//console.info($('#accountConfirmBtn').size());
	$('#postInfoForm1').form(
			'submit',
			{
				onSubmit : function(param) {
				return check2();
				},
				url : 'hello/updateExpertPostInfo.php',
				success : function(data) {
					var obj = $.parseJSON(data);
					//console.info(obj);
					backURL = "account.jsp";
					if (obj.status == "1") {
						$.messager.alert("操作提示",'信息提交成功！感谢您的参与，请点击左侧导航，登出系统','info',function () {
							var url = 'window.location.href="' + backURL + '"';
							setTimeout(url, 1500);
				        });
						
//						$.messager.show({
//							title : 'warning',
//							msg : '信息提交成功！',
//							timeout : 1500,
//							showType : 'slide',
//							style : {
//								
//								right : '',
//								
//								bottom : ''
//							}
//						});
						var url = 'window.location.href="' + backURL + '"';
						setTimeout(url, 1500);

					}

				}
			});
};
autofill = function() {
	$.ajax({
		url : "hello/getUserBankInfo.php",
		dataType : "json",
		success : function(data) {
			//console.info(data);
			var entity = data.entity;
			$('#bankCardNumber0').val(entity[0].bankCardNumber);
			$('#bankName0').val(entity[0].bankName);
			$('#idCardNumber0').val(entity[0].idCardNumber);
			//$('#duty0').val(entity[0].duty);
			$('#name0').val(entity[0].pname);
			$('#telephone0').val(entity[0].ptelephone);
			$('#idCard0').val(entity[0].pidCardNumber);
			$('#address0').val(entity[0].paddress);
			$('#postCard0').val(entity[0].ppostCard);
		}
	});
};
