package com.liqiwei.soft.adminserver.common.dictionary.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.liqiwei.soft.adminserver.common.dictionary.model.Dictionary;
import com.liqiwei.soft.adminserver.common.dictionary.service.DictionaryService;
import com.liqiwei.soft.adminserver.common.util.PageParamUtil;
import com.liqiwei.soft.adminserver.common.util.PageViewUtil;

@Controller
@RequestMapping(value="/common/dictionary")
public class DictionaryController {

	private static final Logger LOGGER = LoggerFactory.getLogger(DictionaryController.class);
	
	@Autowired
	private DictionaryService dictionaryService;
	
	/**
	 * 数据字典列表页
	 * @return
	 */
	@RequestMapping(value="/dictionaryList", method = RequestMethod.GET)
	public String dictionaryList(Dictionary dictionary, Model model,PageParamUtil pageParam) {
		LOGGER.info("进 数据字典列表页");
		PageInfo<Dictionary> dictionaryListPage = this.dictionaryService.selectAllDictionary(dictionary,pageParam);
		model.addAttribute("dictionaryListPage", dictionaryListPage);
		model.addAttribute("dictionary", dictionary);
		//设置分页参数
		PageViewUtil.setViewParam(model,dictionaryListPage);
		return "common/dictionary/dictionaryList";
	}
	
	
	/**
	 * 跳转到添加页面
	 * @return
	 */
	@RequestMapping(value="/addDictionaryPage", method = RequestMethod.GET)
	public String addDictionaryPage(){		
		return "common/dictionary/addDictionary";
	}
	
	
	/**
	 * 添加数据字典
	 * @param dictionary
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/addDictionary", method = RequestMethod.POST)
	public String addDictionary(Dictionary dictionary){
		this.dictionaryService.insert(dictionary);
		return "success";
	}
	
	/**
	 * 跳转到修改页面
	 * @return
	 */
	@RequestMapping(value="/updateDictionaryPage", method = RequestMethod.GET)
	public String updateDictionaryPage(Integer dictionaryId, Model model){
		Dictionary dictionary = this.dictionaryService.selectByDictionaryId(dictionaryId);
		model.addAttribute("dictionary",dictionary);
		return "common/dictionary/updateDictionary";
	}
	
	/**
	 * 修改数据字典
	 * @param dictionary
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/updateDictionary", method = RequestMethod.POST)
	public String updateDictionary(Dictionary dictionary){
		this.dictionaryService.updateByDictionaryId(dictionary);
		return "success";
	}
	
	/**
	 * 删除数据字典
	 * @param dictionaryId
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/deleteDictionary", method = RequestMethod.POST)
	public String deleteDictionary(Integer dictionaryId){
		this.dictionaryService.deleteByDictionaryId(dictionaryId);
		return "success";
	}
	
}
