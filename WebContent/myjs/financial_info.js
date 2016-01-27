$(function(){
	//get_page_view();
	$("#toConfirm").click(function(){
	$.ajax({
		url : "../hello/exportData.php",

		data: {"type": 2},
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
	var initialPage = 1;
	//get_page_view(initialPage);
	bind();
});



get_page_view = function(currentPage){
	$.ajax({
		url : "../hello/getbankInfo.php",

		data: {"ispage": 1, "pageNo": currentPage, "singlePageNumers":10},
		dataType : "json",
		success : function(data) {
			var entity=data.entity;
			var totalpages=data.length;
			//console.info("totalpages "+ totalpages);
			set_table_view(entity);
			$("#currentpage").text(currentPage);
			$("#totalpages").text(totalpages);			
		}
	});
};



bind = function(){
	$("#firstPage").click(function(){
		get_page_view(1);
	});
	$("#lastPage").click(function(){
		var currentPage = $("#totalpages").text();
		get_page_view(currentPage);
	});
	$("#prePage").click(function(){
		var currentPage = Number($("#currentpage").text())-1;
		
		if( currentPage < 1){
			currentPage = 1;
		}
		get_page_view(currentPage);
	});
	$("#nextPage").click(function(){
		var currentPage = Number($("#currentpage").text())+1;
		var lastPage = $("#totalpages").text();
		if(currentPage > lastPage){
			currentPage = lastPage;
		}
		//$("#currentpage").text(lastPage);
		
		//console.info("nextPage  test: "+ currentPage + "   lastpage test:  "+ lastPage);
		get_page_view(currentPage);
	});
	$("#toPageBtn").click(function(){
		var toPage = Number($("#toPageInput").val()); 
		var lastPage = $("#totalpages").text();
		if(toPage >= lastPage){
			currentPage = lastPage;
		}else if(toPage <= 1){
			currentPage = 1;
		}else{
			currentPage = toPage;
		}
		get_page_view(currentPage);
	});
};


set_table_view = function(entity){
	//console.info("set_table_view");
	//console.info(entity);
	while($('#itemFormal').size()>0){
		$('#itemFormal').eq(0).remove();
	}
	for(var i=0;i<entity.length;i++){
		//console.info("hello"+i);
		var ele=$('#itemTest').clone(true);
		ele.attr("id","itemFormal");
		var id = entity[i].userId;
		var ent = get_userinfo(id);
		
		ele.find('#name').html(ent[0].name);
		ele.find('#workplace').html(ent[0].workPlace);
		ele.find('#duty').html(entity[i].duty);
		ele.find('#idCard').html(entity[i].idCardNumber);
		ele.find('#bankCard').html(entity[i].bankCardNumber);
		ele.find('#bankName').html(entity[i].bankName);
		ele.find('#pname').html(entity[i].pname);
		ele.find('#pidcardnumber').html(entity[i].pidCardNumber);
		ele.find('#ptelephone').html(entity[i].ptelephone);
		ele.find('#paddress').html(entity[i].paddress);
		ele.find('#ppostcard').html(entity[i].ppostCard);
		ele.show();
		$('#itemtbody').append(ele);
		
		//ele.insertAfter($('#itemTest'));
	}
};

get_userinfo = function(userid){
	var ent = null
	$.ajax({
		url : "../hello/getUserInfo_financialinfo.php",
		async:false,
		data: {"userId": userid},
		dataType : "json",
		success : function(data) {
			var entity=data.entity;
			ent = entity;
						
		}
	});
	return ent;
};

