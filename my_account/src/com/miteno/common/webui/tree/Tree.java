package com.miteno.common.webui.tree;

import java.util.ArrayList;
import java.util.List;


public class Tree {
	/**
	 * �����ĸ��ڵ�
	 */
	private Tree parent;
	/**
	 * �������ӽڵ�
	 */
	private Tree child;
	/**
	 * �������ֵܽڵ�
	 */
	private Tree brother;
	/**
	 * ������ʾ�ı���
	 */
	private String label;
	/**
	 * ����˵�ʱ������js �ű�
	 */
	private String onClick;
	/**
	 * ������ö����Ӧ��js�����ı�ʶ��ɲ���֮һ
	 */
	private int variableId = count++;

	/**
	 * ����������
	 */
	private static int count = 0;

	/**
	 * ���νڵ�js��������ǰ׺
	 */
	public static String prefix = "node_";

	/**
	 * �Ƿ����ֻ���ļ�����ʽ(whether this tree contains only folders)
	 */
	public static boolean ONLY_FOLDER = false;
	/**
	 * �Ƿ������ʾinput��
	 */
	private boolean showInput = false;
	/**
	 * input �������,ֻ����radio��checkbox
	 */
	private String inputType;
	/**
	 * ����ѡ�����������ѡ���ʱ�����Ķ���
	 */
	private String onCheck;
	/**
	 * ��ǰѡ����Ƿ�ѡ��,ֻ�Դ���ѡ��������Ч
	 */
	private boolean isChecked = false;
	/**
	 * ��ǰ����ֵ
	 */
	private String value="";
	/**
	 * ������ʾ��Ϣ
	 */
	private String tip = "";
	/**
	 * ���ĸ��ڵ���Ϣ
	 */
	private String parentNodeId; 
	/**
	 * ��ǰ�ڵ��Id
	 */
	private String nodeId;
	/**
	 * ���νڵ�Ĭ����ʾ��ͼ��
	 */
	private String icon;
	/**
	 * ���νڵ��ʱ��ʾ��ͼ��
	 */
	private String openIcon;
	/**
	 * ����һ�����οؼ�����ʼ��������ʾ������
	 *
	 * @param label ���οؼ�����ʾ������
	 */
	public Tree() {
		this.label = "emptyTree";
	}
	/**
	 * ����һ�����οؼ�����ʼ��������ʾ������
	 *
	 * @param label ���οؼ�����ʾ������
	 */
	public Tree(String label) {
		this.label = label;
	}
	
	/* edited by zhandl */
	protected String extInfo = "";
	
	
	public String getExtInfo() {
		return extInfo;
	}
	public void setExtInfo(String extInfo) {
		this.extInfo = extInfo;
	}

	/**
	 * ����һ�����οؼ�����ʼ��������ʾ�����ֺ͵��ʱ�����Ķ���
	 *
	 * @param label  ���οؼ�����ʾ������
	 * @param script ������οؼ�ʱ�����Ķ���
	 */
	public Tree(String label, String script) {
		this.label = label;
		if(script != null){
			this.onClick = script.startsWith("javascript:")? script : "javascript:" + script;
		}
	}
	
	
	public String getParentNodeId() {
		return parentNodeId;
	}
	
	public void setParentNodeId(String extInfo) {
		this.parentNodeId = extInfo;
	}
	
	public String getInputType() {
		return inputType;
	}
	
	public void setInputType(String inputType) {
		this.inputType = inputType;
	}
	
	public String getTip() {
		return tip;
	}
	public void setTip(String tip) {
		this.tip = tip;
	}
	/**
	 * �õ�ǰ����ǰ����ʾһ��checkbox
	 *
	 */
	public void showCheckbox(){
		this.showInput = true;
		this.inputType = "checkbox";
	}
	/**
	 * �õ�ǰ����ǰ����ʾһ��radioѡ���
	 *
	 */
	public void showRadio(){
		this.showInput = true;
		this.inputType = "radio";
	}
	

