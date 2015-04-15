/**   
* 文件名：HibernateDao.java   
*   
* 版本信息：   
* 日期：2014-1-7   
* Copyright 2014    
* 版权所有   
*   
*/
package com.miteno.common.dao.hibernate;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.miteno.common.dao.Page;


/**   
 *    
 * 项目名称：tms   
 * 类名称：HibernateDao   
 * 类描述：   
 * 创建人：lzh   
 * 创建时间：2014-1-7 下午2:17:36   
 * 修改人：lzh   
 * 修改时间：2014-1-7 下午2:17:36   
 * 修改备注：   
 * @version    
 *    
 */
@Repository
public class HibernateDao<T,PrimaryKey extends Serializable> {
	/** spring 注入hibernate sessionFactory*/
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public T get(Class<T> entityClass,PrimaryKey id) {
		return (T) sessionFactory.getCurrentSession().get(entityClass, id);
	}

	@Transactional
	public void save(T entity) {
		sessionFactory.getCurrentSession().save(entity);
	}

	@Transactional
	public void update(T entity) {
		sessionFactory.getCurrentSession().update(entity);
		
	}

	@Transactional
	public void delete(T entity) {
		sessionFactory.getCurrentSession().delete(entity);
	}
	@Transactional
	public void delete(Class<T> entityClass,PrimaryKey id){
		delete(get(entityClass,id));
	}

	@Transactional
	public void merge(T entity) {
		sessionFactory.getCurrentSession().merge(entity);		
	}

	@Transactional
	public void saveOrUpdate(T entity) {
		sessionFactory.getCurrentSession().saveOrUpdate(entity);		
	}

	@SuppressWarnings("unchecked")
	public T findUniqueByCriteria(Class<T> entityClass,final Criterion... criterion){
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(entityClass);
		for(Criterion c:criterion){
			criteria.add(c);
		}
		criteria.setProjection(null);
		// 限定了返回结果的样式为只是查询主体,不带关联查询的对象 
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		return (T) criteria.uniqueResult();
	}
	@SuppressWarnings("unchecked")
	public T findUniqueByDetachedCriteria(Class<T> entityClass,final DetachedCriteria detachedCriteria){
		Criteria criteria = detachedCriteria.getExecutableCriteria(sessionFactory.getCurrentSession());
		criteria.setProjection(null);
		// 限定了返回结果的样式为只是查询主体,不带关联查询的对象 
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		return (T) criteria.uniqueResult();
	}
	@SuppressWarnings("unchecked")
	public void findPageByDetachedCriteriaProjection(
			DetachedCriteria detachedCriteria, Page<T> page) {
		
		Criteria criteria = detachedCriteria.getExecutableCriteria(sessionFactory.getCurrentSession());
		int total = criteria.list().size();    //总记录数
		long pageNo = page.getPage();
		long pageSize = page.getRows();

		List<T> items = criteria.setFirstResult((int) ((pageNo -1)*pageSize))
				.setMaxResults((int) pageSize).list();
		page.setData(items);
		page.setTotal(total);
	}
	
	@SuppressWarnings("unchecked")
	public List<Object[]> findByCriteriaSpecification(
			CriteriaSpecification criteriaSpecification) {
		List<Object[]> list = new ArrayList<Object[]>();
		Criteria criteria = null;
		if(criteriaSpecification instanceof Criteria){
			criteria = (Criteria) criteriaSpecification;
		}else if(criteriaSpecification instanceof DetachedCriteria){
			criteria = ((DetachedCriteria)criteriaSpecification).getExecutableCriteria(sessionFactory.getCurrentSession());
		}else{
			return list;
		}
		return criteria.list();
	}

	/** 根据0~n个查询条件 获取所有记录 */
	@SuppressWarnings("unchecked")
	public List<T> findAllByCriteria(Class<T> entityClass,final Criterion... criterion) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(entityClass);
		for(Criterion c:criterion){
			criteria.add(c);
		}
		criteria.setProjection(null);
		// 限定了返回结果的样式为只是查询主体,不带关联查询的对象 
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		return criteria.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<T> findAllByCriteriaSpecification(
			CriteriaSpecification criteriaSpecifications) {
		List<T> list = new ArrayList<T>();
		Criteria criteria = null;
		if(criteriaSpecifications instanceof Criteria){
			criteria = (Criteria) criteriaSpecifications;
		}else if(criteriaSpecifications instanceof DetachedCriteria){
			criteria = ((DetachedCriteria)criteriaSpecifications).getExecutableCriteria(sessionFactory.getCurrentSession());
		}else{
			return list;
		}
		criteria.setProjection(null);
		// 限定了返回结果的样式为只是查询主体,不带关联查询的对象 
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		return criteria.list();
	}

