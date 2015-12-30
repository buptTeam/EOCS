<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String allids="";
    String allnames="";
    String firstidarrs="";
    String isManualAdd="";
    String ave="";
    String areaave="";
    String aveim="";
    String areaaveim="";
    String avecon="";
    String areaavecon="";
    int version=0;
    if(request.getParameter("allids")==null){ %>
<jsp:forward page="question1.jsp"/>
<%} 
    else{
    	 allids=request.getParameter("allids");
    	 firstidarrs=request.getParameter("firstidarrs");
    	 allnames=request.getParameter("allnames");
    	 isManualAdd=request.getParameter("isManualAdd");
    	 ave=request.getParameter("ave");
    	 areaave=request.getParameter("areaave");
    	 aveim=request.getParameter("aveim");
    	 areaaveim=request.getParameter("areaaveim");
    	 avecon=request.getParameter("avecon");
    	 areaavecon=request.getParameter("areaavecon");
    	 version=Integer.valueOf( request.getParameter("version"));
    }
%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title> questionnaire  fill</title>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link rel="stylesheet" href="dist/css/bootstrap-select.css">
	
	<script src="js/jquery-2.0.3.js"></script>
	
	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
   
    <script src="dist/js/bootstrap-select.js"></script>
    <script src="dist/js/bootstrap-select-backup.js"></script>
  
    <link rel="stylesheet" type="text/css" href="easyui/themes/gray/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
  
 	<script type="text/javascript" src="easyui/jquery.min.js"></script>
   	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>


    <script type="text/javascript" src="myjs/question2.js"></script>
    <script type="text/javascript"></script>
</head>
<body>
   <ul id="questionTab" class="nav nav-tabs">
   		<li ><a href="javascript:;" ><font id="shuoming">第一轮调查说明</font></a></li>
   		<li ><a href="javascript:;" >填写规则</a></li>
   		<li ><a href="javascript:;" > 重大疾病选择</a></li>
   		
   		
   		<li class="active"><a href="question2.jsp" >重大疾病评价</a></li> 
	</ul>
              
              
              <div class="table-responsive">
                <div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<ul>
				<li>
					<div>
						熟悉程度：采用尺度调查法。0表示“最不熟悉”，9表示“最熟悉”，请根据自己对该疾病（或问题）的熟悉程度填写0-9之间的任意数字。
					</div>
				</li>
				<li>
					<span>重大程度：0表示“最不重大”，9表示“最重大”。</span>
				</li>
				<li>
					<div>
						<span>可预防程度：0表示“完全不可预防”，9表示“完全可以预防”。</span>
					</div>
				</li>
			</ul>
		</div>
		<div>
			<font color="red" id="warning" style="display:none">其中输入框旁边的红色数字为，该指标的平均值。</font>
		</div>
	</div>
</div>
                <form id="submitremarkForm">
                <table class="table table-striped table-hover table-bordered  table-condensed">
                  <thead>
                    <tr>
                      <th>编号</th>
                      <th>重大疾病和健康问题</th>
                      <th>熟悉程度</th>
                       <%if(version==2){ %>
                      <th>全体专家均分</th>
                      <th>领域专家均分</th>
                      <%} %>
                      <th>重大程度</th>
                       <%if(version==2){ %>
                      <th>全体专家均分</th>
                      <th>领域专家均分</th>
                      <%} %>
                      <th>可预防程度</th>
                       <%if(version==2){ %>
                      <th>全体专家均分</th>
                      <th>领域专家均分</th>
                      <%} %>
                      
                    </tr>
                  </thead>
                  <tbody>
                  <% 
             
                  String[] idarr=allids.split(",");
                  String[] firstidarr=firstidarrs.split(",");
                  String[] namearr=allnames.split(",");
                  String[] isManualAddarr=isManualAdd.split(",");
                  String[] avearr=ave.split(",");
                  String[] areaavearr=areaave.split(",");
                  String[] aveimarr=aveim.split(",");
                  String[] areaaveimarr=areaaveim.split(",");
                  String[] aveconarr=avecon.split(",");
                  String[] areaaveconarr=areaavecon.split(",");
                  for(int i=0;i<idarr.length;i++){%>
                   
                	  <tr  class="tr">
                      <td> <%=i+1 %> </td>
                      <td> <%=namearr[i] %> </td>
                     
                      <td>
                      <input type="text" id="secondLevelId" name="secondLevelId" style="display:none" value="<%=idarr[i] %>">
                      <input type="text" name="firstLevelId" style="display:none" value="<%=firstidarr[i] %>">
                      <input type="text" name="sickName" style="display:none" value="<%=namearr[i]%>">
                      <input type="text" name="isManualAdd" style="display:none" value="<%=isManualAddarr[i]%>">
                      	
                       		<input type="text" class="form-control" id="name" name="familiar" placeholder="请输入0-9的数字">
                      		
                      		 
                      </td>
                      <%if(version==2){ %>
                      <td> <%=avearr[i] %></td>
                      <td><%=areaavearr[i] %></td>
                      <%} %>
                      <td>
                        <!-- Split button -->
                       
                          <input type="text" class="form-control" id="name" name="importance" placeholder="请输入0-9的数字">
                     
                        
                         
                          <!-- 
                          <div class="checkbox col-md-offset-1" id="secondLevelDivTest" style="display:none" >
  							<label>
    						<input type="text" class="form-control" id="name" name="importance" placeholder="请输入0-9的数字">
    						
    						&nbsp;&nbsp;&nbsp;&nbsp;
    						<font size="3" color="red" id="ave">1</font>
    						
  						</label>
  						
				</div>
				 -->
                      </td>
                      <%if(version==2){ %>
                      <td><%=aveimarr[i] %></td>
                      <td><%=areaaveimarr[i] %></td>
                      <%} %>
                      <td>
                        <!-- Split button -->
                      
                       	<input type="text" class="form-control" id="name" name="control" placeholder="请输入0-9的数字">
                       
                       	
                        
                      </td>
                      <%if(version==2){ %>
                      <td><%=aveconarr[i] %></td>
                      <td><%=areaaveconarr[i] %></td>
                      <%} %>
                    </tr>  
              <%} %>
                           
                  </tbody>
                </table>
                </form>
              </div>
              <button type="button" id="submitremarkBtn" class="col-sm-offset-5 btn btn-success " style="text-align:center">&nbsp;&nbsp;提&nbsp;交&nbsp;&nbsp;</button>

</body>
</html>
