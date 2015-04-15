package com.miteno.common.filter;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
  
public class GetHttpServletRequestWrapper extends HttpServletRequestWrapper {  
  
    private String charset = "UTF-8";  
  
    public GetHttpServletRequestWrapper(HttpServletRequest request) {  
        super(request);  
    }  
  
    /** 
     * 获得被装饰对象的引用和采用的字符编码 
     * @param request 
     * @param charset 
     */  
    public GetHttpServletRequestWrapper(HttpServletRequest request,  
            String charset) {  
        super(request);  
        this.charset = charset;  
    }  
  
    /** 
     * 实际上就是调用被包装的请求对象的getParameter方法获得参数，然后再进行编码转换 
     */  
    @Override
    public String getParameter(String name) {  
        String value = super.getParameter(name);  
        value = value == null ? null : convert(value);  
        return value;  
    }  
  
  
    @SuppressWarnings("unchecked")
	@Override
	public Enumeration<String> getParameterNames() {
		// TODO Auto-generated method stub
		return super.getParameterNames();
	}

	@Override
	public String[] getParameterValues(String name) {
		String[] values =  super.getParameterValues(name);
		List<String> valueList = new ArrayList<String>();
		for(String v:values){
			 v = v == null ? null : convert(v);  
			 valueList.add(v);
		}
		return valueList.toArray(new String[]{});
	}

	public String convert(String target) {  
        try {  
            return new String(target.trim().getBytes("ISO-8859-1"), charset);  
        } catch (UnsupportedEncodingException e) {  
            return target;  
        }  
    }  
  
}  