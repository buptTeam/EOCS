init=function(){
	
	//set_table_view();
}
	//get_page_view();
	
	
	






get_table_data = function(){
	var entity = null;
	$.ajax({
		url : "hello/getRemark.php",
		async:false,
		//data : {"userId" : userid},
		dataType : "json",
		success: function(data){
			var ent = data.entity;
			entity = ent;
		}
	});
	return entity;
};





//get_illname = function(secondLevelId){
//	var illname = null;
//	$.ajax({
//		url : "hello/getIllName.php",
//		async:false,
//		data : {"secondLevelId" : secondLevelId},
//		dataType : "json",
//		success: function(data){
//			var ent = data.entity;
//			illname = ent[0].name;
//		}
//	});
//	return illname;
//};


//getUserId = function() {
//	//console.info("checkFlow");
//	var userid = null;
//	$.ajax({
//		url : "hello/getUserInfo.php",
//		dataType : "json",
//		async:false,
//		success : function(data) {
//			//console.info(data.entity[0]);
//			var info = data.entity[0];
//			userid = info.userId;
//			
//		}
//	});
//	return userid;
//};

set_table_view = function(){
	//var userid = getUserId();
	//console.info("this is question3： userid"+userid);
	var ent = get_table_data();
	//console.info("this is ent");
	//console.info(ent);
	for(var j=0; j<ent.length; j++){
		var ele1=$('#tbodytrtest').clone(true);
		ele1.attr("id","tbodytrFormal");
		ele1.find('#no').html(j+1);
		var illname = ent[j].sickname;
		ele1.find('#illname').html(illname);
		
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
		$("#tbodytest").append(ele1);
	}
};




