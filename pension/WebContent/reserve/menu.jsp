<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script>
    var jung1=["돼지고기","소고기","양고기","말고기"];
    var jung2=["잡곡","채소","과일"];
    var jung3=["생선류","조개류","두족류","갑각류","몰라유"];
    var jung4=["스팸","어묵","번데기","훈제"];
    
    function view_jung(n)
    {
    	var jung=document.getElementById("jung");
    	if(n==0) // 축산물
    	{
    		jung.options.length=jung1.length; // option태그의 갯수
    		for(i=0;i<jung1.length;i++)
    		{
    			jung.options[i].value=i;
    			jung.options[i].text=jung1[i];
    		}	
    	}	
    	else if(n==1) // 농산물
    		 {
    		   jung.options.length=jung2.length;
    		   for(i=0;i<jung2.length;i++)
    		   {
    			   jung.options[i].value=i;
    			 jung.options[i].text=jung2[i];
    		   }	
    		 }
    	     else if(n==2) // 수산물
    	    	  {
    	    	 jung.options.length=jung3.length;
    	    		for(i=0;i<jung3.length;i++)
    	    		{
    	    			jung.options[i].value=i;
    	    			jung.options[i].text=jung3[i];
    	    		}	
    	    	  }
    	          else  // 가공품
    	          {
    	        	  jung.options.length=jung4.length;
    	      		for(i=0;i<jung4.length;i++)
    	      		{
    	      			jung.options[i].value=i;
    	      			jung.options[i].text=jung4[i];
    	      		}	  
    	          }
    }
    
  </script>
</head>
<body onload="view_jung(0)">
   <select id="sel" onchange="view_jung(this.value)">
     <option value="0"> 축산물 </option>
     <option value="1"> 농산물 </option>
     <option value="2"> 수산물 </option>
     <option value="3"> 가공품 </option>
   </select>
   <select id="jung">  <!-- 중분류 -->
   </select>
</body>
</html>