package com.myopgg.myopggapp.utils;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import org.springframework.util.StringUtils;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.reflect.TypeToken;

public class IdForNameUtil {

	public List<String> ChangeName(JsonArray freeChampionIds) {
		Gson gson = new Gson();
		List<String> nameList = new ArrayList<String>();
		
		if ( freeChampionIds != null ) {
			// api로 통신한챔피언 고유 번호를 챔피언 이름으로 변환합니다.
			Type type = new TypeToken<List<String>>(){}.getType();
		    List<String> contactList = gson.fromJson(freeChampionIds, type);
		    
		    for ( String idx : contactList ) {
		    	String chgName = "";
		    	if ( StringUtils.pathEquals("3", idx) ) {
		    		chgName = "Galio";
		    	} else if ( StringUtils.pathEquals("6", idx) ) {
		    		chgName = "Urgot";
		    	} else if( StringUtils.pathEquals("23", idx)) {
		    		chgName = "Tryndamere";
		    	} else if ( StringUtils.pathEquals("40", idx)) {
		    		chgName = "Janna";
		    	} else if ( StringUtils.pathEquals("50" ,idx)) {
		    		chgName ="Swain";
		    	} else if ( StringUtils.pathEquals("59", idx)) {
		    		chgName = "JarvanIV";
		    	} else if ( StringUtils.pathEquals("69", idx)) {
		    		chgName = "Cassiopeia";
		    	} else if ( StringUtils.pathEquals("74", idx)) {
		    		chgName = "Heimerdinger";
		    	} else if ( StringUtils.pathEquals("96", idx)) {
		    		chgName = "KogMaw";
		    	} else if ( StringUtils.pathEquals("106", idx)) {
		    		chgName = "Volibear";
		    	} else if ( StringUtils.pathEquals("119", idx)) {
		    		chgName = "Draven";
		    	} else if ( StringUtils.pathEquals("143", idx)) {
		    		chgName = "Zyra";
		    	} else if ( StringUtils.pathEquals("154", idx)) {
		    		chgName = "Zac";
		    	} else if ( StringUtils.pathEquals("163", idx)) {
		    		chgName = "Lillia";
		    	} else if ( StringUtils.pathEquals("245", idx)) {
		    		chgName = "Ziggs";
		    	} else if( StringUtils.pathEquals("21", idx)) {
		    		chgName = "MissFortune";
		    	} else if(StringUtils.pathEquals("22", idx)) {
		    		chgName ="Ashe";
		    	} else if(StringUtils.pathEquals("28", idx)) {
		    		chgName ="Evelynn";
		    	}else if(StringUtils.pathEquals("37", idx)) {
		    		chgName ="Sona";
		    	}else if(StringUtils.pathEquals("45", idx)) {
		    		chgName ="Veigar";
		    	}else if(StringUtils.pathEquals("54", idx)) {
		    		chgName ="Malphite";
		    	}else if(StringUtils.pathEquals("57", idx)) {
		    		chgName ="Maokai";
		    	}else if(StringUtils.pathEquals("86", idx)) {
		    		chgName ="Garen";
		    	}else if(StringUtils.pathEquals("115", idx)) {
		    		chgName ="Ziggs";
		    	}else if(StringUtils.pathEquals("142", idx)) {
		    		chgName ="Zoe";
		    	}else if(StringUtils.pathEquals("157", idx)) {
		    		chgName ="Yasuo";
		    	}else if(StringUtils.pathEquals("240", idx)) {
		    		chgName ="Kled";
		    	}else if(StringUtils.pathEquals("254", idx)) {
		    		chgName ="Vi";
		    	}else if(StringUtils.pathEquals("526", idx)) {
		    		chgName ="Rell";
		    	}else if(StringUtils.pathEquals("7", idx)) {
		    		chgName ="LeBlanc";
		    	}else if(StringUtils.pathEquals("19", idx)) {
		    		chgName ="Warwick";
		    	}else if(StringUtils.pathEquals("29", idx)) {
		    		chgName ="Twitch";
		    	}else if(StringUtils.pathEquals("39", idx)) {
		    		chgName ="Irelia";
		    	}else if(StringUtils.pathEquals("42", idx)) {
		    		chgName ="Corki";
		    	}else if(StringUtils.pathEquals("53", idx)) {
		    		chgName ="Blitzcrank";
		    	}else if(StringUtils.pathEquals("55", idx)) {
		    		chgName ="Katarina";
		    	}else if(StringUtils.pathEquals("82", idx)) {
		    		chgName ="Mordekaiser";
		    	}else if(StringUtils.pathEquals("83", idx)) {
		    		chgName ="Yorick";
		    	}else if(StringUtils.pathEquals("98", idx)) {
		    		chgName ="Shen";
		    	}else if(StringUtils.pathEquals("83", idx)) {
		    		chgName ="Yorick";
		    	}else if(StringUtils.pathEquals("104", idx)) {
		    		chgName ="Graves";
		    	}else if(StringUtils.pathEquals("164", idx)) {
		    		chgName ="Camille";
		    	}else if(StringUtils.pathEquals("497", idx)) {
		    		chgName ="Rakan";
		    	}else if(StringUtils.pathEquals("498", idx)) {
		    		chgName ="Xayah";
		    	}else if(StringUtils.pathEquals("518", idx)) {
		    		chgName ="Neeko";
		    	}
		    	else if(StringUtils.pathEquals("4", idx)) {
		    		chgName ="TwistedFate";
		    	}
		    	else if(StringUtils.pathEquals("31", idx)) {
		    		chgName ="ChoGath";
		    	}
		    	else if(StringUtils.pathEquals("9", idx)) {
		    		chgName ="Fiddlesticks";
		    	}else if(StringUtils.pathEquals("10", idx)) {
		    		chgName ="Kayle";
		    	}else if(StringUtils.pathEquals("17", idx)) {
		    		chgName ="Teemo";
		    	}else if(StringUtils.pathEquals("20", idx)) {
		    		chgName ="Nunu";
		    	}else if(StringUtils.pathEquals("26", idx)) {
		    		chgName ="Zilean";
		    	}else if(StringUtils.pathEquals("36", idx)) {
		    		chgName ="DrMundo";
		    	}else if(StringUtils.pathEquals("38", idx)) {
		    		chgName ="Kassadin";
		    	}else if(StringUtils.pathEquals("77", idx)) {
		    		chgName ="Udyr";
		    	}else if(StringUtils.pathEquals("79", idx)) {
		    		chgName ="Gragas";
		    	}else if(StringUtils.pathEquals("103", idx)) {
		    		chgName ="Ahri";
		    	}
		    	else if(StringUtils.pathEquals("110", idx)) {
		    		chgName ="Varus";
		    	}else if(StringUtils.pathEquals("134", idx)) {
		    		chgName ="Syndra";
		    	}else if(StringUtils.pathEquals("267", idx)) {
		    		chgName ="Nami";
		    	}else if(StringUtils.pathEquals("523", idx)) {
		    		chgName ="Aphelios";
		    	}else if(StringUtils.pathEquals("4", idx)) {
		    		chgName ="Twisted Fate";
		    	}else if(StringUtils.pathEquals("30", idx)) {
		    		chgName ="Karthus";
		    	}else if(StringUtils.pathEquals("31", idx)) {
		    		chgName ="Cho'Gath";
		    	}else if(StringUtils.pathEquals("32", idx)) {
		    		chgName ="Amumu";
		    	}else if(StringUtils.pathEquals("44", idx)) {
		    		chgName ="Taric";
		    	}else if(StringUtils.pathEquals("48", idx)) {
		    		chgName ="Trundle";
		    	}else if(StringUtils.pathEquals("62", idx)) {
		    		chgName ="MonkeyKing";
		    	}else if(StringUtils.pathEquals("107", idx)) {
		    		chgName ="Rengar";
		    	}else if(StringUtils.pathEquals("266", idx)) {
		    		chgName ="Aatrox";
		    	}else if(StringUtils.pathEquals("268", idx)) {
		    		chgName ="Azir";
		    	}else if(StringUtils.pathEquals("350", idx)) {
		    		chgName ="Yuumi";
		    	}else if(StringUtils.pathEquals("360", idx)) {
		    		chgName ="Samira";
		    	}else if(StringUtils.pathEquals("516", idx)) {
		    		chgName ="Ornn";
		    	}
		    	nameList.add(chgName);
		    }
		}
		
		return nameList;
	}
}
