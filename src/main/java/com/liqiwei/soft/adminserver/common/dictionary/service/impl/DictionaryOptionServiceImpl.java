package com.liqiwei.soft.adminserver.common.dictionary.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.liqiwei.soft.adminserver.common.dictionary.dao.DictionaryOptionMapper;
import com.liqiwei.soft.adminserver.common.dictionary.model.DictionaryOption;
import com.liqiwei.soft.adminserver.common.dictionary.service.DictionaryOptionService;
import com.liqiwei.soft.adminserver.common.util.PageParamUtil;
@Service(value="dictionaryOptionService")
public class DictionaryOptionServiceImpl implements DictionaryOptionService{

	private static final Logger LOGGER = LoggerFactory.getLogger(DictionaryOptionServiceImpl.class);

	@Autowired
	private DictionaryOptionMapper dictionaryOptionMapper;
	@CacheEvict(cacheManager = "dictionary",allEntries = true)
	@Override
	public void insert(DictionaryOption dictionaryOption) {
		dictionaryOption.setLocked(false);
		this.dictionaryOptionMapper.insert(dictionaryOption);
	}

	@Override
	public PageInfo<DictionaryOption> selectAllDictionaryOption(DictionaryOption dictionaryOption,
			PageParamUtil pageParam) {
		//分页查询
		PageHelper.startPage(pageParam.getPageNum(), pageParam.getPageSize());
		List<DictionaryOption> dictionaryOptionList = this.dictionaryOptionMapper.selectAllDictionaryOption(dictionaryOption);
		return  new PageInfo<DictionaryOption>(dictionaryOptionList);
	}

	@Override
	public DictionaryOption selectByDictionaryOptionId(Integer dictionaryOptionId) {
		return this.dictionaryOptionMapper.selectByDictionaryOptionId(dictionaryOptionId);
	}
	@CacheEvict(cacheManager = "dictionary",allEntries = true)
	@Override
	public void updateByDictionaryOptionId(DictionaryOption dictionaryOption) {
		this.dictionaryOptionMapper.updateByDictionaryOptionId(dictionaryOption);
	}
	@CacheEvict(cacheManager = "dictionary",allEntries = true)
	@Override
	public void deleteByDictionaryOptionId(Integer dictionaryOptionId) {
		this.dictionaryOptionMapper.deleteByDictionaryOptionId(dictionaryOptionId);
	}

	@Cacheable(cacheNames = "dictionary",key = "#dictValue")
	@Override
	public List<DictionaryOption> selectOptionByDictValue(String dictValue) {
		LOGGER.info("重新获取 {} 的选项列表",dictValue);
		DictionaryOption dictionaryOption = new DictionaryOption();
		dictionaryOption.setDictValue(dictValue);
		return this.dictionaryOptionMapper.selectAllDictionaryOption(dictionaryOption);
	}
	@Cacheable(cacheNames = "dictionary",key = "#dictValue +'_'+ #value")
	@Override
	public String selectNameByDictValueAndValue(String dictValue, String value) {
		LOGGER.info("重新获取 {} 选项 {} 的值",dictValue,value);
		return this.dictionaryOptionMapper.selectNameByDictValueAndValue(dictValue,value);
	}

}
