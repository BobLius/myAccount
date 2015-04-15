/**
 * Project Name:activiti5.3
 * File Name:SequenceGenerator.java
 * Package Name:com.miteno.common.sequence
 * Date:2013-6-2下午8:36:59
 * Copyright (c) 2013, chenzhou1025@126.com All Rights Reserved.
 *
*/

package com.miteno.common.sequence;
/**
 * ClassName:SequenceGenerator <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason:	 TODO ADD REASON. <br/>
 * Date:     2013-6-2 下午8:36:59 <br/>
 * @author   lzh
 * @version  
 * @since    JDK 1.6
 * @see 	 
 */

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Component;

import com.miteno.common.dao.hibernate.HibernateDao;
import com.miteno.common.sequence.entity.RecycledSequence;
import com.miteno.common.sequence.entity.RecycledSequencePk;
import com.miteno.common.sequence.entity.SimpleSequence;




/**
 * 序列生成器：用于根据客户提出的编码规则生成
 * @author lzh
 * @version 1.0.3
 *
 */
@Component
public class SequenceGenerator {
	@Resource
	private HibernateDao<RecycledSequence,RecycledSequencePk> recyledSequenceDao;
	@Resource
	private HibernateDao<SimpleSequence,String> seqDao;
	/**
	 * 根据类名，前缀，和序号总长度，产生一个序号
	 * @param prefix
	 * @param totalLen 要返回的字符串总长度，不足位左补0
	 * @return
	 */
	public synchronized String getNextVal(String className,String prefix,int totalLen){
		/** 先判断序列回收表中有无可用序列 */
		Serializable recycleId = getIdFromRecycle(className+prefix);
		if(recycleId != null){
			return prefix+recycleId+"";
		}
		
		
		/** 回收表中无可用序列时，生成新序列 */
		//初始值，如果是新记录，默认返回 0 作为初始序列号
		String currval = String.format("%0"+totalLen+"d", 0);		
		SimpleSequence seq = seqDao.get(SimpleSequence.class,className+prefix);
		if(seq == null){
			seq = new SimpleSequence();
			seq.setId(className+prefix);
			seq.setCurrval(currval);
			seqDao.save(seq);
		}else{
			currval = seq.getCurrval();
			//序列加1后保存回序列表
			long currval_longVal = Long.parseLong(currval);
			seq.setCurrval(String.format("%0"+totalLen+"d", currval_longVal+1));
			seqDao.update(seq);
		}
		return prefix+currval;	
	}
	/**
	 * 
	 * getNextVal:(这里用一句话描述这个方法的作用). <br/>
	 *
	 * @author lzh
	 * @param className
	 * @param prefix
	 * @param totalLen
	 * @param cycle
	 * @return
	 * @since JDK 1.6
	 */
	public synchronized String getNextVal(String className,String prefix,int totalLen,boolean cycle){
		/** 先判断序列回收表中有无可用序列 */
		Serializable recycleId = getIdFromRecycle(className+prefix);
		if(recycleId != null){
			return prefix+recycleId+"";
		}
		
		
		/** 回收表中无可用序列时，生成新序列 */
		//初始值，如果是新记录，默认返回 0 作为初始序列号
		String currval = String.format("%0"+totalLen+"d", 0);		
		SimpleSequence seq = seqDao.get(SimpleSequence.class,className+prefix);
		if(seq == null){
			seq = new SimpleSequence();
			seq.setId(className+prefix);
			seq.setCurrval(currval);
			seqDao.save(seq);
		}else{
			currval = seq.getCurrval();
			//序列加1后保存回序列表
			long currval_longVal = Long.parseLong(currval);
			String nextVal = String.format("%0"+totalLen+"d", currval_longVal+1);
			if(nextVal.length() > totalLen){
				if(cycle){
					nextVal = String.format("%0"+totalLen+"d", 0);
				}else{
					throw new RuntimeException("序列已用尽");
				}
			}
			seq.setCurrval(nextVal);
			seqDao.update(seq);
		}
		return prefix+currval;	
	}
	/**
	 * 
	 * recyle:将废除的序号放入序号回收表中 <br/>
	 *
	 * @author lzh
	 * @param prefix
	 * @param recyleVal
	 * @since JDK 1.6
	 */
	public void recyle(String prefix,String recyleVal){
		//取出以prfix打头的序号
		List<SimpleSequence> seqs = seqDao.findAllByCriteria(SimpleSequence.class,Restrictions.like("id",prefix,MatchMode.START));
		//不存在该序列 
		if(seqs.size() == 0)
			return;
		SimpleSequence seq = seqs.get(0);
		//确定原序列的 序号长度 
		int val_len = seq.getCurrval().length();
		RecycledSequence seqRecycle = new RecycledSequence();
		RecycledSequencePk seqRecyclePk = new RecycledSequencePk();
		seqRecyclePk.setPrefix(prefix + recyleVal.substring(0, recyleVal.length()-val_len));
		seqRecyclePk.setRecycleVal(recyleVal.substring(recyleVal.length()-val_len));
		seqRecycle.setId(seqRecyclePk);
		try{
			recyledSequenceDao.save(seqRecycle);
		}catch (Exception e) {
			
		}
	}
	/**
	 * 
	 * getIdFromRecycle:根据前缀从序号回收表中尝试取得一可用号码。 <br/>
	 * TODO(这里描述这个方法适用条件 – 可选).<br/>
	 * TODO(这里描述这个方法的执行流程 – 可选).<br/>
	 * TODO(这里描述这个方法的使用方法 – 可选).<br/>
	 * TODO(这里描述这个方法的注意事项 – 可选).<br/>
	 *
	 * @author lzh
	 * @param prefix
	 * @return
	 * @since JDK 1.6
	 */
	public synchronized Serializable getIdFromRecycle(String prefix){
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(RecycledSequence.class);
		detachedCriteria.add(Restrictions.eq("id.prefix", prefix));
		detachedCriteria.addOrder(Order.asc("id.recycleVal"));
		List<RecycledSequence> seqRecycles = recyledSequenceDao.findAllByCriteriaSpecification(detachedCriteria);
		if(seqRecycles.size()>0){
			String recycleId = seqRecycles.get(0).getId().getRecycleVal();
			//用完就把回收表中的记录清理
			RecycledSequencePk id = new RecycledSequencePk();
			id.setPrefix(prefix);
			id.setRecycleVal(recycleId+"");
			this.purge(id);
			return recycleId;
		}else{
			return null;
		}
	}
	/**
	 * 
	 * purge:将指定的序列从序号回收表中删除. <br/>
	 * TODO(这里描述这个方法适用条件 – 可选).<br/>
	 * TODO(这里描述这个方法的执行流程 – 可选).<br/>
	 * TODO(这里描述这个方法的使用方法 – 可选).<br/>
	 * TODO(这里描述这个方法的注意事项 – 可选).<br/>
	 *
	 * @author lzh
	 * @param id
	 * @since JDK 1.6
	 */
	public synchronized void purge(RecycledSequencePk id){
		RecycledSequence seqRecycle = recyledSequenceDao.get(RecycledSequence.class,id);
		if(seqRecycle != null)
			recyledSequenceDao.delete(RecycledSequence.class,id);		
	}
	
	public synchronized void removeFromRecycle(RecycledSequencePk id){
		RecycledSequence seqRecycle = recyledSequenceDao.get(RecycledSequence.class, id);
		if(seqRecycle != null)
			recyledSequenceDao.delete(seqRecycle);		
	}
	
	public synchronized long getId(String prefix){
		long id = 0;		
		SimpleSequence seq = seqDao.get(SimpleSequence.class, prefix);
		if(seq == null){
			seq = new SimpleSequence();
			seq.setId(prefix);
			seq.setCurrval("1");
			seqDao.save(seq);
		}else{
			id = Integer.parseInt(seq.getCurrval());
			seq.setCurrval(seq.getCurrval()+1);
			seqDao.update(seq);
		}
		return id;		
	}
	public void saveForRecyle(RecycledSequence seqRecycle){
		recyledSequenceDao.save(seqRecycle);
	}
}

