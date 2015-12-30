package com.basic;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.*;

import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;


/**
 * 基础控制器，其他控制器需集成此控制器获得initBinder自动转换的功�?
 * 
 * 
 */
public class BaseCtrl extends MultiActionController  {

	/**
	 * 将前台传递过来的日期格式的字符串，自动转化为Date类型
	 * 
	 * @param binder
	 */
	public void initBinder(HttpServletRequest request,ServletRequestDataBinder binder) {
		binder.registerCustomEditor(Date.class, new DateConvertEditor());
	}
	
	 /**
     * 写输出流
     */
    public void writeJSon(HttpServletResponse response, Object obj){
        response.setContentType("text/html;charset=UTF-8");
        response.setHeader("Cache-Control", "no-store");
        try {
            response.getWriter().print(JSONObject.fromObject(obj));
            response.getWriter().flush();
            response.getWriter().close();
        } catch (IOException e) {
            e.printStackTrace();
        }
       
    }

}
