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

color:white;
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
					
					
					



				</ul>
			

			</nav>
			
			
			<div class="href">
				<a class ="ShowchampionStatics" href="ShowchampionStatics"> 나의 챔피언 숙련도 보러가기!</a>
			
			
			</div>

		</header>

			<div id="issue">
			{{issue}}
			</div>

		<div class="main_contents">

			<div class="main_banner">
				<img
					src="http://attach.s.op.gg/logo/20201128185021.1dc5306e4b9ee7c30611adce774fbd77.png">

			</div>
			<div class="user_search">
				<p class="search_title">소환사 이름을 입력하세요</p>

				<form action="/myopggapp/search" method="GET">

					<div class="input-group mb-3">
					

						<input type="text" class="form-control" placeholder="name+ enter "
							aria-label="Username" name="SummonerName"
							aria-describedby="basic-addon1">
					</div>
				</form>

			</div>


			<div class="champion_rotation">
				<p class="rotation_champion"> 이번주의 로테이션 챔피언 </p>
			<div class="rotation_items">
			
		<c:forEach var="data" items="${rotationName}">
		<!-- 	
			<img src="http://z.fow.kr/champ/${data }_64.png"> -->
			<img src="https://opgg-static.akamaized.net/images/lol/champion/${data }.png?image=c_scale,q_auto,w_140&v=1624418935">
			
		</c:forEach>
		</div>
	

			</div>



		</div>
		
	</div>
</body>
</html>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>

<script>
    const app = new Vue({
        el: '#issue',
        data: {
        	issue: '',
        },
        mounted(){
        	 axios.get('http://localhost:8082/myopggapp/status')  
     	    .then((res)=>{
     	    	console.log(res.data);
     	        console.log(res.data.incidents[0].titles[1]); //문제 원인 제목 
     	        console.log(res.data.incidents[0].updates[0].translations[1].content);
     	        //this.issue = res.data.maintenances[0].updates[0].translations[1].content;
     	        this.issue = res.data.incidents[0].updates[0].translations[1].content;
     	        
     	    }) 	
        },
        created(){
        	
        	
        },
        methods: {
            onClickButton() {
                this.liked = true;
            },
        },
    });
</script>
