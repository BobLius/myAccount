package com.miteno.common.webui.tree;



import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;



@Component
public class TreeService {

	public Tree buildCheckBoxTree(List<Map<String,String>> treeList) {	
		
		Tree parent = null;
		Map<String, Tree>  hm = new LinkedHashMap<String, Tree>();
		
		for (Map<String, String> item : treeList ) { 
			
			String currentId = item.get("NODEID");
//			String nodeName = item.get("NODENAME");
			String parentId = item.get("PARENTID");
			String value = item.get("VALUE");
			String label = item.get("LABEL");
			
//			String tip = item.get("TIP");
//			String showInput = item.get("SHOWINPUT");
//			String inputType = item.get("INPUTTYPE");
//			String isChecked = item.get("CHECKED");
			String onclick = item.get("ONCLICK");
//			String oncheck = item.get("ONCHECK");
//			String icon = item.get("ICON") ;
//			String openIcon = item.get("OPENICON") ;
			
			Tree node = new Tree(label); 
						
			node.setValue(value);
			node.setLabel(label);
			node.showCheckbox() ;//��ʾcheckbox��
			
			node.setExtInfo(parentId);

//			if (null != tip) {
//				node.setTip(tip);
//			}
//			if (null != showInput && "true".equals(showInput.toLowerCase())) {
//				node.setShowInput(true);
//			}
//			if (null != inputType) {
//				node.setInputType(inputType);
//			}
//			if (null != isChecked && "true".equals(isChecked.toLowerCase())) {
//				node.setChecked(true);
//			}
			if (null != onclick) {
				node.setOnClick(onclick);
			}
//			if (null != oncheck) {
//				node.setOnCheck(oncheck);
//			}
//			if(!"".equals(icon)){
//				node.setIcon(webContext+icon) ;
//			}
//			if (!"".equals(openIcon)) {
//				node.setOpenIcon(webContext+openIcon) ;
//			}
			
			hm.put(currentId, node);
		}
		
		Collection<Tree> tc = hm.values();
		
		for (Tree t : tc) {
			String p = t.getExtInfo();
			Tree pt = hm.get(p);
			t.setParent(pt);

			if (null == parent) {
				parent = t;
			}
		}
		
		Tree root = parent.getRoot();  
		return root; 
	}
	
	/**
	 * ������ʼ��ʱ�в����Ѿ�ѡ���checkboxѡ����
	 * @param sqlString
	 * @param toCheckList
	 * @return
	 * @changelog 
	 *
	 */
	public Tree buildCheckBoxTree(List<Map<String,String>> treeList, List<String> toCheckList) {	
		
		Tree parent = null;	
		Map<String, Tree>  hm = new LinkedHashMap<String, Tree>();
		
		for (Map<String, String> item : treeList ) { 
			
			String currentId = item.get("NODEID");
			String parentId = item.get("PARENTID");
			String value = item.get("VALUE");
			String label = item.get("LABEL");
			
			Tree node = new Tree(label); 
						
			node.setValue(value);
			node.setLabel(label);
			//��ڵ㣬������ѡ���
			if(!"null".equals(parentId) && !"".equals(parentId)){
				node.showCheckbox() ;//��ʾcheckbox��
			}
			//ѡ����Ƿ�ѡ��
			if (isChecked(toCheckList,currentId)) {
				node.setChecked(true);
			}
			node.setExtInfo(parentId);

			hm.put(currentId, node);
		}
		
		Collection<Tree> tc = hm.values();
		
		for (Tree t : tc) {
			String p = t.getExtInfo();
			Tree pt = hm.get(p);
			t.setParent(pt);

			if (null == parent) {
				parent = t;
			}
		}
		
		Tree root = parent.getRoot();  
		return root; 
	}
	
	/**
	 * ������ʼ��ʱ�в����Ѿ�ѡ���checkboxѡ����
	 * @param sqlString
	 * @param toCheckList
	 * @return
	 * @changelog 
	 *
	 */
	public Tree buildTree(List<Map<String,String>> treeList) {	
		
		Tree parent = null;	
		Map<String, Tree>  hm = new LinkedHashMap<String, Tree>();
		
		for (Map<String, String> item : treeList ) { 
			
			String currentId = item.get("NODEID");
			String parentId = item.get("PARENTID");
			String value = item.get("VALUE");
			String label = item.get("LABEL");
			String onclick = item.get("ONCLICK");
			Tree node = new Tree(label); 
						
			node.setValue(value);
			node.setLabel(label);
			node.setExtInfo(parentId);
			node.setOnClick(onclick);
			hm.put(currentId, node);
		}
		
		Collection<Tree> tc = hm.values();
		
		for (Tree t : tc) {
			String p = t.getExtInfo();
			Tree pt = hm.get(p);
			t.setParent(pt);

			if (null == parent) {
				parent = t;
			}
		}
		
		Tree root = parent.getRoot();  
		return root; 
	}
	
	/**
	 * �ж��Ƿ�ѡ��
	 * @param toCheckList
	 * @param value
	 * @return
	 * @changelog 
	 *
	 */
	private boolean isChecked(List<String> toCheckList , String value){
		boolean flag = false ;
		if(toCheckList != null && toCheckList.size() > 0 && value !=null){
			for (Iterator<String> iter = toCheckList.iterator(); iter.hasNext();) {
				String element =  iter.next();
				if (value.equals(element)) {
					flag = true ;
					break ;
				}
			}
		}
		return flag ;
	}	
}