	/**
	 * @param isChecked the isChecked to set
	 */
	public void setChecked(boolean isChecked) {
		if(showInput){
			this.isChecked = isChecked;	
		}
	}

	/**
	 * @param onCheck the onCheck to set
	 */
	public void setOnCheck(String onCheck) {
		this.onCheck = onCheck;
	}

	/**
	 * @param value the value to set
	 */
	public void setValue(String value) {
		this.value = value;
	}
	
	/**
	 * �жϵ�ǰ�ڵ��Ƿ��Ǹ�ڵ�
	 *
	 * @return boolean ����Ǹ�ڵ�,����true
	 */
	public boolean isRoot() {
		return null == this.parent;
	}

	/**
	 * ��ȡ������ı������
	 *
	 * @return ������ı������
	 */
	private String variable() {
		if (this.parent == null)
			return "root";
		//�����������
		if(count >= Integer.MAX_VALUE - 1000){
			count = 0;
		}
		return prefix + this.variableId;
	}

	/**
	 * ������οؼ�Tree ��Ӧ��javascript ����
	 *
	 * @param tree �����js��������οؼ�����
	 * @return js ������� tree �������οؼ���js����
	 */
	private static StringBuffer generateJS(Tree tree) {
		StringBuffer buffer = new StringBuffer();
		if (tree.isRoot()) {
			buffer.append(generateRoot(tree));
		} else {
			buffer.append(generateItem(tree));
		}
		if (tree.child != null) { // has child
			buffer.append(generateJS(tree.child));
		}
		if (tree.brother != null) { //has brother
			buffer.append(generateJS(tree.brother));
		}
		return buffer;
	}

	/**
	 * ��ȡ��ɸ����οؼ���js����
	 *
	 * @return js ����ɸö�����������οؼ���js����
	 */
	public String getTree() {
		return generateJS(this) + "\ndocument.write(root);";
	}

	/**
	 * ������ĸ�
	 *
	 * @param tree ����ڵ�
	 * @return root ��������js
	 * WebFXTree(sText, sAction, bshowInput, bChecked ,onCheck, sValue ,sBehavior, sIcon, sOpenIcon)
	 */
	private static String generateRoot(Tree tree) {
		StringBuffer root = new StringBuffer(512);
		root.append("var root = new WebFXTree(\"").append(filter(tree.label)).append("\"");
		if(tree.onClick != null){//��checkbox��ѡ��ʱ�Ĵ�������
			root.append(",\" ").append(tree.onClick).append("\"");
		}else{
			root.append(", null");
		}
		root.append(", ").append(tree.showInput);
		root.append(", ").append(tree.isChecked);
		
		if(tree.onCheck != null){//��checkbox��ѡ��ʱ�Ĵ�������
			root.append(",\" ").append(tree.onCheck).append("\"");
		}else{
			root.append(", null");
		}
		root.append(", \"").append(tree.value).append("\"");
		
		if (ONLY_FOLDER) {
			root.append(", \"explorer\"");
		} else {
			root.append(", \"classic\"");
		}
		//���ͼ��
		if(tree.icon != null){//��checkbox��ѡ��ʱ�Ĵ�������
			root.append(",\" ").append(tree.icon).append("\"");
		}else{
			root.append(", null");
		}
		if(tree.openIcon != null){//��checkbox��ѡ��ʱ�Ĵ�������
			root.append(",\" ").append(tree.openIcon).append("\"");
		}else{
			root.append(", null");
		}
		root.append(");");
		
		return root.toString();
	}

