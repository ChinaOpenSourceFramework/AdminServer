package com.liqiwei.soft.adminserver.common.tags;

import javax.servlet.jsp.tagext.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import com.liqiwei.soft.adminserver.common.dictionary.service.DictionaryOptionService;

import javax.servlet.jsp.*;
import java.io.*;

public class DictLabelTag extends SimpleTagSupport {

	private static final Logger LOGGER = LoggerFactory.getLogger(DictLabelTag.class);

	private String dictName;
	private String value;

	@Override
	public void doTag() throws JspException, IOException {
		// 注意 Autoware 注解不能用
		WebApplicationContext webApplicationContext = ContextLoader.getCurrentWebApplicationContext();
		DictionaryOptionService dictionaryOptionService = (DictionaryOptionService) webApplicationContext.getBean("dictionaryOptionService");
		String name = dictionaryOptionService.selectNameByDictValueAndValue(dictName, value);
		LOGGER.info("{} 的选项name {} ", dictName, name);
		JspWriter out = getJspContext().getOut();
		try {
			out.write(name);
		} catch (IOException e) {
			throw new JspException(e);
		}
	}

	public String getDictName() {
		return dictName;
	}

	public void setDictName(String dictName) {
		this.dictName = dictName;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
	
	

}