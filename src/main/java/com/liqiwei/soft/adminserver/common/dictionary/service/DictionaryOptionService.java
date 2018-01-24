package com.liqiwei.soft.adminserver.common.dictionary.service;

import com.github.pagehelper.PageInfo;
import com.liqiwei.soft.adminserver.common.dictionary.model.DictionaryOption;
import com.liqiwei.soft.adminserver.common.util.PageParamUtil;

public interface DictionaryOptionService {
	
	void insert(DictionaryOption dictionaryOption);
	
	PageInfo<DictionaryOption> selectAllDictionaryOption(DictionaryOption dictionaryOption, PageParamUtil pageParam);

	DictionaryOption selectByDictionaryOptionId(Integer dictionaryOptionId);
	
	void updateByDictionaryOptionId(DictionaryOption dictionaryOption);
	
	void deleteByDictionaryOptionId(Integer dictionaryOptionId);
}
