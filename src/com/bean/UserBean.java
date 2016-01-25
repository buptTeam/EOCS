package com.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//导出数据所需要的包
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

//以上为导出数据所需要的包


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
import model.SickList;
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

	// 根据mail name workplace 确认是否有这个人
	public String checkInfo(String mail, String name, String workplace)
			throws HibernateException {
		try {
			if(!(workplace.equals("123456")))
				return ParseToReponse.parse("3", "no such info", null,
						0); // 认证不通过
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
						infos.size()); // 认证不通过
			} else {
				if (1==infos.get(0).getIsUsed()) {
					return ParseToReponse.parse("2", "the info has used",
							infos, infos.size()); // 一个信息不能注册两次
				} else {
					System.out.println("return" + infos.get(0).getName());
					return ParseToReponse.parse("1", "correct", infos,
							infos.size()); // 认证通过
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

			String queryString = "from InitialExpertInfo where id=?"; // 这里
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
			//获取所有的二级指标
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
//			 String[]{"新发突发传染病,鼠疫,霍乱,传染性非典型肺,艾滋病,病毒性肝炎,脊髓灰质炎,人感染致病性禽流感,甲型H1N1流感,麻疹,流行性出雪热,狂犬病,流行性乙型脑炎,登革热,碳疽,细菌性和阿米巴性痢疾,肺结核,伤寒和副伤寒,流行性脑脊髓膜,百日咳,白喉,新生破伤风,猩红热,布鲁氏菌病,淋病,钩端螺旋体病,血吸虫病,疟疾,流行性感冒（简称流感）,流行性腮腺炎,风疹,急性出血性结膜炎,麻风病,流行性和地方性斑诊伤寒,黑热病,包虫病,丝虫病除霍乱,细菌性和阿米巴性痢疾,伤寒和副伤寒以外的感染性腹泻病,手足口病","肺癌,肝癌,胃癌,结直肠癌,乳腺癌,宫颈癌,食管癌,前列腺癌,胰腺癌,白血病,胆囊癌,高血压,血脂异常,冠心病/心肌梗死,糖尿病,脑卒中,慢性阻塞性肺病,哮喘,老年痴呆,慢性肾病,老年失能,超重肥胖,常见口腔疾病","抑郁症,双相情感障碍,精神分裂症,焦虑症,药物滥用与药物依赖,智力障碍,儿童期和青春期发育和行为障碍 如自闭症,癫痫","吸烟,过量饮酒,身体活动不足,不健康饮食（高盐、高脂、少蔬菜水果等）,不安全性行为","妊娠高血压,妊娠糖尿病,产后出血,子痫,先天性心脏病,出生低体重,儿童苯丙酮尿症,新生儿窒息、肺炎","道路交通伤害,自杀,溺水,跌倒,家庭暴力","食物中毒,非法使用食品添加剂,农药、激素及抗生素等残留,营养不良","尘肺,噪声性听力下降或耳聋,甲醛、苯和其他有机溶剂中毒,突发职业中毒,职业紧张,肌肉骨骼损伤（例如颈椎病、腰椎病、肩腕综合征等）,重大环境污染事故,水污染,土壤污染,空气污染,室内环境污染,新技术、新材料带来的环境污染","碘缺乏病,大骨节病"};
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
	
	
	//为导出数据做准备，获取secondlevel的名字。
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
	
	//为导出数据做准备，获取所有export。
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
	
	//为导出数据做准备，获取二级指标的问卷填写信息
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
	
	//导出专家银行信息
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
	
	
	
	
	//导出专家问卷数据
	public String exportData(int type,HttpServletRequest request) throws HibernateException {
		try {
			List<ExpertInfo> list = getExpertInfoName();
			List<SecondLevel> list2 = getsecondLevels();
			List<Top20> list3 = getTop20s();
			//导出版本一调查的问卷信息
			if(type == 1){
				
				boolean res = Remark_DB2Excel( list, request,1);
				if(res == true){
					return ParseToReponse.parse("1", "exportRemarkDatasuccess",
							null, 0);
				}else{
					return ParseToReponse.parse("4", "exportRemarkDataerror", null, 0);
				}
			}else if(type == 2){//导出财务信息
				boolean res = Financial_DB2Excel( list, request);
				if(res == true){
					return ParseToReponse.parse("1", "exportfinancialDatasuccess",
						null, 0);
				}else{
					return ParseToReponse.parse("4", "exportfinancialDataerror", null, 0);
				}
			}else if(type == 3){//导出个人信息
				boolean res = Info_DB2Excel( list,request);
				if(res == true){
					return ParseToReponse.parse("1", "exportinfoDatasuccess",
						null, 0);
				}else{
					return ParseToReponse.parse("4", "exportinfoDataerror", null, 0);
				}
			}else if(type == 4){//导出版本二调查的问卷信息
				boolean res = Remark_DB2Excel( list, request,2);
				if(res == true){
					return ParseToReponse.parse("1", "exportRemarkDatasuccess",
							null, 0);
				}else{
					return ParseToReponse.parse("4", "exportRemarkDataerror", null, 0);
				}
			}else if(type == 5){//导出版本一的二级疾病信息
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

        // 创建Excel表
        try {
        	 WritableWorkbook wwb = null;
             
               // 创建可写入的Excel工作簿
        	   String fileName = request.getRealPath("/download/"+ "top_20.xls") ;
               File file=new File(fileName);
              
               if (!file.exists()) {
                   file.createNewFile();
               }
               //以fileName为文件名来创建一个Workbook
               wwb = Workbook.createWorkbook(file);
               
               
               // 创建工作表
               WritableSheet ws = wwb.createSheet("Top20疾病", 0);
               
               
               
               
               //查询数据库中所有的数据
               //List<StuEntity> list= StuService.getAllByDb();
               //要插入到的Excel表格的行号，默认从0开始
               Label labelIdLabel = new Label(0,0,"Top20疾病ID");
               
               
               ws.addCell(labelIdLabel);
               
               
              /*
               Label[] labarr = new Label[90];
               
               for(int i=0; i<=20; i++){
            	   labarr[1+i*4]= new Label(1+i*4, 0, "二级指标("+i+")");
            	   labarr[2+i*4]= new Label(2+i*4, 0, "熟悉程度");
            	   labarr[3+i*4]= new Label(3+i*4, 0, "重要程度");
            	   labarr[4+i*4]= new Label(4+i*4, 0, "可控性");
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
             
              //写进文档
               wwb.write();
              // 关闭Excel工作簿对象
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

        // 创建Excel表
        try {
        	 WritableWorkbook wwb = null;
             
               // 创建可写入的Excel工作簿
        	   String fileName = request.getRealPath("/download/"+ "ill_data.xls") ;
               File file=new File(fileName);
              
               if (!file.exists()) {
                   file.createNewFile();
               }
               //以fileName为文件名来创建一个Workbook
               wwb = Workbook.createWorkbook(file);
               
               
               // 创建工作表
               WritableSheet ws = wwb.createSheet("疾病", 0);
               
               
               
               
               //查询数据库中所有的数据
               //List<StuEntity> list= StuService.getAllByDb();
               //要插入到的Excel表格的行号，默认从0开始
               Label labelIdLabel = new Label(0,0,"ID");
               Label labelIllName= new Label(1, 0, "疾病名字");//表示第
               Label label_All_familiar_Average = new Label(2, 0, "全体专家熟悉程度均分");
               Label label_Area_familar_Average = new Label(3, 0, "领域专家熟悉程度均分");
               Label label_All_import_Average = new Label(4, 0, "全体专家重要程度均分");
               Label label_Area_import_Average = new Label(5, 0, "领域专家重要程度均分");
               Label label_All_control_Average = new Label(6, 0, "全体专家可控程度均分");
               Label label_Area_control_Average = new Label(7, 0, "领域专家可控程度均分");
               Label label_Percent = new Label(8, 0, "专家选择百分比");
               
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
            	   labarr[1+i*4]= new Label(1+i*4, 0, "二级指标("+i+")");
            	   labarr[2+i*4]= new Label(2+i*4, 0, "熟悉程度");
            	   labarr[3+i*4]= new Label(3+i*4, 0, "重要程度");
            	   labarr[4+i*4]= new Label(4+i*4, 0, "可控性");
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
             
              //写进文档
               wwb.write();
              // 关闭Excel工作簿对象
               wwb.close();


            flag = true;
        }  catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } 

        
        return flag;
    }
	
	
	//获取所有原始的二级指标
	public List<SecondLevel> getAllSecondLevel() throws HibernateException {
		try {
			String queryString = "from SecondLevel where id <131";
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
	
	
	
	//导出数据到excel
	 public boolean Remark_DB2Excel(List<ExpertInfo> list, HttpServletRequest request,int version) {
	        boolean flag = false;
	        WritableWorkbook workbook = null;
	        WritableSheet sheet = null;
	        Label label = null;

	        // 创建Excel表
	        try {
	        	 WritableWorkbook wwb = null;
	             
	               // 创建可写入的Excel工作簿
	        	 
	               String fileName = request.getRealPath("/download/"+ "expert_research_data_"+version+".xls") ;
	               File file=new File(fileName);
	               if (!file.exists()) {
	                   file.createNewFile();
	               }
	               //以fileName为文件名来创建一个Workbook
	               wwb = Workbook.createWorkbook(file);
	               
	               
	               // 创建工作表
	               WritableSheet ws = wwb.createSheet("疾病可防控性", 0);
	               
	               
	               
	               
	               //查询数据库中所有的数据
	               //List<StuEntity> list= StuService.getAllByDb();
	               //要插入到的Excel表格的行号，默认从0开始
	               Label labelUserId= new Label(0, 0, "用户名");//表示第\
	               Label labelillname1 = new Label(1, 0, "一级指标");
	               Label labelillname = new Label(2, 0, "二级指标");
	               Label labelchoosed = new Label(3, 0, "是否选中（1=选中；0=未选中）");
	               Label labelfamiliar = new Label(4, 0, "熟悉程度");
	               Label labelimportance = new Label(5, 0, "重要程度");
	               Label labelcontrol = new Label(6, 0, "可防控程度");
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
	            	   labarr[1+i*4]= new Label(1+i*4, 0, "二级指标("+i+")");
	            	   labarr[2+i*4]= new Label(2+i*4, 0, "熟悉程度");
	            	   labarr[3+i*4]= new Label(3+i*4, 0, "重要程度");
	            	   labarr[4+i*4]= new Label(4+i*4, 0, "可控性");
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
		                	   Label labelUser_i= new Label(0, lineNumber, expertName+"");//表示第
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
		                	   Label labelUser_i= new Label(0, lineNumber, expertName+"");//表示第
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
	             
	              //写进文档
	               wwb.write();
	              // 关闭Excel工作簿对象
	               wwb.close();


	            flag = true;
	        }  catch (Exception e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } 

	        
	        return flag;
	    }
	 
	//导出数据到excel info
		 public boolean Info_DB2Excel(List<ExpertInfo> list, HttpServletRequest request) {
		        boolean flag = false;
		        WritableWorkbook workbook = null;
		        WritableSheet sheet = null;
		        Label label = null;
		        
		        // 创建Excel表
		        try {
		        	 WritableWorkbook wwb = null;
		             
		               // 创建可写入的Excel工作簿
		        	   String fileName = request.getRealPath("/download/"+ "expert_info_data.xls") ;
		               File file=new File(fileName);
		               
		               if (!file.exists()) {
		                   file.createNewFile();
		               }
		               //以fileName为文件名来创建一个Workbook
		               wwb = Workbook.createWorkbook(file);
		               
		               
		               // 创建工作表
		               WritableSheet ws = wwb.createSheet("专家个人信息", 0);
		               
		               
		               
		               
		               //查询数据库中所有的数据
		               //List<StuEntity> list= StuService.getAllByDb();
		               //要插入到的Excel表格的行号，默认从0开始
		               Label labelUserId= new Label(0, 0, "专家姓名");//表示第
		               Label labelAge = new Label(1, 0, "年龄");
		               Label labelEducation = new Label(2, 0, "学历");
		               Label labelWorkPlace = new Label(3, 0, "工作单位");
		               Label labelPostCode = new Label(4, 0, "邮编");
		               Label labelTechLevel = new Label(5, 0, "技术职称");
		               Label labelTechWorkYears = new Label(6, 0, "任职年数");
		               Label labelAdministrationDuty = new Label(7, 0, "行政职务");
		               Label labelAdministrationWorkYears = new Label(8, 0, "任职年数");
		               Label labelTelephone = new Label(9, 0, "联系电话");
		               Label labelMail = new Label(10, 0, "电子邮箱");
		               
		               Label labelGoodAtArea1 = new Label(11, 0, "是否从事公卫领域：1=是，0=否");
		               Label labelArea1Major = new Label(12, 0, "公卫专业");
		               Label labelArea1Year = new Label(13, 0, "从事年数");
		               
		               Label labelGoodAtArea2 = new Label(14, 0, "是否从事临床医疗领域：1=是，0=否");
		               Label labelArea2Major = new Label(15, 0, "临床医疗专业");
		               Label labelArea2Year = new Label(16, 0, "从事年数");
		               
		               Label labelGoodAtArea3 = new Label(17, 0, "是否从事行政管理领域：1=是，0=否");
		               Label labelArea3Major = new Label(18, 0, "行政管理专业");
		               Label labelArea3Year = new Label(19, 0, "从事年数");
		               
		               Label labelGoodAtArea4 = new Label(20, 0, "是否从事科学研究领域：1=是，0=否");
		               Label labelArea4Major = new Label(21, 0, "科学研究专业");
		               Label labelArea4Year = new Label(22, 0, "从事年数");
		               
		               Label labelGoodAtArea5 = new Label(23, 0, "是否从事医学教育领域：1=是，0=否");
		               Label labelArea5Major = new Label(24, 0, "医学教育专业");
		               Label labelArea5Year = new Label(25, 0, "从事年数");
		               
		               Label labelhasFillSurvey1 = new Label(26, 0, "是否完成版本1的问卷填写：1=是，0=否");
		               
		               Label labelhasFillaccount = new Label(27, 0, "是否完成账户信息填写：1=是，0=否");
		               Label labelhasFillSurvey2 = new Label(28, 0, "是否完成版本2的问卷填写：1=是，0=否");
		               
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
		            	   labarr[1+i*4]= new Label(1+i*4, 0, "二级指标("+i+")");
		            	   labarr[2+i*4]= new Label(2+i*4, 0, "熟悉程度");
		            	   labarr[3+i*4]= new Label(3+i*4, 0, "重要程度");
		            	   labarr[4+i*4]= new Label(4+i*4, 0, "可控性");
			               ws.addCell(labarr[1+i*4]);
			               ws.addCell(labarr[2+i*4]);
			               ws.addCell(labarr[3+i*4]);
			               ws.addCell(labarr[4+i*4]);
			               
		               }	               
		               */
		               //int lineNumber = 1;
		               for (int i = 0; i < list.size(); i++) {
		                   
		            	   //String expertName = list.get(i).getName();
		            	   Label labelUserId_i= new Label(0, i+1, list.get(i).getName()+"");//表示第
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
		             
		              //写进文档
		               wwb.write();
		              // 关闭Excel工作簿对象
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

		        // 创建Excel表
		        try {
		        	 WritableWorkbook wwb = null;
		             
		               // 创建可写入的Excel工作簿
		        	   String fileName = request.getRealPath("/download/"+ "expert_financial_data.xls") ;
		               File file=new File(fileName);
		              
		               if (!file.exists()) {
		                   file.createNewFile();
		               }
		               //以fileName为文件名来创建一个Workbook
		               wwb = Workbook.createWorkbook(file);
		               
		               
		               // 创建工作表
		               WritableSheet ws = wwb.createSheet("银行账户信息", 0);
		               
		               
		               
		               
		               //查询数据库中所有的数据
		               //List<StuEntity> list= StuService.getAllByDb();
		               //要插入到的Excel表格的行号，默认从0开始
		               Label labelUserName= new Label(0, 0, "姓名");//表示第
		               Label labelWorkPlace = new Label(1, 0, "工作单位");
		               Label labelIdCardNumber = new Label(2, 0, "身份证号");
		               Label labelBankName = new Label(3, 0, "开户银行全称");
		               Label labelBankCardNumber = new Label(4, 0, "银行账号");
		               Label labelDuty = new Label(5, 0, "职务");
		               
		               Label labelPname = new Label(6, 0, "收款人姓名");
		               Label labelPaddress = new Label(7, 0, "收款地址");
		               Label labelPpostCard = new Label(8, 0, "邮编");
		               Label labelPidCardNumber = new Label(9, 0, "收款人身份证号");
		               Label labelPtelephone = new Label(10, 0, "收款人手机");
		               
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
		            	   labarr[1+i*4]= new Label(1+i*4, 0, "二级指标("+i+")");
		            	   labarr[2+i*4]= new Label(2+i*4, 0, "熟悉程度");
		            	   labarr[3+i*4]= new Label(3+i*4, 0, "重要程度");
		            	   labarr[4+i*4]= new Label(4+i*4, 0, "可控性");
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
				            	 
			            	   Label labelUserName_i= new Label(0, line, expertName+"");//表示第
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
		             
		              //写进文档
		               wwb.write();
		              // 关闭Excel工作簿对象
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
		 
		 public String getAllSick(int userId)
					throws HibernateException {
				try {
					String queryString = "from SickList";
					beginTransaction();
					Query query = session.createQuery(queryString);
					
					List<SickList> sickList = query.list();
					
					queryString = "from Remark  as r where  r.id.userId=? and r.selected=? ";
					beginTransaction();
				    query = session.createQuery(queryString);
					query.setParameter(0, userId);
					query.setParameter(1, 1);
					List<Remark> remark = query.list();
					
					List<HashMap> resList=new ArrayList();
					for(int i=0;i<sickList.size();i++){
						HashMap map=new HashMap();
						map.put("Index", sickList.get(i).getIndex());
						map.put("ImportanceAve", sickList.get(i).getImportanceAve());
						map.put("ProtectiveAve", sickList.get(i).getProtectiveAve());
						map.put("SecondId", sickList.get(i).getSecondId());
						map.put("Zonghe", sickList.get(i).getZonghe());
						map.put("SecondName", sickList.get(i).getSecondName());
						map.put("isSeleted", 0);
						resList.add(map);
					}
					for(int i=0;i<remark.size();i++){
						for(int j=0;j<resList.size();j++){
							//System.out.println(remark.get(i).getId().getSecondLevelId());
							//System.out.println(Integer.parseInt( resList.get(j).get("SecondId").toString()));
							if(remark.get(i).getId().getSecondLevelId()==Integer.parseInt( resList.get(j).get("SecondId").toString())){
								resList.get(j).put("isSeleted", 1);
								break;
							}
						}
					}
					
           return ParseToReponse.parse("1", "OK", resList, resList.size());
					
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
					return ParseToReponse.parse("4", e.getMessage(), null, 0);
				}
			}
		 
		 
		 
	
}