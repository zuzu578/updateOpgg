<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<style>
.banner_items{
	text-align:center;
	margin-top:100px;
	
}
.title{

	text-align:center;
	color:white;
	font-weight:bold;
	font-size:40px;
	
}
body{
background-color:rgb(21, 107, 255); 

}
.select_items{
	width:600px;
	margin:0 auto;

}
.select_items{
margin-top:30px;
margin-bottom:30px;


}
.button_item{
 text-align:center;
}
.table{
	width:1300px;
	margin: 0 auto;
	
}

</style>
<body>
  <div class="main_items">
	<div class="banner_items">
		<img src="https://opgg-static.akamaized.net/logo/20210811124718.0bfc5a4e2f7949e3b12208facef17f86.png">
		
	</div>
	<p class="title"> getAllLeagueEntriesSearch</p>
	<div class="flex_items">
	<div class="select_items">
	<select class="form-select" id="tierBox"aria-label="Default select example">

  <option value="I">I</option>
  <option value="II">II</option>
  <option value="III">III</option>
   <option value="IV">IV</option>
</select>
</div>

<div class="select_items">
	<select class="form-select" id="rankBox" aria-label="Default select example">

  <option value="IRON">IRON </option>
  <option value="BRONZE">BRONZE</option>
  <option value="SILVER">SILVER</option>
   <option value="GOLD">GOLD</option>
    <option value="PLATINUM">PLATINUM</option>
     <option value="DIAMOND">DIAMOND</option>
</select>
</div>


<div class="select_items">
	<select class="form-select" id="queBox" aria-label="Default select example">
  
  <option value="RANKED_SOLO_5x5">RANKED_SOLO_5x5</option>
  <option value="RANKED_FLEX_SR">RANKED_FLEX_SR</option>
  <option value="RANKED_FLEX_TT">RANKED_FLEX_TT</option>
</select>
</div>
	<div class="button_item">
	<button type="button" @click="search()" id="button_items" class="btn btn-light">검색</button>
	</div>
  </div>
  
				  <table class='table' id="table_entries">
            <thead>
                <tr>
                    
           
                    <th scope='col'> summonerName </th>
                    <th scope='col'> tier </th>
                    <th scope='col'> rank </th>
                    <th scope='col'> leaguePoints </th>
                    <th scope='col'> wins </th>
                    <th scope='col'> losses </th>
                    
                    
                    
                    
                    
                </tr>
            </thead>
            <tbody id='bidders'>
            <!--  -->
			<tr v-for="(dataList, idx) in entries" :key="idx">
            <td style="color:white; font-weight:bold;">
            <a :href="'/myopggapp/search?SummonerName=' + dataList.summonerName"  style="black; color:white;">{{dataList.summonerName}} </a>
         
            
            
             </td>
              <td style="color:white; font-weight:bold;">
            {{dataList.tier}}
            
            
             </td>
              <td style="color:white; font-weight:bold;">
            {{dataList.rank}}
            
            
             </td>
             
              <td style="color:white; font-weight:bold;">
            {{dataList.leaguePoints}}
            
            
             </td>
              <td style="color:white; font-weight:bold;">
            {{dataList.wins}}
            
            
             </td>
              <td style="color:white; font-weight:bold;">
            {{dataList.losses}}
            
            
             </td>
             
             
   
            </tr>
           
          
            
            
            </tbody>
            
        </table>
        <div class="pageItems">
        <nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item disabled">
          <a class="page-link" href="#">Previous</a>
    </li>
  
    <li class="page-item">
      <a class="page-link" href="#">Next</a>
    </li>
  </ul>
</nav>
</div>
        
        
  
  </div>

</body>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script> 
const app = new Vue({
    el: '.main_items',
    data: {
    	entries: '',
    	
    },
    mounted(){
        $("#table_entries").attr('style', "display:none;");  //숨기기
        $(".pageItems").attr('style', "display:none;");
    },
    created(){
    	
    	
    },
    methods: {
    	search(){
    		alert("해당 조건의 데이터를 가져옵니다.");
    		var division = $("#tierBox option:selected").val();
    		var tier = $("#rankBox option:selected").val();
    		var queue = $("#queBox option:selected").val();
    		console.log(division);
    		console.log(tier);
    		console.log(queue);
    		axios.get('http://localhost:8082/myopggapp/getAllLeagueEntries',{
    			params:{
    				division:division,
    				tier:tier,
    				queue:queue,
    			}
    		})
    		.then((res)=>{
    			console.log(res.data);
    			this.entries = res.data;
    			
    		})
    		 $("#table_entries").attr('style', "display:'';");
    		   $(".pageItems").attr('style', "display:'';");
    	}
    },
});



</script>
</html>