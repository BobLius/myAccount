/**   
* 文件名：UTF8StringBeanPostProcessor.java   
*   
* 版本信息：   
* 日期：2014-1-7   
* Copyright 移动信息 2014    
* 版权所有   
*   
*/
package com.miteno.framework.spring;

import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeansException;
import org.springframework.http.MediaType;
import org.springframework.http.converter.StringHttpMessageConverter;

/**   
 *    
 * 项目名称：tms   
 * 类名称：UTF8StringBeanPostProcessor   
 * 类描述：   
 * 创建人：lzh   
 * 创建时间：2014-1-7 下午1:45:10   
 * 修改人：lzh   
 * 修改时间：2014-1-7 下午1:45:10   
 * 修改备注：   
 * @version    
 *    
 */
public class UTF8StringBeanPostProcessor {
	public Object postProcessAfterInitialization(Object bean, String beanName)
			throws BeansException {
		if (bean instanceof StringHttpMessageConverter) {
			MediaType mediaType = new MediaType("text", "plain",
					Charset.forName("UTF-8"));
			List<MediaType> types = new ArrayList<MediaType>();
			types.add(mediaType);
			((StringHttpMessageConverter) bean).setSupportedMediaTypes(types);
		}
		return bean;
	}

	public Object postProcessBeforeInitialization(Object bean, String beanName)
			throws BeansException {
		return bean;
	}
}
