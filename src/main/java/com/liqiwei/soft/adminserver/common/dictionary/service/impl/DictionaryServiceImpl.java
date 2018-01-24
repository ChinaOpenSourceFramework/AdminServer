package com.liqiwei.soft.adminserver.common.dictionary.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.liqiwei.soft.adminserver.common.dictionary.dao.DictionaryMapper;
import com.liqiwei.soft.adminserver.common.dictionary.model.Dictionary;
import com.liqiwei.soft.adminserver.common.dictionary.service.DictionaryService;
import com.liqiwei.soft.adminserver.common.util.PageParamUtil;

@Service(value="dictionaryService")
public class DictionaryServiceImpl implements DictionaryService {

	@Autowired
	private DictionaryMapper dictionaryMapper;
	
	@Override
	public PageInfo<Dictionary> selectAllDictionary(Dictionary dictionary, PageParamUtil pageParam) {
		//分页查询
		PageHelper.startPage(pageParam.getPageNum(),pageParam.getPageSize());	
		List<Dictionary> dictionaryList = this.dictionaryMapper.selectAllDictionary(dictionary);
		return new PageInfo<Dictionary>(dictionaryList);
	}

	@Override
	public void insert(Dictionary dictionary) {
		this.dictionaryMapper.insert(dictionary);
	}

	@Override
	public Dictionary selectByDictionaryId(Integer dictionaryId) {
		return this.dictionaryMapper.selectByDictionaryId(dictionaryId);
	}

	@Override
	public void updateByDictionaryId(Dictionary dictionary) {
		this.dictionaryMapper.updateByDictionaryId(dictionary);
	}

	@Override
	public void deleteByDictionaryId(Integer dictionaryId) {
		this.dictionaryMapper.deleteByDictionaryId(dictionaryId);
	}

}