	@SuppressWarnings("unchecked")
	public List<T> findListByDetachedCriteria(DetachedCriteria detachedCriteria){
	    Criteria criteria = detachedCriteria.getExecutableCriteria(sessionFactory.getCurrentSession());
	    criteria.setProjection(null);
        // 限定了返回结果的样式为只是查询主体,不带关联查询的对象 
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
        return criteria.list();
	}
	
	@SuppressWarnings("unchecked")
	public void findPageByDetachedCriteria(
			DetachedCriteria detachedCriteria, Page<T> page) {
		Criteria criteria = null;
		String order = page.getOrders();
		String sort = page.getSorts();
		
		if(StringUtils.isNotEmpty(order) && StringUtils.isNotEmpty(sort)){
			String[] orders = order.split(" ");
			String[] sorts = sort.split(" ");
			for(int i = 0;i<orders.length;i++){			
				if(StringUtils.equalsIgnoreCase("asc", orders[i])&&StringUtils.isNotEmpty(sorts[i])){
					detachedCriteria.addOrder(Order.asc(sorts[i]));
				}else if(StringUtils.equalsIgnoreCase("desc", orders[i])&&StringUtils.isNotEmpty(sorts[i])){
					detachedCriteria.addOrder(Order.desc(sorts[i]));
				}
			}
		}
		
		
		criteria = detachedCriteria.getExecutableCriteria(sessionFactory.getCurrentSession());
		
		long total = this.getCountBycriteriaSpecification(criteria);
		criteria.setProjection(null);
		// 限定了返回结果的样式为只是查询主体,不带关联查询的对象 
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);		
		
		long pageNo = page.getPage();
		long pageSize = page.getRows();
		List<T> items = criteria.setFirstResult((int) ((pageNo -1)*pageSize))
				.setMaxResults((int) pageSize).list();
		page.setData(items);
		page.setTotal(total);
		
	}

	

	/** 获取符合查询条件的记录数 */
	public long getCountByCriteria(Class<T> entityClass,final Criterion... criterion) {
		Criteria criteria = sessionFactory.getCurrentSession()
				.createCriteria(entityClass);
		if (criterion != null) {
			for (Criterion c : criterion) {
				criteria.add(c);
			}
		}
		return getCountBycriteriaSpecification(criteria);
	}
	
	/** 取得符合条件的记录数 */
	public long getCountBycriteriaSpecification(final CriteriaSpecification criteriaSpecification){
		Criteria criteria = null;
		if(criteriaSpecification instanceof Criteria){
			criteria = (Criteria) criteriaSpecification;
		}else if(criteriaSpecification instanceof DetachedCriteria){
			criteria = ((DetachedCriteria)criteriaSpecification).getExecutableCriteria(sessionFactory.getCurrentSession());
		}else{
			return 0;
		}
		String countStr = criteria.setProjection(
				Projections.rowCount()).uniqueResult()+"";
		long count = Long.valueOf(countStr.equals("null")?"0":countStr);
		return count;
	}
	
	public void updateByHql(String hql, Object...params) {
		 Query query = sessionFactory.getCurrentSession().createQuery(hql);
         for(int i=0; i<params.length; i++){
             query.setParameter(i, params[i]);
         }
         query.executeUpdate();
	}

	
	@SuppressWarnings("unchecked")
	public T findUniqueByHql(Class<T> entityClass,String hql, Object...params) {
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
        for(int i=0; i<params.length; i++){
            query.setParameter(i, params[i]);
        }
        T t = (T)query.uniqueResult();
        return t;
	}

	
	@SuppressWarnings("unchecked")
	public List<T> findByHql(String hql, Object ... params) {
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
        for(int position = 0; position < params.length; position ++){
            query.setParameter(position, params[position]);
        }
        return query.list();
	}

	
	@SuppressWarnings("unchecked")
	public void findPageByHql(Page<T> page,String hql, Object ... params) {
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
        for(int position = 0; position < params.length; position ++){
            query.setParameter(position, params[position]);
        }
        int total = query.list().size();    //总记录数
        long pageNo = page.getPage();
		int pageSize = page.getRows();
        //用于分页查询
        if(pageSize > 0){
            query.setFirstResult(new Long((pageNo -1)*pageSize).intValue());
            query.setMaxResults(pageSize);
        }
        List<T> list = query.list();
        page.setData(list);
        page.setTotal(total);
		
	}

	
	public long getCountByHql(String hql, Object ... params) {
		 Query query = sessionFactory.getCurrentSession().createQuery(hql);
	     return (Long) query.iterate().next();
	}

	
	public Session getHibernateSession() {
		return sessionFactory.getCurrentSession();
	}

}
