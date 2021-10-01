<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
* {
	padding: 0;
	margin: 0;
}

.nav_container {
	background-color: black;
	color: white;
	display: flex;
	padding: 5px;
	justify-content: space-between;
	font-size: 13px;
}

body {
	background-color: rgb(21, 107, 255);
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

.result_area {
	
}

.main_contents {
	width: 1550px;
	background-color: white;
	border-radius: 10px;
	margin-top: 50px;
	padding-left: 100px;
	padding-top: 100px;
	margin: 0 auto;
}

.result_area {
	display: flex;
}

.summoner_level {
	font-weight: bold;
}

.summoner_info {
	
}

.summoner {
	font-weight: bold;
	font-size: 40px;
}

.Button_refresh {
	border: 1px solid #1a78ae;
	background: #1f8ecd;
	color: #f2f2f2;
	padding: 11px 14px 10px;
	border-radius: 2px;
	font-weight: bold;
	width: 150px;
	text-align: center;
	cursor: pointer;
}

.image_rank img {
	width: 20%;
}

.result_rank {
	margin-top: 50px;
}

.left_rank_area {
	
}

.icon_area img {
	width: 70%;
}

.icon_area {
	width: 200px;
}

.rank_name {
	font-weight: bold;
}

.result_rank {
	display: flex;
}

.gameInfo_table {
	display: flex;
}

.buttons_area {
	display: flex;
	align-items: center;
}

.button_items_champmastery {
	width: 150px;
	height: 47px;
	line-height: 47px;
	text-align: center;
	font-weight: bold;
	cursor: pointer;
	background-color: black;
	color: white;
	border-radius: 2px;
}

.champmastery_items {
	margin-left: 20px;
}

.table_list_items {
	display: flex;
}
</style>
<body>
	<div class="main_wrap">
		<header class="nav_container">
			<div class="opgg_logo">
				<h1></h1>
				<img
					src="https://opgg-static.akamaized.net/images/gnb/svg/00-opgglogo.svg">
			</div>
			<nav class="nav_items">
				<ul class="items">
					<li class="item-list"><img
						src="https://opgg-gnb.akamaized.net/static/images/icons/img-navi-lol-white.svg">
						<p>League of Legends</p></li>
					<li class="item-list"><img
						src="https://opgg-gnb.akamaized.net/static/images/icons/img-navi-pubg-gray.svg">
						<p>PUBG</p></li>
					<li class="item-list"><img
						src="https://opgg-gnb.akamaized.net/static/images/icons/img-navi-overwatch-gray.svg">
						<p>OVERWATCH</p></li>
					<li class="item-list"><img
						src="https://opgg-gnb.akamaized.net/static/images/icons/img-navi-fortnite-gray.svg">
						<p>FORTNITE</p></li>
					<li class="item-list"><img
						src="https://opgg-gnb.akamaized.net/static/images/icons/img-navi-r-6-gray.svg">
						<p>RainbowSix Siege</p></li>

					<form action="/myopggapp/search" method="get">
						<div class="input-group mb-3">

							<input type="text" name="SummonerName" class="form-control"
								placeholder="소환사이름 + enter" aria-label="Username"
								aria-describedby="basic-addon1">
						</div>

					</form>
				</ul>


			</nav>

		</header>



		<div class="main_contents">
			<div class="result_area">
				<div class="icon_area">

					<img src=<c:url value="${profileImgURL}"/> />
					<p class="summoner_level">레벨 : ${summonerLevel }</p>
					<input type="hidden" name="id" id="id" value="${id }"> <input
						type="hidden" name="accountId" id="accountId"
						value="${accountId }"> <input type="hidden" name="puuid"
						id="puuid" value="${puuid }"> <input type="hidden"
						name="summonerName" id="summonerName" value="${SummonerName }">
				</div>
				<div class="summoner_info">
					<p class="summoner">${SummonerName }</p>
					<p class="update_date">소환사 정보변경 업데이트 일자: ${revisionDate }</p>
					<div class="span">
						<span> 게임정보 : {{gameMode }} </span>
					</div>




					<div class="gameInfo_table">


						<table class='table' id="table_ban">
							<thead>
								<tr>


									<th scope='col'>챔피언 밴 정보</th>



								</tr>
							</thead>
							<tbody id='bidders'>
								<!--  -->
								<tr v-for="(dataList, idx) in bannedChampions" :key="idx">
									<td>{{dataList.championId}} <img
										:src="'https://z.fow.kr/champ/'+dataList.championId+'_64.png'">

									</td>



								</tr>




							</tbody>
						</table>

						<table class='table' id="table_champion">
							<thead>
								<tr>


									<th scope='col'>챔피언</th>

								</tr>
							</thead>
							<tbody id='bidders'>
								<!--  -->
								<tr v-for="(dataList, idx) in participants" :key="idx">
									<td>{{dataList.championId}} <img
										:src="'https://z.fow.kr/champ/'+dataList.championId+'_64.png'">
									</td>


								</tr>




							</tbody>
						</table>


						<table class='table' id="table_summoner">
							<thead>
								<tr>


									<th scope='col'>소환사 이름</th>
									<th scope='col'>스펠1</th>
									<th scope='col'>스펠2</th>
								</tr>
							</thead>

							<tbody id='bidders'>
								<!--  -->

								<tr v-for="(dataList, idx) in participants" :key="idx">
									<td><a
										:href="'/myopggapp/search?SummonerName=' + dataList.summonerName"
										style="">{{dataList.summonerName}} </a></td>
									<td>{{dataList.spell1Id}}
										<div class="spell1" v-if="dataList.spell1Id == 21">
											<img
												src="https://opgg-static.akamaized.net/images/lol/spell/SummonerBarrier?image=c_scale,q_auto,w_22&v=1626880099">
										</div>

										<div class="spell1" v-if="dataList.spell1Id == 1">
											<img
												src="https://opgg-static.akamaized.net/images/lol/spell/SummonerBoost.png?image=c_scale,q_auto,w_42&v=1626880099">
										</div>

										<div class="spell1" v-if="dataList.spell1Id == 14">
											<img
												src="https://opgg-static.akamaized.net/images/lol/spell/SummonerDot.png?image=c_scale,q_auto,w_42&v=1626880099">
										</div>

										<div class="spell1" v-if="dataList.spell1Id == 3">
											<img
												src="https://opgg-static.akamaized.net/images/lol/spell/SummonerExhaust.png?image=c_scale,q_auto,w_42&v=1626880099">
										</div>

										<div class="spell1" v-if="dataList.spell1Id == 4">
											<img
												src="https://opgg-static.akamaized.net/images/lol/spell/SummonerFlash.png?image=c_scale,q_auto,w_42&v=1626880099">
										</div>

										<div class="spell1" v-if="dataList.spell1Id == 6">
											<img
												src="https://opgg-static.akamaized.net/images/lol/spell/SummonerHaste.png?image=c_scale,q_auto,w_22&v=1626880099">
										</div>

										<div class="spell1" v-if="dataList.spell1Id == 7">
											<img
												src="https://opgg-static.akamaized.net/images/lol/spell/SummonerHeal.png?image=c_scale,q_auto,w_42&v=1626880099">
										</div>

										<div class="spell1" v-if="dataList.spell1Id == 11">
											<img
												src="https://opgg-static.akamaized.net/images/lol/spell/SummonerSmite.png?image=c_scale,q_auto,w_42&v=1626880099">
										</div>

										<div class="spell1" v-if="dataList.spell1Id == 12">
											<img
												src="https://opgg-static.akamaized.net/images/lol/spell/SummonerTelePort.png?image=c_scale,q_auto,w_42&v=1626880099">
										</div>


									</td>
									<td>{{dataList.spell2Id}}
										<div class="spell2" v-if="dataList.spell2Id == 21">
											<img
												src="https://opgg-static.akamaized.net/images/lol/spell/SummonerBarrier?image=c_scale,q_auto,w_22&v=1626880099">
										</div>
										<div class="spell2" v-if="dataList.spell2Id == 54">

											<img
												src="https://opgg-static.akamaized.net/images/lol/spell/Summoner_UltBook_Placeholder.png?image=c_scale,q_auto,w_22&v=1626880099">
										</div>

										<div class="spell2" v-if="dataList.spell2Id == 1">
											<img
												src="https://opgg-static.akamaized.net/images/lol/spell/SummonerBoost.png?image=c_scale,q_auto,w_42&v=1626880099">
										</div>

										<div class="spell2" v-if="dataList.spell2Id == 14">
											<img
												src="https://opgg-static.akamaized.net/images/lol/spell/SummonerDot.png?image=c_scale,q_auto,w_42&v=1626880099">
										</div>

										<div class="spell2" v-if="dataList.spell2Id == 3">
											<img
												src="https://opgg-static.akamaized.net/images/lol/spell/SummonerExhaust.png?image=c_scale,q_auto,w_42&v=1626880099">
										</div>

										<div class="spell2" v-if="dataList.spell2Id == 4">
											<img
												src="https://opgg-static.akamaized.net/images/lol/spell/SummonerFlash.png?image=c_scale,q_auto,w_42&v=1626880099">
										</div>

										<div class="spell2" v-if="dataList.spell2Id == 6">
											<img
												src="https://opgg-static.akamaized.net/images/lol/spell/SummonerHaste.png?image=c_scale,q_auto,w_22&v=1626880099">
										</div>

										<div class="spell2" v-if="dataList.spell2Id == 7">
											<img
												src="https://opgg-static.akamaized.net/images/lol/spell/SummonerHeal.png?image=c_scale,q_auto,w_42&v=1626880099">
										</div>

										<div class="spell2" v-if="dataList.spell2Id == 11">
											<img
												src="https://opgg-static.akamaized.net/images/lol/spell/SummonerSmite.png?image=c_scale,q_auto,w_42&v=1626880099">
										</div>

										<div class="spell2" v-if="dataList.spell2Id == 12">
											<img
												src="https://opgg-static.akamaized.net/images/lol/spell/SummonerTelePort.png?image=c_scale,q_auto,w_42&v=1626880099">
										</div>





									</td>



								</tr>




							</tbody>
						</table>






					</div>

					<div class="buttons_area">
						<div class="Button_refresh">

							<div class="button_items" @click="viewGameInfo()">인게임 정보</div>


						</div>
						<div class="champmastery_items" @click="viewChampionMastery()">
							<div class="button_items_champmastery">챔피언 숙련도 보기</div>
						</div>

					</div>




					<input type="hidden" id="encryptedId" value=${id}>


				</div>

			</div>


			<!--  전적 list ! -->

			<table class='table' id="table_champion_mastery">
				<thead>
					<tr>



						<th scope='col'>챔피언</th>
						<th scope='col'>챔피언레벨</th>
						<th scope='col'>챔피언포인트</th>
						<th scope='col'>championPointsSinceLastLevel</th>
						<th scope='col'>championPointsUntilNextLevel</th>
						<th scope='col'>chestGranted</th>
						<th scope='col'>마지막으로 플레이한시간</th>
						<th scope='col'>토큰흭득</th>



					</tr>
				</thead>
				<tbody id='bidders'>
					<!--  -->
					<tr v-for="(dataList, idx) in championMastery" :key="idx">
						<td>{{dataList.championId}} <img
							:src="'https://z.fow.kr/champ/'+dataList.championId+'_64.png'">

						</td>
						<td>{{dataList.championLevel}}</td>
						<td>{{dataList.championPoints}}</td>
						<td>{{dataList.championPointsSinceLastLevel}}</td>
						<td>{{dataList.championPointsUntilNextLevel}}</td>
						<td>{{dataList.chestGranted}}</td>
						<td>{{dataList.lastPlayTime}}</td>
						<td>{{dataList.tokensEarned}}</td>



					</tr>




				</tbody>
			</table>
			<div class="result_rank">
				<div class="left_rank_area">
					<div class="image_rank">
						<div class="rank_image_item">
							<h3>${queueType }</h3>

							<img
								src=<c:url value="https://opgg-static.akamaized.net/images/medals/${tier}_1.png?image=q_auto:best&v=1"/> />
						</div>
						<div class="rank_information">
							<p class="rank_name">${tier }</p>
							<p class="rank_point">${leaguePoints}LP/${wins }승${losses } 패</p>

						</div>


					</div>

				</div>
				<div class="match_list_items">
					<div class="table_list_items">
						<table class='table' id="table_champion_mastery">
							<thead>
								<tr>



									<th scope='col'>챔피언</th>




								</tr>
							</thead>
							<tbody id='bidders'>
								<!--  -->
								<tr v-for="(data, idx2) in championName" :key="idx2">
									<td><img
										:src="'https://opgg-static.akamaized.net/images/lol/champion/'+championName[idx2]+'.png?image=c_scale,q_auto,w_46&v=1632277051'">
									</td>



								</tr>




							</tbody>
						</table>
						<table class='table' id="table_champion_mastery">
							<thead>
								<tr>



									<th scope='col'>모드</th>




								</tr>
							</thead>
							<tbody id='bidders'>
								<!--  -->
								<tr v-for="(data, idx) in modeList" :key="idx">
									<td>{{modeList[idx]}}</td>
								</tr>




							</tbody>
						</table>



						<table class='table' id="kdaResult">
							<thead>
								<tr>



									<th scope='col'>KDA</th>




								</tr>
							</thead>
							<tbody id='bidders'>
								<!--  -->
								<tr v-for="(data, idx) in kdaResult" :key="idx">
									<td>{{kdaResult[idx]}}</td>
								</tr>




							</tbody>
						</table>



						<table class='table' id="win">
							<thead>
								<tr>



									<th scope='col'>승</th>




								</tr>
							</thead>
							<tbody id='bidders'>
								<!--  -->
								<tr v-for="(data, idx) in win" :key="idx">
									<td>
										<div class="winStatus" v-if="win[idx] == true">승리</div>
										<div class="lose" v-else>패배</div>

									</td>
								</tr>




							</tbody>
						</table>


						<table class='table' id="win">
							<thead>
								<tr>



									<th scope='col'>팀</th>




								</tr>
							</thead>
							<tbody id='bidders'>
								<!-- participantchampionName[idx] -->
								<tr v-for="(data, idx) in participantchampionName" :key="idx">
									<td>
										<div class="participantchampionName">
											<img
												:src="'https://opgg-static.akamaized.net/images/lol/champion/'+participantchampionName[idx]+'.png?image=c_scale,q_auto,w_46&v=1632277051'">

										</div>


									</td>
								</tr>




							</tbody>
						</table>
						<table class='table' id="win">
							<thead>
								<tr>



									<th scope='col'>level</th>




								</tr>
							</thead>
							<tbody id='bidders'>
								<!-- -->
								<tr v-for="(data, idx) in userLevel" :key="idx">
									<td>{{userLevel[idx]}}</td>
								</tr>




							</tbody>
						</table>
						<table class='table' id="kill">
							<thead>
								<tr>



									<th scope='col'>킬</th>




								</tr>
							</thead>
							<tbody id='bidders'>
								<!-- -->
								<tr v-for="(data, idx) in kills" :key="idx">
									<td>{{kills[idx]}}</td>
								</tr>




							</tbody>
						</table>
						<table class='table' id="deaths">
							<thead>
								<tr>



									<th scope='col'>death</th>




								</tr>
							</thead>
							<tbody id='bidders'>
								<!-- -->
								<tr v-for="(data, idx) in deaths" :key="idx">
									<td>{{deaths[idx]}}</td>
								</tr>




							</tbody>
						</table>


						<table class='table' id=assists>
							<thead>
								<tr>



									<th scope='col'>assists</th>




								</tr>
							</thead>
							<tbody id='bidders'>
								<!-- -->
								<tr v-for="(data, idx) in assists" :key="idx">
									<td>{{assists[idx]}}</td>
								</tr>




							</tbody>
						</table>


					


						<table class='table' id="spell1Casts">
							<thead>
								<tr>
									<th scope='col'>spell</th>

								</tr>
							</thead>
							<tbody id='bidders'>
								<!-- -->
								<tr v-for="(data, idx) in spell" :key="idx">
							
								
							<td><img :src="'http://z.fow.kr/spell//'+spell[idx]+'.png'"></td>
								</tr>




							</tbody>
						</table>

						<table class='table' id="individualPosition">
							<thead>
								<tr>



									<th scope='col'>라인</th>




								</tr>
							</thead>
							<tbody id='bidders'>
								<!-- -->
								<tr v-for="(data, idx) in individualPosition" :key="idx">
									<td>{{individualPosition[idx]}}</td>
								</tr>




							</tbody>
						</table>
						<!-- items  -->
						<table class='table' id="items0">
							<thead>
								<tr>



									<th scope='col'>items</th>




								</tr>
							</thead>
							<tbody id='bidders'>
								<!-- -->
								<tr v-for="(data, idx) in item" :key="idx">
								<td>
								<div class="item_images">
									<img :src="'https://opgg-static.akamaized.net/images/lol/item/'+item[idx]+'.png?image=q_auto:best&v=1632277051'">
								</div>
								</td>
								</tr>




							</tbody>
						</table>
						
						
						
						
						

					</div>



				</div>
			</div>

		</div>

	</div>
</body>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>

<script>

const app = new Vue({
    el: '.main_contents',
    data: {
    	issue: '',
    	matchInfo :'',
    	participants:'',
    	bannedChampions:'',
    	gameMode : '',
    	championMastery:'',
    	modeList:[],
    	summonerName : '',
    	championName:[],
    	gameType:[],
    	gameStartTimestamp:[],
    	win:[],
    	participantchampionName:[],
    	userLevel:[],
    	kills:[],
    	deaths:[],
    	assists:[],
    	neutralMinionsKilled:[],
    	visionScore:[],
    	spell1Casts:[],
    	spell2Casts:[],
    	spell3Casts:[],
    	spell4Casts:[],
    	individualPosition:[],
    	item:[],
    	spell:[],
    	kdaResult:[],
    },
    mounted(){
    
    	console.log('this.summonerName',this.summonerName)
    	 axios.get('http://localhost:8082/myopggapp/status')  
 	    .then((res)=>{
 	    	//console.log(res.data);
 	       // console.log(res.data.incidents[0].titles[1]); //문제 원인 제목 
 	        //console.log(res.data.incidents[0].updates[0].translations[1].content);
 	        //this.issue = res.data.maintenances[0].updates[0].translations[1].content;
 	        
 	    }) 	
 	    $("#table_ban").attr('style', "display:none;");  //숨기기
 	   $("#table_champion").attr('style', "display:none;");  //숨기기
 	  $("#table_summoner").attr('style', "display:none;");  //숨기기
 	  //table_champion_mastery
 	   $("#table_champion_mastery").attr('style', "display:none;");  //숨기기


    },
    created(){
    		   // 해당 소환사의 닉네임을 filter 를 위해서 가져옵니다.
    	   	   var summonerName2 =  $("#summonerName").val();
    		   //해당 소환사의 puuid 를 이용하여 match id  를 가져옵니다!
    		   var puuid = $("#puuid").val();
    		   
			  
    		   axios.get('/myopggapp/getMatchIds',{
    		      params:{
    		         puuid : puuid,
    		      }
    		      })
    		      .then((res)=>{
    		         console.log('res.data', res.data);
    		         // 가져온 match id 리스트를 바탕으로 match id list 를 서버에 전달하여 데이터를 가져온다
    		         for(var i = 0 ; i <  Object.keys(res.data).length ; i++ ){
    		           // console.log(res.data[i]);
    		            axios.get('/myopggapp/getMatchListByIds',{
    		               params:{
    		                  matchId : res.data[i],
    		               }
    		               })
    		               // match id 로 가져온 match list 데이터! 
    		               .then((res)=>{
    		                //  console.log(res.data);
    		                 // console.log(res.data.info.gameStartTimestamp); // 게임 시작 시간 
    		                  this.gameStartTimestamp.push(res.data.info.gameStartTimestamp);
    		                 // console.log(res.data.info.gameMode);// 게임 모드
    		                  this.modeList.push(res.data.info.gameMode);
    		                  //console.log(res.data.info.gameType);// 게임 타입 
    		                  this.gameType.push(res.data.info.gameType);
    		                  
    		                  for(var j = 0 ; j < 2 ; j ++) {
    		                     //console.log('res.data.info.bans',res.data.info.teams[j].bans[j].championId); // 챔피언 밴 
    		                     
    		                     
    		                  }
    		              	
    		                
    		                  for(var i = 0 ; i< Object.keys(res.data.info).length ; i++){
    		                	  //검색한 소환사가 플레이한 챔피언을 filter 해준다. 
    		                	  if (res.data.info.participants[i].summonerName == summonerName2) {
									//console.log("championImage" , res.data.info.participants[i].championName)
									 this.championName.push(res.data.info.participants[i].championName);
									 this.win.push(res.data.info.participants[i].win);
									 this.userLevel.push(res.data.info.participants[i].champLevel);
									 //kda 계산 
									 this.kills.push(res.data.info.participants[i].kills);
									 this.deaths.push(res.data.info.participants[i].deaths);
									 this.assists.push(res.data.info.participants[i].assists);
									// console.log('kda계산 => ', kdaResult);
									 var kdaCal = (parseInt(res.data.info.participants[i].kills)+parseInt(res.data.info.participants[i].assists))/parseInt(res.data.info.participants[i].deaths);
									// console.log('kdaCal',kdaCal);
									 this.kdaResult.push(kdaCal);
									
									 this.neutralMinionsKilled.push(res.data.info.participants[i].neutralMinionsKilled)// 순수 미니언 처치수 
									 this.visionScore.push(res.data.info.participants[i].visionScore);
									 this.spell1Casts.push(res.data.info.participants[i].spell1Casts);
									 this.spell2Casts.push(res.data.info.participants[i].spell2Casts);
									 this.spell3Casts.push(res.data.info.participants[i].spell3Casts);
									 this.spell4Casts.push(res.data.info.participants[i].spell4Casts);
									 //test 
									 this.spell.push(res.data.info.participants[i].spell1Casts);
									 this.spell.push(res.data.info.participants[i].spell2Casts);
									 this.spell.push(res.data.info.participants[i].spell3Casts);
									 this.spell.push(res.data.info.participants[i].spell4Casts);
									 
									 this.individualPosition.push(res.data.info.participants[i].individualPosition);
									// this.item0.push(res.data.info.participants[i].item0);
									 console.log('item[0]',res.data.info.participants[i].item0)
									 
									 
									 //test 
									 this.item.push(res.data.info.participants[i].item0);
									 this.item.push(res.data.info.participants[i].item1);
									 this.item.push(res.data.info.participants[i].item2);
									 this.item.push(res.data.info.participants[i].item3);
									 this.item.push(res.data.info.participants[i].item4);
									 
									 
									 
									 return true;
										
								}
    		                	  console.log('items',res.data.info.participants[i]);  // 승리여부 
    		                	  this.participantchampionName.push(res.data.info.participants[i].championName);
    		                	   
    		                     /* console.log(res.data.info.participants[i].summonerName);  // 참여한 소환사 닉네임 
    		                     console.log(res.data.info.participants[i].summonerId);  // 참여한 소환사 summonerId 
    		                     console.log(res.data.info.participants[i].assists);  // 참여한 소환사 assist
    		                     console.log(res.data.info.participants[i].baronKills);  // 참여한 소환사 baronKills
    		                     console.log(res.data.info.participants[i].champExperience);  // 참여한 소환사 챔피언 숙련도 
    		                     console.log(res.data.info.participants[i].champLevel);  // 참여한 소환사 챔피언 레벨  
    		                     console.log(res.data.info.participants[i].championId);  // 참여한 소환사 챔피언 id 값   
    		                     console.log(res.data.info.participants[i].championName);  // 참여한 소환사 챔피언 이름   
    		                    
    		                     console.log(res.data.info.participants[i].deaths);  // 참여한 소환사 데스 
    		                     console.log(res.data.info.participants[i].kills);  // 킬  
    		                     console.log(res.data.info.participants[i].doubleKills);  // 더블킬  
    		                     console.log(res.data.info.participants[i].tripleKills);  // 트리플킬  
    		                     console.log(res.data.info.participants[i].quadraKills);  // 쿼드라킬
    		                     console.log(res.data.info.participants[i].pentaKills);  // 펜타킬
    		                     console.log(res.data.info.participants[i].dragonKills);  // 드래곤 킬수   
    		                     console.log(res.data.info.participants[i].firstBloodKill);  // 퍼블 여부 
    		                     console.log(res.data.info.participants[i].firstTowerKill);  // 첫 포탑 파괴 여부 
    		                     console.log(res.data.info.participants[i].gameEndedInEarlySurrender);  //조기 항복 여부 
    		                     console.log(res.data.info.participants[i].gameEndedInSurrender);  //항복 여부 
    		                     console.log(res.data.info.participants[i].goldEarned);  //골드 흭득량 
    		                     console.log(res.data.info.participants[i].goldSpent);  //골드 소비량 
    		                     console.log(res.data.info.participants[i].individualPosition);  // 라인(포지션)
    		                     console.log(res.data.info.participants[i].inhibitorKills);  // 억제기 파괴수
    		                     console.log(res.data.info.participants[i].item0);  // 아이템1
    		                     console.log(res.data.info.participants[i].item1);  // 아이템2
    		                     console.log(res.data.info.participants[i].item2);  // 아이템3
    		                     console.log(res.data.info.participants[i].item3);  // 아이템4
    		                     console.log(res.data.info.participants[i].item4);  // 아이템5
    		                     console.log(res.data.info.participants[i].item5);  // 아이템6
    		                     console.log(res.data.info.participants[i].magicDamageDealt);  // 가한 마법피해량
    		                     console.log(res.data.info.participants[i].magicDamageDealtToChampions);  // 챔피언한테 준 마법 피해량 
    		                     console.log(res.data.info.participants[i].nexusKills);  // 넥서스 킬  
    		                     console.log(res.data.info.participants[i].profileIcon);  // 프로필 아이콘 
    		                     console.log(res.data.info.participants[i].teamId);  // 속한 팀 id (보라 / 파랑팀)
    		                     console.log(res.data.info.participants[i].win);  // 승리여부 
    		                     console.log(res.data.info.participants[i].wardsKilled);  // 와드 처치수  
    		                     console.log(res.data.info.participants[i].wardsPlaced);  // 와드 설치수    */
    		                     
    		                  }
    		                  
    		                  
    		               });
    		         }

    		      })
    	
 
    },
    methods: {
    	
    	viewGameInfo(){
    		alert("해당 소환사의 현재 게임정보를 가져옵니다.");
    		//jquery
    		var getSummonnerEncryptedId = $("#encryptedId").val();
    			
    	
    		console.log(getSummonnerEncryptedId);
    		 axios.get('/myopggapp/getUserGameNowInfo',{
           		 params:{
           			getSummonnerEncryptedId:getSummonnerEncryptedId
           		 }
       		 }) 
    	 	    .then((res)=>{
    	 	 
    	 	    	console.log(res.data.gameMode);
    	 	    
    			  this.bannedChampions = res.data.bannedChampions;
    	 	      this.matchInfo = res.data;
    	 	      this.participants = res.data.participants;
    	 	      this.gameMode = res.data.gameMode;
    	 	      console.log(res.data.Error);
    	 	      if(res.data.Error == '해당소환사는 게임중이 아닙니다.'){
    	 	    	  alert(res.data.Error);
    	 	    	  return false;
    	 	      }
    	 	     $("#table_ban").attr('style', "display:'';");
    	 	    
    	 	 	   $("#table_champion").attr('style', "display:'';");
    	 	 	  $("#table_summoner").attr('style', "display:'';");
    	 	    	
    	 	    	
    	 	    }) 	
    		
    	},
    	viewChampionMastery(){
    		// 해당 소환사의 챔피언숙련도 정보를 보여줍니다.
    		var getSummonnerEncryptedId = document.getElementById("encryptedId").value;
    		console.log("encryptedId ====> " + getSummonnerEncryptedId);
    		axios.get('/myopggapp/getchampionMastery',{
    			params:{
    				getSummonnerEncryptedId:getSummonnerEncryptedId
    			}
    		})
    		.then((res)=>{
    			console.log(res.data);
    			this.championMastery = res.data;
    			
    		})
    		 $("#table_champion_mastery").attr('style', "display:'';");
    	}
       
    },
});



</script>
</html>
