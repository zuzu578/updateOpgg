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
		</header>

			<div id="issue">
			{{issue}}
			</div>

		<div class="main_contents">
		<div class="image">
			<img src="https://opgg-static.akamaized.net/logo/20210717025919.c71d1c8b76704b41ad64462ac4e7ef5c.png">
			<h1> 챌린저 랭킹</h1>
		</div>
		  <!-- 현재 페이지를 임시로 보여줍니다( paging ) -->
         <!-- default value = 1 로 설정해주어 page 1인 데이터를 디폴트값으로 렌더링해줍니다.  -->
      <input type="hidden" name="current_page" id="current_page" value='1'>

	
	<div class="table_items">
	 <table class="table table-striped" >
      <tr>
      	<td> 소환사 이름 </td>
         <td>승리 횟수</td>
         <td>패배 횟수</td>
         <td>LP</td>
         <td>네임드여부</td>
         <td>랭크</td>
      </tr>
   
      <tr v-for="(dataList, idx) in boardData" :key="idx">
     
        <td> <a :href="'/myopggapp/search?SummonerName=' + dataList.summonerName"  style="black">{{dataList.summonerName}} </a></td>
        
      <td>{{dataList.wins}}</td>
       <td>{{dataList.losses}}</td>
        <td>{{dataList.leaguePoints}}</td>
         <td v-if="dataList.veteran == true" >
 			프로
         </td>
         <td v-else>일반인</h1>
         
         <td>챌린저</td>
      </tr>
     
    
         
   </table>
   
   <div class="paging">
  <nav aria-label="Page navigation example">
  <ul class="pagination">
    
    <li class="page-item" @click="prev()">prev</li> 
    <li class="page-item" @click="next()">next</li>
    
  </ul>
</nav>
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
        el: '.main_wrap',
        data: {
        	issue: '',
        	boardData:'',
        	defaultPageNum:'',
        },
        mounted(){
        	 axios.get('http://localhost:8082/myopggapp/status')  
     	    .then((res)=>{
     	        console.log(res.data.incidents[0].titles[1]); //문제 원인 제목 
     	        console.log(res.data.incidents[0].updates[0].translations[1].content);
     	       this.issue = res.data.maintenances[0].updates[0].translations[1].content;
     	        
     	    }) 	
        },
        created(){
        	 axios.get('http://localhost:8082/myopggapp/getRankerList')  
      	    .then((res)=>{
      	    	console.log(res.data.entries);
      	    	this.boardData = res.data.entries;
      	       
      	        
      	    }) 
        	
        },
        methods: {
        	//이전페이지 보여주기 
            prev(){
                console.log("이전페이지 클릭 !" );
              var pageNum = document.getElementById('current_page').value
              var currentPageNum = parseInt(pageNum) -1;
               document.getElementById('current_page').value = currentPageNum;
              //alert(currentPageNum);
              console.log(currentPageNum)
              this.defaultPageNum = currentPageNum;
              console.log("현재 페이지 ==> " + this.defaultPageNum);
              if(this.defaultPageNum <= 0 ){
                  console.log("이전 데이터가 없습니다.")
                  // - 값이 된 페이지를 초기 값으로 복원합니다.
                  this.defaultPageNum = 1;
                  console.log("페이지값 복원 ====> "+ this.defaultPageNum);
                  return false;
              }
               axios.get('http://localhost:8082/myopggapp/getRankerList',{
                params: {
                defaultPageNum : this.defaultPageNum,
                }
            }) 
            .then((res)=>{
                //get Data List 
            	console.log(res.data.entries);
      	    	this.boardData = res.data.entries;
            })
            },
        	 next(){
        	      console.log("다음페이지 click! ");
        	      var pageNum = document.getElementById('current_page').value
        	      var currentPageNum = parseInt(pageNum) +1;
        	      document.getElementById('current_page').value = currentPageNum;
        	      //alert(currentPageNum);
        	      console.log(currentPageNum)
        	      this.defaultPageNum = currentPageNum;
        	      console.log("현재 페이지 ==> " + this.defaultPageNum);
        	      axios.get('http://localhost:8082/myopggapp/getRankerList',{
        	        params: {
        	        defaultPageNum : this.defaultPageNum,
        	      
        	        }
        	    }) 
        	    .then((res)=>{
        	        //get Data List 
        	        console.log("success");
        	        console.log(res.data.entries);
          	    	this.boardData = res.data.entries;
        	    })
        	    }
        },
    });
</script>