	/**
	 * ���һ�����ڵ�
	 *
	 * @param tree ���ڵ����
	 * @return treeItem ���ڵ��js����
	 * WebFXTreeItem(sText, sAction, bshowInput,inputType, onCheck, bChecked ,sValue ,tip,eParent, sIcon, sOpenIcon)
	 */
	private static String generateItem(Tree tree) {
		StringBuilder item = new StringBuilder("\n");
		item.append("var ").append(prefix).append(tree.variableId).append("= new WebFXTreeItem(\"").append(filter(tree.label)).append("\"");
		if(tree.onClick != null){//��checkbox��ѡ��ʱ�Ĵ�������
			item.append(",\" ").append(tree.onClick).append("\"");
		}else{
			item.append(", null");
		}
		if(tree.showInput){//�Ƿ���ʾCheckbox
			item.append(", ").append(tree.showInput);
			item.append(", \"").append(tree.inputType).append("\"");
			if(tree.onCheck != null){//��checkbox��ѡ��ʱ�Ĵ�������
				item.append(",\" ").append(tree.onCheck).append("\"");
			}else{
				item.append(", null");
			}
			item.append(",").append(tree.isChecked);
			if(tree.value != null){
				item.append(",\"").append(tree.value).append("\"");
			}
		}else if(!"".equals(tree.value)){
			item.append(", false, null, null, false").append(",\"").append(tree.value).append("\"");
		}
		if(tree.tip != null){
			item.append(",\"").append(filter(tree.tip)).append("\""); 
		}
		
		item.append(",null"); //����eParent
		//����ͼ��
		if(tree.icon != null){//��checkbox��ѡ��ʱ�Ĵ�������
			item.append(",\" ").append(tree.icon).append("\"");
		}else{
			item.append(", null");
		}
		if(tree.openIcon != null){//��checkbox��ѡ��ʱ�Ĵ�������
			item.append(",\" ").append(tree.openIcon).append("\"");
		}else{
			item.append(", null");
		}
		
		item.append(");");
		item.append("\n").append(tree.parent.variable()).append(".add(").append(tree.variable()).append(");");
		return item.toString();
	}

	/**
	 * Ϊ��ǰ�ڵ�����ӽڵ�
	 *
	 * @param child ����ӵ��ӽڵ�
	 * @return child ����ӵ��ӽڵ�
	 */
	public Tree addChild(Tree child) {
		Tree node = this.parent;
		while(node != null){
			if(node.equals(child)){
				throw new RuntimeException("������Ӹ��ڵ���Ϊ�ӽڵ�...");
			}
			node = node.parent;
		}
		if (this.child != null) {
			//has child ,add the given child as the younger brother of the elder child
			Tree elder = this.child;
			return elder.addBrother(child);
		} else {
			//has no child,add this as the first child
			this.child = child;
			child.parent = this;
		}

		return child;
	}

	/**
	 * ����ӽڵ�
	 *
	 * @param label  �ӽڵ�����ʾ�����
	 * @param script ����ӽڵ�ʱ�����Ķ���
	 * @return Tree ����ӵ������ڵ�
	 */
	public Tree addChild(String label, String script) {
		Tree son = new Tree(label, script);
		return addChild(son);
	}
	/**
	 * ����ӽڵ�
	 *
	 * @param label  �ӽڵ�����ʾ�����
	 * @param script ����ӽڵ�ʱ�����Ķ���
	 * @param value �ӽڵ��ֵ
	 * @return Tree ����ӵ������ڵ�
	 */
	public Tree addChild(String label, String script,String value) {
		Tree son = new Tree(label, script);
		son.setValue(value);
		return addChild(son);
	}
	/**
	 * ����ӽڵ�
	 *
	 * @param label �ӽڵ�����ʾ�����
	 * @return child ����ӵ������ڵ�
	 */
	public Tree addChild(String label) {
		return addChild(label, null);
	}

