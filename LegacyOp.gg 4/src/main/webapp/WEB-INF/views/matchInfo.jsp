<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page session="false"%>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0"
	crossorigin="anonymous">
<title>Home</title>
</head>
<style>
#issue{
padding-top:20px;
font-size:20px;
text-align:center;

font-color:black;
font-weight:bold;

}
* {
	padding: 0;
	margin: 0;
}

.nav_container {
	background-color: black;
	color: white;
	display: flex;
	padding: 5px;
	font-size: 13px;
}

body {
	background-color:white;
}

.items {
	list-style: none;
	display: flex;
}

.item-list {
	display: flex;
	align-items: center;
}

.opgg_logo {
	margin: 12px 16px;
	width: 57px;
	height: 14px;
}

.opgg_logo img {
	width: 100%;
}

.item-list {
	padding-left: 10px;
	padding-right: 10px;
}

.main_banner {
	text-align: center;
	margin-top: 50px;
	margin-bottom: 20px;
}

.user_search {
	width: 600px;
	margin: 0 auto;
}

.search_title {
	color: white;
	font-weight: bold;
	text-align: center;
	font-size: 50px;
}
.rotation_champion{
	text-align:center;
	margin-top:20px;
	font-weight:bold;
	color:white;
	font-size:40px;
	
	
}
.rotation_items{
	text-align:center;
	width: 900px;
	margin: 0 auto;
	
}
.ShowchampionStatics{
	color:white;
	font-weight:bold;
	text-decoration : none;
}
.table_items{
	width:1000px;
	margin:0 auto;
	
	
}
.image{
text-align:center;}
.page-item{
    width:50px;
    border:1px solid black;
    font-weight:bold;
    cursor: pointer;
}
.paging{
 width:100px;
 margin:0 auto;
text-align:center;}


.images img{
	width:50%;
}
.summonerInfo{
width:1000px;
margin: 0 auto;
}
.title23{
	text-align:center;
}
.images2 img{
	width:2																																																																																																																																																																																																																																																																																																	0%;
}

.teams{
	width:1000px;
	margin: 0 auto;
}
.champion img{
	width:60%;
}
.winLose{
font-weight:bold;}
.para{

text-align:center;}
.st{
text-align:center;
font-weight:bold;
font-size:30px;

}
.st2{

text-align:center;
font-weight:bold;
font-size:30px;
}
.bannedTitle{
text-align:center;
}
.banned_champions{
	display:flex;

	justify-content:center;
	
	
}
.main_banner_images{

	text-align:center;
}
.stats{
	padding-left:20px;
	padding-right:20px;
	
}
</style>
<body>
	<div class="main_wrap">
		<header class="nav_container">
			<div class="opgg_logo">
			<h1>  </h1>
			<img src="https://opgg-static.akamaized.net/images/gnb/svg/00-opgglogo.svg">
			</div>
			<nav class="nav_items">
				<ul class="items">
					<li class="item-list"><img src="https://opgg-gnb.akamaized.net/static/images/icons/img-navi-lol-white.svg"><p>League of Legends</p> </li>
					<li class="item-list"><img src="https://opgg-gnb.akamaized.net/static/images/icons/img-navi-pubg-gray.svg"><p>PUBG</p> </li>
					<li class="item-list"><img src="https://opgg-gnb.akamaized.net/static/images/icons/img-navi-overwatch-gray.svg"><p>OVERWATCH</p> </li>
					<li class="item-list"><img src="https://opgg-gnb.akamaized.net/static/images/icons/img-navi-fortnite-gray.svg"><p>FORTNITE</p> </li>
					<li class="item-list"><img src="https://opgg-gnb.akamaized.net/static/images/icons/img-navi-r-6-gray.svg"><p>RainbowSix Siege</p> </li>
					
					<form action="/myopggapp/search" method ="get">
				<div class="input-group mb-3">
  
  <input type="text" name="SummonerName" class="form-control" placeholder="소환사이름 + enter" aria-label="Username" aria-describedby="basic-addon1">
