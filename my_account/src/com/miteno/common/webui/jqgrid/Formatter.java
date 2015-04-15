/**   
* 文件名：Formatter.java   
*   
* 版本信息：   
* 日期：2014-1-22   
* Copyright 移动信息 2014    
* 版权所有   
*   
*/
package com.miteno.common.webui.jqgrid;

/**   
 *    
 * 项目名称：bms   
 * 类名称：Formatter   
 * 类描述：   getSupport方法返回类的.class，是用来作为Serializer类的成员变量中的键
 * 创建人：dell   
 * 创建时间：2014-1-22 下午2:00:02   
 * 修改人：dell   
 * 修改时间：2014-1-22 下午2:00:02   
 * 修改备注：   
 * @version    
 *    
 */
public interface Formatter {
	String format(Object o);
	@SuppressWarnings("rawtypes")
	Class getSupportClass();
}
