package com.myopgg.myopggapp.dto;

public class ChampionsResourcesDto
{
	private String version;
	private String champListData;
	private Boolean dataById;
	private String locale;
	public ChampionsResourcesDto() {
		
	}
	
	public ChampionsResourcesDto(String version, String champListData, Boolean dataById, String locale) {
		super();
		this.version = version;
		this.champListData = champListData;
		this.dataById = dataById;
		this.locale = locale;
	}
	

	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public String getChampListData() {
		return champListData;
	}
	public void setChampListData(String champListData) {
		this.champListData = champListData;
	}
	public Boolean getDataById() {
		return dataById;
	}
	public void setDataById(Boolean dataById) {
		this.dataById = dataById;
	}
	public String getLocale() {
		return locale;
	}
	public void setLocale(String locale) {
		this.locale = locale;
	}

	@Override
	public String toString() {
		return "ChampionsResourcesDto [version=" + version + ", champListData=" + champListData + ", dataById="
				+ dataById + ", locale=" + locale + ", getVersion()=" + getVersion() + ", getChampListData()="
				+ getChampListData() + ", getDataById()=" + getDataById() + ", getLocale()=" + getLocale()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
	

}