	/**
	 * ��ӵ�ǰ���ڵ���ֵܽڵ�
	 *
	 * @param younger ����ӵ��ֵܽڵ�
	 * @return Tree ����ӵ��ֵܽڵ�
	 */
	public Tree addBrother(Tree younger) {
		Tree node = this.parent;
		while(node != null){
			if(node.equals(younger)){
				throw new RuntimeException("������Ӹ��ڵ���Ϊ�ֵܽڵ�...");
			}
			node = node.parent;
		}
		if (isRoot()) {
			// if this is the root ,add the given node as brother
			return addChild(younger);
		}
		Tree elder = this;
		//get the youngest brother
		while (elder.brother != null) {
			elder = elder.brother;
		}
		//add the younger as the yongest brother
		elder.brother = younger;
		younger.parent = elder.parent;
		return younger;

	}

	/**
	 * Ϊ��ǰ�ڵ�����ֵܽڵ�
	 *
	 * @param label  �ֵܽڵ�����ʾ������
	 * @param script ����ֵܽڵ�ʱ�����Ķ���
	 * @return Tree ����ӵ��ֵܽڵ�
	 */
	public Tree addBrother(String label, String script) {
		Tree younger = new Tree(label, script);
		return addBrother(younger);
	}

	/**
	 * Ϊ��ǰ�ڵ�����ֵܽڵ�
	 *
	 * @param label �ֵܽڵ�����ʾ������
	 * @return Tree ����ӵ��ֵܽڵ�
	 */
	public Tree addBrother(String label) {
		return addBrother(label, null);
	}

	/**
	 * ���ص�ǰ�ڵ�����ո�ڵ�
	 *
	 * @return root ��ǰ�ڵ�����ո�ڵ�
	 */
	public Tree getRoot() {
		Tree tree = this;
		while (tree.parent != null) {
			tree = tree.parent;
			if(tree == this){
				throw new RuntimeException("�����ӽڵ���ֱջ�����...");
			}
		}
		return tree;
	}

	/**
	 * ���õ�����οؼ�ʱ�����Ķ���
	 *
	 * @param script �����õĶ���
	 */
	public void setOnClick(String script) {
		if(script != null){
			this.onClick = script.startsWith("javascript:") ? script: "javascript:" + script;
		}
	}

	/**
	 * �������οؼ�����ʾ������
	 *
	 * @param label ����ʾ������
	 */
	public void setLabel(String label) {
		this.label = label;
	}

	public String toString() {
		return getTree();
	}
	
	public Tree getParent() {
		return parent;
	}
	public void setParent(Tree parent) {		
		if (null != parent) {
			parent.addChild(this);
		}
	}
	public boolean isShowInput() {
		return showInput;
	}
	public void setShowInput(boolean showInput) {
		this.showInput = showInput;
	}
	public int getVariableId() {
		return variableId;
	}
	public void setVariableId(int variableId) {
		this.variableId = variableId;
	}
	public boolean isChecked() {
		return isChecked;
	}
	public String getLabel() {
		return label;
	}
	public String getOnCheck() {
		return onCheck;
	}
	public String getOnClick() {
		return onClick;
	}
	public String getValue() {
		return value;
	}
	
    /**
     * Filter the specified string for characters that are sensitive to
     * HTML interpreters, returning the string with these characters replaced
     * by the corresponding character entities.
     *
     * @param value The string to be filtered and returned
     */
    public static String filter(String value) {

        if (value == null || value.length() == 0) {
            return value;
        }

        StringBuffer result = null;
        String filtered = null;
        for (int i = 0; i < value.length(); i++) {
            filtered = null;
            switch (value.charAt(i)) {
                case '<':
                    filtered = "&lt;";
                    break;
                case '>':
                    filtered = "&gt;";
                    break;
                case '&':
                    filtered = "&amp;";
                    break;
                case '"':
                    filtered = "&quot;";
                    break;
                case '\'':
                    filtered = "&#39;";
                    break;
            }

            if (result == null) {
                if (filtered != null) {
                    result = new StringBuffer(value.length() + 50);
                    if (i > 0) {
                        result.append(value.substring(0, i));
                    }
                    result.append(filtered);
                }
            } else {
                if (filtered == null) {
                    result.append(value.charAt(i));
                } else {
                    result.append(filtered);
                }
            }
        }

        return result == null ? value : result.toString();
    }
	/**
	 * create xml tree
	 * @return
	 */
	public static XMLTree createXMLTree(){
		return new XMLTree();
	}
	/**
	 * 2007-9-30 ����02:48:36
	 * Author:yangdongyu(yangdy@bingosoft.net)
	 * ReadMe:���xmltree�İ�����
	 * ChangeLog:
	 */
	public static class XMLTree{
		public static final String xmlHeader = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><tree ";
		public static final String xmlFooter = "</tree>";
		private String text;
		private String src;
		private String value;
		private String onclick;
		private boolean showInput;
		private String oncheck;
		private boolean checked = false;
		private String icon;
		private String openIcon;
		private String target;
		private String inputType;
		private XMLTree parent;
		
