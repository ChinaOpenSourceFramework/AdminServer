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
import com.liqiwei.soft.adminserver.common.controller.BaseResponse;
import com.liqiwei.soft.adminserver.common.dictionary.model.Dictionary;
import com.liqiwei.soft.adminserver.common.dictionary.model.DictionaryOption;
import com.liqiwei.soft.adminserver.common.dictionary.service.DictionaryOptionService;
import com.liqiwei.soft.adminserver.common.dictionary.service.DictionaryService;
import com.liqiwei.soft.adminserver.common.util.PageParamUtil;
import com.liqiwei.soft.adminserver.common.util.PageViewUtil;

@Controller
@RequestMapping(value="/common/dictionary")
public class DictionaryOptionController {

	private static final Logger LOGGER = LoggerFactory.getLogger(DictionaryOptionController.class);
	
	@Autowired
	private DictionaryOptionService dictionaryOptionService;
	
	@Autowired
	private DictionaryService dictionaryService;
	/**
	 * 数据字典选项列表页
	 * @return
	 */
	@RequestMapping(value="/dictionaryOptionList", method = RequestMethod.GET)
	public String dictionaryOptionList(DictionaryOption dictionaryOption,Integer dictionaryId, Model model,PageParamUtil pageParam) {
		LOGGER.info("进 数据字典选项列表页");
		Dictionary dictionary = this.dictionaryService.selectByDictionaryId(dictionaryId);
		dictionaryOption.setDictValue(dictionary.getValue());
		PageInfo<DictionaryOption> dictionaryOptionListPage = this.dictionaryOptionService.selectAllDictionaryOption(dictionaryOption,pageParam);
		model.addAttribute("dictionaryOptionListPage", dictionaryOptionListPage);
		model.addAttribute("dictionaryOption", dictionaryOption);
		model.addAttribute("dictionary", dictionary);
		//设置分页参数
		PageViewUtil.setViewParam(model,dictionaryOptionListPage);
		return "common/dictionary/dictionaryOptionList";
	}
	
	
	/**
	 * 跳转到添加页面
	 * @return
	 */
	@RequestMapping(value="/addDictionaryOptionPage", method = RequestMethod.GET)
	public String addDictionaryOptionPage(){		
		return "common/dictionary/addDictionaryOption";
	}
	
	
	/**
	 * 添加数据字典选项
	 * @param dictionaryOption
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/addDictionaryOption", method = RequestMethod.POST)
	public String addDictionaryOption(DictionaryOption dictionaryOption){
		this.dictionaryOptionService.insert(dictionaryOption);
		return BaseResponse.successJson();
	}
	
	/**
	 * 跳转到修改页面
	 * @return
	 */
	@RequestMapping(value="/updateDictionaryOptionPage", method = RequestMethod.GET)
	public String updateDictionaryOptionPage(Integer dictionaryOptionId, Model model){
		DictionaryOption dictionaryOption = this.dictionaryOptionService.selectByDictionaryOptionId(dictionaryOptionId);
		model.addAttribute("dictionaryOption",dictionaryOption);
		return "common/dictionary/updateDictionaryOption";
	}
	
	/**
	 * 修改数据字典选项
	 * @param dictionaryOption
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/updateDictionaryOption", method = RequestMethod.POST)
	public String updateDictionaryOption(DictionaryOption dictionaryOption){
		this.dictionaryOptionService.updateByDictionaryOptionId(dictionaryOption);
		return BaseResponse.successJson();
	}
	
	/**
	 * 删除数据字典选项
	 * @param dictionaryOptionId
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/deleteDictionaryOption", method = RequestMethod.POST)
	public String deleteDictionaryOption(Integer dictionaryOptionId){
		this.dictionaryOptionService.deleteByDictionaryOptionId(dictionaryOptionId);
		return BaseResponse.successJson();
	}
	
}
