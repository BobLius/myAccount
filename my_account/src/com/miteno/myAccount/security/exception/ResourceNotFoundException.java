/**   
* 文件名：ResourceNotFoundException.java   
*   
* 版本信息：   
* 日期：2014-1-17   
* Copyright 移动信息 2014    
* 版权所有   
*   
*/
package com.miteno.myAccount.security.exception;

/**   
 *    
 * 项目名称：myAccount   
 * 类名称：ResourceNotFoundException   
 * 类描述：   资源未找到异常，一般在根据条件检索权限菜单资源未找到时触发
 * 创建人：lzh   
 * 创建时间：2014-1-17 下午4:13:29   
 * 修改人：lzh   
 * 修改时间：2014-1-17 下午4:13:29   
 * 修改备注：   
 * @version    
 *    
 */
public class ResourceNotFoundException extends Exception {

	/**   
	* serialVersionUID:
	* @since Ver 1.1   
	*/   
	
	private static final long serialVersionUID = 4831919287458991045L;

	public ResourceNotFoundException() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ResourceNotFoundException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

	public ResourceNotFoundException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	public ResourceNotFoundException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}
	
}
