/**   
* 文件名：PropertiesHelper.java   
*   
* 版本信息：   
* 日期：2014-1-7   
* Copyright 移动信息 2014    
* 版权所有   
*   
*/
package com.miteno.common.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**   
 *    
 * 项目名称：tms   
 * 类名称：PropertiesHelper   
 * 类描述：   
 * 创建人：lzh   
 * 创建时间：2014-1-7 下午1:20:34   
 * 修改人：lzh   
 * 修改时间：2014-1-7 下午1:20:34   
 * 修改备注：   
 * @version    
 *    
 */
public class PropertiesHelper {
	private Logger logger = LoggerFactory.getLogger(PropertiesHelper.class);
	private Properties properties;
	private static PropertiesHelper propertiesReader;

	/* 不允许创建实例  */
	private PropertiesHelper(){
		
	}
	
	/**
	 * 
	* 创建一个新的实例 PropertiesHelper.   
	*   
	* @param resName 配置文件路径，以classloader路径为basepath中需要 相对路径 即可 
	* @throws IOException
	 */
	private PropertiesHelper(String resName) throws IOException{
		InputStream is = PropertiesHelper.class.getClassLoader()
				.getResourceAsStream(resName);
		properties = new Properties();
		try {
			properties.load(is);
			logger.debug("加载配置信息成功");
		} catch (IOException e) {
			logger.warn("加载配置文件出错");
			throw e;
		}
	}
	
	/**
	 * 
	  
	* getInstance(得到 PropertiesHelper的单例实例)   
	  
	* TODO(这里描述这个方法适用条件 – 可选)   
	  
	* TODO(这里描述这个方法的执行流程 – 可选)   
	  
	* TODO(这里描述这个方法的使用方法 – 可选)   
	  
	* TODO(这里描述这个方法的注意事项 – 可选)   
	  
	* @param   resName   
	  
	* @param  @return    设定文件   
	  
	* @return String    DOM对象   
	  
	* @Exception 异常对象   
	  
	* @since  CodingExample　Ver(编码范例查看) 1.1
	 */
	public static PropertiesHelper getInstance(String resName) throws IOException{
		if(propertiesReader==null){
			return new PropertiesHelper(resName);
		}
		return propertiesReader;
	}
	
	/**
	 * 
	  
	* getProperties(返回所有属性)   
	  
	* TODO(这里描述这个方法适用条件 – 可选)   
	  
	* TODO(这里描述这个方法的执行流程 – 可选)   
	  
	* TODO(这里描述这个方法的使用方法 – 可选)   
	  
	* TODO(这里描述这个方法的注意事项 – 可选)   
	  
	* @param   name   
	  
	* @param  @return    设定文件   
	  
	* @return String    DOM对象   
	  
	* @Exception 异常对象   
	  
	* @since  CodingExample　Ver(编码范例查看) 1.1
	 */
	public Properties getProperties(){
		return this.properties;
	}
	
   
	/**
	 * 
	  
	* getString(根据key取value)   
	  
	* TODO(这里描述这个方法适用条件 – 可选)   
	  
	* TODO(这里描述这个方法的执行流程 – 可选)   
	  
	* TODO(这里描述这个方法的使用方法 – 可选)   
	  
	* TODO(这里描述这个方法的注意事项 – 可选)   
	  
	* @param   name   
	  
	* @param  @return    设定文件   
	  
	* @return String    DOM对象   
	  
	* @Exception 异常对象   
	  
	* @since  CodingExample　Ver(编码范例查看) 1.1
	 */
	public String getString(String key){
		String result = "";
		result = properties.getProperty(key);
		return result;
	}
	/**
	 * 
	  
	* getInt(如果确定值是int值，转换后返回int类型的值)   
	  
	* TODO(这里描述这个方法适用条件 – 可选)   
	  
	* TODO(这里描述这个方法的执行流程 – 可选)   
	  
	* TODO(这里描述这个方法的使用方法 – 可选)   
	  
	* TODO(这里描述这个方法的注意事项 – 可选)   
	  
	* @param   name   
	  
	* @param  @return    设定文件   
	  
	* @return String    DOM对象   
	  
	* @Exception 异常对象   
	  
	* @since  CodingExample　Ver(编码范例查看) 1.1
	 */
	public int getInt(String key){
		return Integer.parseInt(getString(key));
	}
}
