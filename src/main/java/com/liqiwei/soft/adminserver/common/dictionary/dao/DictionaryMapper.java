package com.liqiwei.soft.adminserver.common.dictionary.dao;

import com.liqiwei.soft.adminserver.common.dictionary.model.Dictionary;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DictionaryMapper {

	int insert(Dictionary dictionary);

	List<Dictionary> selectAllDictionary(Dictionary dictionary);

	Dictionary selectByDictionaryId(Integer id);

	int updateByDictionaryId(Dictionary dictionary);
	
	int deleteByDictionaryId(Integer id);
	

}