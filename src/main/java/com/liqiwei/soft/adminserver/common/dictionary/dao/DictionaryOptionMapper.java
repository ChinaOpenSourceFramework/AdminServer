package com.liqiwei.soft.adminserver.common.dictionary.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.liqiwei.soft.adminserver.common.dictionary.model.DictionaryOption;

@Mapper
public interface DictionaryOptionMapper {

	int insert(DictionaryOption dictionaryOption);
	
	List<DictionaryOption> selectAllDictionaryOption(DictionaryOption dictionaryOption);

	DictionaryOption selectByDictionaryOptionId(Integer id);
	
	int updateByDictionaryOptionId(DictionaryOption dictionaryOption);
	
	int deleteByDictionaryOptionId(Integer id);

	String selectNameByDictValueAndValue(@Param("dictValue")String dictValue, @Param("value")String value);

}