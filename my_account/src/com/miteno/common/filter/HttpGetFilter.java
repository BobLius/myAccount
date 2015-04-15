package com.miteno.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class HttpGetFilter implements Filter {
	private String encoding="UTF-8";
	@SuppressWarnings("unused")
	private FilterConfig config;

	@Override
	public void destroy() {
		

	}


    public void doFilter(ServletRequest request, ServletResponse response,  
                FilterChain chain) throws IOException, ServletException {  
            //设置请求响应字符编码  
            request.setCharacterEncoding(encoding);  
            response.setCharacterEncoding(encoding);  
            //新增加的代码          
            HttpServletRequest req = (HttpServletRequest)request;  
          
              
            if(req.getMethod().equalsIgnoreCase("get"))  
            {  
                req = new GetHttpServletRequestWrapper(req,"UTF-8");  
            }  
              
            chain.doFilter(req, response);  
      
        }  


	@Override
	public void init(FilterConfig config) throws ServletException {
		 this.config = config;  
         String encoding = config.getServletContext().getInitParameter("get_method_encoding");    
         if( encoding != null && encoding.trim().length() != 0)  
         {  
             this.encoding = encoding;  
         }  
	}

}
