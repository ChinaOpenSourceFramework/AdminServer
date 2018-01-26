package com.liqiwei.soft.adminserver.common.dictionary.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.liqiwei.soft.adminserver.common.dictionary.model.DictionaryOption;
import com.liqiwei.soft.adminserver.common.util.PageParamUtil;

public interface DictionaryOptionService {
	
	void insert(DictionaryOption dictionaryOption);
	
	PageInfo<DictionaryOption> selectAllDictionaryOption(DictionaryOption dictionaryOption, PageParamUtil pageParam);
	
	String selectNameByDictValueAndValue(String dictValue ,String value);
	
	List<DictionaryOption> selectOptionByDictValue(String dictValue);

	DictionaryOption selectByDictionaryOptionId(Integer dictionaryOptionId);
	
	void updateByDictionaryOptionId(DictionaryOption dictionaryOption);
	
	void deleteByDictionaryOptionId(Integer dictionaryOptionId);
}
