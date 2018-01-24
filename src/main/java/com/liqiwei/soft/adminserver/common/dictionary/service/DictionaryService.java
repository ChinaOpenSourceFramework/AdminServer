package com.liqiwei.soft.adminserver.common.dictionary.service;

import com.github.pagehelper.PageInfo;
import com.liqiwei.soft.adminserver.common.dictionary.model.Dictionary;
import com.liqiwei.soft.adminserver.common.util.PageParamUtil;

public interface DictionaryService {

	PageInfo<Dictionary> selectAllDictionary(Dictionary dictionary, PageParamUtil pageParam);

	void insert(Dictionary dictionary);

	Dictionary selectByDictionaryId(Integer dictionaryId);

	void updateByDictionaryId(Dictionary dictionary);

	void deleteByDictionaryId(Integer dictionaryId);

}
