/**   
* 文件名：Dateformater.java   
*   
* 版本信息：   
* 日期：2014-1-22   
* Copyright 移动信息 2014    
* 版权所有   
*   
*/
package com.miteno.common.webui.jqgrid.impl;

import java.sql.Date;
import java.text.SimpleDateFormat;

import com.miteno.common.webui.jqgrid.Formatter;

/**   
 *    
 * 项目名称：myAccount   
 * 类名称：Dateformater   
 * 类描述：   
 * 创建人：dell   
 * 创建时间：2014-1-22 下午2:01:10   
 * 修改人：dell   
 * 修改时间：2014-1-22 下午2:01:10   
 * 修改备注：   
 * @version    
 *    
 */
public class DateFormater implements Formatter {

	/* (non-Javadoc)   
	 * @see com.miteno.common.webui.jqgrid.Formatter#format(java.lang.Object)   
	 */
	@Override
	public String format(Object o) {
		return new SimpleDateFormat("yyyy/MM/dd").format(o);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public Class getSupportClass() {
		return Date.class;
	}

}
