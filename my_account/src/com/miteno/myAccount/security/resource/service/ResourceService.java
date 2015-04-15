package com.miteno.myAccount.security.resource.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

import com.miteno.common.dao.hibernate.HibernateDao;
import com.miteno.myAccount.security.resource.entity.Resource;
import com.miteno.myAccount.security.user.entity.User;


@Service("resourceService")
public class ResourceService {
	@javax.annotation.Resource
	private HibernateDao<Resource,String> resourceDao;
	@javax.annotation.Resource
	private HibernateDao<User,String> userDao;
	
	public List<Resource> getAllMenus(){
		List<Resource> list = resourceDao.findAllByCriteria(Resource.class,Restrictions.eq("level", 1));
		Collections.sort(list);
		return list;
	}
	public List<Map<String,String>> getResourceTreeList(){
		LinkedList<Map<String,String>> tmpList = new LinkedList<Map<String,String>>();
		Resource resource = null;
		Map<String,String> rowMap = new HashMap<String, String>(); 
		resource = resourceDao.findAllByCriteria(Resource.class,Restrictions.eq("url", "/")).get(0);
		com.miteno.myAccount.security.user.entity.User user = userDao.get(User.class, "100000");
		String user_type = user.getUser_type();
		if("1".equals(user_type)){ //平台用户追加别名
			if(resource.getSynonyms()==null||"".equals(resource.getSynonyms())){
				rowMap.put("LABEL",resource.getName() );
			}
			else{
				rowMap.put("LABEL",resource.getName()+"("+resource.getSynonyms()+")" );
			}
		}else{
			rowMap.put("LABEL",resource.getName() );
		}
		rowMap.put("NODEID", resource.getId().toString());	
			
		rowMap.put("ONCLICK","view('"+resource.getId()+"');");
		rowMap.put("VALUE", resource.getId().toString());
		tmpList.add(rowMap);
		
		List<Map<String,String>> treeList = new ArrayList<Map<String,String>>();
		
		while(!tmpList.isEmpty()){
			rowMap = tmpList.poll();
			treeList.add(rowMap);
			List<Resource> children = resourceDao.findAllByCriteria(Resource.class, Restrictions.eq("parent.id", rowMap.get("NODEID")));
			Collections.sort(children);
			for(Resource child:children){
				rowMap = new HashMap<String,String>();
				if("1".equals(user_type)){ //平台用户追加别名
					if(child.getSynonyms()==null||"".equals(child.getSynonyms())){
						rowMap.put("LABEL",child.getName() );
					}
					else{
						rowMap.put("LABEL",child.getName()+"("+child.getSynonyms()+")" );
					}
				}else{
					rowMap.put("LABEL",child.getName() );
				}
				rowMap.put("NODEID", child.getId().toString());	
				rowMap.put("PARENTID", child.getParent().getId().toString());
				rowMap.put("VALUE", child.getId().toString());
				rowMap.put("ONCLICK","view('"+child.getId()+"');");
				tmpList.offer(rowMap);
			}			
		}
		
		return treeList;
	}
	public Resource getResourceById(String id){
		return resourceDao.get(Resource.class,id);
	}
	public Resource getResourceByPid(String pid){
		return resourceDao.findAllByCriteria(Resource.class, Restrictions.eq("parent.id", pid)).get(0);
	}
	public Resource getResourceByUrl(final String url){
			List<Resource> list = resourceDao.findAllByCriteria(Resource.class,Restrictions.eq("url", url));
			return list.get(0);
	}
}
