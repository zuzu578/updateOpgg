package com.myopgg.myopggapp.dto;

public class ChampionMasteryDto 
{
	private long championPointsUntilNextLevel;
	private boolean chestGranted;
	private long championId;
	private long lastPlayTime;
	private int championLevel;
	private String summonerId;
	private int championPoints;
	private long championPointsSinceLastLevel;
	private int tokensEarned;
	public ChampionMasteryDto() {
		
	}
	
	public ChampionMasteryDto(long championPointsUntilNextLevel, boolean chestGranted, long championId,
			long lastPlayTime, int championLevel, String summonerId, int championPoints,
			long championPointsSinceLastLevel, int tokensEarned) {
		super();
		this.championPointsUntilNextLevel = championPointsUntilNextLevel;
		this.chestGranted = chestGranted;
		this.championId = championId;
		this.lastPlayTime = lastPlayTime;
		this.championLevel = championLevel;
		this.summonerId = summonerId;
		this.championPoints = championPoints;
		this.championPointsSinceLastLevel = championPointsSinceLastLevel;
		this.tokensEarned = tokensEarned;
	}

	public long getChampionPointsUntilNextLevel() {
		return championPointsUntilNextLevel;
	}
	public void setChampionPointsUntilNextLevel(long championPointsUntilNextLevel) {
		this.championPointsUntilNextLevel = championPointsUntilNextLevel;
	}
	public boolean isChestGranted() {
		return chestGranted;
	}
	public void setChestGranted(boolean chestGranted) {
		this.chestGranted = chestGranted;
	}
	public long getChampionId() {
		return championId;
	}
	public void setChampionId(long championId) {
		this.championId = championId;
	}
	public long getLastPlayTime() {
		return lastPlayTime;
	}
	public void setLastPlayTime(long lastPlayTime) {
		this.lastPlayTime = lastPlayTime;
	}
	public int getChampionLevel() {
		return championLevel;
	}
	public void setChampionLevel(int championLevel) {
		this.championLevel = championLevel;
	}
	public String getSummonerId() {
		return summonerId;
	}
	public void setSummonerId(String summonerId) {
		this.summonerId = summonerId;
	}
	public int getChampionPoints() {
		return championPoints;
	}
	public void setChampionPoints(int championPoints) {
		this.championPoints = championPoints;
	}
	public long getChampionPointsSinceLastLevel() {
		return championPointsSinceLastLevel;
	}
	public void setChampionPointsSinceLastLevel(long championPointsSinceLastLevel) {
		this.championPointsSinceLastLevel = championPointsSinceLastLevel;
	}
	public int getTokensEarned() {
		return tokensEarned;
	}
	public void setTokensEarned(int tokensEarned) {
		this.tokensEarned = tokensEarned;
	}

	@Override
	public String toString() {
		return "ChampionMasteryDto [championPointsUntilNextLevel=" + championPointsUntilNextLevel + ", chestGranted="
				+ chestGranted + ", championId=" + championId + ", lastPlayTime=" + lastPlayTime + ", championLevel="
				+ championLevel + ", summonerId=" + summonerId + ", championPoints=" + championPoints
				+ ", championPointsSinceLastLevel=" + championPointsSinceLastLevel + ", tokensEarned=" + tokensEarned
				+ ", getChampionPointsUntilNextLevel()=" + getChampionPointsUntilNextLevel() + ", isChestGranted()="
				+ isChestGranted() + ", getChampionId()=" + getChampionId() + ", getLastPlayTime()=" + getLastPlayTime()
				+ ", getChampionLevel()=" + getChampionLevel() + ", getSummonerId()=" + getSummonerId()
				+ ", getChampionPoints()=" + getChampionPoints() + ", getChampionPointsSinceLastLevel()="
				+ getChampionPointsSinceLastLevel() + ", getTokensEarned()=" + getTokensEarned() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	

}