</div>
			
			</form>	
				</ul>
			
			
			</nav>
		
		</header>

		<div class="main_contents">
			<div class="main_banner_images">
			  <img src="https://opgg-static.akamaized.net/logo/20210717025919.c71d1c8b76704b41ad64462ac4e7ef5c.png">
			</div>
			<h1 class="title23"> 전적 상세정보 : {{test4}} </h1>
			<p class="para"> 게임에 참여한 소환사들 </p>
			<div class="summonerInfo">
			<table class="table table-striped" >
      <tr>
      	<td> 소환사 아이콘 </td>
         <td> 소환사 이름</td>
      </tr>
   
      <tr v-for="(dataList, idx) in participantIdentities" :key="idx">
     	<td> 
     	<div class="images2"> <img :src="'https://opgg-static.akamaized.net/images/profile_icons/profileIcon' + dataList.player.profileIcon +'.jpg?image=q_auto:best&v=1518361200'"></div> </td>
     	<td> 
     	<a :href="'/myopggapp/search?SummonerName=' + dataList.player.summonerName"  style="black">{{dataList.player.summonerName}} </a>
     	
     	</td>
      </tr>
     
    
         
   </table>
			
</div>

<h1 class="bannedTitle"> 밴 정보 </h1>

<div class="banned_champions">
	<div class="banned_1">
	<table class="table table-striped" >
      <tr>
      <td> 금지한 챔피언 </td> 
      <td> 픽 turn </td> 
   
     
      
      </tr>
   
      <tr v-for="(dataList, idx) in championBans1" :key="idx">
       <td>
       {{dataList.championId}}
       <img :src="'//z.fow.kr/champ/'+dataList.championId+'_64.png'">
         <div class="banned_champion_images" v-if="dataList.championId == '-1'">
       		밴하지 않음
       </div>
       </td>
       <td>
       {{dataList.pickTurn}}
       </td>
      
     
      </tr>
     
    
         
   </table>
   </div>
   
   <div class="banned_2">
	<table class="table table-striped" >
      <tr>
      <td> 금지한 챔피언 </td>  
     <td> 픽 turn </td>  
     
      
      </tr>
   
      <tr v-for="(dataList, idx) in championBans2" :key="idx">
       <td>
      	  <img :src="'//z.fow.kr/champ/'+dataList.championId+'_64.png'">
      	    <div class="banned_champion_images" v-if="dataList.championId == '-1'">
       		밴하지 않음
       </div>
      {{dataList.championId}}
       </td>
          <td>
       {{dataList.pickTurn}}
       </td>
     
      </tr>
     
    
         
   </table>
   </div>


</div>

		<p class="st2"> 팀 오브젝트 정보  </p>
	<div class="teams">
	<table class="table table-striped" >
      <tr>
      <td>팀아이디</td>
       <td>승리여부</td>
      	<td> 타워 킬수 </td>
         <td> 전령킬수</td>
         <td> 퍼스트블러드</td>
         
         <td> 첫드래곤</td>
          <td> 드래곤 킬수</td>
          <td>바론킬수</td>
          <td>첫 억제기 파괴</td>
          <td>첫 전령 처치</td>
          
      </tr>
   
      <tr v-for="(dataList, idx) in team" :key="idx">
    		  <td>
     		<div class="blue" v-if="dataList.teamId == 100">
     			파랑팀
     		</div>
     		<div class="red" v-else>
     			빨강팀
     		</div>
      </td>
       <td>
      
       <div class="win" v-if="dataList.win == 'Win'">
     			승리
      </div>
        <div class="lose" v-else>
     		패배
      </div>
       
       
       </td>
     	<td> 
     	{{dataList.towerKills}}
     	</td>
    	<td> 
     	{{dataList.riftHeraldKills}}
     	</td>
     	<td> 
     	
     	{{dataList.firstBlood}}
     	</td>
     	
     	<td> 
     	{{dataList.firstDragon}}
     	</td>
     	<td> 
     	{{dataList.dragonKills}}
     	</td>
     	<td>
     	{{dataList.baronKills}}
     	</td>
     	<td>
     	{{dataList.firstInhibitor}}
     	</td>
     	<td>
     	{{dataList.firstRiftHerald}}
     	</td>
     
      </tr>
     
    
         
   </table>


