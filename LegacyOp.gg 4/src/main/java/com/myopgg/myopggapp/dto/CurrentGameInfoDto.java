package com.myopgg.myopggapp.dto;


//current user Play game info dtos 

//2021 - 06 - 24 : 게임중인 유저의 플레이 정보를 보여주는 dtos 
// ==> match id 를 통해 api 데이터를 받아온다.

public class CurrentGameInfoDto {
	private long gameId;
	private String gameType;
	private long gameStartTime;
	private long mapId;
	private long gameLength;
	private String platformId;
	private String gameMode;
	//private long gameId;
	//private long gameId;
	//private long gameId;
	private int pickTurn;
	private long championId;
	private long teamId;

	private long spell1Id;
	private long spell2Id;
	private long perkStyle;
	private long perkSubStyle;
	public CurrentGameInfoDto() {
		
	}
	
	public CurrentGameInfoDto(long gameId, String gameType, long gameStartTime, long mapId, long gameLength,
			String platformId, String gameMode, int pickTurn, long championId, long teamId, long spell1Id,
			long spell2Id, long perkStyle, long perkSubStyle) {
		super();
		this.gameId = gameId;
		this.gameType = gameType;
		this.gameStartTime = gameStartTime;
		this.mapId = mapId;
		this.gameLength = gameLength;
		this.platformId = platformId;
		this.gameMode = gameMode;
		this.pickTurn = pickTurn;
		this.championId = championId;
		this.teamId = teamId;
		this.spell1Id = spell1Id;
		this.spell2Id = spell2Id;
		this.perkStyle = perkStyle;
		this.perkSubStyle = perkSubStyle;
	}

	public long getGameId() {
		return gameId;
	}
	public void setGameId(long gameId) {
		this.gameId = gameId;
	}
	public String getGameType() {
		return gameType;
	}
	public void setGameType(String gameType) {
		this.gameType = gameType;
	}
	public long getGameStartTime() {
		return gameStartTime;
	}
	public void setGameStartTime(long gameStartTime) {
		this.gameStartTime = gameStartTime;
	}
	public long getMapId() {
		return mapId;
	}
	public void setMapId(long mapId) {
		this.mapId = mapId;
	}
	public long getGameLength() {
		return gameLength;
	}
	public void setGameLength(long gameLength) {
		this.gameLength = gameLength;
	}
	public String getPlatformId() {
		return platformId;
	}
	public void setPlatformId(String platformId) {
		this.platformId = platformId;
	}
	public String getGameMode() {
		return gameMode;
	}
	public void setGameMode(String gameMode) {
		this.gameMode = gameMode;
	}
	public int getPickTurn() {
		return pickTurn;
	}
	public void setPickTurn(int pickTurn) {
		this.pickTurn = pickTurn;
	}
	public long getChampionId() {
		return championId;
	}
	public void setChampionId(long championId) {
		this.championId = championId;
	}
	public long getTeamId() {
		return teamId;
	}
	public void setTeamId(long teamId) {
		this.teamId = teamId;
	}
	public long getSpell1Id() {
		return spell1Id;
	}
	public void setSpell1Id(long spell1Id) {
		this.spell1Id = spell1Id;
	}
	public long getSpell2Id() {
		return spell2Id;
	}
	public void setSpell2Id(long spell2Id) {
		this.spell2Id = spell2Id;
	}
	public long getPerkStyle() {
		return perkStyle;
	}
	public void setPerkStyle(long perkStyle) {
		this.perkStyle = perkStyle;
	}
	public long getPerkSubStyle() {
		return perkSubStyle;
	}
	public void setPerkSubStyle(long perkSubStyle) {
		this.perkSubStyle = perkSubStyle;
	}

	@Override
	public String toString() {
		return "CurrentGameInfoDto [gameId=" + gameId + ", gameType=" + gameType + ", gameStartTime=" + gameStartTime
				+ ", mapId=" + mapId + ", gameLength=" + gameLength + ", platformId=" + platformId + ", gameMode="
				+ gameMode + ", pickTurn=" + pickTurn + ", championId=" + championId + ", teamId=" + teamId
				+ ", spell1Id=" + spell1Id + ", spell2Id=" + spell2Id + ", perkStyle=" + perkStyle + ", perkSubStyle="
				+ perkSubStyle + ", getGameId()=" + getGameId() + ", getGameType()=" + getGameType()
				+ ", getGameStartTime()=" + getGameStartTime() + ", getMapId()=" + getMapId() + ", getGameLength()="
				+ getGameLength() + ", getPlatformId()=" + getPlatformId() + ", getGameMode()=" + getGameMode()
				+ ", getPickTurn()=" + getPickTurn() + ", getChampionId()=" + getChampionId() + ", getTeamId()="
				+ getTeamId() + ", getSpell1Id()=" + getSpell1Id() + ", getSpell2Id()=" + getSpell2Id()
				+ ", getPerkStyle()=" + getPerkStyle() + ", getPerkSubStyle()=" + getPerkSubStyle() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	

}
