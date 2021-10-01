package com.myopgg.myopggapp.dto;

import java.util.List;

import com.google.gson.JsonArray;

public class MatchlistDto 
{
	private int startIndex;
	private int totalGames;
	private int endIndex;
	private JsonArray matches;
	private long gameId;
	private String role;
	private String platformId;
	private int champion;
	private int queue;
	private String lane;
	private long timestamp;
	public MatchlistDto() {
		
	}
	
	
	public MatchlistDto(int startIndex, int totalGames, int endIndex, JsonArray matches) {
		super();
		this.startIndex = startIndex;
		this.totalGames = totalGames;
		this.endIndex = endIndex;
		this.matches = matches;
		this.gameId = gameId;
		this.role = role;
		this.platformId = platformId;
		this.champion = champion;
		this.queue = queue;
		this.lane = lane;
		this.timestamp = timestamp;
	}


	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public int getTotalGames() {
		return totalGames;
	}
	public void setTotalGames(int totalGames) {
		this.totalGames = totalGames;
	}
	public int getEndIndex() {
		return endIndex;
	}
	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}
	public JsonArray getMatches() {
		return matches;
	}
	public void setMatches(JsonArray matches) {
		this.matches = matches;
	}
	public long getGameId() {
		return gameId;
	}
	public void setGameId(long gameId) {
		this.gameId = gameId;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getPlatformId() {
		return platformId;
	}
	public void setPlatformId(String platformId) {
		this.platformId = platformId;
	}
	public int getChampion() {
		return champion;
	}
	public void setChampion(int champion) {
		this.champion = champion;
	}
	public int getQueue() {
		return queue;
	}
	public void setQueue(int queue) {
		this.queue = queue;
	}
	public String getLane() {
		return lane;
	}
	public void setLane(String lane) {
		this.lane = lane;
	}
	public long getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(long timestamp) {
		this.timestamp = timestamp;
	}


	@Override
	public String toString() {
		return "MatchlistDto [startIndex=" + startIndex + ", totalGames=" + totalGames + ", endIndex=" + endIndex
				+ ", matches=" + matches + ", gameId=" + gameId + ", role=" + role + ", platformId=" + platformId
				+ ", champion=" + champion + ", queue=" + queue + ", lane=" + lane + ", timestamp=" + timestamp
				+ ", getStartIndex()=" + getStartIndex() + ", getTotalGames()=" + getTotalGames() + ", getEndIndex()="
				+ getEndIndex() + ", getMatches()=" + getMatches() + ", getGameId()=" + getGameId() + ", getRole()="
				+ getRole() + ", getPlatformId()=" + getPlatformId() + ", getChampion()=" + getChampion()
				+ ", getQueue()=" + getQueue() + ", getLane()=" + getLane() + ", getTimestamp()=" + getTimestamp()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
	

}
