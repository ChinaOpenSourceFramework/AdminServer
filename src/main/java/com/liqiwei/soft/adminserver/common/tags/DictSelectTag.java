package com.liqiwei.soft.adminserver.common.tags;

import javax.servlet.jsp.tagext.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import com.liqiwei.soft.adminserver.common.dictionary.model.DictionaryOption;
import com.liqiwei.soft.adminserver.common.dictionary.service.DictionaryOptionService;

import javax.servlet.jsp.*;
import java.io.*;
import java.util.List;

public class DictSelectTag extends SimpleTagSupport {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(DictSelectTag.class);
	
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
    	//注意 Autoware 注解不能用 
    	WebApplicationContext webApplicationContext = ContextLoader.getCurrentWebApplicationContext();
    	DictionaryOptionService dictionaryOptionService = (DictionaryOptionService)webApplicationContext.getBean("dictionaryOptionService");
    	List<DictionaryOption> dict_list = dictionaryOptionService.selectOptionByDictValue(dictName);
    	LOGGER.info("{} 的选项个数 {} ",dictName,dict_list.size());
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
         for(DictionaryOption dc:dict_list){  
             if(dc.getValue().equals(this.getValue())){  
                 sb.append("<option value='"+dc.getValue()+"' selected='selected'>");  
             }else{  
                 sb.append("<option value='"+dc.getValue()+"'>");  
             }  
             sb.append(dc.getName()+"</option>");  
         }  
         sb.append("</select>");  
         try {  
             out.write(sb.toString());  
         } catch (IOException e) {  
             // TODO Auto-generated catch block  
             throw new JspException(e);  
         }  
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