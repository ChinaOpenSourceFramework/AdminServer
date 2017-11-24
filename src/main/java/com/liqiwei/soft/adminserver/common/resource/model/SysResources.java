package com.liqiwei.soft.adminserver.common.resource.model;

public class SysResources{
    private Integer resId;

    private String resName;
    
    private String resValue;

    private String description;

    private Boolean resType;

    private Integer resLevel;

    private Integer pResId;

    private Integer resSort;

    private String resIcon;

    private Boolean locked;

    public Integer getResId() {
        return resId;
    }

    public void setResId(Integer resId) {
        this.resId = resId;
    }

    public String getResName() {
        return resName;
    }

    public void setResName(String resName) {
        this.resName = resName == null ? null : resName.trim();
    }

    public String getResValue() {
		return resValue;
	}

	public void setResValue(String resValue) {
		this.resValue = resValue == null ? null : resValue.trim();
	}

	public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Boolean getResType() {
        return resType;
    }

    public void setResType(Boolean resType) {
        this.resType = resType;
    }

    public Integer getResLevel() {
        return resLevel;
    }

    public void setResLevel(Integer resLevel) {
        this.resLevel = resLevel;
    }

    public Integer getpResId() {
        return pResId;
    }

    public void setpResId(Integer pResId) {
        this.pResId = pResId;
    }

    public Integer getResSort() {
        return resSort;
    }

    public void setResSort(Integer resSort) {
        this.resSort = resSort;
    }

    public String getResIcon() {
        return resIcon;
    }

    public void setResIcon(String resIcon) {
        this.resIcon = resIcon == null ? null : resIcon.trim();
    }

    public Boolean getLocked() {
        return locked;
    }

    public void setLocked(Boolean locked) {
        this.locked = locked;
    }

	@Override
	public String toString() {
		return "SysResources [resId=" + resId + ", resName=" + resName + ", resValue=" + resValue + ", description="
				+ description + ", resType=" + resType + ", resLevel=" + resLevel + ", pResId=" + pResId + ", resSort="
				+ resSort + ", resIcon=" + resIcon + ", locked=" + locked + "]";
	}

}