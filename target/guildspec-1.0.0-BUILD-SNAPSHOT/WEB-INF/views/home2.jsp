<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <link rel="shortcut icon" href="#">
    
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/resources/css/jquery-ui.css"/> 
    <link rel="stylesheet" href="/resources/css/jquery.dataTables.min.css"/>
    <link rel="stylesheet" href="/resources/css/dataTables.bootstrap.min.css"/>
    
    <script src="/resources/js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <script src="/resources/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="/resources/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
    
    <meta charset="utf-8" />
	<title>수로 파티 도우미(${guildName} 관리자 페이지)</title>
</head>
<body>
<h3>데이터 출처 : maple.gg</h3>
<h3>길드를 검색후 더블클릭하면 이동됩니다.</h3>
<input type="button" onclick="javascript:void(0)" id="specUdt" value="업데이트" >
<input type="button" onclick="javascript:void(0)" id="home" value="메인으로" >

<table>
	<tr>
	<td >
		<h2>전체</h2>
	</td>
	<td align="right">
	<input type="button" onclick="javascript:void(0)" id="allAdd" value="전체저장" >
	<input type="button" onclick="javascript:void(0)" id="allDel" value="전체삭제" >
	<input type="button" onclick="javascript:void(0)" id="add" value="추가" >
	</td>
	</tr>
	<tr>
	<td colspan="2"  style="padding: 0 20 0 0px;">
	<table id="allGrid"  class="table table-striped table-bordered" >
	<thead>
		<tr>
			<th>닉네임</th>
			<th>레벨</th>
			<th>직업</th>
			<th>무릉</th>
		</tr>
	</thead>
	</table>
	</td>
	</tr>
	</table>
	<table>
	<tr>
	<td>
		<h3>1수로</h3>
	</td>
	</tr>
	<tr>
	<td style="padding: 0 20 0 0px;">
	<table id="suro1_1"  class="table table-striped table-bordered" >
	<thead>
		<tr>
			<th>닉네임</th>
			<th>직업</th>
		</tr>
	</thead>
	</table>
	</td>
	<td style="vertical-align:top; padding: 0 20 0 0px;" >
	<table id="suro1_2"  class="table table-striped table-bordered" >
	<thead>
		<tr>
			<th>닉네임</th>
			<th>직업</th>
		</tr>
	</thead>
	</table>
	</td>
	<td style="vertical-align:top;">
	<table id="suro1_3"  class="table table-striped table-bordered" >
	<thead>
		<tr>
			<th>닉네임</th>
			<th>직업</th>
		</tr>
	</thead>
	</table>
	</td>
	</tr>
	
	<tr>
	<td>
		<h3>2수로</h3>
	</td>
	</tr>
	<tr>
	<td style="padding: 0 20 0 0px;">
	<table id="suro2_1"  class="table table-striped table-bordered" >
	<thead>
		<tr>
			<th>닉네임</th>
			<th>직업</th>
		</tr>
	</thead>
	</table>
	</td>
	<td style="vertical-align:top; padding: 0 20 0 0px;" >
	<table id="suro2_2"  class="table table-striped table-bordered" >
	<thead>
		<tr>
			<th>닉네임</th>
			<th>직업</th>
		</tr>
	</thead>
	</table>
	</td>
	<td style="vertical-align:top;">
	<table id="suro2_3"  class="table table-striped table-bordered" >
	<thead>
		<tr>
			<th>닉네임</th>
			<th>직업</th>
		</tr>
	</thead>
	</table>
	</td>
	</tr>
	
	<tr>
	<td>
		<h3>3수로</h3>
	</td>
	</tr>
	<tr>
	<td style="padding: 0 20 0 0px;">
	<table id="suro3_1"  class="table table-striped table-bordered" >
	<thead>
		<tr>
			<th>닉네임</th>
			<th>직업</th>
		</tr>
	</thead>
	</table>
	</td>
	<td style="vertical-align:top; padding: 0 20 0 0px;" >
	<table id="suro3_2"  class="table table-striped table-bordered" >
	<thead>
		<tr>
			<th>닉네임</th>
			<th>직업</th>
		</tr>
	</thead>
	</table>
	</td>
	<td style="vertical-align:top;">
	<table id="suro3_3"  class="table table-striped table-bordered" >
	<thead>
		<tr>
			<th>닉네임</th>
			<th>직업</th>
		</tr>
	</thead>
	</table>
	</td>
	</tr>
	
	<tr>
	<td>
		<h3>4수로</h3>
	</td>
	</tr>
	<tr>
	<td style="padding: 0 20 0 0px;">
	<table id="suro4_1"  class="table table-striped table-bordered" >
	<thead>
		<tr>
			<th>닉네임</th>
			<th>직업</th>
		</tr>
	</thead>
	</table>
	</td>
	<td style="vertical-align:top; padding: 0 20 0 0px;" >
	<table id="suro4_2"  class="table table-striped table-bordered" >
	<thead>
		<tr>
			<th>닉네임</th>
			<th>직업</th>
		</tr>
	</thead>
	</table>
	</td>
	<td style="vertical-align:top;">
	<table id="suro4_3"  class="table table-striped table-bordered" >
	<thead>
		<tr>
			<th>닉네임</th>
			<th>직업</th>
		</tr>
	</thead>
	</table>
	</td>
	</tr>
	</table>
	
 <script type="text/javascript"> 
 $(document).ready(function(){
	 $("#allGrid").DataTable({
		 scrollY:500,
	     ajax: {
	      "type" : "GET",
	         "url" : "/allselect/${server}/${guildName}",
	            "dataType": "json",
	            "dataSrc": function (d) {
	                    return d;
	            }
	         },
	    columns: [
	               { data: "nickname" },
	               { data: "level" },
	               { data: "job" },
	               { data: "spec" }
	           ],
	    columnDefs: [
	        { "width": "150", "targets": 0 },
	        { "width": "120", "targets": 1 },
	        { "width": "150", "targets": 2 },
	        { "width": "300", "targets": 3 }
	      ],
	    scrollY: "600px",
	    scrollX: true,
	    scrollCollapse: true,
	    fixedColumns: true,
 		lengthChange: false,
 		searching: true,
 		ordering: false,
 		info: false,
 		paging: false,
        bDestroy: true
  });
	 
	 for(var i = 1; i<=4; i++){
		 for(var j = 1; j<4; j++){
			 $("#suro" + i + "_" + j).DataTable({
				 scrollY:500,
			     ajax: {
			      "type" : "GET",
			         "url" : "/allselect/${server}/${guildName}",
			            "dataType": "json",
			            "dataSrc": function (d) {
			                    return d;
			            }
			         },
			    columns: [
			               { data: "nickname" },
			               { data: "job" }
			           ],
			    columnDefs: [
			        { "width": "150", "targets": 0 },
			        { "width": "150", "targets": 1 }
			      ],
			    scrollY: "600px",
			    scrollX: true,
			    scrollCollapse: true,
			    fixedColumns: true,
		 		lengthChange: false,
		 		searching: true,
		 		ordering: false,
		 		info: false,
		 		paging: false,
		        bDestroy: true
		  });;
		 }
	 }
	
	 var allTable = $('#allGrid').DataTable();
	 
	 $("#specUdt").click(function(){
		 
		  	$.ajax({
		      url         :   "/update/${server}/${guildName}",
		      dataType    :   "json",
		      contentType : "application/json; charset=UTF-8",
		      type        :   "GET",
		      complete     :   function(){
		          location.reload();
		      }
		  });
	     });
		 
		 $("#home").click(function(){
			location.href="/${server}/${guildName}";	 
		 });
	 
	 
 });
 
 

</script>
</body>
</html>
