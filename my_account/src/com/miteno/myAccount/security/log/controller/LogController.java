/**   
* 文件名：LogController.java   
*   
* 版本信息：   
* 日期：2014-1-13   
* Copyright 移动信息 2014    
* 版权所有   
*   
*/
package com.miteno.myAccount.security.log.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.miteno.common.dao.hibernate.HibernateDao;
import com.miteno.myAccount.security.log.entity.Log;
import com.miteno.myAccount.security.log.form.LogForm;
import com.miteno.myAccount.security.log.service.LogService;

/**   
 *    
 * 项目名称：bms   
 * 类名称：LogController   
 * 类描述：   用于日志流水查看和查询的控制器类
 * 创建人：lzh   
 * 创建时间：2014-1-13 下午5:37:27   
 * 修改人：lzh   
 * 修改时间：2014-1-13 下午5:37:27   
 * 修改备注：   
 * @version    
 *    
 */
	@Controller
	@RequestMapping("log")
	public class LogController {
		@Resource
		private LogService auditLogService;
		@Resource
		private HibernateDao<Log, String> logDao;
	
		@RequestMapping
		public String list(LogForm form, Model model){
			form=auditLogService.search(form);
			model.addAttribute("form", form);
			return "log/list";
		}
		@RequestMapping(value="view")
		public String view(@RequestParam String id,Model model){
			model.addAttribute("log", logDao.get(Log.class, id));
			return "log/view";
		}
		
	}