</div>
	<div class="teams">
	<table class="table table-striped" >
      <tr>
      <td> 팀 </td>  
   
      <td> 억제기 파괴 수 </td>
      <td> 첫 타워 파괴 </td>
      
      </tr>
   
      <tr v-for="(dataList, idx) in championBans" :key="idx">
       <td>
       <div class="blue" v-if="dataList.teamId == 100">
     			파랑팀
     		</div>
     		<div class="red" v-else>
     			빨강팀
     		</div>
       </td>
      
       <td>
     	{{dataList.inhibitorKills}}
      </td>
    
      <td>
      {{dataList.firstTower}}
      
      </td>
      
     
      </tr>
     
    
         
   </table>


</div>
		
		
		
		
		
		
	<div class="stats">
		<p class="st"> 게임 분석  </p>
		<table class="table table-striped" >
      <tr>
      	<td> 승패 여부 </td>
      	<td> 챔피언 </td>
      	<td> 스펠 정보1 </td>
		<td> 스펠 정보2</td>
		<td> 아이템 1</td>
		<td> 아이템 2</td>
		<td> 아이템 3</td>
		<td> 아이템 4</td>
		<td> 아이템 5</td>
		<td> 아이템 6</td>
		<td> 아이템 7</td>
		<td>킬</td>
		<td>데스</td>
		<td>어시스트</td>
		<td> 미니언 처치수</td>
		<td> 몬스터 처치수 </td>
		<td> 챔피언레벨 </td>
		<td> 골드 흭득</td>
		<td> 골드 소비 </td>
		<td> 시야점수 </td>
		<td> 와드 지운횟수 </td>
		<td> 와드 설치 횟수 </td>
		<td> 시야와드 구입횟수 </td>
		<td> 더블킬 </td>
		<td> 트리플킬  </td>
		<td> 쿼드라킬 </td>
		<td> 펜타킬 </td>
		<td> 물리피해량 </td>
		<td>챔피언한테 준 물리피해량</td> 
		<td>받은 물리피해량</td>
		<td> 총피해량</td>
		<td>챔피언한테가한피해량</td>
		<td>총피해량</td>
		<td>총 힐량</td>
		<td>총 유닛 횟수</td>
		<td>실제 준 피해량</td>
		<td>실제 챔피언한테 준 피해량</td>
		<td>실제 받은 피해량</td>
		
      </tr>
   
      <tr v-for="(dataList, idx) in participants" :key="idx" >
     
       <td> 
       <div class="winLose" v-if="dataList.stats.win == true">
         승리 
       </div>
       <div class="winLose" v-else>
         패배
       </div>
       
       
       
       </td>
      <td>
      
   
      
       {{dataList.championId}}
		  <img :src="'//z.fow.kr/champ/'+dataList.championId+'_64.png'">
      
      </td>
      
      
      
      <td>
      {{dataList.spell1Id}}
      <div class="spell1" v-if= "dataList.spell1Id == 21">
      <img src="https://opgg-static.akamaized.net/images/lol/spell/SummonerBarrier?image=c_scale,q_auto,w_22&v=1626880099">
      </div>
      
      <div class="spell1" v-if= "dataList.spell1Id == 1">
       <img src="https://opgg-static.akamaized.net/images/lol/spell/SummonerBoost.png?image=c_scale,q_auto,w_42&v=1626880099">
      </div>
      
      <div class="spell1" v-if= "dataList.spell1Id == 14">
      <img src="https://opgg-static.akamaized.net/images/lol/spell/SummonerDot.png?image=c_scale,q_auto,w_42&v=1626880099">
      </div>
      
      <div class="spell1" v-if= "dataList.spell1Id == 3">
      <img src="https://opgg-static.akamaized.net/images/lol/spell/SummonerExhaust.png?image=c_scale,q_auto,w_42&v=1626880099">
      </div>
      
      <div class="spell1" v-if= "dataList.spell1Id == 4">
      <img src="https://opgg-static.akamaized.net/images/lol/spell/SummonerFlash.png?image=c_scale,q_auto,w_42&v=1626880099">
      </div>
      
      <div class="spell1" v-if= "dataList.spell1Id == 6">
        <img src="https://opgg-static.akamaized.net/images/lol/spell/SummonerHaste.png?image=c_scale,q_auto,w_22&v=1626880099">
      </div>
      
      <div class="spell1" v-if= "dataList.spell1Id == 7">
      <img src="https://opgg-static.akamaized.net/images/lol/spell/SummonerHeal.png?image=c_scale,q_auto,w_42&v=1626880099">
      </div>
      
      <div class="spell1" v-if= "dataList.spell1Id == 11">
      <img src="https://opgg-static.akamaized.net/images/lol/spell/SummonerSmite.png?image=c_scale,q_auto,w_42&v=1626880099">
      </div>
      
      <div class="spell1" v-if= "dataList.spell1Id == 12">
      <img src="https://opgg-static.akamaized.net/images/lol/spell/SummonerTelePort.png?image=c_scale,q_auto,w_42&v=1626880099">
      </div>
      
       
      
       </td>
      <td> 
      {{dataList.spell2Id}}
       <div class="spell2" v-if= "dataList.spell2Id == 21">
      <img src="https://opgg-static.akamaized.net/images/lol/spell/SummonerBarrier?image=c_scale,q_auto,w_22&v=1626880099">
      </div>
           <div class="spell2" v-if= "dataList.spell2Id == 54">
           
      <img src="https://opgg-static.akamaized.net/images/lol/spell/Summoner_UltBook_Placeholder.png?image=c_scale,q_auto,w_22&v=1626880099">
      </div>
      
      <div class="spell2" v-if= "dataList.spell2Id == 1">
       <img src="https://opgg-static.akamaized.net/images/lol/spell/SummonerBoost.png?image=c_scale,q_auto,w_42&v=1626880099">
      </div>
      
      <div class="spell2" v-if= "dataList.spell2Id == 14">
      <img src="https://opgg-static.akamaized.net/images/lol/spell/SummonerDot.png?image=c_scale,q_auto,w_42&v=1626880099">
      </div>
      
      <div class="spell2" v-if= "dataList.spell2Id == 3">
      <img src="https://opgg-static.akamaized.net/images/lol/spell/SummonerExhaust.png?image=c_scale,q_auto,w_42&v=1626880099">
      </div>
      
      <div class="spell2" v-if= "dataList.spell2Id == 4">
      <img src="https://opgg-static.akamaized.net/images/lol/spell/SummonerFlash.png?image=c_scale,q_auto,w_42&v=1626880099">
      </div>
      
      <div class="spell2" v-if= "dataList.spell2Id == 6">
        <img src="https://opgg-static.akamaized.net/images/lol/spell/SummonerHaste.png?image=c_scale,q_auto,w_22&v=1626880099">
      </div>
      
      <div class="spell2" v-if= "dataList.spell2Id == 7">
      <img src="https://opgg-static.akamaized.net/images/lol/spell/SummonerHeal.png?image=c_scale,q_auto,w_42&v=1626880099">
      </div>
      
      <div class="spell2" v-if= "dataList.spell2Id == 11">
      <img src="https://opgg-static.akamaized.net/images/lol/spell/SummonerSmite.png?image=c_scale,q_auto,w_42&v=1626880099">
      </div>
      
      <div class="spell2" v-if= "dataList.spell2Id == 12">
      <img src="https://opgg-static.akamaized.net/images/lol/spell/SummonerTelePort.png?image=c_scale,q_auto,w_42&v=1626880099">
      </div>
      
      
      </td>
      
       
      <td> 
      
  		         
      {{dataList.stats.item0}} 
      <img :src="'//z.fow.kr/items3/'+dataList.stats.item0+'.png'"></td>
       <td> {{dataList.stats.item1}}
       <img :src="'//z.fow.kr/items3/'+dataList.stats.item1+'.png'"> </td>
        <td> {{dataList.stats.item2}} 
        <img :src="'//z.fow.kr/items3/'+dataList.stats.item2+'.png'"></td>
         <td> {{dataList.stats.item3}} 
         <img :src="'//z.fow.kr/items3/'+dataList.stats.item3+'.png'"></td>
          <td> {{dataList.stats.item4}} 
          <img :src="'//z.fow.kr/items3/'+dataList.stats.item4+'.png'"></td>
           <td> {{dataList.stats.item5}}
           <img :src="'//z.fow.kr/items3/'+dataList.stats.item5+'.png'"> </td>
            <td> {{dataList.stats.item6}} 
            <img :src="'//z.fow.kr/items3/'+dataList.stats.item6+'.png'"></td>
       <td>{{dataList.stats.kills}}</td>
        <td>{{dataList.stats.deaths}}</td>
        <td>{{dataList.stats.assists}}</td>
        <td>{{dataList.stats.totalMinionsKilled}}</td>
        <td>{{dataList.stats.neutralMinionsKilled}}</td>
        <td>{{dataList.stats.champLevel}}</td>
         <td>{{dataList.stats.goldEarned}}</td>
        <td>{{dataList.stats.goldSpent}}</td>
        <td>{{dataList.stats.visionScore}}</td>
     	<td>{{dataList.stats.wardsKilled}}</td>
        <td>{{dataList.stats.wardsPlaced}}</td>
        <td>{{dataList.stats.visionWardsBoughtInGame}}</td>
       
       	<td>{{dataList.stats.doubleKills}}</td>
       		<td>{{dataList.stats.tripleKills}}</td>
       			<td>{{dataList.stats.quadraKills}}</td>
       					<td>{{dataList.stats.pentaKills}}</td>
       					
       					
       	 <td>{{dataList.stats.physicalDamageDealt}} </td>
       	<td>{{dataList.stats.physicalDamageDealtToChampions}}</td>
       <td>{{dataList.stats.physicalDamageTaken}}</td>
      <td>{{dataList.stats.totalDamageDealt}}</td>
      <td>{{dataList.stats.totalDamageDealtToChampions}}</td>
      <td> {{dataList.stats.totalDamageTaken}}</td>
      <td>{{dataList.stats.totalHeal}}</td>
      <td>{{dataList.stats.totalUnitsHealed}}</td>
      <td>{{dataList.stats.trueDamageDealt}}</td>
      <td>{{dataList.stats.trueDamageDealtToChampions}}</td>
      <td>{{dataList.stats.trueDamageTaken}}
                
      </tr>
     
    
         
   </table>
		
