package com.miteno.common.webui.jqgrid;

import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.miteno.common.dao.Page;
import com.miteno.common.webui.jqgrid.impl.DateFormater;
import com.miteno.common.webui.jqgrid.impl.DoubleFormater;
import com.miteno.common.webui.jqgrid.impl.TimestampFormater;

/**   
*    
* 项目名称：myAccount   
* 类名称：Serializer   
* 类描述：   页面JQGrid需要的数据组装
* 创建人：zhanghao  
* 创建时间：2014-1-22 下午1:13:02   
* 修改人：zhanghao   
* 修改时间：2014-1-22 下午1:13:02   
* 修改备注：   
* @version    
*    
*/
public class Serializer<T> {
	/*定义一个成员变量*/
	@SuppressWarnings("rawtypes")
	private Map<Class,Formatter> formaterProvider;
	/*创建本类的构造方法,构造方法中来给成员变量中赋值 由于DateFormater和DoubleFormater都是Formatter接口的实现类,
	 * 因此构造方法中可以放入new DateFormater和new DoubleFormater为值*/
	@SuppressWarnings("rawtypes")
	public Serializer(){
		formaterProvider = new HashMap<Class,Formatter>();
		formaterProvider.put(Timestamp.class, new TimestampFormater());
		formaterProvider.put(Date.class,new DateFormater());
		formaterProvider.put(Double.class, new DoubleFormater());
	}
	/*当外部调用本类的这个方法时,就会覆盖成员变量中对应的键所对应的值,下面的值也是一个接口,通过键取得这个这个接口再调format方法就是自定义的新的方法*/
	public void registerFormatter(Formatter formatter){
		formaterProvider.put(formatter.getSupportClass(), formatter);
	}
	/**
	 * 
	  
	* page2Json(提供了page到JQGrid需要的数据的转换)   
	  
	* TODO(这里描述这个方法适用条件 – 可选)  
	  
	* @param pager 分页对象
	* @param fileds	要过滤的字段
	* @return map	JQGrid需要的数据集合
	* @throws IllegalArgumentException
	* @throws IntrospectionException
	* @throws IllegalAccessException
	* @throws InvocationTargetException
	 
	* 创建时间 2014-1-22 下午1:18:52
	  
	* @since  v1.1
	 */
	@SuppressWarnings("unchecked")
	public Map<String,Object> page2Json(Page<T> pager,String ... fileds) throws IllegalArgumentException, IntrospectionException, IllegalAccessException, InvocationTargetException{
	/*	数据集合*/
		List<T> dataList = pager.getData();
	/*	总页数*/
		long total=pager.getTotalPages();
	/*当前页*/
		long page=pager.getPage();
	/*	总记录数*/
		long records=pager.getTotal();
		Map<String,Object> map = new HashMap<String,Object>();
		List<Map<String,Object>> resultList = new ArrayList<Map<String,Object>>();
		map.put("total",total );
		map.put("page",page);
		map.put("records",records);
		resultList=bean2List(dataList,fileds);
		map.put("rows",resultList);
		return map;
	}
	/**
	 * 
	  
	* bean2IncludeList(根据传入的fileds,提供page里data到JQGrid里面的rows的转换)   
	  
	* TODO(这里描述这个方法适用条件 – 可选)  
	  
	* @param dataList page中的data
	* @param fileds 需要转换的字段
	* @return resultList JQGrid中的rows,里面只包含字段对应的逗号隔开的值
	* @throws IntrospectionException
	* @throws IllegalArgumentException
	* @throws IllegalAccessException
	* @throws InvocationTargetException
	 
	* 创建时间 2014-1-22 下午1:18:08
	  
	* @since  v1.1
	 */
	@SuppressWarnings("rawtypes")
	private List bean2List(List<T> dataList,String ... fileds) throws IntrospectionException, IllegalArgumentException, IllegalAccessException, InvocationTargetException{
		List<Map<String,Object>> resultList = new ArrayList<Map<String,Object>>();
	
			for(T t:dataList){
				Class clazz=t.getClass();
				Map<String,Object> mapRow = new HashMap<String,Object>();
				for(String field:fileds){
					PropertyDescriptor pd = new PropertyDescriptor(field, clazz);
					if(pd !=null){
						Method getMethod=pd.getReadMethod();
						Object obj = getMethod.invoke(t);
						obj = format(obj);
						mapRow.put(field,obj);
					}
				}
				resultList.add(mapRow);
				
			}
		return resultList;
	}
	/**
	 * 
	  
	* format(格式化数据)   
	  
	* TODO(把数据的类型.class当做主键到成员变量formaterProvider中取得对应的接口,然后掉format方法进行格式化)  
	  
	* @param obj
	* @return
	 
	* 创建时间 2014-1-22 下午3:53:57
	  
	* @since  v1.1
	 */
	public String format(Object obj){
		/*如果这里要格式化,凡是有的类型,必须有默认的实现根式化的类,就是成员变量中根据类型.class一定能取到,要是没有默认也要自定义,否则会报错*/
	/*	String formatted = null;
		if(obj instanceof Timestamp){
			formatted = formaterProvider.get(Timestamp.class).format(obj);
			return formatted;
		}
		if(obj instanceof Date){
			formatted = formaterProvider.get(Date.class).format(obj);
			return formatted;
		}*/
		return obj+"";
	}
}
