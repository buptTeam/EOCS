package com.bean;

import java.util.List;

//导出数据所需要的包




//以上为导出数据所需要的包


import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.Serializable;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

 
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.hibernate.HibernateException;



//以上为导入数据所需要的包


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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




public class DataBean extends HibernateBase {
	
	
	public String getData(HttpServletRequest request,String fileNmae,String type) throws HibernateException,Exception {
		try {
			String fileName = request.getRealPath("/download/"+ fileNmae) ;
			File file = new File(fileName);
		       String[][] result = getData(file, 1);
		       
		       int rowLength = result.length;
		       System.out.print("type"+type);
		       if(Integer.valueOf(type)==1){
		    	   for(int i=0;i<rowLength;i++) {
			    	   //System.out.print(result[i]);
			    	   String nameString = result[i][0];
			    	   String workplaceString = result[i][1];
			    	   String administrastion = result[i][2];
			    	   String telephoneString = result[i][3];
			    	   String mail = result[i][4];
			    	  
			    	   String passwordString = result[i][5];
			    	   
			    	   User user = new User(nameString, passwordString, 4,0);
			    	   beginTransaction();
			    	   Serializable s = session.save(user);
			    	   ExpertInfo expertInfo = new ExpertInfo();
			    	   expertInfo.setWorkPlace(workplaceString);
			    	   expertInfo.setAdministrationDuty(administrastion);
			    	   expertInfo.setTelephone(telephoneString);
			    	   expertInfo.setMail(mail);
			    	   expertInfo.setUserId((Integer)s);
			    	   expertInfo.setName(nameString);
			    	   expertInfo.setHasFillSurvey(0);
			    	   expertInfo.setGoodatArea1(0);
			    	   expertInfo.setGoodatArea2(0);
			    	   expertInfo.setGoodatArea3(0);
			    	   expertInfo.setGoodatArea4(0);
			    	   expertInfo.setGoodatArea5(0);
			    	   expertInfo.setArea1Year(0);
			    	   expertInfo.setArea2Year(0);
			    	   expertInfo.setArea3Year(0);
			    	   expertInfo.setArea4Year(0);
			    	   expertInfo.setArea5Year(0);
			    	   expertInfo.setHasFillSurvey2(0);
			    	   expertInfo.setHasFillBankinfo(0);
			    	   session.save(expertInfo);
			    	   
			    	   ExpertBankInfo exBankInfo=new ExpertBankInfo((Integer)s);
			    	   session.save(exBankInfo);
			    	   endTransaction(true);
			    	   
			    	   /*
			    	   for(int j=0;j<result[i].length;j++) {
			               
			        	   System.out.print(result[i][j]+"\t\t");
			              
			           }
			           System.out.println();*/
			       }
		       }else if(Integer.valueOf(type)==2){
		    	   System.out.println("hello+update secondlevel");
		    	   for(int i=0;i<rowLength;i++) {
			    	   //System.out.print(result[i]);
			    	   String id_String = result[i][0];
		    		   String all_familiar_aveString = result[i][2];
			    	   String area_familiar_aveString = result[i][3];
			    	   String all_important_aveString = result[i][4];
			    	   String area_important_aveString = result[i][5];
			    	   String all_control_aveString = result[i][6];
			    	   String area_control_aveString = result[i][7];
			    	   String percentString = result[i][8];
			    	   int id =  Integer.parseInt(id_String);
			    	   double all_familiar_ave =  Double.parseDouble(all_familiar_aveString);
			    	   double area_familiar_ave =  Double.parseDouble(area_familiar_aveString);
			    	   double all_important_ave =  Double.parseDouble(all_important_aveString);
			    	   double area_important_ave =  Double.parseDouble(area_important_aveString);
			    	   double all_control_ave =  Double.parseDouble(all_control_aveString);
			    	   double area_control_ave =  Double.parseDouble(area_control_aveString);
			    	   double percent =  Double.parseDouble(percentString);
			    	   String queryString = "update SecondLevel w set w.ave=?,w.areaAve=?,w.aveIm=?,w.areaAveIm=?,w.aveCon=?,w.areaAveCon=?,w.percentage=? where w.id=?";
						beginTransaction();
						
						Query q = session.createQuery(queryString);
						q.setParameter(0,all_familiar_ave);
						q.setParameter(1,area_familiar_ave);
						q.setParameter(2,all_important_ave);
						q.setParameter(3,area_important_ave);
						q.setParameter(4,all_control_ave);
						q.setParameter(5,area_control_ave);
						q.setParameter(6,percent);
						q.setParameter(7,id);
						
						q.executeUpdate();
						endTransaction(true);
			    	   
			    	  
			    	   
			    	   //endTransaction(true);
			    	   
			    	   /*
			    	   for(int j=0;j<result[i].length;j++) {
			               
			        	   System.out.print(result[i][j]+"\t\t");
			              
			           }
			           System.out.println();*/
			       }
		    	   request.getSession().setAttribute("msgsick", "上传成功");
		       }else {
		    	   String sql="delete from Top20"; 
		    	   beginTransaction();
		    	   Query qq = session.createQuery(sql);
		    	   qq.executeUpdate();
		    	   endTransaction(true);
		    	   for(int i=0;i<rowLength;i++) {
			    	   //System.out.print(result[i]);
		    		   
		    		   String id_String = result[i][0];
		    		   
			    	   int sickid =  Integer.parseInt(id_String);
			    	   Top20 top20 = new Top20(sickid);
			    	   
						beginTransaction();
						
						
						Serializable s = session.save(top20);
						
						
						endTransaction(true);
			    	   
			    	  
			    	   
			    	   //endTransaction(true);
			    	   
			    	   /*
			    	   for(int j=0;j<result[i].length;j++) {
			               
			        	   System.out.print(result[i][j]+"\t\t");
			              
			           }
			           System.out.println();*/
			       }
		    	   request.getSession().setAttribute("msgtop", "上传成功");
			}
		       
			
		      
			return ParseToReponse.parse("1", "导入数据", "userId:", 0);
		} catch (Exception e) {
			// TODO: handle exception
			request.getSession().setAttribute("msg", "上传失败");
			e.printStackTrace();
			return ParseToReponse.parse("4", e.getMessage(), null, 0);
		}
	}
	


	
	
