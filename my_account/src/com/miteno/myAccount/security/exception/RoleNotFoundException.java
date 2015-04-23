/**   
* 文件名：RoleNotFoundException.java   
*   
* 版本信息：   
* 日期：2014-1-20   
* Copyright 移动信息 2014    
* 版权所有   
*   
*/
package com.miteno.myAccount.security.exception;

/**   
 *    
 * 项目名称：myAccount   
 * 类名称：RoleNotFoundException   
 * 类描述：   角色未找到异常
 * 创建人：lzh   
 * 创建时间：2014-1-20 上午11:14:09   
 * 修改人：lzh   
 * 修改时间：2014-1-20 上午11:14:09   
 * 修改备注：   
 * @version    
 *    
 */
public class RoleNotFoundException extends Exception {

	/**   
	* serialVersionUID
	*   
	* @since Ver 1.1   
	*/   
	
	private static final long serialVersionUID = 6583828670388137939L;

	public RoleNotFoundException() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RoleNotFoundException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

	public RoleNotFoundException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	public RoleNotFoundException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}
	
}
