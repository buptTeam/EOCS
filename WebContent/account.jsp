<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>account_information</title>

</head>
<body style="height:100%">
    <div >
    	<font color="red" id="warning" size="3" class="col-sm-offset-1">
    	请选择下面两种付款方式之一，并填写相应信息，我们将在两轮调查完成之后，按照中国工程院相关规定支付相应咨询费。
 
    	</font>
    	<br>
    	
    </div>
    <hr>
    <div id = "bank_info">
    <font color="red" id="warning" size="3" class="col-sm-offset-5">
    	方式一：银行汇款
 
    	</font>
    	<br>
<form  id="personalForm" class="form-horizontal" >
   <div class="form-group">
      <label for="name" class="col-sm-3 control-label">身份证号</label>
      <div class="col-sm-5 ">
      <input type="text" class="form-control" id="idCardNumber0" name="idCardNumber0" placeholder="请输入您的身份证号">
       </div> 
      <font color="red" id="nameResult" style="float:left;" class="col-sm-1">*</font>
   </div>   
      
      <label for="age" class="col-sm-2 control-label "  style="display:none">职&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp务</label>
      <div class="col-sm-3 " style="display:none">
      <input type="text" class="form-control easyui-validatebox"  id="duty0" name="duty0"  placeholder="请输入您的职务">
      </div>
       <font color="red" id="telephoneResult"  class="col-sm-1" style="display:none">*</font>
    
     <div class="form-group">  
       
      <label for="name" class="col-sm-3 control-label">银行账号</label>
      <div class="col-sm-5 ">
      <input type="text" class="form-control" id="bankCardNumber0" name="bankCardNumber0" placeholder="请输入您的银行账号">
       </div> 
      <font color="red" id="educationResult" style="float:left;" class="col-sm-1">*</font>
   </div>
   <div class="form-group">
      
      
      <label for="age" class="col-sm-3 control-label">开户银行及支行</label>
      <div class="col-sm-5 ">
      <input type="text" class="form-control" id="bankName0" name="bankName0" placeholder="请输入开户银行全称">
      </div>
       <font color="red" id="ageResult"  class="col-sm-1">*</font>
      
   </div>
   <br>
   <br>
   	<a id="toConfirm" href="javascript:;" data-toggle="modal" data-target="#confirmModal" role="button" class="btn btn-success btn-sm col-sm-offset-5">提交信息</a>
	
 <!-- <button type="button" id="personalBtn" class="btn btn-success btn-sm" align="center" >提交</button> -->
</form>
</div>
<hr>
    <div >
    	<font color="red" id="warning" size="3" class="col-sm-offset-5">
    	方式二：邮局汇款
 
    	</font>
    	<br>
    	<br>
    	
    </div>	
<div id="post_info">
	<form  id="postInfoForm" class="form-horizontal" >
   <div class="form-group">
      <label for="name" class="col-sm-3 control-label">收&nbsp&nbsp款&nbsp&nbsp人&nbsp&nbsp姓&nbsp名</label>
      <div class="col-sm-5 ">
      <input type="text" class="form-control" id="name0" name="name0" placeholder="请输入收款人姓名">
       </div> 
      <font color="red" id="nameResult" style="float:left;" class="col-sm-1">*</font>

      
      
   </div>
   <!-- 
   <div class="form-group">
     
      
      <label for="age" class="col-sm-3 control-label "  >收款人联系方式</label>
      <div class="col-sm-5 ">
      <input type="text" class="form-control easyui-validatebox"  id="telephone0" name="telephone0"  placeholder="请输入收款人联系方式（短信通知）">
      </div>
       <font color="red" id="telephoneResult"  class="col-sm-1">*</font>
      
      
   </div>
    -->
    
    <input type="text" class="form-control easyui-validatebox"  id="telephone0" name="telephone0"  placeholder="请输入收款人联系方式（短信通知）" style="display:none">
    
    <!-- 
   <div class="form-group">
      <label for="name" class="col-sm-3 control-label">收款人身份证号</label>
      <div class="col-sm-5 ">
      <input type="text" class="form-control" id="idCard0" name="idCard0" placeholder="请输入收款人身份证号">
       </div> 
      <font color="red" id="educationResult" style="float:left;" class="col-sm-1">*</font>
      
     
      
   </div>
    -->
    <input type="text" class="form-control" id="idCard0" name="idCard0" placeholder="请输入收款人身份证号" style="display:none">
      <div class="form-group">
      <label for="name" class="col-sm-3 control-label">收&nbsp&nbsp&nbsp款&nbsp&nbsp&nbsp地&nbsp&nbsp&nbsp址</label>
      <div class="col-sm-5 ">
      <input type="text" class="form-control" id="address0" name="address0" placeholder="请输入收款地址">
       </div> 
      <font color="red" id="educationResult" style="float:left;" class="col-sm-1">*</font>
      
     
      
   </div>
   <div class="form-group">
      <label for="name" class="col-sm-3 control-label">邮&nbsp&nbsp&nbsp政&nbsp&nbsp&nbsp编&nbsp&nbsp&nbsp码</label>
      <div class="col-sm-5 ">
      <input type="text" class="form-control" id="postCard0" name="postCard0" placeholder="请输入邮政编码">
       </div> 
      <font color="red" id="educationResult" style="float:left;" class="col-sm-1">*</font>
      
     
      
   </div>
   <br>
   <br>
   	<a id="toConfirmpost" href="javascript:;" data-toggle="modal" data-target="#confirmModal2" role="button" class="btn btn-success btn-sm col-sm-offset-5">提交信息</a>
	
 <!-- <button type="button" id="personalBtn" class="btn btn-success btn-sm" align="center" >提交</button> -->
