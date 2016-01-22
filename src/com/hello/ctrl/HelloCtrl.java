package com.hello.ctrl;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.hibernate.HibernateException;

import antlr.build.Tool;

import com.basic.BaseCtrl;
import com.basic.MyTool;
import com.basic.ParseToReponse;
import com.bean.DataBean;
import com.bean.UserBean;
import com.opensymphony.xwork2.validator.annotations.RegexFieldValidator;

public class HelloCtrl extends BaseCtrl {
	// 判断是否在邮件列表
	public void checkInfo(HttpServletRequest request,
			HttpServletResponse response) {
		UserBean userBean = new UserBean();
		String mesString = null;
		try {
			mesString = userBean.checkInfo(request.getParameter("mail"),
					request.getParameter("name"),
					request.getParameter("workplace"));
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		writeJSon(response, mesString);
	}

	// 登陆名是否已使用
	public void LoginNameIsExist(HttpServletRequest request,
			HttpServletResponse response) {
		UserBean userBean = new UserBean();
		String mesString = null;
		try {
			mesString = userBean.LoginNameIsExist(request
					.getParameter("LoginName"));
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		writeJSon(response, mesString);
	}

	// 专家注册 type=4
	public void ExpertRegistry(HttpServletRequest request,
			HttpServletResponse response) {
		UserBean userBean = new UserBean();
		String mesString = null;
		try {
			mesString = userBean.ExpertRegistry(
					request.getParameter("LoginName"),
					request.getParameter("password"),
					Integer.valueOf(request.getParameter("infoId")));
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		writeJSon(response, mesString);
	}

	// 添加除专家外的其他类的人员 type=1 位超级管理员 2 位财务人员 3数据收集人员
	public void addOtherUser(HttpServletRequest request,
			HttpServletResponse response) {
		UserBean userBean = new UserBean();
		String mesString = null;
		try {
			mesString = userBean.addOtherUser(
					request.getParameter("LoginName"),
					request.getParameter("password"),
					Integer.valueOf(request.getParameter("userType")));
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		writeJSon(response, mesString);
	}

	// 登陆
	public void login(HttpServletRequest request, HttpServletResponse response) {
		UserBean userBean = new UserBean();
		String mesString = null;
		try {
			mesString = userBean.login(request.getParameter("loginName"),
					request.getParameter("password"), request);
			// System.out.println(request.getSession().getAttribute("name")+"sesionUserId");
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		writeJSon(response, mesString);
	}

	// 更新专家基本信息
	public void updateExpertBasicInfo(HttpServletRequest request,
			HttpServletResponse response) {
		UserBean userBean = new UserBean();
		String mesString = null;
		int techWorkYears = 0;
		int administrationWorkYear = 0;
		int age = 0;
		try {
			 System.out.println("goodatArea1"+ request.getParameter("goodatArea1"));
			 if(request.getParameter("techWorkYears") == "" || request.getParameter("techWorkYears") == null){
				 techWorkYears = 0;
			 }else{
				 techWorkYears = Integer.valueOf(MyTool.parseTostring(request.getParameter("techWorkYears")));
			 }
			 if(request.getParameter("administrationWorkYear") == "" || request.getParameter("administrationWorkYear") == null){
				 administrationWorkYear = 0;
			 }else{
				 administrationWorkYear = Integer.valueOf(MyTool.parseTostring(request.getParameter("administrationWorkYear")));
			 }
			 if(request.getParameter("age") == "" || request.getParameter("age") == null){
				 age = 0;
			 }else{
				 age = Integer.valueOf(MyTool.parseTostring(request.getParameter("age")));
			 }
			 
				 mesString = userBean.updateExpertBasicInfo(request
							.getParameter("name"),  request
									.getParameter("education"), request
							.getParameter("workPlace"), request
							.getParameter("postcode"), request
							.getParameter("techLevel"), techWorkYears,
							request.getParameter("telephone"), request
									.getParameter("mail"), request
									.getParameter("administrationDuty"), Integer
									.valueOf(MyTool.parseTostring(request
											.getParameter("goodatArea1"))), request
									.getParameter("area1Major"), Integer.valueOf(MyTool
									.parseTostring(request.getParameter("area1Year"))),
							Integer.valueOf(MyTool.parseTostring(request
									.getParameter("goodatArea2"))), request
									.getParameter("area2Major"), Integer.valueOf(MyTool
									.parseTostring(request.getParameter("area2Year"))),
							Integer.valueOf(MyTool.parseTostring(request
									.getParameter("goodatArea3"))), request
									.getParameter("area3Major"), Integer.valueOf(MyTool
									.parseTostring(request.getParameter("area3Year"))),
							Integer.valueOf(MyTool.parseTostring(request
									.getParameter("goodatArea4"))), request
									.getParameter("area4Major"), Integer.valueOf(MyTool
									.parseTostring(request.getParameter("area4Year"))),
							Integer.valueOf(MyTool.parseTostring(request
									.getParameter("goodatArea5"))), request
									.getParameter("area5Major"), Integer.valueOf(MyTool
									.parseTostring(request.getParameter("area5Year"))),
							age,administrationWorkYear,
							request);
			
			 
		
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		writeJSon(response, mesString);
	}

	// 更新专家银行信息
	public void updateExpertPostInfo(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("here");
		UserBean userBean = new UserBean();
		String mesString = null;
		try {
			mesString = userBean.updateExpertPostInfo(
					request.getParameter("name"),
					request.getParameter("telephone"),
					request.getParameter("idCard"),
					request.getParameter("address"),
					request.getParameter("postCard"),request);
	
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		writeJSon(response, mesString);
	}
	public void updateExpertBankInfo(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("here");
		UserBean userBean = new UserBean();
		String mesString = null;
		try {
			mesString = userBean.updateExpertBankInfo(
					request.getParameter("bankName"),
					request.getParameter("duty"),
					request.getParameter("idCardNumber"),
					request.getParameter("bankCardNumber"),request);
	
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		writeJSon(response, mesString);
	}
	//获取一级分类
	public void getFirstLevel(HttpServletRequest request,
			HttpServletResponse response) {
		UserBean userBean = new UserBean();
		String mesString = null;
		try {
			mesString = userBean.getFirstLevel();
	
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		writeJSon(response, mesString);
	}
	public void getSecondLevel(HttpServletRequest request,
		HttpServletResponse response) {
		UserBean userBean = new UserBean();
		String mesString = null;
		try {
			mesString = userBean.getSecondLevel(Integer.valueOf( request.getParameter("fitstLevelId")));
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		writeJSon(response, mesString);
	}
	
	public void getIllName(HttpServletRequest request,
			HttpServletResponse response) {
			UserBean userBean = new UserBean();
			String mesString = null;
			try {
				mesString = userBean.getIllName(Integer.valueOf( request.getParameter("secondLevelId")));
			} catch (HibernateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			writeJSon(response, mesString);
		}
	
	public void submitremark(HttpServletRequest request,
			HttpServletResponse response) {
		UserBean userBean = new UserBean();
		String mesString0 = null;
		String mesString = null;
		try {
			int uerid= (int) request.getSession().getAttribute("userId");
			String[] idsStrings= request.getParameterValues("secondLevelId");
			String[] fistidStrings= request.getParameterValues("firstLevelId");
			String[] sickNames= request.getParameterValues("sickName");
			String[] familiar= request.getParameterValues("familiar");
			String[] importance= request.getParameterValues("importance");
			String[] control= request.getParameterValues("control");
			String[] isManualAdd= request.getParameterValues("isManualAdd");
			int version=(int) request.getSession().getAttribute("version");
			
			userBean.initremark(uerid,version);
			for(int i=0;i<idsStrings.length;i++){
				//if(version==1)
					
				//mesString0 = userBean.countSecondLevel(Integer.valueOf(MyTool.parseTostring(idsStrings[i])),Integer.valueOf(MyTool.parseTostring(familiar[i])), Integer.valueOf(MyTool.parseTostring(importance[i])), Integer.valueOf(MyTool.parseTostring(control[i])));
//				System.out.println("this submit remark");
//				System.out.println(mesString0);
				
				mesString = userBean.submitremark(version,Integer.valueOf(MyTool.parseTostring(familiar[i])), Integer.valueOf(MyTool.parseTostring(importance[i])), Integer.valueOf(MyTool.parseTostring(control[i])), uerid, Integer.valueOf(MyTool.parseTostring(idsStrings[i])),Integer.valueOf(MyTool.parseTostring(fistidStrings[i])),sickNames[i],Integer.valueOf(MyTool.parseTostring(isManualAdd[i])));
			}
			//
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("submit"+mesString);
		writeJSon(response, mesString);
	}
	
	public void getRemark(HttpServletRequest request,
			HttpServletResponse response){
		UserBean userBean = new UserBean();
		String mesString = null;
		try{
			//int userid = Integer.valueOf(request.getParameter("userId"));
			int userid = (int)request.getSession().getAttribute("userId");
			mesString =userBean.getRemark(userid);
		}catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		writeJSon(response, mesString);
	}
	public void getRemark2(HttpServletRequest request,
			HttpServletResponse response){
		UserBean userBean = new UserBean();
		String mesString = null;
		try{
			//int userid = Integer.valueOf(request.getParameter("userId"));
			int userid = (int)request.getSession().getAttribute("userId");
			mesString =userBean.getRemark2(userid);
		}catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		writeJSon(response, mesString);
	}
	
	public void getRemark_research(HttpServletRequest request,
			HttpServletResponse response){
		UserBean userBean = new UserBean();
		String mesString = null;
		try{
			int userid = Integer.valueOf(request.getParameter("userId"));
			//int userid = (int)request.getSession().getAttribute("userId");
			mesString =userBean.getRemark(userid);
		}catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		writeJSon(response, mesString);
	}
	
	public void getUserInfo(HttpServletRequest request,
			HttpServletResponse response) {
		UserBean userBean = new UserBean();
		String mesString = null;
		try {
			int userid= (int) request.getSession().getAttribute("userId");
			System.out.println("this is userid");
			System.out.println(userid);
				//int userid = Integer.valueOf(request.getParameter("userId"));
				mesString = userBean.getUserInfo(userid);
				System.out.println(mesString);
			//
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		writeJSon(response, mesString);
	}
	
	public void getUserInfo_financialinfo(HttpServletRequest request,
			HttpServletResponse response) {
		UserBean userBean = new UserBean();
		String mesString = null;
		try {
			int userid= Integer.valueOf(request.getParameter("userId"));
			System.out.println("this is userid");
			System.out.println(userid);
				//int userid = Integer.valueOf(request.getParameter("userId"));
				mesString = userBean.getUserInfo(userid);
				System.out.println(mesString);
			//
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		writeJSon(response, mesString);
	}
	public void getAllExportsInfo(HttpServletRequest request,
			HttpServletResponse response) {
		UserBean userBean = new UserBean();
		String mesString = null;
		try {
			
			
				mesString = userBean.getAllExportsInfo();
			//
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		writeJSon(response, mesString);
	}
	
	public void getExportsInfo(HttpServletRequest request,
			HttpServletResponse response) {
		UserBean userBean = new UserBean();
		String mesString = null;
		try {
				mesString = userBean.getExportsInfo(request.getParameter("ispage") , Integer.valueOf(request.getParameter("pageNo")), Integer.valueOf(request.getParameter("singlePageNumers")));
			//
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		writeJSon(response, mesString);
	}
	
//	public void getAllUsers(HttpServletRequest request,
//			HttpServletResponse response) {
//		UserBean userBean = new UserBean();
//		String mesString = null;
//		try {
//			
//			
//				mesString = userBean.getAllUsers();
//			//
//		} catch (HibernateException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		writeJSon(response, mesString);
//	}
	
	public void getUserBankInfo(HttpServletRequest request,
			HttpServletResponse response) {
		UserBean userBean = new UserBean();
		String mesString = null;
		try {
			int uerid= (int) request.getSession().getAttribute("userId");
			//int uerid= Integer.valueOf(request.getParameter("userId"));
			mesString = userBean.getUserBankInfo(uerid);
			//
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		writeJSon(response, mesString);
	}
	
	
	public void getOterUserInfo(HttpServletRequest request,
			HttpServletResponse response) {
		UserBean userBean = new UserBean();
		String mesString = null;
		try {
				mesString = userBean.getOterUserInfo();
			//
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		writeJSon(response, mesString);
	}
	public void getbankInfo(HttpServletRequest request,
			HttpServletResponse response) {
		UserBean userBean = new UserBean();
		String mesString = null;
		try {
				mesString = userBean.getbankInfo(request.getParameter("ispage") , Integer.valueOf(request.getParameter("pageNo")), Integer.valueOf(request.getParameter("singlePageNumers")));
			//
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		writeJSon(response, mesString);
	}
	
	public void getsysVersion(HttpServletRequest request,
			HttpServletResponse response) {
		UserBean userBean = new UserBean();
		String mesString = null;
		try {
				mesString = userBean.getsysVersion();
			//
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		writeJSon(response, mesString);
	}
	
	public void setsysVersion(HttpServletRequest request,
			HttpServletResponse response) {
		UserBean userBean = new UserBean();
		String mesString = null;
		try {
				mesString = userBean.setsysVersion(Integer.valueOf(request.getParameter("isVersion")));
			//
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		writeJSon(response, mesString);
	}
	
	public void exportData(HttpServletRequest request,
			HttpServletResponse response) {
		UserBean userBean = new UserBean();
		String mesString = null;
		
		try {
				mesString = userBean.exportData(Integer.valueOf(request.getParameter("type")),request);
			//
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		writeJSon(response, mesString);
	}
	
//	public void getData(HttpServletRequest request,
//			HttpServletResponse response) throws Exception {
//		DataBean dataBean = new DataBean();
//		String mesString = null;
//		
//		try {
//				mesString = dataBean.getData(request);
//			//
//		} catch (HibernateException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		writeJSon(response, mesString);
//	}
	
	public void addsecondLeveSick(HttpServletRequest request,
			HttpServletResponse response) {
		UserBean userBean = new UserBean();
		String mesString = null;
		try {
				mesString = userBean.addsecondLeveSick(request.getParameter("sickNmae"));
			//
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		writeJSon(response, mesString);
	}
	public void cleanSession(HttpServletRequest request,
			HttpServletResponse response) {
		//UserBean userBean = new UserBean();
		String mesString = null;
		try {
				//mesString = userBean.addsecondLeveSick(request.getParameter("sickNmae"));
			request.getSession().removeAttribute("userId");
			request.getSession().removeAttribute("type");
			request.getSession().removeAttribute("loginName");
			request.getSession().removeAttribute("msg");
			mesString = ParseToReponse
					.parse("1", "clean", null, 0);
			//
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		writeJSon(response, mesString);
	}
	
	public void uploadFile(HttpServletRequest request,
			HttpServletResponse response){
		  try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		  String typeString = request.getParameter("type");
		  DiskFileItemFactory factory = new DiskFileItemFactory();
		  ServletFileUpload upload = new ServletFileUpload(factory);
		  try {
		   List items = upload.parseRequest(request);
		   Iterator itr = items.iterator();
		   while (itr.hasNext()) {
		    FileItem item = (FileItem) itr.next();
		    if (item.isFormField()) {
		     System.out.println("表单参数名:" + item.getFieldName() + "，表单参数值:" + item.getString("UTF-8"));
		    } else {
		     if (item.getName() != null && !item.getName().equals("")) {
		      System.out.println("上传文件的大小:" + item.getSize());
		      System.out.println("上传文件的类型:" + item.getContentType());
		      // item.getName()返回上传文件在客户端的完整路径名称
		      System.out.println("上传文件的名称:" + item.getName());

		      File tempFile = new File(item.getName());

		      File file = new File(request.getSession().getServletContext().getRealPath("/download"), item.getName());
		      System.out.println(request.getSession().getServletContext().getRealPath("/download"));

		      item.write(file);
		      request.setAttribute("upload.message", "上传文件成功！");
		      DataBean dBean=new DataBean();
		      System.out.println("HelloCtrl.uploadFile()"+typeString);
		      dBean.getData(request,item.getName(),typeString);
		     }else{
		      request.setAttribute("upload.message", "没有选择上传文件！");
		     }
		    }
		   }
		  }catch(FileUploadException e){
		   e.printStackTrace();
		  } catch (Exception e) {
		   e.printStackTrace();
		   request.setAttribute("upload.message", "上传文件失败！");
		  }
		  try {
			  if(typeString == "1"){
				  response.sendRedirect("../admin/set_person.jsp");
			  }else{
				  response.sendRedirect("../researcher/research_info.jsp");
			  }
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 }
		
	public void changePwd(HttpServletRequest request,
			HttpServletResponse response) {
		UserBean userBean = new UserBean();
		String mesString = null;
		try {
				//mesString = userBean.addsecondLeveSick(request.getParameter("sickNmae"));
			int uerid= (int) request.getSession().getAttribute("userId");
			mesString = userBean.changePwd(uerid, request.getParameter("password"));
			//
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		writeJSon(response, mesString);
	}
	public void getScores(HttpServletRequest request,
			HttpServletResponse response) {
		UserBean userBean = new UserBean();
		String mesString = null;
		try {
				//mesString = userBean.addsecondLeveSick(request.getParameter("sickNmae"));
			
			mesString = userBean.getScores(Integer.valueOf( request.getParameter("sickId")));
			//
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		writeJSon(response, mesString);
	}
	
	
	public void haschangPwd(HttpServletRequest request,
			HttpServletResponse response) {
		UserBean userBean = new UserBean();
		String mesString = null;
		try {
				//mesString = userBean.addsecondLeveSick(request.getParameter("sickNmae"));
			int uerid= (int) request.getSession().getAttribute("userId");
			mesString = userBean.haschangPwd(uerid);
			//
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		writeJSon(response, mesString);
	}
	public void adminGetUserPasswd(HttpServletRequest request,
			HttpServletResponse response) {
		UserBean userBean = new UserBean();
		String mesString = null;
		try {
				//mesString = userBean.addsecondLeveSick(request.getParameter("sickNmae"));
			String userName= request.getParameter("userName");
			mesString = userBean.adminGetUserPasswd(userName);
			//
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		writeJSon(response, mesString);
	}
	public void adminResetUserPasswd(HttpServletRequest request,
			HttpServletResponse response) {
		UserBean userBean = new UserBean();
		String mesString = null;
		try {
				//mesString = userBean.addsecondLeveSick(request.getParameter("sickNmae"));
			String userName= request.getParameter("password");
			mesString = userBean.adminResetUserPasswd(userName);
			//
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		writeJSon(response, mesString);
	}
	public void getTop20List(HttpServletRequest request,
			HttpServletResponse response) {
		UserBean userBean = new UserBean();
		String mesString = null;
		try {
				//mesString = userBean.addsecondLeveSick(request.getParameter("sickNmae"));
			int uerid= (int) request.getSession().getAttribute("userId");
			//String userName= request.getParameter("password");
			mesString = userBean.getTop20List(uerid);
			//
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		writeJSon(response, mesString);
	}
	
	public void getNotIntop20(HttpServletRequest request,
			HttpServletResponse response) {
		UserBean userBean = new UserBean();
		String mesString = null;
		try {
				//mesString = userBean.addsecondLeveSick(request.getParameter("sickNmae"));
			int uerid= (int) request.getSession().getAttribute("userId");
			//String userName= request.getParameter("password");
			mesString = userBean.getNotIntop20(uerid);
			//
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		writeJSon(response, mesString);
	}
	
	public void getAllSick(HttpServletRequest request,
			HttpServletResponse response) {
		UserBean userBean = new UserBean();
		String mesString = null;
		try {
				//mesString = userBean.addsecondLeveSick(request.getParameter("sickNmae"));
			int uerid= (int) request.getSession().getAttribute("userId");
			//String userName= request.getParameter("password");
			mesString = userBean.getAllSick(uerid);
			//
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		writeJSon(response, mesString);
	}
}
