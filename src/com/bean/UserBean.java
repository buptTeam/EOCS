package com.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//������������Ҫ�İ�
import java.io.File;
import java.io.IOException;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

//����Ϊ������������Ҫ�İ�


import javax.servlet.http.HttpServletRequest;

import model.ExpertBankInfo;
import model.ExpertInfo;
import model.FirstLevel;
import model.InitialExpertInfo;
import model.Remark;
import model.Remark2;
import model.Remark2Id;
import model.RemarkId;
import model.SecondLevel;
import model.Top20;
import model.User;
import model.SystemConf;
import model.ExpertInfo;

import org.antlr.grammar.v3.ANTLRv3Parser.id_return;
import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.basic.HibernateBase;
import com.basic.ParseToReponse;

public class UserBean extends HibernateBase {
	public UserBean() throws HibernateException {
		super();
	}
	
	private static Log log = LogFactory.getLog(UserBean.class);

	// ����mail name workplace ȷ���Ƿ��������
	public String checkInfo(String mail, String name, String workplace)
			throws HibernateException {
		try {
			if(!(workplace.equals("123456")))
				return ParseToReponse.parse("3", "no such info", null,
						0); // ��֤��ͨ��
			System.out.println(name + "name" + workplace);
			String queryString = "from InitialExpertInfo where mail=? and mail<>? and name=? and name<>? ";
			beginTransaction();
			Query query = session.createQuery(queryString);
			query.setParameter(0, mail);
			query.setParameter(1, "");
			query.setParameter(2, name);
			query.setParameter(3, "");
			
			
			
			List<InitialExpertInfo> infos = query.list();
			if (infos.size() == 0) {
				return ParseToReponse.parse("3", "no such info", infos,
						infos.size()); // ��֤��ͨ��
			} else {
				if (1==infos.get(0).getIsUsed()) {
					return ParseToReponse.parse("2", "the info has used",
							infos, infos.size()); // һ����Ϣ����ע������
				} else {
					System.out.println("return" + infos.get(0).getName());
					return ParseToReponse.parse("1", "correct", infos,
							infos.size()); // ��֤ͨ��
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return ParseToReponse.parse("4", e.getMessage(), null, 0);
		}
	}

	public String LoginNameIsExist(String name) throws HibernateException {
		try {
			System.out.println("name:" + name);
			String queryString = "from User where loginName=?";
			beginTransaction();
			Query query = session.createQuery(queryString);
			query.setParameter(0, name);
			List<User> users = query.list();
			if (users.size() == 0) {
				return ParseToReponse.parse("1", "OK", null, 0);
			} else {
				return ParseToReponse.parse("2", "the LoginName has been used",
						null, 0);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return ParseToReponse.parse("4", e.getMessage(), null, 0);
		}
	}

	public String ExpertRegistry(String LoginName, String password, int infoId)
			throws HibernateException {
		try {
			System.out.println("LoginName:" + LoginName + "password:"
					+ password + "info:" + String.valueOf(infoId));
			User user = new User(LoginName, password, 4,0);
			beginTransaction();
			Serializable s = session.save(user);
			endTransaction(true);

			int userId = Integer.valueOf(s.toString());

			String queryString = "from InitialExpertInfo where id=?"; // ����
			beginTransaction();
			Query query = session.createQuery(queryString);
			query.setParameter(0, infoId);
			List<InitialExpertInfo> initialExpertInfos = query.list();
			InitialExpertInfo info = initialExpertInfos.get(0);

			ExpertInfo eInfo = new ExpertInfo(userId,0,0);
			eInfo.setName(info.getName());
			eInfo.setMail(info.getMail());
			//eInfo.setWorkPlace(info.getWorkplace());
			eInfo.setHasFillSurvey(0);
			eInfo.setGoodatArea1(0);
			eInfo.setGoodatArea2(0);
			eInfo.setGoodatArea3(0);
			eInfo.setGoodatArea4(0);
			eInfo.setGoodatArea5(0);
			eInfo.setArea1Year(0);
			eInfo.setArea2Year(0);
			eInfo.setArea3Year(0);
			eInfo.setArea4Year(0);
			eInfo.setArea5Year(0);
			
			beginTransaction();
			Serializable eInfo_s = session.save(eInfo);
			endTransaction(true);

			ExpertBankInfo ebinfoBankInfo = new ExpertBankInfo(userId);
			beginTransaction();
			Serializable ebinfoBankInfo_s = session.save(ebinfoBankInfo);
			endTransaction(true);

			info.setIsUsed(1);
			beginTransaction();
			session.saveOrUpdate(info);
			endTransaction(true);
			return ParseToReponse.parse("1", "ExpertRegistry succefully",
					"userId:" + s, 0);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return ParseToReponse.parse("4", e.getMessage(), null, 0);
		}
	}

	public String addOtherUser(String LoginName, String password, int userType)
			throws HibernateException {
		try {
			System.out.println("LoginName:" + LoginName + "password:"
					+ password + "userType:" + String.valueOf(userType));
			User user = new User(LoginName, password, userType,0);
			beginTransaction();
			Serializable s = session.save(user);
			endTransaction(true);
			return ParseToReponse.parse("1", "addUser succefully", "userId:"
					+ s, 0);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return ParseToReponse.parse("4", e.getMessage(), null, 0);
		}
	}

	public String login(String loginName, String password,
			HttpServletRequest request) throws HibernateException {
		try {
			System.out.println("loginName:" + loginName + "password:"
					+ password);
			
			int version=-1;
			
			String queryString = "from User where loginName=? and password=?";
			beginTransaction();
			Query query = session.createQuery(queryString);
			query.setParameter(0, loginName);
			query.setParameter(1, password);
			List<User> users = query.list();
			if (users.size() == 0) {
				return ParseToReponse.parse("2", "invalid name or password",
						null, 0);
			} else {
				String queryString1 = "from SystemConf order by id desc";
				beginTransaction();
				Query query1 = session.createQuery(queryString1).setFirstResult(0).setMaxResults(1); ;
				//.query.setMaxResults(1);
				
				//query.setParameter(0, userId);
				List<SystemConf> SystemConfs = query1.list();
				version=SystemConfs.get(0).getVersion();
				
				
				User user = users.get(0);
				request.getSession().setAttribute("type", user.getType());
				request.getSession().setAttribute("userId", user.getId());
				request.getSession().setAttribute("loginName",
						user.getLoginName());
				if (user.getType() == 4) {
					if(version==2){
						int curid=users.get(0).getId();
						String hql = " select hasFillSurvey from ExpertInfo where userId=?";     
						beginTransaction();
						Query query2 = session.createQuery(hql);
						query2.setParameter(0, curid);
						List<Integer> res = query2.list();
						int hassfill=res.get(0);
						System.out.println("hassfill"+hassfill);
						if(hassfill==0){
							return	ParseToReponse.parse("7", "did not fill first version",
									null, 0);
						}
					}
					request.getSession().setAttribute("version", version);
				}
				return ParseToReponse
						.parse("1", "correct", users, users.size());
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return ParseToReponse.parse("4", e.getMessage(), null, 0);
		}
	}

	public String updateExpertBasicInfo(String name, 
			String education, String workPlace, String postcode,
			String techLevel, Integer techWorkYears, String telephone,
			String mail, String administrationDuty, Integer goodatArea1,
			String area1Major, Integer area1Year, Integer goodatArea2,
			String area2Major, Integer area2Year, Integer goodatArea3,
			String area3Major, Integer area3Year, Integer goodatArea4,
			String area4Major, Integer area4Year, Integer goodatArea5,
			String area5Major, Integer area5Year, Integer age,
			Integer administrationWorkYear, HttpServletRequest request)
			throws HibernateException {
		try {
			int userId = (int) request.getSession().getAttribute("userId");
			String queryString1 = "from ExpertInfo where userId=?";
			beginTransaction();
			Query query1 = session.createQuery(queryString1);
			System.out.println(userId + "userId");
			query1.setParameter(0, userId);

			List<ExpertInfo> expertInfos = query1.list();
			System.out.println(expertInfos.size() + "size");
			int hasFillSurvey = expertInfos.get(0).getHasFillSurvey();
			int hasFillSurvey2=expertInfos.get(0).getHasFillSurvey2();
			int hasFillBankinfo=expertInfos.get(0).getHasFillBankinfo();
			ExpertInfo exInfo = new ExpertInfo(userId, name, education,
					workPlace, postcode, techLevel, techWorkYears, telephone,
					mail, hasFillSurvey, administrationDuty, goodatArea1,
					area1Major, area1Year, goodatArea2, area2Major, area2Year,
					goodatArea3, area3Major, area3Year, goodatArea4,
					area4Major, area4Year, goodatArea5, area5Major, area5Year,
					age, administrationWorkYear,hasFillSurvey2,
				hasFillBankinfo);
			beginTransaction();
			session.saveOrUpdate(exInfo);
			endTransaction(true);
			return ParseToReponse.parse("1", "update successfully", null, 0);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return ParseToReponse.parse("4", e.getMessage(), null, 0);
		}
	}

	public String updateExpertBankInfo(String bankName, String duty,
			String idCardNumber, String bankCardNumber,
			HttpServletRequest request) throws HibernateException {
		try {
			int userId = (int) request.getSession().getAttribute("userId");

			
			String queryString = "update ExpertBankInfo w set w.bankName=?,w.duty=?,w.idCardNumber=?,w.bankCardNumber=? where w.userId=?";
			beginTransaction();
			
			Query q = session.createQuery(queryString);
			q.setParameter(0,bankName);
			q.setParameter(1,duty);
			q.setParameter(2,idCardNumber);
			q.setParameter(3,bankCardNumber);
			q.setParameter(4,userId);
			
			q.executeUpdate();
			endTransaction(true);
			
			
			 queryString = "update ExpertInfo w set w.hasFillBankinfo=? where w.userId=?";
			beginTransaction();
			 q = session.createQuery(queryString);
			q.setParameter(0,1);
			q.setParameter(1,userId);
			q.executeUpdate();
			endTransaction(true);
			
			return ParseToReponse.parse("1", "update bankInfo successfully",
					null, 0);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return ParseToReponse.parse("4", e.getMessage(), null, 0);
		}
	}
	public String updateExpertPostInfo(String PName, String PTelephone,
			String PIdCardNumber, String PAddress,String PPostCard,
			HttpServletRequest request) throws HibernateException {
		try {
			
			int userId = (int) request.getSession().getAttribute("userId");
			
			String queryString = "update ExpertBankInfo w set w.PName=?,w.PTelephone=?,w.PIdCardNumber=?,w.PAddress=?,w.PPostCard=? where w.userId=?";
			beginTransaction();
			
			Query q = session.createQuery(queryString);
			q.setParameter(0,PName);
			q.setParameter(1,PTelephone);
			q.setParameter(2,PIdCardNumber);
			q.setParameter(3,PAddress);
			q.setParameter(4,PPostCard);
			q.setParameter(5,userId);
			
			q.executeUpdate();
			endTransaction(true);
			 queryString = "update ExpertInfo w set w.hasFillBankinfo=? where w.userId=?";
				beginTransaction();
				 q = session.createQuery(queryString);
				q.setParameter(0,1);
				q.setParameter(1,userId);
				q.executeUpdate();
				endTransaction(true);
			
			return ParseToReponse.parse("1", "update post bankInfo successfully",
					null, 0);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return ParseToReponse.parse("4", e.getMessage(), null, 0);
		}
	}
	public String getFirstLevel() throws HibernateException {
		try {
			String queryString = "from FirstLevel";
			beginTransaction();
			Query query = session.createQuery(queryString);
			List<FirstLevel> FirstLevels = query.list();
			return ParseToReponse.parse("1", "get all firstLeval infos",
					FirstLevels, FirstLevels.size());

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return ParseToReponse.parse("4", e.getMessage(), null, 0);
		}
	}
	public String getSecondLevel(int fitstLevelId) throws HibernateException {
		try {
			String queryString = "from SecondLevel where firstLevelId=?";
			beginTransaction();
			Query query = session.createQuery(queryString);
			query.setParameter(0, fitstLevelId);
			List<SecondLevel> SecondLevels = query.list();
			return ParseToReponse.parse("1", "get secondLevel infos",
					SecondLevels, SecondLevels.size());

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return ParseToReponse.parse("4", e.getMessage(), null, 0);
		}
	}
	
	public String countSecondLevel(int secondLevelId,int familiar, Integer importance, Integer control) throws HibernateException {
		try {
			String queryString = "update SecondLevel w set w.count=w.count+1 , w.totalFamiliar=w.totalFamiliar+"+familiar+" , w.totalImportance=w.totalImportance+"+importance+" , w.totalControll=w.totalControll+"+control+" where w.id=?";
			beginTransaction();
			
			Query q = session.createQuery(queryString);
//			q.setParameter(0,familiar);
//			q.setParameter(1,importance);
//			q.setParameter(2,control);
			q.setParameter(0,secondLevelId);
			
			q.executeUpdate();
			endTransaction(true);
						
			return ParseToReponse.parse("1", "submit second_level count successfully",
					null, 0);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return ParseToReponse.parse("4", e.getMessage(), null, 0);
		}
	}
	
	public String submitremark(int version,Integer familiar, Integer importance,Integer control,int userId, int secondLevelId, int firstLevelId, String sickName,int isManualAdded) throws HibernateException {
		try {
            beginTransaction();
            String hql="";
            if(version==1)
		     hql = "update ExpertInfo w set w.hasFillSurvey=? where w.userId =?";
            else if(version==2){
             hql = "update ExpertInfo w set w.hasFillSurvey2=? where w.userId =?";
            }
			Query q = session.createQuery(hql);
			q.setInteger(0,1);
			q.setInteger(1,userId);
			q.executeUpdate();
			endTransaction(true);
			
			 
			if(isManualAdded == 0){
				beginTransaction();
				String remaString="";
				if(version==1){
					remaString="Remark";
				}else if(version==2){
					remaString="Remark2";
				}
				String hql_r = "update "+remaString+" w set  w.familiar=?,w.importance=?,w.control=?,w.selected=? where w.id.userId =? and w.id.secondLevelId =?";
				Query q_r = session.createQuery(hql_r);
				q_r.setInteger(0,familiar);
				q_r.setInteger(1,importance);
				q_r.setInteger(2,control);
				q_r.setInteger(3,1);
				q_r.setInteger(4,userId);
				q_r.setInteger(5,secondLevelId);
				q_r.executeUpdate();
				endTransaction(true);
			}else {
				if(version==1){
					RemarkId rId=new RemarkId(userId, secondLevelId);
	    			Remark remark=new Remark(rId, familiar, importance, control,1, sickName,firstLevelId);
	    			beginTransaction();
	    			Serializable s = session.save(remark);
	    			endTransaction(true);
				}else if(version==2){
					Remark2Id rId=new Remark2Id(userId, secondLevelId);
	    			Remark2 remark=new Remark2(rId, familiar, importance, control,1, sickName,firstLevelId);
	    			beginTransaction();
	    			Serializable s = session.save(remark);
	    			endTransaction(true);
				}
				
			}
			
			
			
			return ParseToReponse.parse("1", "submit remark successfully",
					version, 0);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return ParseToReponse.parse("4", e.getMessage(), null, 0);
		}
	}
	
	public String initremark(int userId,int version) throws HibernateException {
		try {
			//��ȡ���еĶ���ָ��
            List<SecondLevel> SecondLevels = getAllSecondLevel();
            beginTransaction();
            for(int i=0; i < SecondLevels.size(); i++){
            	int secondid = SecondLevels.get(i).getId();
            	int firstid = SecondLevels.get(i).getFirstLevelId();
            	String sickname0 = SecondLevels.get(i).getName();
            	if(version==1){
            		RemarkId rId=new RemarkId(userId, secondid);
        			Remark remark=new Remark(rId, 0, 0, 0,0,sickname0,firstid);
        			
        			Serializable s = session.save(remark);
            	}else if(version==2){
					Remark2Id r2idId=new Remark2Id(userId, secondid);
					Remark2 remark2=new Remark2(r2idId, 0, 0, 0, 0, sickname0,firstid);
					Serializable s = session.save(remark2);
				}
            }
            endTransaction(true);
			
            
			
			
			return ParseToReponse.parse("1", "init remark successfully",
					null, 0);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return ParseToReponse.parse("4", e.getMessage(), null, 0);
		}
	}
	
	public String getUserInfo(int userId) throws HibernateException {
		try {
			String queryString = "from ExpertInfo where userId=?";
			beginTransaction();
			Query query = session.createQuery(queryString);
			query.setParameter(0, userId);
			List<ExpertInfo> expertInfo = query.list();
			
			return ParseToReponse.parse("1", "ExpertInfo",
					expertInfo, expertInfo.size());

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return ParseToReponse.parse("4", e.getMessage(), null, 0);
		}
	}
	public String getUserBankInfo(int userId) throws HibernateException {
		try {
			String queryString = "from ExpertBankInfo where userId=?";
			beginTransaction();
			Query query = session.createQuery(queryString);
			query.setParameter(0, userId);
			List<ExpertBankInfo> ExpertBankInfoa = query.list();
			
			return ParseToReponse.parse("1", "getUserBankInfo",
					ExpertBankInfoa, ExpertBankInfoa.size());

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return ParseToReponse.parse("4", e.getMessage(), null, 0);
		}
	}
	
	
	public String getOterUserInfo() throws HibernateException {
		try {
			String queryString = "from User where type=? or type=?";
			beginTransaction();
			Query query = session.createQuery(queryString);
			query.setParameter(0, 2);
			query.setParameter(1, 3);
			List<User> Users = query.list();
			
			return ParseToReponse.parse("1", "getOterUserInfo",
					Users, Users.size());

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return ParseToReponse.parse("4", e.getMessage(), null, 0);
		}
	}
	public String getbankInfo(String ispage,int pageNo,int singlePageNumers) throws HibernateException {
		try {
			String queryString = "from ExpertBankInfo";
			beginTransaction();
			Query query = session.createQuery(queryString);
			if(ispage.equals("1")){
				query .setFirstResult((pageNo-1)*singlePageNumers);
	            query .setMaxResults(singlePageNumers);
			}
			
			List<ExpertBankInfo> ExpertBankInfos = query.list();
			
			String queryString1 = "select count(*) from ExpertBankInfo";
			beginTransaction();
			Query query1 = session.createQuery(queryString1);
			int pagesLong=((Long)query1.uniqueResult()).intValue()/singlePageNumers;
			if(((Long)query1.uniqueResult()).intValue()%singlePageNumers!=0){
				pagesLong++;
			}
			
			return ParseToReponse.parse("1", "getOterUserInfo",
					ExpertBankInfos, pagesLong);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return ParseToReponse.parse("4", e.getMessage(), null, 0);
		}
	}
	
	
	
//	public String getAllUsers() throws HibernateException {
//		try {
//
//			 String[] ss = new
//			 String[]{"�·�ͻ����Ⱦ��,����,����,��Ⱦ�Էǵ��ͷ�,���̲�,�����Ը���,���������,�˸�Ⱦ�²���������,����H1N1����,����,�����Գ�ѩ��,��Ȯ��,��������������,�Ǹ���,̼��,ϸ���ԺͰ��װ�������,�ν��,�˺��͸��˺�,�������Լ���Ĥ,���տ�,�׺�,�������˷�,�ɺ���,��³�Ͼ���,�ܲ�,���������岡,Ѫ���没,ű��,�����Ը�ð��������У�,������������,����,���Գ�Ѫ�Խ�Ĥ��,��粡,�����Ժ͵ط��԰����˺�,���Ȳ�,���没,˿�没������,ϸ���ԺͰ��װ�������,�˺��͸��˺�����ĸ�Ⱦ�Ը�к��,����ڲ�","�ΰ�,�ΰ�,θ��,��ֱ����,���ٰ�,������,ʳ�ܰ�,ǰ���ٰ�,���ٰ�,��Ѫ��,���Ұ�,��Ѫѹ,Ѫ֬�쳣,���Ĳ�/�ļ�����,����,������,���������Էβ�,����,����մ�,��������,����ʧ��,���ط���,������ǻ����","����֢,˫������ϰ�,�������֢,����֢,ҩ��������ҩ������,�����ϰ�,��ͯ�ں��ഺ�ڷ�������Ϊ�ϰ� ���Ա�֢,���","����,��������,��������,��������ʳ�����Ρ���֬�����߲�ˮ���ȣ�,����ȫ����Ϊ","�����Ѫѹ,��������,�����Ѫ,����,���������ಡ,����������,��ͯ����ͪ��֢,��������Ϣ������","��·��ͨ�˺�,��ɱ,��ˮ,����,��ͥ����","ʳ���ж�,�Ƿ�ʹ��ʳƷ��Ӽ�,ũҩ�����ؼ������صȲ���,Ӫ������","����,�����������½������,��ȩ�����������л��ܼ��ж�,ͻ��ְҵ�ж�,ְҵ����,����������ˣ����羱׵������׵���������ۺ����ȣ�,�ش󻷾���Ⱦ�¹�,ˮ��Ⱦ,������Ⱦ,������Ⱦ,���ڻ�����Ⱦ,�¼������²��ϴ����Ļ�����Ⱦ","��ȱ����,��ǽڲ�"};
//			 for (int i = 0; i < ss.length; i++) {
//			 String subString=ss[i];
//			 String[] allsStrings =subString.split(",");
//			 System.out.println(i+":"+allsStrings.length);
//			 for (int j = 0; j < allsStrings.length; j++) {
//			 System.out.println( allsStrings[j].trim());
//			 SecondLevel secondLevel=new
//			 SecondLevel(i+1,allsStrings[j].trim(),0);
//			 beginTransaction();
//			 Serializable s= session.save(secondLevel);
//			 endTransaction(true);
//			 }
//			 }
//			System.out.println("hello");
//			String queryString = "from User";
//			beginTransaction();
//			Query query = session.createQuery(queryString);
//			List<User> users = query.list();
//			System.out.println(users.size());
//
//			return ParseToReponse.parse("1", "all users data", users,
//					users.size());
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//
//			return ParseToReponse.parse("2", e.getMessage(), null, 0);
//		}
//
//	}
	
	public String getAllExportsInfo() throws HibernateException {
		try {

			 
			System.out.println("hello");
			String queryString = "from ExpertInfo";
			beginTransaction();
			Query query = session.createQuery(queryString);
			List<ExpertInfo> experts = query.list();
			System.out.println(experts.size());

			return ParseToReponse.parse("1", "all exports data", experts,
					experts.size());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

			return ParseToReponse.parse("2", e.getMessage(), null, 0);
		}
	}
	
	public String getExportsInfo(String ispage,int pageNo,int singlePageNumers) throws HibernateException {
		try {
			String queryString = "from ExpertInfo";
			beginTransaction();
			Query query = session.createQuery(queryString);
			if(ispage.equals("1")){
				query .setFirstResult((pageNo-1)*singlePageNumers);
	            query .setMaxResults(singlePageNumers);
			}
			
			List<ExpertInfo> ExpertsInfo = query.list();
			endTransaction(true);
			String queryString1 = "select count(*) from ExpertInfo";
			beginTransaction();
			Query query1 = session.createQuery(queryString1);
			int pagesLong=((Long)query1.uniqueResult()).intValue()/singlePageNumers;
			if(((Long)query1.uniqueResult()).intValue()%singlePageNumers!=0){
				pagesLong++;
			}
			endTransaction(true);
			return ParseToReponse.parse("1", "getExpertsInfo",
					ExpertsInfo, pagesLong);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return ParseToReponse.parse("4", e.getMessage(), null, 0);
		}
	}

	public String deleteUser(int id) {
		try {
			beginTransaction();
			User user = (User) session.load(User.class, id);
			session.delete(user);
			endTransaction(true);
			return ParseToReponse.parse("1", "delete user successfully", null,
					0);
		} catch (Exception e) {
			e.printStackTrace();

			return ParseToReponse.parse("2", e.getMessage(), null, 0);
			// TODO: handle exception
		}

	}
	
	public String getsysVersion() throws HibernateException {
		try {
			String queryString = "from SystemConf order by id desc";
			beginTransaction();
			Query query = session.createQuery(queryString).setFirstResult(0).setMaxResults(1); ;
			//.query.setMaxResults(1);
			
			//query.setParameter(0, userId);
			List<ExpertInfo> sysVersionInfo = query.list();
			endTransaction(true);
			return ParseToReponse.parse("1", "sysVersionInfo",
					sysVersionInfo, sysVersionInfo.size());

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return ParseToReponse.parse("4", e.getMessage(), null, 0);
		}
	}
	
	public String setsysVersion(int version) throws HibernateException {
		try {
			System.out.println("version:" + version);
			SystemConf sysconf = new SystemConf();
			sysconf.setVersion(version);
			beginTransaction();
			Serializable s = session.save(sysconf);
			endTransaction(true);
			
			return ParseToReponse.parse("1", "setSysVersionInfo",
					null, 0);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return ParseToReponse.parse("4", e.getMessage(), null, 0);
		}
	}
	
	public String getRemark(int userId) throws HibernateException {
		try {
			
			String queryString = "from Remark where id.userId =? and selected <> 0";
			beginTransaction();
			Query query = session.createQuery(queryString);
			query.setParameter(0, userId);
			List<Remark> remark = query.list();
			//endTransaction(true);
			
			return ParseToReponse.parse("1", "getExpertRemark",
					remark, remark.size());

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return ParseToReponse.parse("4", e.getMessage(), null, 0);
		}
	}
	public String getRemark2(int userId) throws HibernateException {
		try {
			
			String queryString = "from Remark2 where id.userId =? and selected <> 0";
			beginTransaction();
			Query query = session.createQuery(queryString);
			query.setParameter(0, userId);
			List<Remark2> remark = query.list();
			//endTransaction(true);
			
			return ParseToReponse.parse("1", "getExpertRemark",
					remark, remark.size());

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return ParseToReponse.parse("4", e.getMessage(), null, 0);
		}
	}
	
	
	
	
	public String getIllName(int id) throws HibernateException {
		try {
			
			String queryString = "from SecondLevel where id =?";
			beginTransaction();
			Query query = session.createQuery(queryString);
			query.setParameter(0, id);
			List<SecondLevel> secondlevel = query.list();
			//endTransaction(true);
			
			return ParseToReponse.parse("1", "getsecondlevel",
					secondlevel, secondlevel.size());

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return ParseToReponse.parse("4", e.getMessage(), null, 0);
		}
	}
	
	
	//Ϊ����������׼������ȡsecondlevel�����֡�
	public List<SecondLevel> getSecondIllName(int id) throws HibernateException{
		try {
			
			String queryString = "from SecondLevel where id =?";
			beginTransaction();
			Query query = session.createQuery(queryString);
			query.setParameter(0, id);
			List<SecondLevel> secondlevel = query.list();
			endTransaction(true);
			
			return secondlevel;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}
	
	//Ϊ����������׼������ȡ����export��
	public List<ExpertInfo> getExpertInfoName() throws HibernateException{
		try {
			
			String queryString = "from ExpertInfo";
			beginTransaction();
			Query query = session.createQuery(queryString);
			List<ExpertInfo> expertinfo = query.list();
			endTransaction(true);
			
			return expertinfo;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}
	
	//Ϊ����������׼������ȡ����ָ����ʾ���д��Ϣ
	public List<Remark> getExpertRemark(int userId) throws HibernateException{
		try {
			
			String queryString = "from Remark where id.userId =?";
			beginTransaction();
			Query query = session.createQuery(queryString);
			query.setParameter(0, userId);
			List<Remark> remark = query.list();
			endTransaction(true);
			
			return remark;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}
	
	public List<Remark2> getExpertRemark2(int userId) throws HibernateException{
		try {
			
			String queryString = "from Remark2 where id.userId =?";
			beginTransaction();
			Query query = session.createQuery(queryString);
			query.setParameter(0, userId);
			List<Remark2> remark = query.list();
			endTransaction(true);
			
			return remark;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}
	
	//����ר��������Ϣ
	public List<ExpertBankInfo> getexportbankInfo(int id) throws HibernateException {
		try {
			String queryString = "from ExpertBankInfo where userId = ?";
			
			beginTransaction();
			Query query = session.createQuery(queryString);
			query.setParameter(0, id);
			List<ExpertBankInfo> exportBankInfo = query.list();
			endTransaction(true);
			
			return exportBankInfo;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}
	
	public List<Top20> getTop20s() throws HibernateException {
		try {
			String queryString = "from Top20 ";
			
			beginTransaction();
			Query query = session.createQuery(queryString);
			//query.setParameter(0, id);
			List<Top20> top20s = query.list();
			endTransaction(true);
			
			return top20s;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}
	
	
	
	
	//����ר���ʾ�����
	public String exportData(int type,HttpServletRequest request) throws HibernateException {
		try {
			List<ExpertInfo> list = getExpertInfoName();
			List<SecondLevel> list2 = getsecondLevels();
			List<Top20> list3 = getTop20s();
			//�����汾һ������ʾ���Ϣ
			if(type == 1){
				
				boolean res = Remark_DB2Excel( list, request,1);
				if(res == true){
					return ParseToReponse.parse("1", "exportRemarkDatasuccess",
							null, 0);
				}else{
					return ParseToReponse.parse("4", "exportRemarkDataerror", null, 0);
				}
			}else if(type == 2){//����������Ϣ
				boolean res = Financial_DB2Excel( list, request);
				if(res == true){
					return ParseToReponse.parse("1", "exportfinancialDatasuccess",
						null, 0);
				}else{
					return ParseToReponse.parse("4", "exportfinancialDataerror", null, 0);
				}
			}else if(type == 3){//����������Ϣ
				boolean res = Info_DB2Excel( list,request);
				if(res == true){
					return ParseToReponse.parse("1", "exportinfoDatasuccess",
						null, 0);
				}else{
					return ParseToReponse.parse("4", "exportinfoDataerror", null, 0);
				}
			}else if(type == 4){//�����汾��������ʾ���Ϣ
				boolean res = Remark_DB2Excel( list, request,2);
				if(res == true){
					return ParseToReponse.parse("1", "exportRemarkDatasuccess",
							null, 0);
				}else{
					return ParseToReponse.parse("4", "exportRemarkDataerror", null, 0);
				}
			}else if(type == 5){//�����汾һ�Ķ���������Ϣ
				boolean res = Ill_DB2Excel( list2,request);
				if(res == true){
					return ParseToReponse.parse("1", "exportRemarkDatasuccess",
							null, 0);
				}else{
					return ParseToReponse.parse("4", "exportRemarkDataerror", null, 0);
				}
			}else if(type == 6){
				boolean res = Top20_DB2Excel( list3,request);
				if(res == true){
					return ParseToReponse.parse("1", "exportRemarkDatasuccess",
							null, 0);
				}else{
					return ParseToReponse.parse("4", "exportRemarkDataerror", null, 0);
				}
			}else{
				return ParseToReponse.parse("4", "exportRemarkDataerror", null, 0);
			}
			
			

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return ParseToReponse.parse("4", e.getMessage(), null, 0);
		}
	}
	
	
	public List<SecondLevel> getsecondLevels() throws HibernateException {
		try {
			String queryString = "from SecondLevel ";
			
			beginTransaction();
			Query query = session.createQuery(queryString);
			//query.setParameter(0, id);
			List<SecondLevel> secondLevels = query.list();
			endTransaction(true);
			
			return secondLevels;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}
	
	public boolean Top20_DB2Excel(List<Top20> list,HttpServletRequest request) {
        boolean flag = false;
        WritableWorkbook workbook = null;
        WritableSheet sheet = null;
        Label label = null;

        // ����Excel��
        try {
        	 WritableWorkbook wwb = null;
             
               // ������д���Excel������
        	   String fileName = request.getRealPath("/download/"+ "top_20.xls") ;
               File file=new File(fileName);
              
               if (!file.exists()) {
                   file.createNewFile();
               }
               //��fileNameΪ�ļ���������һ��Workbook
               wwb = Workbook.createWorkbook(file);
               
               
               // ����������
               WritableSheet ws = wwb.createSheet("Top20����", 0);
               
               
               
               
               //��ѯ���ݿ������е�����
               //List<StuEntity> list= StuService.getAllByDb();
               //Ҫ���뵽��Excel�����кţ�Ĭ�ϴ�0��ʼ
               Label labelIdLabel = new Label(0,0,"Top20����ID");
               
               
               ws.addCell(labelIdLabel);
               
               
              /*
               Label[] labarr = new Label[90];
               
               for(int i=0; i<=20; i++){
            	   labarr[1+i*4]= new Label(1+i*4, 0, "����ָ��("+i+")");
            	   labarr[2+i*4]= new Label(2+i*4, 0, "��Ϥ�̶�");
            	   labarr[3+i*4]= new Label(3+i*4, 0, "��Ҫ�̶�");
            	   labarr[4+i*4]= new Label(4+i*4, 0, "�ɿ���");
	               ws.addCell(labarr[1+i*4]);
	               ws.addCell(labarr[2+i*4]);
	               ws.addCell(labarr[3+i*4]);
	               ws.addCell(labarr[4+i*4]);
	               
               }	               
               */
               //int lineNumber = 1;
               //int line = 1;
               for (int i = 0; i < list.size(); i++) {
                   int id = list.get(i).getSickId();
            	   
            	   Label labelillId_i = new Label(0, i+1, id+"");
            	   
                   ws.addCell(labelillId_i);
            	   
		               
		             
               }
             
              //д���ĵ�
               wwb.write();
              // �ر�Excel����������
               wwb.close();


            flag = true;
        }  catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } 

        
        return flag;
    }
	
	public boolean Ill_DB2Excel(List<SecondLevel> list,HttpServletRequest request) {
        boolean flag = false;
        WritableWorkbook workbook = null;
        WritableSheet sheet = null;
        Label label = null;

        // ����Excel��
        try {
        	 WritableWorkbook wwb = null;
             
               // ������д���Excel������
        	   String fileName = request.getRealPath("/download/"+ "ill_data.xls") ;
               File file=new File(fileName);
              
               if (!file.exists()) {
                   file.createNewFile();
               }
               //��fileNameΪ�ļ���������һ��Workbook
               wwb = Workbook.createWorkbook(file);
               
               
               // ����������
               WritableSheet ws = wwb.createSheet("����", 0);
               
               
               
               
               //��ѯ���ݿ������е�����
               //List<StuEntity> list= StuService.getAllByDb();
               //Ҫ���뵽��Excel�����кţ�Ĭ�ϴ�0��ʼ
               Label labelIdLabel = new Label(0,0,"ID");
               Label labelIllName= new Label(1, 0, "��������");//��ʾ��
               Label label_All_familiar_Average = new Label(2, 0, "ȫ��ר����Ϥ�̶Ⱦ���");
               Label label_Area_familar_Average = new Label(3, 0, "����ר����Ϥ�̶Ⱦ���");
               Label label_All_import_Average = new Label(4, 0, "ȫ��ר����Ҫ�̶Ⱦ���");
               Label label_Area_import_Average = new Label(5, 0, "����ר����Ҫ�̶Ⱦ���");
               Label label_All_control_Average = new Label(6, 0, "ȫ��ר�ҿɿس̶Ⱦ���");
               Label label_Area_control_Average = new Label(7, 0, "����ר�ҿɿس̶Ⱦ���");
               Label label_Percent = new Label(8, 0, "ר��ѡ��ٷֱ�");
               
               ws.addCell(labelIdLabel);
               ws.addCell(labelIllName);
               ws.addCell(label_All_familiar_Average);
               ws.addCell(label_Area_familar_Average);
               ws.addCell(label_All_import_Average);
               ws.addCell(label_Area_import_Average);
               ws.addCell(label_All_control_Average);
               ws.addCell(label_Area_control_Average);
               ws.addCell(label_Percent);
               
              /*
               Label[] labarr = new Label[90];
               
               for(int i=0; i<=20; i++){
            	   labarr[1+i*4]= new Label(1+i*4, 0, "����ָ��("+i+")");
            	   labarr[2+i*4]= new Label(2+i*4, 0, "��Ϥ�̶�");
            	   labarr[3+i*4]= new Label(3+i*4, 0, "��Ҫ�̶�");
            	   labarr[4+i*4]= new Label(4+i*4, 0, "�ɿ���");
	               ws.addCell(labarr[1+i*4]);
	               ws.addCell(labarr[2+i*4]);
	               ws.addCell(labarr[3+i*4]);
	               ws.addCell(labarr[4+i*4]);
	               
               }	               
               */
               //int lineNumber = 1;
               //int line = 1;
               for (int i = 0; i < list.size(); i++) {
                   int id = list.get(i).getId();
            	   String illName = list.get(i).getName();
            	   double all_familar_ave = list.get(i).getAve();
            	   double area_familar_ave = list.get(i).getAreaAve();
            	   double all_import_ave = list.get(i).getAveIm();
            	   double area_import_ave = list.get(i).getAreaAveIm();
            	   double all_control_ave = list.get(i).getAveCon();
            	   double area_control_ave = list.get(i).getAreaAveCon();
            	   double percent = list.get(i).getPercentage();
            	   
            	   Label labelillId_i = new Label(0, i+1, id+"");
            	   Label labelillName_i = new Label(1, i+1, illName+"");
            	   
            	   Label label_All_familar_Average_i = new Label(2, i+1, all_familar_ave+"");
                   Label label_Area_familar_Average_i = new Label(3, i+1, area_familar_ave+"");
                   Label label_All_import_Average_i = new Label(4, i+1, all_import_ave+"");
                   Label label_Area_import_Average_i = new Label(5, i+1, area_import_ave+"");
                   Label label_All_control_Average_i = new Label(6, i+1, all_control_ave+"");
                   Label label_Area_control_Average_i = new Label(7, i+1, area_control_ave+"");
                   Label label_Percent_i = new Label(8, i+1, percent+"");
                   
                   ws.addCell(labelillId_i);
            	   ws.addCell(labelillName_i);
            	   ws.addCell(label_All_familar_Average_i);
            	   ws.addCell(label_Area_familar_Average_i);
            	   ws.addCell(label_All_import_Average_i);
            	   ws.addCell(label_Area_import_Average_i);
            	   ws.addCell(label_All_control_Average_i);
            	   ws.addCell(label_Area_control_Average_i);
            	   ws.addCell(label_Percent_i);
		               
		             
               }
             
              //д���ĵ�
               wwb.write();
              // �ر�Excel����������
               wwb.close();


            flag = true;
        }  catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } 

        
        return flag;
    }
	
	
	//��ȡ����ԭʼ�Ķ���ָ��
	public List<SecondLevel> getAllSecondLevel() throws HibernateException {
		try {
			String queryString = "from SecondLevel where firstLevelId > 0";
			beginTransaction();
			Query query = session.createQuery(queryString);
			//query.setParameter(0, fitstLevelId);
			List<SecondLevel> SecondLevels = query.list();
			return SecondLevels;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}
	
	
	
	//�������ݵ�excel
	 public boolean Remark_DB2Excel(List<ExpertInfo> list, HttpServletRequest request,int version) {
	        boolean flag = false;
	        WritableWorkbook workbook = null;
	        WritableSheet sheet = null;
	        Label label = null;

	        // ����Excel��
	        try {
	        	 WritableWorkbook wwb = null;
	             
	               // ������д���Excel������
	        	 
	               String fileName = request.getRealPath("/download/"+ "expert_research_data_"+version+".xls") ;
	               File file=new File(fileName);
	               if (!file.exists()) {
	                   file.createNewFile();
	               }
	               //��fileNameΪ�ļ���������һ��Workbook
	               wwb = Workbook.createWorkbook(file);
	               
	               
	               // ����������
	               WritableSheet ws = wwb.createSheet("�����ɷ�����", 0);
	               
	               
	               
	               
	               //��ѯ���ݿ������е�����
	               //List<StuEntity> list= StuService.getAllByDb();
	               //Ҫ���뵽��Excel�����кţ�Ĭ�ϴ�0��ʼ
	               Label labelUserId= new Label(0, 0, "�û���");//��ʾ��\
	               Label labelillname1 = new Label(1, 0, "һ��ָ��");
	               Label labelillname = new Label(2, 0, "����ָ��");
	               Label labelchoosed = new Label(3, 0, "�Ƿ�ѡ�У�1=ѡ�У�0=δѡ�У�");
	               Label labelfamiliar = new Label(4, 0, "��Ϥ�̶�");
	               Label labelimportance = new Label(5, 0, "��Ҫ�̶�");
	               Label labelcontrol = new Label(6, 0, "�ɷ��س̶�");
	               ws.addCell(labelUserId);
	               ws.addCell(labelillname1);
	               ws.addCell(labelillname);
	               ws.addCell(labelchoosed);
	               ws.addCell(labelfamiliar);
	               ws.addCell(labelimportance);
	               ws.addCell(labelcontrol);
	               
	              /*
	               Label[] labarr = new Label[90];
	               
	               for(int i=0; i<=20; i++){
	            	   labarr[1+i*4]= new Label(1+i*4, 0, "����ָ��("+i+")");
	            	   labarr[2+i*4]= new Label(2+i*4, 0, "��Ϥ�̶�");
	            	   labarr[3+i*4]= new Label(3+i*4, 0, "��Ҫ�̶�");
	            	   labarr[4+i*4]= new Label(4+i*4, 0, "�ɿ���");
		               ws.addCell(labarr[1+i*4]);
		               ws.addCell(labarr[2+i*4]);
		               ws.addCell(labarr[3+i*4]);
		               ws.addCell(labarr[4+i*4]);
		               
	               }	               
	               */
	               int lineNumber = 1;
	               for (int i = 0; i < list.size(); i++) {
	                   /*
	            	   String expertName = list.get(i).getName();
	                   Label labelExpertName_i = new Label(0, i+1, expertName+"");
	                   ws.addCell(labelExpertName_i);
	                   int expertId = list.get(i).getUserId();
	                   List<Remark> remark = getExpertRemark(expertId);
	                   for (int j=0; j < remark.size(); j++){
	                	   Label[] labarr_i = new Label[90];
	                	   int secondlevelId = remark.get(j).getId().getSecondLevelId();
	                	   int importance =  remark.get(j).getImportance();
	                	   int familiar = remark.get(j).getFamiliar();
	                	   int control = remark.get(j).getControl();
	                	   List<SecondLevel> secondLevel = getSecondIllName(secondlevelId);
	                	   String secondLevelName = secondLevel.get(0).getName();
	                	   labarr_i[1+j*4]= new Label(1+j*4, i+1, secondLevelName+"");
	                	   labarr_i[2+j*4]= new Label(2+j*4, i+1, familiar+"");
	                	   labarr_i[3+j*4]= new Label(3+j*4, i+1, importance+"");
	                	   labarr_i[4+j*4]= new Label(4+j*4, i+1, control+"");
			               ws.addCell(labarr_i[1+j*4]);
			               ws.addCell(labarr_i[2+j*4]);
			               ws.addCell(labarr_i[3+j*4]);
			               ws.addCell(labarr_i[4+j*4]);
	                   }
	                   */
	            	   String expertName = list.get(i).getName();
	            	   int expertId = list.get(i).getUserId();
	            	   if(version==1){
	            		   List<Remark> remark = getExpertRemark(expertId);
		                   for (int j=0; j < remark.size(); j++){
		                	   Label labelUser_i= new Label(0, lineNumber, expertName+"");//��ʾ��
		                	   Label labelillname_i1 = new Label(1, lineNumber, remark.get(j).getFirstLevelId()+"");
		    	               Label labelillname_i = new Label(2, lineNumber, remark.get(j).getSickname()+"");
		    	               Label labelchoosed_i = new Label(3, lineNumber, remark.get(j).getSelected()+"");
		    	               Label labelfamiliar_i = new Label(4, lineNumber, remark.get(j).getFamiliar()+"");
		    	               Label labelimportance_i = new Label(5, lineNumber, remark.get(j).getImportance()+"");
		    	               Label labelcontrol_i = new Label(6, lineNumber, remark.get(j).getControl()+"");
		    	               ws.addCell(labelUser_i);
		    	               ws.addCell(labelillname_i1);
		    	               ws.addCell(labelillname_i);
		    	               ws.addCell(labelchoosed_i);
		    	               ws.addCell(labelfamiliar_i);
		    	               ws.addCell(labelimportance_i);
		    	               ws.addCell(labelcontrol_i);
		    	               lineNumber++;
		                   }
	            	   }else {
	            		   List<Remark2> remark = getExpertRemark2(expertId);
		                   for (int j=0; j < remark.size(); j++){
		                	   Label labelUser_i= new Label(0, lineNumber, expertName+"");//��ʾ��
		                	   Label labelillname_i1 = new Label(1, lineNumber, remark.get(j).getFirstLevelId()+"");
		                	   Label labelillname_i = new Label(2, lineNumber, remark.get(j).getSickname()+"");
		    	               Label labelchoosed_i = new Label(3, lineNumber, remark.get(j).getSelected()+"");
		    	               Label labelfamiliar_i = new Label(4, lineNumber, remark.get(j).getFamiliar()+"");
		    	               Label labelimportance_i = new Label(5, lineNumber, remark.get(j).getImportance()+"");
		    	               Label labelcontrol_i = new Label(6, lineNumber, remark.get(j).getControl()+"");
		    	               ws.addCell(labelUser_i);
		    	               ws.addCell(labelillname_i1);
		    	               ws.addCell(labelillname_i);
		    	               ws.addCell(labelchoosed_i);
		    	               ws.addCell(labelfamiliar_i);
		    	               ws.addCell(labelimportance_i);
		    	               ws.addCell(labelcontrol_i);
		    	               lineNumber++;
		                   }
						
					}
	                   
	               }
	             
	              //д���ĵ�
	               wwb.write();
	              // �ر�Excel����������
	               wwb.close();


	            flag = true;
	        }  catch (Exception e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } 

	        
	        return flag;
	    }
	 
	//�������ݵ�excel info
		 public boolean Info_DB2Excel(List<ExpertInfo> list, HttpServletRequest request) {
		        boolean flag = false;
		        WritableWorkbook workbook = null;
		        WritableSheet sheet = null;
		        Label label = null;
		        
		        // ����Excel��
		        try {
		        	 WritableWorkbook wwb = null;
		             
		               // ������д���Excel������
		        	   String fileName = request.getRealPath("/download/"+ "expert_info_data.xls") ;
		               File file=new File(fileName);
		               
		               if (!file.exists()) {
		                   file.createNewFile();
		               }
		               //��fileNameΪ�ļ���������һ��Workbook
		               wwb = Workbook.createWorkbook(file);
		               
		               
		               // ����������
		               WritableSheet ws = wwb.createSheet("ר�Ҹ�����Ϣ", 0);
		               
		               
		               
		               
		               //��ѯ���ݿ������е�����
		               //List<StuEntity> list= StuService.getAllByDb();
		               //Ҫ���뵽��Excel�����кţ�Ĭ�ϴ�0��ʼ
		               Label labelUserId= new Label(0, 0, "ר������");//��ʾ��
		               Label labelAge = new Label(1, 0, "����");
		               Label labelEducation = new Label(2, 0, "ѧ��");
		               Label labelWorkPlace = new Label(3, 0, "������λ");
		               Label labelPostCode = new Label(4, 0, "�ʱ�");
		               Label labelTechLevel = new Label(5, 0, "����ְ��");
		               Label labelTechWorkYears = new Label(6, 0, "��ְ����");
		               Label labelAdministrationDuty = new Label(7, 0, "����ְ��");
		               Label labelAdministrationWorkYears = new Label(8, 0, "��ְ����");
		               Label labelTelephone = new Label(9, 0, "��ϵ�绰");
		               Label labelMail = new Label(10, 0, "��������");
		               
		               Label labelGoodAtArea1 = new Label(11, 0, "�Ƿ���¹�������1=�ǣ�0=��");
		               Label labelArea1Major = new Label(12, 0, "����רҵ");
		               Label labelArea1Year = new Label(13, 0, "��������");
		               
		               Label labelGoodAtArea2 = new Label(14, 0, "�Ƿ�����ٴ�ҽ������1=�ǣ�0=��");
		               Label labelArea2Major = new Label(15, 0, "�ٴ�ҽ��רҵ");
		               Label labelArea2Year = new Label(16, 0, "��������");
		               
		               Label labelGoodAtArea3 = new Label(17, 0, "�Ƿ����������������1=�ǣ�0=��");
		               Label labelArea3Major = new Label(18, 0, "��������רҵ");
		               Label labelArea3Year = new Label(19, 0, "��������");
		               
		               Label labelGoodAtArea4 = new Label(20, 0, "�Ƿ���¿�ѧ�о�����1=�ǣ�0=��");
		               Label labelArea4Major = new Label(21, 0, "��ѧ�о�רҵ");
		               Label labelArea4Year = new Label(22, 0, "��������");
		               
		               Label labelGoodAtArea5 = new Label(23, 0, "�Ƿ����ҽѧ��������1=�ǣ�0=��");
		               Label labelArea5Major = new Label(24, 0, "ҽѧ����רҵ");
		               Label labelArea5Year = new Label(25, 0, "��������");
		               
		               Label labelhasFillSurvey1 = new Label(26, 0, "�Ƿ���ɰ汾1���ʾ���д��1=�ǣ�0=��");
		               
		               Label labelhasFillaccount = new Label(27, 0, "�Ƿ�����˻���Ϣ��д��1=�ǣ�0=��");
		               Label labelhasFillSurvey2 = new Label(28, 0, "�Ƿ���ɰ汾2���ʾ���д��1=�ǣ�0=��");
		               
		               ws.addCell(labelUserId);
		               ws.addCell(labelAge);
		               ws.addCell(labelEducation);
		               ws.addCell(labelWorkPlace);
		               ws.addCell(labelPostCode);
		               ws.addCell(labelTechLevel);
		               ws.addCell(labelTechWorkYears);
		               ws.addCell(labelAdministrationDuty);
		               ws.addCell(labelAdministrationWorkYears);
		               ws.addCell(labelTelephone);
		               ws.addCell(labelMail);
		               
		               ws.addCell(labelGoodAtArea1);
		               ws.addCell(labelArea1Major);
		               ws.addCell(labelArea1Year);
		               
		               ws.addCell(labelGoodAtArea2);
		               ws.addCell(labelArea2Major);
		               ws.addCell(labelArea2Year);
		               
		               ws.addCell(labelGoodAtArea3);
		               ws.addCell(labelArea3Major);
		               ws.addCell(labelArea3Year);
		               
		               ws.addCell(labelGoodAtArea4);
		               ws.addCell(labelArea4Major);
		               ws.addCell(labelArea4Year);
		               
		               ws.addCell(labelGoodAtArea5);
		               ws.addCell(labelArea5Major);
		               ws.addCell(labelArea5Year);
		               
		               ws.addCell(labelhasFillSurvey1);
		               ws.addCell(labelhasFillaccount);
		               ws.addCell(labelhasFillSurvey2);
		              /*
		               Label[] labarr = new Label[90];
		               
		               for(int i=0; i<=20; i++){
		            	   labarr[1+i*4]= new Label(1+i*4, 0, "����ָ��("+i+")");
		            	   labarr[2+i*4]= new Label(2+i*4, 0, "��Ϥ�̶�");
		            	   labarr[3+i*4]= new Label(3+i*4, 0, "��Ҫ�̶�");
		            	   labarr[4+i*4]= new Label(4+i*4, 0, "�ɿ���");
			               ws.addCell(labarr[1+i*4]);
			               ws.addCell(labarr[2+i*4]);
			               ws.addCell(labarr[3+i*4]);
			               ws.addCell(labarr[4+i*4]);
			               
		               }	               
		               */
		               //int lineNumber = 1;
		               for (int i = 0; i < list.size(); i++) {
		                   
		            	   //String expertName = list.get(i).getName();
		            	   Label labelUserId_i= new Label(0, i+1, list.get(i).getName()+"");//��ʾ��
			               Label labelAge_i = new Label(1, i+1, list.get(i).getAge()+"");
			               Label labelEducation_i = new Label(2, i+1, list.get(i).getEducation()+"");
			               Label labelWorkPlace_i = new Label(3, i+1, list.get(i).getWorkPlace()+"");
			               Label labelPostCode_i = new Label(4, i+1, list.get(i).getPostcode()+"");
			               Label labelTechLevel_i = new Label(5, i+1, list.get(i).getTechLevel()+"");
			               Label labelTechWorkYears_i = new Label(6, i+1, list.get(i).getTechWorkYears()+"");
			               Label labelAdministrationDuty_i = new Label(7, i+1, list.get(i).getAdministrationDuty()+"");
			               Label labelAdministrationWorkYears_i = new Label(8, i+1, list.get(i).getAdministrationWorkYear()+"");
			               Label labelTelephone_i = new Label(9, i+1, list.get(i).getTelephone()+"");
			               Label labelMail_i = new Label(10, i+1, list.get(i).getMail()+"");
			               
			               Label labelGoodAtArea1_i = new Label(11, i+1, list.get(i).getGoodatArea1()+"");
			               Label labelArea1Major_i = new Label(12, i+1, list.get(i).getArea1Major()+"");
			               Label labelArea1Year_i = new Label(13, i+1, list.get(i).getArea1Year()+"");
			               
			               Label labelGoodAtArea2_i = new Label(14, i+1, list.get(i).getGoodatArea2()+"");
			               Label labelArea2Major_i = new Label(15, i+1, list.get(i).getArea2Major()+"");
			               Label labelArea2Year_i = new Label(16, i+1, list.get(i).getArea2Year()+"");
			               
			               Label labelGoodAtArea3_i = new Label(17, i+1, list.get(i).getGoodatArea3()+"");
			               Label labelArea3Major_i = new Label(18, i+1, list.get(i).getArea3Major()+"");
			               Label labelArea3Year_i = new Label(19, i+1, list.get(i).getArea3Year()+"");
			               
			               Label labelGoodAtArea4_i = new Label(20, i+1, list.get(i).getGoodatArea4()+"");
			               Label labelArea4Major_i = new Label(21, i+1, list.get(i).getArea4Major()+"");
			               Label labelArea4Year_i = new Label(22, i+1, list.get(i).getArea4Year()+"");
			               
			               Label labelGoodAtArea5_i = new Label(23, i+1, list.get(i).getGoodatArea5()+"");
			               Label labelArea5Major_i = new Label(24, i+1, list.get(i).getArea5Major()+"");
			               Label labelArea5Year_i = new Label(25, i+1, list.get(i).getArea5Year()+"");
			               
			               Label labelhasFillSurvey1_i = new Label(26, i+1, list.get(i).getHasFillSurvey()+"");
			               
			               Label labelhasFillaccount_i = new Label(27, i+1, list.get(i).getHasFillBankinfo()+"");
			               Label labelhasFillSurvey2_i = new Label(28, i+1, list.get(i).getHasFillSurvey2()+"");
			               
			               
			               ws.addCell(labelUserId_i);
			               ws.addCell(labelAge_i);
			               ws.addCell(labelEducation_i);
			               ws.addCell(labelWorkPlace_i);
			               ws.addCell(labelPostCode_i);
			               ws.addCell(labelTechLevel_i);
			               ws.addCell(labelTechWorkYears_i);
			               ws.addCell(labelAdministrationDuty_i);
			               ws.addCell(labelAdministrationWorkYears_i);
			               ws.addCell(labelTelephone_i);
			               ws.addCell(labelMail_i);
			               
			               ws.addCell(labelGoodAtArea1_i);
			               ws.addCell(labelArea1Major_i);
			               ws.addCell(labelArea1Year_i);
			               
			               ws.addCell(labelGoodAtArea2_i);
			               ws.addCell(labelArea2Major_i);
			               ws.addCell(labelArea2Year_i);
			               
			               ws.addCell(labelGoodAtArea3_i);
			               ws.addCell(labelArea3Major_i);
			               ws.addCell(labelArea3Year_i);
			               
			               ws.addCell(labelGoodAtArea4_i);
			               ws.addCell(labelArea4Major_i);
			               ws.addCell(labelArea4Year_i);
			               
			               ws.addCell(labelGoodAtArea5_i);
			               ws.addCell(labelArea5Major_i);
			               ws.addCell(labelArea5Year_i);
			               
			               ws.addCell(labelhasFillSurvey1_i);
			               ws.addCell(labelhasFillaccount_i);
			               ws.addCell(labelhasFillSurvey2_i);
		               }
		             
		              //д���ĵ�
		               wwb.write();
		              // �ر�Excel����������
		               wwb.close();


		            flag = true;
		        }  catch (Exception e) {
		            // TODO Auto-generated catch block
		            e.printStackTrace();
		        } 

		        
		        return flag;
		    }
		 
		 
		 public boolean Financial_DB2Excel(List<ExpertInfo> list,HttpServletRequest request) {
		        boolean flag = false;
		        WritableWorkbook workbook = null;
		        WritableSheet sheet = null;
		        Label label = null;

		        // ����Excel��
		        try {
		        	 WritableWorkbook wwb = null;
		             
		               // ������д���Excel������
		        	   String fileName = request.getRealPath("/download/"+ "expert_financial_data.xls") ;
		               File file=new File(fileName);
		              
		               if (!file.exists()) {
		                   file.createNewFile();
		               }
		               //��fileNameΪ�ļ���������һ��Workbook
		               wwb = Workbook.createWorkbook(file);
		               
		               
		               // ����������
		               WritableSheet ws = wwb.createSheet("�����˻���Ϣ", 0);
		               
		               
		               
		               
		               //��ѯ���ݿ������е�����
		               //List<StuEntity> list= StuService.getAllByDb();
		               //Ҫ���뵽��Excel�����кţ�Ĭ�ϴ�0��ʼ
		               Label labelUserName= new Label(0, 0, "����");//��ʾ��
		               Label labelWorkPlace = new Label(1, 0, "������λ");
		               Label labelIdCardNumber = new Label(2, 0, "���֤��");
		               Label labelBankName = new Label(3, 0, "��������ȫ��");
		               Label labelBankCardNumber = new Label(4, 0, "�����˺�");
		               Label labelDuty = new Label(5, 0, "ְ��");
		               
		               Label labelPname = new Label(6, 0, "�տ�������");
		               Label labelPaddress = new Label(7, 0, "�տ��ַ");
		               Label labelPpostCard = new Label(8, 0, "�ʱ�");
		               Label labelPidCardNumber = new Label(9, 0, "�տ������֤��");
		               Label labelPtelephone = new Label(10, 0, "�տ����ֻ�");
		               
		               ws.addCell(labelUserName);
		               ws.addCell(labelWorkPlace);
		               ws.addCell(labelIdCardNumber);
		               ws.addCell(labelBankName);
		               ws.addCell(labelBankCardNumber);
		               ws.addCell(labelDuty);
		               
		               ws.addCell(labelPname);
		               ws.addCell(labelPaddress);
		               ws.addCell(labelPpostCard);
		               ws.addCell(labelPidCardNumber);
		               ws.addCell(labelPtelephone);		            
		               
		              /*
		               Label[] labarr = new Label[90];
		               
		               for(int i=0; i<=20; i++){
		            	   labarr[1+i*4]= new Label(1+i*4, 0, "����ָ��("+i+")");
		            	   labarr[2+i*4]= new Label(2+i*4, 0, "��Ϥ�̶�");
		            	   labarr[3+i*4]= new Label(3+i*4, 0, "��Ҫ�̶�");
		            	   labarr[4+i*4]= new Label(4+i*4, 0, "�ɿ���");
			               ws.addCell(labarr[1+i*4]);
			               ws.addCell(labarr[2+i*4]);
			               ws.addCell(labarr[3+i*4]);
			               ws.addCell(labarr[4+i*4]);
			               
		               }	               
		               */
		               int lineNumber = 1;
		               int line = 1;
		               for (int i = 0; i < list.size(); i++) {
		                   
		            	   String expertName = list.get(i).getName();
		            	   String expertWorkPlaceString = list.get(i).getWorkPlace();
		            	   int expertId = list.get(i).getUserId();
		            	   if(list.get(i).getHasFillSurvey() != 0){
		            		   List<ExpertBankInfo> exportbBankInfos = getexportbankInfo(expertId);
				            	 
			            	   Label labelUserName_i= new Label(0, line, expertName+"");//��ʾ��
				               Label labelWorkPlace_i = new Label(1, line, expertWorkPlaceString+"");
				               Label labelIdCardNumber_i = new Label(2, line, exportbBankInfos.get(0).getIdCardNumber()+"");
				               Label labelBankName_i = new Label(3, line, exportbBankInfos.get(0).getBankName()+"");
				               Label labelBankCardNumber_i = new Label(4, line, exportbBankInfos.get(0).getBankCardNumber()+"");
				               Label labelDuty_i = new Label(5, line, exportbBankInfos.get(0).getDuty()+"");
				               
				               Label labelPname_i = new Label(6, line, exportbBankInfos.get(0).getPName()+"");
				               Label labelPaddress_i = new Label(7, line, exportbBankInfos.get(0).getPAddress()+"");
				               Label labelPpostCard_i = new Label(8, line, exportbBankInfos.get(0).getPPostCard()+"");
				               Label labelPidCardNumber_i = new Label(9, line, exportbBankInfos.get(0).getPIdCardNumber()+"");
				               Label labelPtelephone_i = new Label(10, line, exportbBankInfos.get(0).getPTelephone()+"");
				               
				               ws.addCell(labelUserName_i);
				               ws.addCell(labelWorkPlace_i);
				               ws.addCell(labelIdCardNumber_i);
				               ws.addCell(labelBankName_i);
				               ws.addCell(labelBankCardNumber_i);
				               ws.addCell(labelDuty_i);
				               
				               ws.addCell(labelPname_i);
				               ws.addCell(labelPaddress_i);
				               ws.addCell(labelPpostCard_i);
				               ws.addCell(labelPidCardNumber_i);
				               ws.addCell(labelPtelephone_i);
				               
				               line = line + 1;
				     
		            	   }
		            	   
		            	   
		            		                   
		               }
		             
		              //д���ĵ�
		               wwb.write();
		              // �ر�Excel����������
		               wwb.close();


		            flag = true;
		        }  catch (Exception e) {
		            // TODO Auto-generated catch block
		            e.printStackTrace();
		        } 

		        
		        return flag;
		    }
		 public String addsecondLeveSick(String SickName)
					throws HibernateException {
				try {
					SecondLevel secondLevel=new SecondLevel(0, SickName, 0,0,0,0,0,0,0,0,0,0,0);
					beginTransaction();
					Serializable s = session.save(secondLevel);
					endTransaction(true);
					return ParseToReponse.parse("1", "addUser succefully", s, 0);
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
					return ParseToReponse.parse("4", e.getMessage(), null, 0);
				}
			}
		 
		 public String changePwd(int uerId,String password)
					throws HibernateException {
				try {
					String queryString = "update User w set w.password=?,w.hasChanged=? where w.id=?";
					beginTransaction();
					
					Query q = session.createQuery(queryString);
					q.setParameter(0,password);
					q.setParameter(1,1);
					System.out.println("uerId"+uerId);
					q.setParameter(2,uerId);
					
					
					q.executeUpdate();
					endTransaction(true);
					return ParseToReponse.parse("1", "changPwd succefully", null, 0);
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
					return ParseToReponse.parse("4", e.getMessage(), null, 0);
				}
			}
		 
		 public String haschangPwd(int uerId)
					throws HibernateException {
				try {
					String queryString = "from User where id=?";
					beginTransaction();
					Query query = session.createQuery(queryString);
					query.setParameter(0, uerId);
					List<User> users = query.list();
					
						return ParseToReponse.parse("1", "OK", users, users.size());
					
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
					return ParseToReponse.parse("4", e.getMessage(), null, 0);
				}
			}
		 
		 public String getScores(int uerId)
					throws HibernateException {
				try {
					String queryString = "from SecondLevel where id=?";
					beginTransaction();
					Query query = session.createQuery(queryString);
					query.setParameter(0, uerId);
					List<User> users = query.list();
					
						return ParseToReponse.parse("1", "OK", users, users.size());
					
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
					return ParseToReponse.parse("4", e.getMessage(), null, 0);
				}
			}
		 public String adminGetUserPasswd(String userName)
					throws HibernateException {
				try {
					String queryString = "from User where loginName=?";
					beginTransaction();
					Query query = session.createQuery(queryString);
					query.setParameter(0, userName);
					List<User> users = query.list();
					
						return ParseToReponse.parse("1", "OK", users, users.size());
					
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
					return ParseToReponse.parse("4", e.getMessage(), null, 0);
				}
			}
		 public String adminResetUserPasswd(String userName)
					throws HibernateException {
				try {
					String queryString = "update User w set w.password=? where w.type=?";
					beginTransaction();
					Query q = session.createQuery(queryString);
					q.setParameter(0,userName);
					q.setParameter(1,4);
					q.executeUpdate();
					endTransaction(true);
                    return ParseToReponse.parse("1", "OK", null, 0);
					
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
					return ParseToReponse.parse("4", e.getMessage(), null, 0);
				}
			}
		 public String getTop20List(int userId)
					throws HibernateException {
				try {
					String queryString = "select s.id from SecondLevel as s,Remark as r where r.id.userId=? and r.selected=? and s.id=r.id.secondLevelId and  s.id in(select t.sickId from Top20 as t)";
					beginTransaction();
					Query query = session.createQuery(queryString);
					System.out.println("userId"+userId);
					query.setParameter(0, userId);
					query.setParameter(1, 1);
					
					List selectIds = query.list();
					
					String queryString1 = "select s from SecondLevel as s,Top20 as top where top.sickId=s.id";
					beginTransaction();
					Query query1 = session.createQuery(queryString1);
					
					
					List<SecondLevel> users = query1.list();
					List<Map<String, ?>> res=new ArrayList<Map<String, ?>>();
					for(int i=0;i<users.size();i++){
						int flag=0;
						for(int j=0;j<selectIds.size();j++){
							if(selectIds.get(j)==users.get(i).getId()){
								flag=1;
								break;
							}
						}
						Map singleMap=new HashMap();
						singleMap.put("id", users.get(i).getId());
						singleMap.put("firstLevelId", users.get(i).getFirstLevelId());
						singleMap.put("name", users.get(i).getName());
						singleMap.put("ave", users.get(i).getAve());
						singleMap.put("areaAve", users.get(i).getAreaAve());
						singleMap.put("aveIm", users.get(i).getAveIm());
						singleMap.put("areaAveIm", users.get(i).getAreaAveIm());
						singleMap.put("aveCon", users.get(i).getAveCon());
						singleMap.put("areaAveCon", users.get(i).getAreaAveCon());
						singleMap.put("percentage", users.get(i).getPercentage());
						singleMap.put("selected", flag);
						res.add(singleMap);
						
						
					}
                 return ParseToReponse.parse("1", "OK", res, res.size());
					
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
					return ParseToReponse.parse("4", e.getMessage(), null, 0);
				}
			}
		 
		 public String getNotIntop20(int userId)
					throws HibernateException {
				try {
					String queryString = "select s from SecondLevel as s,Remark as r where r.id.userId=? and r.selected=? and s.id=r.id.secondLevelId and s.id not in (select t.sickId from Top20 as t)";
					beginTransaction();
					Query query = session.createQuery(queryString);
					System.out.println("userId"+userId);
					query.setParameter(0, userId);
					query.setParameter(1, 1);
					
					List<SecondLevel> selectIds = query.list();
					
					
              return ParseToReponse.parse("1", "OK", selectIds, selectIds.size());
					
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
					return ParseToReponse.parse("4", e.getMessage(), null, 0);
				}
			}
		 
		 
		 
	
}