	/**
     * 读取Excel的内容，第一维数组存储的是一行中格列的值，二维数组存储的是多少个行
     * @param file 读取数据的源Excel
     * @param ignoreRows 读取数据忽略的行数，比喻行头不需要读入 忽略的行数为1
     * @return 读出的Excel中数据的内容
     * @throws FileNotFoundException
     * @throws IOException
     */
    public  String[][] getData(File file, int ignoreRows)
           throws FileNotFoundException, IOException {
       List<String[]> result = new ArrayList<String[]>();
       int rowSize = 0;
       BufferedInputStream in = new BufferedInputStream(new FileInputStream(file));
       // 打开HSSFWorkbook
       POIFSFileSystem fs = new POIFSFileSystem(in);
       HSSFWorkbook wb = new HSSFWorkbook(fs);
       HSSFCell cell = null;
       int sheetIndex = 0;
       //for (int sheetIndex = 0; sheetIndex < wb.getNumberOfSheets(); sheetIndex++) {
           HSSFSheet st = wb.getSheetAt(sheetIndex);
           // 第一行为标题，不取
           for (int rowIndex = ignoreRows; rowIndex <= st.getLastRowNum(); rowIndex++) {
              HSSFRow row = st.getRow(rowIndex);
              if (row == null) {
                  continue;
              }
              int tempRowSize = row.getLastCellNum() + 1;
              if (tempRowSize > rowSize) {
                  rowSize = tempRowSize;
              }
              String[] values = new String[rowSize];
              Arrays.fill(values, "");
              boolean hasValue = false;
              for (short columnIndex = 0; columnIndex <= row.getLastCellNum(); columnIndex++) {
                  String value = "";
                  cell = row.getCell(columnIndex);
                  if (cell != null) {
                     // 注意：一定要设成这个，否则可能会出现乱码
                     cell.setEncoding(HSSFCell.ENCODING_UTF_16);
                     switch (cell.getCellType()) {
                     case HSSFCell.CELL_TYPE_STRING:
                         value = cell.getStringCellValue();
                         break;
                     case HSSFCell.CELL_TYPE_NUMERIC:
                         if (HSSFDateUtil.isCellDateFormatted(cell)) {
                            Date date = cell.getDateCellValue();
                            if (date != null) {
                                value = new SimpleDateFormat("yyyy-MM-dd").format(date);
                            } else {
                                value = "";
                            }
                         } else {
                            value = new DecimalFormat("0").format(cell.getNumericCellValue());
                         }
                         break;
                     case HSSFCell.CELL_TYPE_FORMULA:
                         // 导入时如果为公式生成的数据则无值
                         if (!cell.getStringCellValue().equals("")) {
                            value = cell.getStringCellValue();
                         } else {
                            value = cell.getNumericCellValue() + "";
                         }
                         break;
                     case HSSFCell.CELL_TYPE_BLANK:
                         break;
                     case HSSFCell.CELL_TYPE_ERROR:
                         value = "";
                         break;
                     case HSSFCell.CELL_TYPE_BOOLEAN:
                         value = (cell.getBooleanCellValue() == true ? "Y"
                                : "N");
                         break;
                     default:
                         value = "";
                     }
                  }
                  if (columnIndex == 0 && value.trim().equals("")) {
                     break;
                  }
                  values[columnIndex] = rightTrim(value);
                  hasValue = true;
              }
 
              if (hasValue) {
                  result.add(values);
              }
           }
       //}
       in.close();
       String[][] returnArray = new String[result.size()][rowSize];
       for (int i = 0; i < returnArray.length; i++) {
           returnArray[i] = (String[]) result.get(i);
       }
       return returnArray;
    }
    
    
    /**
     * 去掉字符串右边的空格
     * @param str 要处理的字符串
     * @return 处理后的字符串
     */
     public  String rightTrim(String str) {
       if (str == null) {
           return "";
       }
       int length = str.length();
       for (int i = length - 1; i >= 0; i--) {
           if (str.charAt(i) != 0x20) {
              break;
           }
           length--;
       }
       return str.substring(0, length);
    }


}
