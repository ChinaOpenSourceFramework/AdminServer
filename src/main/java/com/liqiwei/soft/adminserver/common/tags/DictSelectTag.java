package com.liqiwei.soft.adminserver.common.tags;

import javax.servlet.jsp.tagext.*;

import org.springframework.util.StringUtils;

import com.liqiwei.soft.adminserver.common.dictionary.model.Dictionary;

import javax.servlet.jsp.*;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class DictSelectTag extends SimpleTagSupport {

    private String dictName;  
    private boolean defaultValue;  
    private String value;  
    private String name;  
    private String id;  
    private String cssClass;  
    private String styleClass;  
    private String multiple;  
    private String onChange;  
  
    @Override
    public void doTag() throws JspException, IOException {
 /**   	
//    	 DictValue dict = new DictValue();  
//         List<DictValue> dict_list = dict.getRepository().findByProperty(DictValue.class,"dictName",dictName);  
    	 List<Dictionary> dict_list = new ArrayList<Dictionary>();
    	 dict_list.add(new Dictionary("1", "one"));
    	 dict_list.add(new Dictionary("2", "two"));
    	 
         JspWriter out = getJspContext().getOut();
         StringBuffer sb = new StringBuffer();  
         sb.append("<select name='"+this.getName()+"' id='"+this.getId()+"'");  
         if(!StringUtils.isEmpty(this.getCssClass())){  
             sb.append("class=\"" + this.getCssClass() + "\" ");  
         }  
         if(!StringUtils.isEmpty(this.getStyleClass())){  
             sb.append("style=\"" + this.getStyleClass() + "\" ");  
         }  
         if(!StringUtils.isEmpty(this.getMultiple())){  
             sb.append("multiple=\"" + this.getMultiple() + "\" ");  
         }  
         if(!StringUtils.isEmpty(this.getOnChange())){  
             sb.append("onchange=\"" + this.getOnChange() + "\" ");  
         }  
         sb.append(">");  
         if(this.isDefaultValue()){    
             sb.append("<option value=''>--请选择--</option>");    
         }  
         for(Dictionary dc:dict_list){  
             if(dc.getItemCode().equals(this.getValue())){  
                 sb.append("<option value='"+dc.getItemCode()+"' selected='selected'>");  
             }else{  
                 sb.append("<option value='"+dc.getItemCode()+"'>");  
             }  
             sb.append(dc.getItemDesc()+"</option>");  
         }  
         sb.append("</select>");  
         try {  
             out.write(sb.toString());  
         } catch (IOException e) {  
             // TODO Auto-generated catch block  
             throw new JspException(e);  
         }  
    	**/
    }

    
    
    
	public String getDictName() {
		return dictName;
	}

	public void setDictName(String dictName) {
		this.dictName = dictName;
	}

	public boolean isDefaultValue() {
		return defaultValue;
	}

	public void setDefaultValue(boolean defaultValue) {
		this.defaultValue = defaultValue;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCssClass() {
		return cssClass;
	}

	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}

	public String getStyleClass() {
		return styleClass;
	}

	public void setStyleClass(String styleClass) {
		this.styleClass = styleClass;
	}

	public String getMultiple() {
		return multiple;
	}

	public void setMultiple(String multiple) {
		this.multiple = multiple;
	}

	public String getOnChange() {
		return onChange;
	}

	public void setOnChange(String onChange) {
		this.onChange = onChange;
	}
	  
	 
}