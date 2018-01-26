package com.liqiwei.soft.adminserver.common.dictionary.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.liqiwei.soft.adminserver.common.dictionary.dao.DictionaryOptionMapper;
import com.liqiwei.soft.adminserver.common.dictionary.model.DictionaryOption;
import com.liqiwei.soft.adminserver.common.dictionary.service.DictionaryOptionService;
import com.liqiwei.soft.adminserver.common.util.PageParamUtil;
@Service(value="dictionaryOptionService")
public class DictionaryOptionServiceImpl implements DictionaryOptionService{

	@Autowired
	private DictionaryOptionMapper dictionaryOptionMapper;
	
	@Override
	public void insert(DictionaryOption dictionaryOption) {
		dictionaryOption.setLocked(false);
		this.dictionaryOptionMapper.insert(dictionaryOption);
	}

	@Override
	public PageInfo<DictionaryOption> selectAllDictionaryOption(DictionaryOption dictionaryOption,
			PageParamUtil pageParam) {
		//分页查询
		PageHelper.startPage(pageParam.getPageNum(),pageParam.getPageSize());
		List<DictionaryOption> dictionaryOptionList = this.dictionaryOptionMapper.selectAllDictionaryOption(dictionaryOption);
		return  new PageInfo<DictionaryOption>(dictionaryOptionList);
	}

	@Override
	public DictionaryOption selectByDictionaryOptionId(Integer dictionaryOptionId) {
		return this.dictionaryOptionMapper.selectByDictionaryOptionId(dictionaryOptionId);
	}

	@Override
	public void updateByDictionaryOptionId(DictionaryOption dictionaryOption) {
		this.dictionaryOptionMapper.updateByDictionaryOptionId(dictionaryOption);
	}

	@Override
	public void deleteByDictionaryOptionId(Integer dictionaryOptionId) {
		this.dictionaryOptionMapper.deleteByDictionaryOptionId(dictionaryOptionId);
	}

	@Override
	public List<DictionaryOption> selectOptionByDictValue(String dictValue) {
		DictionaryOption dictionaryOption = new DictionaryOption();
		dictionaryOption.setDictValue(dictValue);
		return this.dictionaryOptionMapper.selectAllDictionaryOption(dictionaryOption);
	}

	@Override
	public String selectNameByDictValueAndValue(String dictValue, String value) {
		return this.dictionaryOptionMapper.selectNameByDictValueAndValue(dictValue,value);
	}

}
