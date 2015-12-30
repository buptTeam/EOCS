$(function(){
	//get_page_view();
	$("#toConfirm_ill").click(function(){
		$.ajax({
			url : "../hello/exportData.php",

			data: {"type": 5},
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
	$("#toConfirm_top20").click(function(){
		$.ajax({
			url : "../hello/exportData.php",

			data: {"type": 6},
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
	
	$("#toConfirm").click(function(){
		$.ajax({
			url : "../hello/exportData.php",

			data: {"type": 1},
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
	
	$("#toConfirm2").click(function(){
		$.ajax({
			url : "../hello/exportData.php",

			data: {"type": 4},
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
	get_page_view(initialPage);
	bind();
	
});



get_page_view = function(currentPage){
	$.ajax({
		url : "../hello/getExportsInfo.php",

		data: {"ispage": 1, "pageNo": currentPage, "singlePageNumers":10},
		dataType : "json",
		success : function(data) {
			var entity=data.entity;
			var totalpages=data.length;
			//console.info("totalpages "+ totalpages);
			set_div_view(entity);
			$("#currentpage").text(currentPage);
			$("#totalpages").text(totalpages);			
		}
	});
};

get_table_data = function(userid){
	var entity = null;
	$.ajax({
		url : "../hello/getRemark_research.php",
		async:false,
		data : {"userId" : userid},
		dataType : "json",
		success: function(data){
			var ent = data.entity;
			entity = ent;
		}
	});
	return entity;
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

get_illname = function(secondLevelId){
	var illname = null;
	$.ajax({
		url : "../hello/getIllName.php",
		async:false,
		data : {"secondLevelId" : secondLevelId},
		dataType : "json",
		success: function(data){
			var ent = data.entity;
			illname = ent[0].name;
		}
	});
	return illname;
};

set_div_view = function(entity){
	//console.info("set_div_view");
	//console.info(entity);
	while($('#itemFormal').size()>0){
		$('#itemFormal').eq(0).remove();
	}
	for(var i=0;i<entity.length;i++){
		//console.info("hello"+i);
		var ele=$('#itemTest').clone(true);
		ele.attr("id","itemFormal");
		ele.find('#id').html(i+1);
		ele.find('#name').html(entity[i].name);
		ele.find('#mail').html(entity[i].mail);
		var href = "#collapse"+i;
		var href1 = "collapse"+i;
		ele.find('.accordion-toggle').attr("href",href);
		ele.find('.accordion-body').attr("id",href1);
		
		var ent = get_table_data(entity[i].userId);
		//console.info("this is ent");
		//console.info(ent);
		for(var j=0; j<ent.length; j++){
			var ele1=ele.find('#tbodytrtest').clone(true);
			ele1.attr("id","tbodytrFormal");
			ele1.find('#no').html(j+1);
			//var illname = get_illname(ent[j].id.secondLevelId);
			
			ele1.find('#illname').html(ent[j].sickname);
			
			ele1.find('#familiar').html(ent[j].familiar);
			ele1.find('#importance').html(ent[j].importance);
			ele1.find('#control').html(ent[j].control);
			//var href = "#collapse"+i;
			//var href1 = "collapse"+i;
			//ele.find('.accordion-toggle').attr("href",href);
			//ele.find('.accordion-body').attr("id",href1);
			ele1.show();
			//console.info("this is ele: ");
			//console.info(ele);
			ele.find("#tbodytest").append(ele1);
		}
		
		ele.show();
		//console.info("this is ele: ");
		//console.info(ele);
		$('#accordion2').append(ele);
		
		//ele.insertAfter($('#itemTest'));
	}
};


