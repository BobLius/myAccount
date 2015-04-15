/**   
* 文件名：Page.java   
*   
* 版本信息：   
* 日期：2014-1-7   
* Copyright 移动信息 2014    
* 版权所有   
*   
*/
package com.miteno.common.dao;

import java.util.List;

/**   
 *    
 * 项目名称：tms   
 * 类名称：Page   
 * 类描述：   
 * 创建人：lzh   
 * 创建时间：2014-1-7 下午2:46:38   
 * 修改人：lzh   
 * 修改时间：2014-1-7 下午2:46:38   
 * 修改备注：   
 * @version    
 *    
 */
public class Page<T> {
	/** 页码，第几页 */
	private long page = 1;
	/** 总页数 */
	@SuppressWarnings("unused")
	private long totalPages;
	/** 每页的大小  */
	private int rows = 10;
	/** 总记录数  */
	private long total;	
	/** 此页携带的数据 */
	private List<T> data;
	/** 排序字段 ，如果是多个排序字段，以逗号隔开 */
	private String sorts;
	/** 排序顺序 ，如果是多个排序字段，以逗号隔开，并与排序字段sort一一对应 */
	private String orders;
	
	
	public long getTotalPages() {
		return (this.total + rows - 1) / rows;
	}
	
	public long getPage() {
		return page;
	}

	public void setPage(long page) {
		this.page = page;
	}

	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public long getTotal() {
		return total;
	}
	public void setTotal(long total) {
		this.total = total;
	}
	public List<T> getData() {
		return data;
	}
	public void setData(List<T> data) {
		this.data = data;
	}
	public String getSorts() {
		return sorts;
	}
	public void setSorts(String sorts) {
		this.sorts = sorts;
	}
	public String getOrders() {
		return orders;
	}
	public void setOrders(String orders) {
		this.orders = orders;
	}
	
}