		private List<XMLTree> children = new ArrayList<XMLTree>(0);;
		/**
		 * ����ӽڵ�
		 * @param child
		 */
		public void addChild(XMLTree child){
			child.parent = this;
			this.children.add(child);
		}
		/**
		 * @param checked the checked to set
		 */
		public XMLTree setChecked(boolean checked) {
			this.checked = checked;
			return this;
		}
		/**
		 * @param icon the icon to set
		 */
		public XMLTree setIcon(String icon) {
			this.icon = icon;
			return this;
		}
		/**
		 * @param openIcon the openIcon to set
		 */
		public XMLTree setOpenIcon(String openIcon) {
			this.openIcon = openIcon;
			return this;
		}
		/**
		 * @param target the target to set
		 */
		public XMLTree setTarget(String target) {
			this.target = target;
			return this;
		}
		/**
		 * @param onCheck the onCheck to set
		 */
		public XMLTree setOncheck(String onCheck) {
			this.oncheck = onCheck;
			return this;
		}
		/**
		 * @param onclick the onclick to set
		 */
		public XMLTree setOnclick(String onclick) {
			if(onclick != null){
				this.onclick =onclick.startsWith("javascript:") ? onclick : ("javascript:" + onclick);
			}
			return this;
		}
		/**
		 * @param showInput the showInput to set
		 */
		public XMLTree setshowInput(boolean showInput) {
			this.showInput = showInput;
			return this;
		}
		/**
		 * @param src the src to set
		 */
		public XMLTree setSrc(String src) {
			this.src = BeanHelper.filter(src);
			return this;
		}
		public String getText() {
			return text;
		}
		public String getValue() {
			return value;
		}
		/**
		 * @param text the text to set
		 */
		public XMLTree setText(String text) {
			this.text = text;
			return this;
		}
		/**
		 * @param value the value to set
		 */
		public XMLTree setValue(String value) {
			this.value = value;
			return this;
		}
		/**
		 * showRadio
		 */
		public void showRadio() {
			this.showInput = true;
			this.inputType = "radio";
		}
		/**
		 * showCheckbox
		 *
		 */
		public void showCheckbox() {
			this.showInput = true;
			this.inputType = "checkbox";
		}
		/**
		 * ��ȡ��ǰ���ڵ���������еľ��·��
		 * @return
		 */
		public String getAbsolutePath(){
			String path = this.text;
			XMLTree temp = this;
			while(temp.parent != null && temp.parent.text != null){
				path = temp.parent.text + "/" + path;
				temp = temp.parent;
			}
			return path;
		}
		/**
		 * ͨ����·��ѡ�ж�Ӧ�ĸ�ڵ�
		 * @param absolutePaths
		 */
		public void setCheckedByAbsolutePath(List<String> absolutePaths){
			for(String path : absolutePaths){
				if(this.getAbsolutePath().equals(path)){
					this.setChecked(true);
				}
				if(!this.children.isEmpty()){
					for(XMLTree child : this.children){
						child.setCheckedByAbsolutePath(absolutePaths);
					}
				}
			}
		}
		/**
		 * ����һ���ӽڵ�
		 * @return
		 */
		public XMLTree createChild(){
			XMLTree child = new XMLTree();
			this.addChild(child);
			return child;
		}
		
