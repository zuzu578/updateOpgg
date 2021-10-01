package com.myopgg.myopggapp;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.reflect.Type;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;


import org.json.simple.JSONObject;

import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParseException;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;
import com.myopgg.myopggapp.dto.ChampionInfoRotation;
import com.myopgg.myopggapp.dto.ChampionMasteryDto;
import com.myopgg.myopggapp.dto.ChampionsResourcesDto;
import com.myopgg.myopggapp.dto.MatchlistDto;
import com.myopgg.myopggapp.dto.SummonerDto;
import com.myopgg.myopggapp.utils.IdForNameUtil;
import org.json.simple.JSONArray;

import org.json.simple.JSONObject;

import org.json.simple.parser.JSONParser;



/**
 * Handles requests for the application home page.
 */
@Controller
public class SearchSummoner {
	
	//API keys 
	//api 키는 유효기간이 존재하므로 재발급을 받아야합니다.
	final static String API_KEY = "RGAPI-b2f4dc60-f934-4afe-91ea-d9ec18c35685";
	
	
	@RequestMapping(value = "/ShowchampionStatics" , method = RequestMethod.GET)
	public String ShowchampionStatics(HttpServletRequest req, Model model) {
		// /lol/static-data/v3/champions
		//https://kr.api.riotgames.com /lol/static-data/v3/champions"+"?api_key="+API_KEY;
		BufferedReader br = null;
		ChampionsResourcesDto rdto = null;
		try {
			//https://kr.api.riotgames.com/lol/platform/v3/champion-rotations"+"?api_key="+API_KEY
			String urlstr = "https://kr.api.riotgames.com/lol/static-data/v3/champions"+"?api_key="+API_KEY;
			URL url = new URL(urlstr);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8")); 
			String result = "";
			String line;
			while((line = br.readLine()) != null) { 
				result = result + line;
			}
			JsonParser jsonParser = new JsonParser();
			JsonObject k = (JsonObject) jsonParser.parse(result);
			String version = k.get("version").getAsString();
			System.out.println("version = ====>" + version);
			String champListData = k.get("champListData").getAsString();
			System.out.println("champListData = ====>" + champListData);
			Boolean dataById = k.get("dataById").getAsBoolean();
			System.out.println("dataById = ====>" + dataById);
			String locale = k.get("locale").getAsString();
			System.out.println("locale = ====>" + locale);
			
			model.addAttribute("version", version);
			model.addAttribute("champListData", champListData);
			model.addAttribute("dataById", dataById);
			model.addAttribute("locale", locale);
			
			
		}catch(Exception e) {
			System.out.println(e);
		}
		
		return "ShowchampionStatics";
	}
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest httpServletRequest, Model model) {
		BufferedReader br = null;
		ChampionInfoRotation cdto = null;
		try {
			///lol/platform/v3/champion-rotations
			// /lol/platform/v3/champion-rotations
			String urlstr = "https://kr.api.riotgames.com/lol/platform/v3/champion-rotations"+"?api_key="+API_KEY;
			URL url = new URL(urlstr);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8")); 
			String result = "";
			String line;
			while((line = br.readLine()) != null) { 
				result = result + line;
			}
			JsonParser jsonParser = new JsonParser();
			JsonObject k = (JsonObject) jsonParser.parse(result);
			int maxNewPlayerLevel = k.get("maxNewPlayerLevel").getAsInt();
			System.out.println("maxNewPlayerLevel =========>"+maxNewPlayerLevel);
			JsonArray freeChampionIdsForNewPlayers = new JsonArray();
			 freeChampionIdsForNewPlayers =  k.get("freeChampionIdsForNewPlayers").getAsJsonArray();
			System.out.println("freeChampionIdsForNewPlayers ========>" + freeChampionIdsForNewPlayers );
			JsonArray freeChampionIds = new JsonArray();
			freeChampionIds = k.get("freeChampionIds").getAsJsonArray();
			System.out.println("freeChampionIds======>"+freeChampionIds);
			//cdto = new ChampionInfoRotation(maxNewPlayerLevel,freeChampionIdsForNewPlayers,freeChampionIds);
			//model.addAttribute("SummonerName",SummonerName);
			IdForNameUtil a1 = new IdForNameUtil();
			//a1.ChangeName(freeChampionIds); ==> 챔피언 이름 바꾸기 
			
			model.addAttribute("rotationName",a1.ChangeName(freeChampionIds));
			model.addAttribute("maxNewPlayerLevel",maxNewPlayerLevel);
			model.addAttribute("freeChampionIdsForNewPlayers",freeChampionIdsForNewPlayers);
			model.addAttribute("freeChampionIds",freeChampionIds);
			
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		
		return "home";
	}
	
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String result(HttpServletRequest req , Model model, HttpServletRequest httpServletRequest) {
		////https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/%EC%98%A4%EC%88%9C%EB%8F%84%EC%88%9C%EB%8F%84%EB%9E%80%EB%8F%84%EB%9E%80?api_key=RGAPI-637a6ba5-549d-43da-b3e2-961dfc8a8766
		
		//VersionCheck.checkVersion();
		BufferedReader br = null;
		String SummonerName = httpServletRequest.getParameter("SummonerName");
		//String lolNickName = req.getParameter("lolNickName");
		System.out.println("SummonerName===>"+SummonerName);
		SummonerDto temp= null;
		com.myopgg.myopggapp.dto.LeagueEntrydto[] leagueInfo = null;
		//LeagueEntrydto[] leagueInfo = null;
		try{      
			///lol/summoner/v4/summoners/by-account/{encryptedAccountId}
			String urlstr = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/"+
					SummonerName.replace(" ", "")		+"?api_key="+API_KEY;
			URL url = new URL(urlstr);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");

			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8")); 
			String result = "";
			String line;
			while((line = br.readLine()) != null) { 
				result = result + line;
			}
			JsonParser jsonParser = new JsonParser();
			JsonObject k = (JsonObject) jsonParser.parse(result);
			int profileIconId = k.get("profileIconId").getAsInt(); // profileIconId 를 int 값을  받습니다.
			String name = k.get("name").getAsString();
			System.out.println(name);
			String puuid = k.get("puuid").getAsString();
			long summonerLevel = k.get("summonerLevel").getAsLong();
			System.out.println(summonerLevel);
			long revisionDate = k.get("revisionDate").getAsLong();
			String id = k.get("id").getAsString();
			String accountId = k.get("accountId").getAsString();
			System.out.println("accountId ====> "+accountId);
			temp = new SummonerDto(profileIconId,name,puuid,summonerLevel,revisionDate,id,accountId);
			model.addAttribute("SummonerName",SummonerName);
			model.addAttribute("profileIconId",profileIconId);
			model.addAttribute("name",name);
			model.addAttribute("puuid",puuid);
			model.addAttribute("summonerLevel",summonerLevel);
			model.addAttribute("revisionDate",revisionDate);
			model.addAttribute("id",id);
			model.addAttribute("accountId",accountId);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		String[] leagueName = null ; 
		try{            
			String urlstr = "https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/"+
					temp.getId()		+"?api_key="+API_KEY;
			URL url = new URL(urlstr);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8")); // �뿬湲곗뿉 臾몄옄�뿴�쓣 諛쏆븘���씪.
			String result = "";
			String line;
			while((line = br.readLine()) != null) { // 洹� 諛쏆븘�삩 臾몄옄�뿴�쓣 怨꾩냽 br�뿉�꽌 以꾨떒�쐞濡� 諛쏄퀬 異쒕젰�븯寃좊떎.
				result = result + line;
			}
			JsonParser jsonParser = new JsonParser();
			JsonArray arr = (JsonArray) jsonParser.parse(result);
			leagueInfo = new com.myopgg.myopggapp.dto.LeagueEntrydto[arr.size()];
			leagueName = new String[arr.size()];
			for(int i=0; i<arr.size(); i++) {
				JsonObject k =  (JsonObject) arr.get(i);
				int wins = k.get("wins").getAsInt();
				int losses = k.get("losses").getAsInt();
				String rank = k.get("rank").getAsString();
				String tier = k.get("tier").getAsString();
				String queueType = k.get("queueType").getAsString();
				int leaguePoints = k.get("leaguePoints").getAsInt();
				String leagueId = k.get("leagueId").getAsString();
				
				model.addAttribute("wins",wins);
				model.addAttribute("losses",losses);
				model.addAttribute("rank",rank);
				model.addAttribute("tier",tier);
				model.addAttribute("queueType",queueType);
				model.addAttribute("leaguePoints",leaguePoints);
				model.addAttribute("leagueId",leagueId);
				System.out.println("wins"+wins);
				System.out.println(losses);
				System.out.println(rank);
				System.out.println(tier);
				System.out.println(queueType);
				System.out.println(leaguePoints);
				System.out.println(leagueId);

				leagueInfo[i] = new com.myopgg.myopggapp.dto.LeagueEntrydto(queueType, wins, losses, leagueId, rank,tier, leaguePoints);
				urlstr = "https://kr.api.riotgames.com/lol/league/v4/leagues/"+
						leagueInfo[i].getLeagueId()		+"?api_key="+API_KEY;
				url = new URL(urlstr);
				urlconnection = (HttpURLConnection) url.openConnection();
				urlconnection.setRequestMethod("GET");
				br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8")); // �뿬湲곗뿉 臾몄옄�뿴�쓣 諛쏆븘���씪.
				result = "";
				line ="";
				while((line = br.readLine()) != null) { // 洹� 諛쏆븘�삩 臾몄옄�뿴�쓣 怨꾩냽 br�뿉�꽌 以꾨떒�쐞濡� 諛쏄퀬 異쒕젰�븯寃좊떎.
					result = result + line;
				}
				jsonParser = new JsonParser();
				k = (JsonObject) jsonParser.parse(result);
				leagueName[i] = k.get("name").getAsString();
			}
			System.out.print(leagueInfo[0]);
			model.addAttribute("summoner", temp);
			//https://opgg-static.akamaized.net/images/profile_icons/profileIcon6.jpg?image=q_auto:best&v=1518361200
			model.addAttribute("profileImgURL", "https://opgg-static.akamaized.net/images/profile_icons/profileIcon"+temp.getProfileIconId()+".jpg?image=q_auto:best&v=1518361200");
			model.addAttribute("leagueInfo", leagueInfo);
			model.addAttribute("tierImgURL", "img/emblems/Emblem_"+leagueInfo[0].getTier()+".png");
			model.addAttribute("leagueName", leagueName);
			
		}catch(Exception e){
			System.out.println(e.getMessage());
		} 
		br = null;
		
		SummonerName = httpServletRequest.getParameter("SummonerName");
		System.out.println("SummonerName===>"+SummonerName);
		MatchlistDto md= null;
		try {
			//참고 
			//https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/%EC%98%A4%EC%88%9C%EB%8F%84%EC%88%9C%EB%8F%84%EB%9E%80%EB%8F%84%EB%9E%80?api_key=RGAPI-637a6ba5-549d-43da-b3e2-961dfc8a8766
		
			// macth list 보여주기 
			//https://kr.api.riotgames.com/lol/match/v4/matchlists/by-account/2yOznX13C2V-V-GvTY-FZmwzy0kJUg4ibRdd-WsLlghNhn3ZGnrsiA-n?api_key=RGAPI-637a6ba5-549d-43da-b3e2-961dfc8a8766
			
			System.out.println("getAccountId 로 macth List select ");
			String urlstr = "https://kr.api.riotgames.com/lol/match/v4/matchlists/by-account/"+
					temp.getPuuid()		+"?api_key="+API_KEY;
			URL url = new URL(urlstr);
			System.out.println(temp.getAccountId());
			System.out.println("getID() ===> "+temp.getId());
			String encryptedId = temp.getId();
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8")); // �뿬湲곗뿉 臾몄옄�뿴�쓣 諛쏆븘���씪.
			String result = "";
			String line;
			while((line = br.readLine()) != null) { 
				result = result + line;
			}
			JsonParser jsonParser = new JsonParser();
			JsonObject k = (JsonObject) jsonParser.parse(result);
			int startIndex = k.get("startIndex").getAsInt();
			System.out.println(startIndex);
			int endIndex = k.get("endIndex").getAsInt();
			JsonArray matches = new JsonArray();
			matches = k.get("matches").getAsJsonArray();
			System.out.println("jsonArray ====== = = = =");	
			Gson gson = new Gson();
			// 컴파일시 제네릭이 소멸되는것때문에 해당 제네릭을 유추합니다 ( Type ) 
			Type type = new TypeToken<List<Map<String, Object>>>(){}.getType();
			//get url comnnection => get json => List<Map<String , Object > > 
			// 통신후 받아온 해당 json data  의 제네릭 타입을 유추한다. 
		    List<Map<String, Object>> contactList = gson.fromJson(matches, type);	
			System.out.println("matches ====>"+matches);
			System.out.println("endIndex" + endIndex);
			int totalGames = k.get("totalGames").getAsInt();
			System.out.println("totalGames"+totalGames);
			//long gameId = k.get("gameId").getAsLong();
			//System.out.println("gameId" + gameId);
			//long timestamp = k.get("timestamp").getAsLong();
			//System.out.println("timestamp"+timestamp);
			String accountId =temp.getAccountId();
			//System.out.println("accountId =====> "+accountId);
			md = new MatchlistDto(startIndex,totalGames,endIndex,matches);
			model.addAttribute("accountId",accountId);
			model.addAttribute("encryptedId",encryptedId);
			model.addAttribute("startIndex", startIndex);
			model.addAttribute("totalGames", totalGames);
			model.addAttribute("endIndex", endIndex);
			model.addAttribute("matches", contactList);
			IdForNameUtil a1 = new IdForNameUtil();
			//a1.ChangeName(freeChampionIds); ==> 챔피언 이름 바꾸기 
			//model.addAttribute("timestamp", timestamp);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		br = null;
		
		ChampionMasteryDto cdto= null;
		try {
			// /lol/champion-mastery/v4/champion-masteries/by-summoner/{encryptedSummonerId}
			System.out.println("getId 로  champin mastery List select ");
			System.out.println("getID() ===> "+temp.getId());
			String urlstr = "https://kr.api.riotgames.com/lol/champion-mastery/v4/champion-masteries/by-summoner/"+
					temp.getId()		+"?api_key="+API_KEY;
			URL url = new URL(urlstr);
			System.out.println(temp.getId());

			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			// restful api transaction 시 request method 는 get 방식으로 
			urlconnection.setRequestMethod("GET");
			
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8")); // utf - 8 로 encoding 
			String result = "";
			String line;
			while((line = br.readLine()) != null) { 
				result = result + line;
			}
		
			JsonParser jsonParser = new JsonParser();
			JsonArray k = (JsonArray) jsonParser.parse(result);
			System.out.println("===========" + k);
			//JsonArray championPointsUntilNextLevel = new JsonArray();
			//long championPointsUntilNextLevel = Long.parseLong(k.get("championPointsUntilNextLevel").toString());
			 Gson gson = new Gson();
			Type type = new TypeToken<List<ChampionMasteryDto>>(){}.getType();
		    List<ChampionMasteryDto> championMastery = gson.fromJson(k, type);
		    model.addAttribute("championMastery",championMastery);
		    		
		
		}catch(Exception e) {
			System.out.println(e);
		}
		
	
		return "result";
			
	}	
	// 현재 리그오브레전드 서버 상태, 문제점 에대한 데이터를 가져옵니다.
	@RequestMapping("/status")
	@ResponseBody
	public Map<String, Object> getServerStatus(HttpServletRequest req , Model model) throws IOException, ParseException {
		  System.out.println("getServerStatus List ! ");
		  BufferedReader br = null;
		
		  String urlstr = "https://kr.api.riotgames.com/lol/status/v4/platform-data?api_key="+API_KEY;
			URL url = new URL(urlstr);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8")); 
			String result = "";
			String line;
			while((line = br.readLine()) != null) { 
				result = result + line;
			}
			
			JSONParser parser = new JSONParser();
			Object object = parser.parse(result.toString()); 
			JSONObject json = (JSONObject) object;
			System.out.println(json);
		return getMapFromJsonObject(json);
		
	}
	
	//챌린저 유저들의 list 를 가져옵니다.
	@RequestMapping("/getRankerList")
	@ResponseBody
	public Map<String, Object> getRankerList(HttpServletRequest req , Model model) throws IOException, ParseException {
		  System.out.println("getRankerList!");
		  BufferedReader br = null;
		  String page = req.getParameter("defaultPageNum");
		  System.out.println("pageNumber ===> " + page);
		  String urlstr = "https://kr.api.riotgames.com/lol/league/v4/challengerleagues/by-queue/RANKED_SOLO_5x5?page="+page+"&api_key="+API_KEY;
			URL url = new URL(urlstr);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8")); 
			String result = "";
			String line;
			while((line = br.readLine()) != null) { 
				result = result + line;
			}
			
			JSONParser parser = new JSONParser();
			Object object = parser.parse(result.toString()); 
			JSONObject json = (JSONObject) object;
			System.out.println(json);
		return getMapFromJsonObject(json);
		
	}
	
	
	//해당 유저의 매치 정보데이터를 가져옵니다. 
	//요청변수 : matchId 
	
	@RequestMapping("/getMatchInfo")
	@ResponseBody
	public Map<String, Object> getMatchInfo(HttpServletRequest req , Model model) throws IOException, ParseException {
		  System.out.println("getMatchInfo!");
		  BufferedReader br = null;
		  /*
		  String page = req.getParameter("defaultPageNum");
		  System.out.println("pageNumber ===> " + page);
		  */
		  // 요청변수 (parameter)
		  String matchId = req.getParameter("matchId");
		  System.out.println("gameId====> " + matchId);
		  matchId = matchId.replace(".", "");
		  matchId = matchId.replace("E9","");
		  System.out.println("matchId Replaced! ===>" + matchId);
		  
		  String urlstr = "https://kr.api.riotgames.com/lol/match/v4/matches/"+matchId+"?api_key="+API_KEY;
			URL url = new URL(urlstr);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8")); 
			String result = "";
			String line;
			while((line = br.readLine()) != null) { 
				result = result + line;
			}
			
			JSONParser parser = new JSONParser();
			Object object = parser.parse(result.toString()); 
			JSONObject json = (JSONObject) object;
			System.out.println(json);
		return getMapFromJsonObject(json);
		
	}
	@RequestMapping("/MatchInfo")
	public String MatchInfo(HttpServletRequest req) {
		return "matchInfo";
	}
	@RequestMapping("/RankerList")
	public String RankerList(HttpServletRequest req ) {
		return "RankerList";
	}
	// 랜덤으로 소환사의 게임정보를 가져옵니다. 
		@RequestMapping("/RandomSpector")
		public String RandomSpector(HttpServletRequest req , Model model )
		{
			System.out.println("Random Summonner game info ");
			
			return "RandomSpector";
		}
		//test : random 게임관전 정보를 가져옵니다. 
		@RequestMapping("/getRandomSpector")
		@ResponseBody
		public Map<String, Object> getRandomSpector(HttpServletRequest req , Model model) throws IOException, ParseException {
			  System.out.println("getMatchInfo!");
			  BufferedReader br = null;	
			  // https://kr.api.riotgames.com/lol/spectator/v4/featured-games?api_key=RGAPI-7aa13dd6-fab2-4ce0-aac3-27add86f7677
			  String urlstr = "https://kr.api.riotgames.com/lol/spectator/v4/featured-games?api_key="+API_KEY;

				URL url = new URL(urlstr);
				HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
				urlconnection.setRequestMethod("GET");
				br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8")); 
				String result = "";
				String line;
				while((line = br.readLine()) != null) { 
					result = result + line;
				}
				
				JSONParser parser = new JSONParser();
				Object object = parser.parse(result.toString()); 
				JSONObject json = (JSONObject) object;
				System.out.println(json);
			return getMapFromJsonObject(json);
			
		}
		// 현재 게임중인 , 해당유저에 대한 게임중인 정보데이터를 가져옵니다. 
		// json object 일경우! 
		@RequestMapping("/getUserGameNowInfo")
		@ResponseBody
		public Map<String, Object> getUserGameNowInfo(HttpServletRequest req , Model model)  {
			  try {
			  System.out.println("getUserGameNowInfo!");
			  BufferedReader br = null;	
			  String getSummonnerEncryptedId = req.getParameter("getSummonnerEncryptedId");
			  System.out.println("getSummonnerEncryptedId ==> " + getSummonnerEncryptedId);
			  // https://kr.api.riotgames.com/lol/spectator/v4/active-games/by-summoner/JXQov2YMqrYNdmK59p8-X6XW--g3F5dNy_Mrp0uDJlFM6qY?api_key=RGAPI-7aa13dd6-fab2-4ce0-aac3-27add86f7677
			  String urlstr = "https://kr.api.riotgames.com/lol/spectator/v4/active-games/by-summoner/"+getSummonnerEncryptedId+"?api_key="+API_KEY;

				URL url = new URL(urlstr);
				HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
				//dead point => 게임중이 아닌 소환사일 경우 , 여기에서 exception 
				urlconnection.setRequestMethod("GET");
				
				br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8")); 
				String result = "";
				String line;
				while((line = br.readLine()) != null) { 
					result = result + line;
				}
				
				JSONParser parser = new JSONParser();
				Object object = parser.parse(result.toString()); 
				JSONObject json = (JSONObject) object;
				System.out.println(json);
			return getMapFromJsonObject(json);
			  }catch(Exception ex){
				 
				  return exception();
			  }
			
		}
		//게임중이 아닐경우 message 
		public Map<String,Object> exception(){
			Map<String, Object> map = new HashMap<String, Object> ();
			String ex = "해당소환사는 게임중이 아닙니다.";
			map.put("Error", ex);
			
			return map;
		}
		/*
		 * description : 해당소환사의 챔피언 숙련도를 가져옵니다.
		 * parameter : getSummonnerEncryptedId , api Key
		 * @Return : json 
		 * 
		 */
		@RequestMapping("/getchampionMastery")
		@ResponseBody
		public List<?> getchampionMastery(HttpServletRequest req , Model model) throws IOException, ParseException {
			System.out.println("getchampionMastery!");
			// /lol/champion-mastery/v4/champion-masteries/by-summoner/{encryptedSummonerId}
			  BufferedReader br = null;	
			  String getSummonnerEncryptedId = req.getParameter("getSummonnerEncryptedId");
						System.out.println("getId 로  champin mastery List select ");
						String urlstr = "https://kr.api.riotgames.com/lol/champion-mastery/v4/champion-masteries/by-summoner/"+
								getSummonnerEncryptedId		+"?api_key="+API_KEY;
						URL url = new URL(urlstr);
						
						HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
						urlconnection.setRequestMethod("GET");
						
						br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8")); // �뿬湲곗뿉 臾몄옄�뿴�쓣 諛쏆븘���씪.
						String result = "";
						String line;
						while((line = br.readLine()) != null) { 
							result = result + line;
						}
					
						JsonParser jsonParser = new JsonParser();
						JsonArray k = (JsonArray) jsonParser.parse(result);
						System.out.println("===========>" + k);
						Gson gson = new Gson();
						// 제네릭이라는 것 자체가 컴파일이 되고 나면 타입 소거가 되기 때문에 원래의 타입을 알 수 없게 되어 버린다.
						// 때문에 해당 제네릭의 타입을 유추한다 
						Type type = new TypeToken<List<Object>>(){}.getType();
					    List<Object> championMastery = gson.fromJson(k, type);
					    //model.addAttribute("championMastery",championMastery);
					    return championMastery;
		}
		@RequestMapping("/getAllLeagueEntriesSearch")
		public String getAllLeagueEntriesSearch(HttpServletRequest req, Model model) {
			return "getAllLeagueEntriesSearch";
		}
		@RequestMapping("/getAllLeagueEntries")
		@ResponseBody
		public List<Object> getAllLeagueEntries(HttpServletRequest req , Model model) throws IOException, ParseException {
			  System.out.println("getAllLeagueEntries!");
			  BufferedReader br = null;	
			  // https://kr.api.riotgames.com/lol/league/v4/entries/RANKED_SOLO_5x5/GOLD/I?page=1&api_key=RGAPI-36095518-f2a6-4129-b40b-c315613f91f5
			  /*
			   * @params
			   * 1) @ division (string)
			   * 2) @ tier (string)
			   * 3) @ queue (string) 
			   * 4) @ page (string) 
			   * 
			   * 요청 예시 => http://localhost:8082/myopggapp/getAllLeagueEntries?queue=RANKED_SOLO_5x5&tier=GOLD&division=I&page=1
			   */
			  String division = req.getParameter("division");
			  System.out.println("division ==>" +division );
			  String tier = req.getParameter("tier");
			  System.out.println("tier ==> " + tier);
			  String queue = req.getParameter("queue");
			  System.out.println("queue ==> " + queue);
			  String page = req.getParameter("page");
			  System.out.println("page ==> " + page);
			  // https://kr.api.riotgames.com/lol/league/v4/entries/RANKED_SOLO_5x5/GOLD/I?page=2&api_key=RGAPI-36095518-f2a6-4129-b40b-c315613f91f5
			  // https://kr.api.riotgames.com/lol/league/v4/entries/RANKED_SOLO_5x5/GOLD/I?page=1?api_key=RGAPI-36095518-f2a6-4129-b40b-c315613f91f5
			  if(page == null) {
				  page = "";
			  }
			  String urlstr = "https://kr.api.riotgames.com/lol/league/v4/entries/"+queue+"/"+tier+"/"+division+"?page="+page+"&api_key="+API_KEY;
			  
				URL url = new URL(urlstr);
				HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
				urlconnection.setRequestMethod("GET");
				br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8")); 
				String result = "";
				String line;
				while((line = br.readLine()) != null) { 
					result = result + line;
				}
				

				JsonParser jsonParser = new JsonParser();
				// String 객체를 jsonArray로 변환하는 과정
				JsonArray jsonArrayResult = (JsonArray) jsonParser.parse(result);			
				Gson gson = new Gson();
				// 제네릭이라는 것 자체가 컴파일이 되고 나면 타입 소거가 되기 때문에 원래의 타입을 알 수 없게 되어 버린다.
				// 때문에 해당 제네릭의 타입을 유추한다 
				Type type = new TypeToken<List<Object>>(){}.getType();
			    List<Object> getAllLeagueEntries = gson.fromJson(jsonArrayResult, type);
				
			return getAllLeagueEntries;
			
		}
		
		
		/**
		    * @description : 소환사 아이디 입력후 , puuid 를 통해 match id를 가져옵니다 
		    * @Api : /lol/match/v5/matches/by-puuid/{puuid}/ids
		    * @example : https://asia.api.riotgames.com/lol/match/v5/matches/by-puuid/CdQu2rBm3j7Kmi9R9ABTP2gTvIggOAF0zI3WjYHmEY_S5oIwQuE-_UMOkI2OdUO4ZgTL43U6qwC17g/ids?start=0&count=20&api_key=RGAPI-b2f4dc60-f934-4afe-91ea-d9ec18c35685
		    * @param req
		    * @param : puuid 
		    * @return : jsonArray
		    * @sample : puuid => CdQu2rBm3j7Kmi9R9ABTP2gTvIggOAF0zI3WjYHmEY_S5oIwQuE-_UMOkI2OdUO4ZgTL43U6qwC17g
		    * @test url : http://localhost:8083/getMatchList?puuid=CdQu2rBm3j7Kmi9R9ABTP2gTvIggOAF0zI3WjYHmEY_S5oIwQuE-_UMOkI2OdUO4ZgTL43U6qwC17g
		    */
		   
		   @RequestMapping("/getMatchIds")
		   @ResponseBody
		   public List<?> getMatchIds(HttpServletRequest req , Model model) throws IOException, ParseException {
		        String puuid = req.getParameter("puuid");
		        BufferedReader br = null;   

		            
		               String urlstr = "https://asia.api.riotgames.com/lol/match/v5/matches/by-puuid/"+
		                     puuid+"/ids?start=0&count=20&api_key="+API_KEY;
		               URL url = new URL(urlstr);
		               
		               HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
		               urlconnection.setRequestMethod("GET");
		               
		               br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8")); //  
		               String result = "";
		               String line;
		               while((line = br.readLine()) != null) { 
		                  result = result + line;
		               }
		            
		               JsonParser jsonParser = new JsonParser();
		               JsonArray k = (JsonArray) jsonParser.parse(result);
		               System.out.println("===========>" + k);
		               Gson gson = new Gson();
		               // 제네릭이라는 것 자체가 컴파일이 되고 나면 타입 소거가 되기 때문에 원래의 타입을 알 수 없게 되어 버린다.
		               // 때문에 해당 제네릭의 타입을 유추한다 
		               Type type = new TypeToken<List<Object>>(){}.getType();
		                List<Object> getMatchList = gson.fromJson(k, type);
		                //model.addAttribute("championMastery",championMastery);
		                return getMatchList;
		   }
		   
		   
		   
		   
		   /**
		    * @description : match id 를 기준으로 matchlist 데이터 정보들을 가져옵니다.  
		    * @Api : /lol/match/v5/matches/{matchId}
		    * @param req
		    * @param matchId 
		    * @url : https://asia.api.riotgames.com/lol/match/v5/matches/KR_5460959012?api_key=RGAPI-b2f4dc60-f934-4afe-91ea-d9ec18c35685
		    * @return
		    * @throws org.json.simple.parser.ParseException
		    * @return : json Object  
		    */
		   @RequestMapping(value="/getMatchListByIds",method = RequestMethod.GET)
		   @ResponseBody
		   public Map<String, Object> getMatchListByIds(HttpServletRequest req ,Model model) throws IOException, ParseException, org.json.simple.parser.ParseException {
		        String matchId = req.getParameter("matchId");
		        BufferedReader br = null;   

		            
		               String urlstr = "https://asia.api.riotgames.com/lol/match/v5/matches/"+
		                     matchId+"/?api_key="+API_KEY;
		               URL url = new URL(urlstr);
		               
		               HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
		               urlconnection.setRequestMethod("GET");
		               
		               br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8")); //  
		               String result = "";
		               String line;
		               while((line = br.readLine()) != null) { 
		                  result = result + line;
		               }
		            
		               JSONParser parser = new JSONParser();
		               Object object = parser.parse(result.toString()); 
		               JSONObject json = (JSONObject) object;
		               System.out.println(json);
		               return getMapFromJsonObject(json);
		   
		   }
		   
		
		
	public Map<String , Object > getMapFromJsonObject(JSONObject jsonObj){
		Map<String , Object >map = null;
		try {
			map = new ObjectMapper().readValue(jsonObj.toJSONString(),Map.class);
			System.out.println("map data ===> " + map );
			
		}catch(JsonParseException e) {
			
		}catch(JsonMappingException e) {
			
		}catch(IOException e) {
			
		}
		return map;
		
	}
}