</form>
</div>


	
<form  id="personalForm1" class="form-horizontal" >			
        <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">请确认以下信息</h4>
                
              </div>
              <div class="modal-body" >
              
 
   <div class="form-group">
      <label for="name" class="col-sm-4 control-label">身份证号</label>
      <div class="col-sm-4 ">
      <input type="text" class="form-control" id="idCardNumber" name="idCardNumber" placeholder="请输入您的身份证号" >
       </div> 
      
   </div>
   
   <div class="form-group" style="display:none">
    	<label for="age" class="col-sm-4 control-label "  >职&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp务</label>
      	<div class="col-sm-4 ">
      	<input type="text" class="form-control easyui-validatebox"  id="duty" name="duty"  placeholder="请输入您的职务" >
      	</div>
       	
   </div>
   
   <div class="form-group">
      <label for="name" class="col-sm-4 control-label">银行账号</label>
      <div class="col-sm-4 ">
      <input type="text" class="form-control" id="bankCardNumber" name="bankCardNumber" placeholder="请输入您的银行账号" >
       </div>  
   </div>
   
   <div class="form-group" >
      <label for="age" class="col-sm-4 control-label">开户银行及支行</label>
      <div class="col-sm-4 ">
      <input type="text" class="form-control" id="bankName" name="bankName" placeholder="请输入开户银行全称" >
      </div>
    </div>
 <!-- <button type="button" id="personalBtn" class="btn btn-success btn-sm" align="center" >提交</button> -->



              </div>
              
              
              <div class="modal-footer">
               
                <button type="button" id="accountConfirmBtn" class="btn btn-success" >提交</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
              </div>
            </div>
          </div>
        </div>
</form>


<!-- post info -->
<form  id="postInfoForm1" class="form-horizontal" >			
        <div class="modal fade" id="confirmModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">请确认以下信息</h4>
                
              </div>
              <div class="modal-body" >
              
 
   <div class="form-group">
      <label for="name" class="col-sm-4 control-label">收款人姓名</label>
      <div class="col-sm-4 ">
      <input type="text" class="form-control" id="name" name="name" placeholder="请输入您的身份证号" >
       </div> 
      
   </div>
   <!-- 
   <div class="form-group">
    	<label for="age" class="col-sm-4 control-label "  >收款人联系方式</label>
      	<div class="col-sm-4 ">
      	<input type="text" class="form-control easyui-validatebox"  id="telephone" name="telephone"  placeholder="请输入您的职务" >
      	</div>
       	
   </div>
    -->
    <input type="text" class="form-control easyui-validatebox"  id="telephone" name="telephone"  placeholder="请输入您的联系方式" style="display:none">
    <!-- 
   <div class="form-group">
      <label for="name" class="col-sm-4 control-label">收款人身份证号</label>
      <div class="col-sm-4 ">
      <input type="text" class="form-control" id="idCard" name="idCard" placeholder="请输入您的银行账号" >
       </div>  
   </div>
    -->
    <input type="text" class="form-control" id="idCard" name="idCard" placeholder="请输入您的银行账号" style="display:none">
   <div class="form-group">
      <label for="age" class="col-sm-4 control-label">收款人地址</label>
      <div class="col-sm-4 ">
      <input type="text" class="form-control" id="address" name="address" placeholder="请输入开户银行全称" >
      </div>
    </div>
    <div class="form-group">
      <label for="age" class="col-sm-4 control-label">邮政编码</label>
      <div class="col-sm-4 ">
      <input type="text" class="form-control" id="postCard" name="postCard" placeholder="请输入开户银行全称" >
      </div>
    </div>
 <!-- <button type="button" id="personalBtn" class="btn btn-success btn-sm" align="center" >提交</button> -->



              </div>
              
              
              <div class="modal-footer">
               
                <button type="button" id="postConfirmBtn" class="btn btn-success" >提交</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
              </div>
            </div>
          </div>
        </div>
</form>



</body>
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


    <script type="text/javascript" src="myjs/account.js"></script>
    
    <script type="text/javascript"></script>
</html>