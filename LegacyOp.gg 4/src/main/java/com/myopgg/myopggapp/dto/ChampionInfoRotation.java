package com.myopgg.myopggapp.dto;

import java.util.ArrayList;
import java.util.List;

public class ChampionInfoRotation 
{
	private int maxNewPlayerLevel;
	private int freeChampionIdsForNewPlayers;
	private int freeChampionIds;
	
	
	public ChampionInfoRotation() {
		
	}
	public ChampionInfoRotation(int maxNewPlayerLevel, int freeChampionIdsForNewPlayers, int freeChampionIds) {
		super();
		this.maxNewPlayerLevel = maxNewPlayerLevel;
		this.freeChampionIdsForNewPlayers = freeChampionIdsForNewPlayers;
		this.freeChampionIds = freeChampionIds;
	}

	public int getMaxNewPlayerLevel() {
		return maxNewPlayerLevel;
	}

	public void setMaxNewPlayerLevel(int maxNewPlayerLevel) {
		this.maxNewPlayerLevel = maxNewPlayerLevel;
	}

	public int getFreeChampionIdsForNewPlayers() {
		return freeChampionIdsForNewPlayers;
	}

	public void setFreeChampionIdsForNewPlayers(int freeChampionIdsForNewPlayers) {
		this.freeChampionIdsForNewPlayers = freeChampionIdsForNewPlayers;
	}

	public int getFreeChampionIds() {
		return freeChampionIds;
	}

	public void setFreeChampionIds(int freeChampionIds) {
		this.freeChampionIds = freeChampionIds;
	}
	@Override
	public String toString() {
		return "ChampionInfoRotation [maxNewPlayerLevel=" + maxNewPlayerLevel + ", freeChampionIdsForNewPlayers="
				+ freeChampionIdsForNewPlayers + ", freeChampionIds=" + freeChampionIds + ", getMaxNewPlayerLevel()="
				+ getMaxNewPlayerLevel() + ", getFreeChampionIdsForNewPlayers()=" + getFreeChampionIdsForNewPlayers()
				+ ", getFreeChampionIds()=" + getFreeChampionIds() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
	
}