</div>

		

	</div>
	

</body>
</html>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>

<script>
    const app = new Vue({
        el: '.main_wrap',
        data: {
        	issue: '',
        	participantIdentities:'',
        	participants:'',
        	test:'',
        	test4:'',
        	team:'',
        	championBans:'',
        	championBans1:'',
        	championBans2:'',
        	
        },
        mounted(){
        	 axios.get('http://localhost:8082/myopggapp/status')  
     	    .then((res)=>{
     	      //  console.log(res.data.incidents[0].titles[1]); //문제 원인 제목 
     	        //console.log(res.data.incidents[0].updates[0].translations[1].content);
     	       //this.issue = res.data.maintenances[0].updates[0].translations[1].content;
     	        console.log(res);
     	        
     	    }) 	
        },
        created(){
        	var matchId = location.search;
        	console.log("matchId ==> " +matchId);
        	var params = new URLSearchParams(matchId);
        	matchId = params.get('matchId');
        	console.log(matchId);
        	 axios.get('http://localhost:8082/myopggapp/getMatchInfo',{
       		 params:{
       			matchId:matchId
       		 }
   		 }) 
      	    .then((res)=>{
      	    	console.log( res.data);
      	    	console.log(res.data.teams[0].bans);
      	    	this.participantIdentities = res.data.participantIdentities;
      	        this.participants = res.data.participants;
      	        this.test = res.data;
      	        this.test4 = res.data.gameMode;
      	        this.test5 = res.data.participantIdentities;
      	        this.team = res.data.teams;
      	        this.championBans = res.data.teams;
      	      	this.championBans1 = res.data.teams[0].bans;
    	        this.championBans2 = res.data.teams[1].bans;
      	       
      	        
      	    }) 
        	
        },
        methods: {
        	
        	 
        },
    });
</script>