		private void toXML(StringBuilder sb){
			sb.append("<tree ");
			if(this.text != null){
				sb.append("text=\"").append(filter(this.text)).append("\" ");
			}
			if(this.src != null){
				sb.append("src=\"").append(this.src).append("\" ");
			}
			if(this.value != null){
				sb.append("value=\"").append(filter(this.value)).append("\" ");
			}
			if (this.onclick != null) {
				sb.append("onclick=\"").append(this.onclick).append("\" ");
			}		
			if(this.inputType != null)
            {
                sb.append("inputType=\"").append(inputType).append("\" ");
                if(inputType.equals("checkbox"))
                    sb.append("showCheckbox=\"").append(true).append("\" ");
                else
                if(inputType.equals("radio"))
                    sb.append("showRadio=\"").append(true).append("\" ");
            }
			if (this.showInput) {
				sb.append("showInput=\"").append(this.showInput).append("\" ");
			}
//			if (this.inputType != null) {
//				sb.append("inputType=\"").append(this.inputType).append("\" ");
//			}
			if (this.oncheck != null) {
				sb.append("oncheck=\"").append(this.oncheck).append("\" ");
			}
			if (this.checked) {
				sb.append("checked=\"").append(this.checked).append("\" ");
			}		
			if (this.icon != null) {
				sb.append("icon=\"").append(this.icon).append("\" ");
			}
			if (this.openIcon != null) {
				sb.append("openIcon=\"").append(this.openIcon).append("\" ");
			}	
			if (this.target != null) {
				sb.append("target=\"").append(this.target).append("\"");
			}
			sb.append(" >");
			if(this.children != null && !this.children.isEmpty()){
				for(XMLTree child : children){
					child.toXML(sb);
				}
			}
			sb.append("</tree>");
		}
		public String getTree(){
			StringBuilder sb = new StringBuilder();
			sb.append(xmlHeader);
			if(this.text != null){
				sb.append("text=\"").append(filter(this.text)).append("\" ");
			}
			if(this.src != null){
				sb.append("src=\"").append(this.src).append("\" ");
			}
			if(this.value != null){
				sb.append("value=\"").append(filter(this.value)).append("\" ");
			}
			if (this.onclick != null) {
				sb.append("onclick=\"").append(this.onclick).append("\" ");
			}			
			if (this.showInput) {
				sb.append("showInput=\"").append(this.showInput).append("\" ");
			}	
			if(this.inputType != null)
            {
                sb.append("inputType=\"").append(inputType).append("\" ");
                if(inputType.equals("checkbox"))
                    sb.append("showCheckbox=\"").append(true).append("\" ");
                else
                if(inputType.equals("radio"))
                    sb.append("showRadio=\"").append(true).append("\" ");
            }
			if (this.oncheck != null) {
				sb.append("oncheck=\"").append(this.oncheck).append("\" ");
			}
			if (this.checked) {
				sb.append("checked=\"").append(this.checked).append("\" ");
			}		
			if (this.icon != null) {
				sb.append("icon=\"").append(this.icon).append("\" ");
			}
			if (this.openIcon != null) {
				sb.append("openIcon=\"").append(this.openIcon).append("\" ");
			}	
			if (this.target != null) {
				sb.append("target=\"").append(this.target).append("\" ");
			}
			sb.append(">");
			for(XMLTree child : children){
				child.toXML(sb);
			}
			sb.append(xmlFooter);
			return sb.toString();
		}
		public String toString(){
			return getTree();
		}
	}
	public String getNodeId() {
		return nodeId;
	}

	public void setNodeId(String nodeId) {
		this.nodeId = nodeId;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getOpenIcon() {
		return openIcon;
	}
	public void setOpenIcon(String openIcon) {
		this.openIcon = openIcon;
	}
	
}