/**   
* 文件名：UserNotFoundException.java   
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
 * 项目名称：bms   
 * 类名称：UserNotFoundException   
 * 类描述：   后台管理用户未找到异常
 * 创建人：lzh   
 * 创建时间：2014-1-20 上午11:51:14   
 * 修改人：lzh   
 * 修改时间：2014-1-20 上午11:51:14   
 * 修改备注：   
 * @version    
 *    
 */
public class UserNotFoundException extends Exception {

	  
	/**
	 * 
	 */
	private static final long serialVersionUID = 4707890356587087979L;


	/**   
	* 创建一个新的实例 UserNotFoundException.   
	*      
	*/
	public UserNotFoundException() {
		super();
		// TODO Auto-generated constructor stub
	}

	  
	/**   
	* 创建一个新的实例 UserNotFoundException.   
	*   
	* @param message
	* @param cause   
	*/
	public UserNotFoundException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

	  
	/**   
	* 创建一个新的实例 UserNotFoundException.   
	*   
	* @param message   
	*/
	public UserNotFoundException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	  
	/**   
	* 创建一个新的实例 UserNotFoundException.   
	*   
	* @param cause   
	*/
	public UserNotFoundException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}
	
}
