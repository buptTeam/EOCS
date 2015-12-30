package com.basic;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.core.NestedIOException;
import org.springframework.core.io.Resource;
import org.springframework.web.servlet.handler.SimpleUrlHandlerMapping;

public class SimpleUrlHandlerBean extends SimpleUrlHandlerMapping implements InitializingBean {
	private static final String URL_FILE_SUFFIX = "-ctrl.xml";
	private static final String CONTROLLER_BEAN_NAME_SUFFIX = "Ctrl";
	private Resource[] urlLocations;
	private String aliasCtrl;
	private String[] urlAlias;

	public void setUrlLocations(Resource[] urlLocations) {
		this.urlLocations = urlLocations;
		System.out.println("log>>>>>>>>>>>");
		System.out.println(urlLocations);
	}
	
	public void setUrlAliasCtrl(String ctrl) {
		if (ctrl.indexOf(CONTROLLER_BEAN_NAME_SUFFIX) > 0)
			this.aliasCtrl = ctrl;
		else
			this.aliasCtrl = ctrl + CONTROLLER_BEAN_NAME_SUFFIX;
	}
	
	public void setUrlAlias(String[] urlLocations) {
		this.urlAlias = urlLocations;
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		for (Resource urlLocation : this.urlLocations) {
			if (urlLocation == null) {
				continue;
			}

			try {
				String fileName=urlLocation.getFilename();
				String handler=fileName.replace(URL_FILE_SUFFIX, "");
				addWildCardHandler(handler);

			} catch (Exception e) {
				throw new NestedIOException(
						"Failed to read urlhandler resource: '" + urlLocation
								+ "'", e);
			}

			if (logger.isDebugEnabled()) {
				System.out.println("add url handler from file: '" + urlLocation + "'");
			    logger.debug("add url handler from file: '" + urlLocation + "'");
			}
		}
		
		addAliasHandler();

	}
    
	//执行别名地址映射
	private void addAliasHandler() {
		if(urlAlias==null||aliasCtrl==null) return;
		for (String url : this.urlAlias) {
			if (url == null) {
				continue;
			}

			super.registerHandler(url, aliasCtrl);

		}

	}
	
	private void addWildCardHandler(String handler) {
		String urlPath = getWildcardPath(handler);
		if (urlPath == null)
			return;
		super.registerHandler(urlPath, handler + CONTROLLER_BEAN_NAME_SUFFIX);
	}

	private String getWildcardPath(String controllerName) {

		if (!StringUtils.isEmpty(controllerName)) {
			String fullPath = "";
			fullPath = fullPath + "/" + controllerName + "/*";
			return fullPath;
		}
		return null;
	}
}
