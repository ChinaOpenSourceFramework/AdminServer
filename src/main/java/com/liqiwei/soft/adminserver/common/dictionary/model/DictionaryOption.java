package com.liqiwei.soft.adminserver.common.dictionary.model;

public class DictionaryOption {
	
	private Integer id;

    private String dictValue;

    private String name;

    private String value;

    private Integer sort;

    private Boolean locked;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDictValue() {
		return dictValue;
	}

	public void setDictValue(String dictValue) {
		this.dictValue = dictValue;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public Boolean getLocked() {
		return locked;
	}

	public void setLocked(Boolean locked) {
		this.locked = locked;
	}

	@Override
	public String toString() {
		return "DictionaryOption [id=" + id + ", dictValue=" + dictValue + ", name=" + name + ", value=" + value
				+ ", sort=" + sort + ", locked=" + locked + "]";
	}
    
}
