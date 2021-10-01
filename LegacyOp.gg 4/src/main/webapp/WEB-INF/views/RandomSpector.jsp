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
.main_banner{
text-align:center;
}
.search_title{

text-align:center;
font-weight:bold;
font-size:40px;


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
		
			
			
			

		</header>

			

		<div class="main_contents">

			<div class="main_banner">
				<img
					src="https://opgg-static.akamaized.net/logo/20210726053109.bfb410d8b85a471c90fc60a3f4418039.png">

			</div>
			<div class="user_search">
			
				<p class="search_title">랜덤게임정보</p>
			 <table class='table'>
            <thead>
                <tr>
                    <th scope='col'>챔피언</th>
                    <th scope='col'>소환사 아이콘</th>
                    <th scope='col'>소환사이름</th>
                    <th scope='col'>팀</th>
                    <th scope='col'>스펠1</th>
                    <th scope='col'>스펠2</th>
                    
                </tr>
            </thead>
            <tbody id='bidders'>
            <tr v-for="(dataList, idx) in datalist" :key="idx">
            <td>{{dataList.championId}} </td>
            <td><img :src="'https://opgg-static.akamaized.net/images/profile_icons/profileIcon' + dataList.profileIconId +'.jpg?image=q_auto:best&v=1518361200'"> </td>
             <td>{{dataList.summonerName}} </td>
            <td>{{dataList.teamId}} </td>
            <td>{{dataList.spell1Id}}</td>
             <td>{{dataList.spell2Id}}</td>
          
            
            </tr>
				
            </tbody>
        </table>
        
        
        
        <table class='table'>
            <thead>
                <tr>
                    <th scope='col'>bannedChampions</th>
                    <th scope='col'>gameLength</th>
                    <th scope='col'>gameMode</th>
                    <th scope='col'>gameStartTime</th>
                    <th scope='col'>participants</th>
                    
                    
                </tr>
            </thead>
            <tbody id='bidders'>
            <tr v-for="(dataList, idx) in dataList2" :key="idx">
          <td>  {{dataList}}</td>
            <!-- 
            <td>{{dataList.bannedChampions}} </td>
       
             <td>{{dataList.gameLength}} </td>
            <td>{{dataList.gameMode}} </td>
            <td>{{dataList.gameStartTime}}</td>
             <td>{{dataList.participants}}</td>
          
             -->
            </tr>
				
            </tbody>
        </table>
				

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
        el: '.user_search',
        data: {
        	datalist: '',
        	dataList2:'',
        	
        	
        },
        mounted(){
        	 axios.get('http://localhost:8082/myopggapp/getRandomSpector')  
     	    .then((res)=>{
     	    	console.log(res.data.gameList);
     	    	for(var i = 0 ; i<res.data.gameList.length ; i++){
     	    		console.log(res.data.gameList[i].participants);
     	    		this.datalist = res.data.gameList[i].participants;
     	    	}
     	    	for(var i = 0 ; i< res.data.gameList.length; i++){
     	    		this.dataList2 = res.data.gameList[i];
     	    	}
     	    	//console.log(res.data.gameList.participants);
     	    	
     	    	
     	        
     	    }) 
     	    
        },
        created(){
        	
        	
        },
        methods: {
           
        },
    });
</script>
