<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
</head>
	
	<link href="/resources/jq_lib/jquery-ui-1.12.1.custom/jquery-ui.css" rel='stylesheet'> <!--jquery ui  -->
	<link href='/resources/jq_lib/Guriddo_jqGrid_JS_5.2.1/css/ui.jqgrid.css' rel='stylesheet'> <!--jqgrid  -->
	
	<script src="/resources/jq_lib/jquery-3.2.1.min.js"></script> <!--jquery  -->
	<script src='/resources/jq_lib/jquery-ui-1.12.1.custom/jquery-ui.js'></script> <!--jquery ui  -->
	<script src="/resources/jq_lib/jquery-serialize-object-2.4.0/jquery.serialize-object.min.js"></script> <!--serializeObject  -->
	<script src="/resources/jq_lib/Guriddo_jqGrid_JS_5.2.1/src/i18n/grid.locale-kr.js"></script> <!--jqgrid  -->
	<script src="/resources/jq_lib/Guriddo_jqGrid_JS_5.2.1/js/jquery.jqGrid.min.js"></script> <!--jqgrid  -->
	<script>
    $(document).ready(function(){
    	
    

        $('#sample3').button();
        $('#sample4').button();
        $('#sample5').button();
        $('#sample6').button();
        
        
        $('#sample6').click(function(){
        	
        	var person = {
        			name : '윤인성'
        			,eat : function (food){
        				alert(this.name + '이 ' + food +"을/를 먹습니다");
        			}
        	};
        	
        	person.eat("밥");
        	
        });
        
        
	
    	$("#checkLine input[type='checkbox']").each(function(idx){
    		
    		if($(this).is(":checked"))
        		$(this).val("01");
        	else
        		$(this).val("02");
        	
		
	});
        
        
        $("#checkLine input[type='checkbox']").change(function(){
        	
        	if($(this).is(":checked"))
        		$(this).val("01");
        	else
        		$(this).val("02");
        	
        });
        
        $('#sample5').click(function(){
        	$("#checkLine input[type='checkbox']").each(function(idx){
        		
	        		alert($(this).val());
        		
        	});
        });
        
		
        
        $('#jqList').jqGrid({  
  			url 			: "/getEmpList",
        	datatype 		: "json",
        	jsonReader		: {
        		page 	:	 "page"
        		,total	:	 "total"
        		,root	:	 "user"
        		,repeatitems : false
        	}
        	,mtype 			: 'get',
        	colNames		: ["번호", "타이틀"],
        	colModel		: [
        				  {name 	:  "BOARD_NUM"  , index : "BOARD_NUM"},
        				  {name		:  "BOARD_TITLE"   , index : "BOARD_TITLE" },
        	],
        	rowNum			: 10,
        	pager			: '#pager',
        	caption			: "사원정보",
        	height			: "auto",
        	multiselect		: true
        	,rowList		: [10,20,30]
        	,sortoder		: 'desc'
        	,loadonce		: false
        }); 
        
        
    
	
        
    //    $('#sample2').click(getTimeFunc);
        
        $('#sample4').click(function(){
        	
        	var checkJson = $("#checkLine").serializeObject();
        	alert(JSON.stringify(checkJson));
        	alert(checkJson);
        
        	
        	
        });
        
      
        $('#sample3').click(function(){
        	
        	$.ajax({
        		url 		: '/getEmpList',
        		dataType	: 'json',
        		type 		: 'get',
        		
        		success		: function(data){
        			var s = '';
        			
        			for(var i=0; i<data.user.length; i++){
        				s+=data.user[i].BOARD_NUM+", ";
        				s+=data.user[i].BOARD_TITLE+"\n";
        			}
        			alert(s);
        			
        			$("#resultText1").text(JSON.stringify(data));
        		},
        		error		: function(){
					alert("실패");        			
        		}
        	});
        	
        });

        var xhr = new XMLHttpRequest();
        xhr.open('get','/getEmpList');
        xhr.send();
        
        xhr.onreadystatechange = function(){
        	if(xhr.readyState == 4 && xhr.status == 200){//login.hwan에 모든 실행(로직)을 마치면 이부분이 실행된다.  
    			var txt = xhr.responseText; //HwanController>login.hwan에서 print.out된(화면에 출력된) 정보를 가져온다.)
    			var js = JSON.parse(txt); //가져온 텍스트를 제이슨 타입으로 변경.
    			
    			
    			var s = '';
    			
    			
    			for(var i=0; i<js.length; i++){
    				s+=js[i].BOARD_NUM+", ";
    				s+=js[i].BOARD_TITLE+"\n";
    			}
    			
    			$("#resultText1").text(s);
    			$("#resultText2").text(txt);
        	
        	
        	}
        }
        
    }); // end ready
    
    
    function leadingZeros(n, digits){
    	var zero = '';
    	n = n.toString();
    	
    	if(n.length < digits){
    		for(var i = 0; i<digits - n.length; i++){
    			zero += '0';
    		}
    		
    	}
    		return zero + n;
    	
    }
    
    /* function getTimeFunc(){
    	var s = "";
        /* 	var d = new Date() ; 
        	
        	alert("new Date() : "+ d);
        	
        	var s = 
        		leadingZeros(d.getHours(),2)+''+
        		leadingZeros(d.getMinutes(),2)+''+
        		leadingZeros(d.getSeconds(),2)+"b";
        	
        	alert("leadingZeros : "+s+" , "+s.length ); 
        	
        	$.ajax({
        		async:false,
				url: "/getDate",
				cache: false,
				dataType: "json",
				type: "get",
				success: function(data, textStatus, jqXHR){
					
					 alert("getDate() : "+data.getDate+ " , "+data.getDate.length); 
					s = data.getDate;
					
				},
				error: function (jqXHR, textStatus, errorThrown)
				{
					alert("실패");	
				}
			});
        	
        	alert(s);
    }
    */
 
  
    

    
    </script>
    
	<body>

	<!-- <input type="text" id="sample2" value="TEST"> -->
	
	<form id="checkLine">
		<input type="checkbox" name="check1" value="01" checked="checked">
		<input type="checkbox" name="check2" value="01">
		<input type="checkbox" name="check3" value="01">
		<input type="checkbox" name="check4" value="01">
		<input type="checkbox" name="check5" value="01">
		<input type="checkbox"name="check6" value="01">
	</form>
	
	<input type="text" id="sample3" value="TEST2" readonly="readonly">
	<input type="text" id="sample4" value="TEST4" readonly="readonly">
	<input type="text" id="sample5" value="TEST5" readonly="readonly">
	<input type="text" id="sample6" value="javascript test" readonly="readonly">
	<table id="jqList"></table>
	<div id="pager"></div>
	
	<textarea rows="50" cols="50" id="resultText1"></textarea>
	<textarea rows="50" cols="50" id="resultText2"></textarea>

</html>
