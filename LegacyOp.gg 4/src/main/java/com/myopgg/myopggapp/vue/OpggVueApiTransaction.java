package com.myopgg.myopggapp.vue;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonParseException;

@Controller
public class OpggVueApiTransaction {
	final static String API_KEY = "RGAPI-715e6e7f-64c0-4532-817f-0cdaeb4d6854";
	@RequestMapping("/getRotationChapion")
	@ResponseBody
	public Map<String, Object> getRotationChampion(HttpServletRequest req , Model model) throws IOException, ParseException {
		  System.out.println(" Main Page() Start!  ");
		  BufferedReader br = null;
	
		  String urlstr = "https://kr.api.riotgames.com/lol/platform/v3/champion-rotations?api_key="+API_KEY+"+";
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
	
	@RequestMapping("/searchSummoner")
	@ResponseBody
	public Map<String, Object> searchSummoner(HttpServletRequest req , Model model) throws IOException, ParseException {
		  System.out.println("search Start!");
		  BufferedReader br = null;
		  String SummonerName = req.getParameter("SummonerName");
		  System.out.println("SummonerName ==== > " + SummonerName);
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
			
			JSONParser parser = new JSONParser();
			Object object = parser.parse(result.toString()); 
			JSONObject json = (JSONObject) object;
			System.out.println(json);
		return getMapFromJsonObject(json);
		
	}
	
	@RequestMapping("/summonerStats")
	@ResponseBody
	public Map<String, Object> summonerStats(HttpServletRequest req , Model model) throws IOException, ParseException {
		  System.out.println("summonerStats Start!");
		  BufferedReader br = null;
		  String SummonerName = req.getParameter("SummonerName");
		  System.out.println("SummonerName ==== > " + SummonerName);
		  String urlstr = "https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/"+
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
