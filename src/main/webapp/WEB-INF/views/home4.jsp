<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <link rel="shortcut icon" href="#">
    
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/resources/css/jquery-ui.css"/> 
    <link rel="stylesheet" href="/resources/css/jquery.dataTables.min.css"/>
    <link rel="stylesheet" href="/resources/css/dataTables.bootstrap.min.css"/>
    <link rel="stylesheet" href="/resources/css/jquery.modal.min.css"/>
    
    <script src="/resources/js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <script src="/resources/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="/resources/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
    <script src="/resources/js/jquery.modal.min.js" type="text/javascript"></script>
    
    <meta charset="utf-8" />
	<title>수로 파티 도우미(${guildName} 서포터 직업 선택 페이지)</title>
</head>
<body>
<h3>데이터 출처 : maple.gg</h3>
<h3>수로에 참여하는 길드원을 관리하는 화면입니다.</h3>
<h3>따로 체크하지않으시면 전체 추가하시면 됩니다.</h3>
<input type="button" onclick="javascript:void(0)" id="home" value="메인으로" >
<input type="button" onclick="javascript:void(0)" id="admin" value="관리자 화면으로" >

<table>
	<tr>
<td style="vertical-align:top">
	<table>
	<tr>
	<td>
		<h2>선택안된 길드원</h2>
	</td>
	<td align="right">
	<input type="button" onclick="javascript:void(0)" id="allAdd" value="전체 추가" >
	<input type="button" onclick="javascript:void(0)" id="admin_att_save" value="추가" >
	</td>
	</tr>
	<tr>
	<td colspan="2"  style="padding: 0 20 0 0px;">
	<table id="attGrid"  class="table table-striped table-bordered" >
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
</td>
<td valign="top">
<table>
	<tr>
	<td>
		<h2>수로에 참여하는 길드원</h2>
	</td>
	<td align="right">
	<input type="button" onclick="javascript:void(0)" id="allDel" value="전체 삭제" >
	<input type="button" onclick="javascript:void(0)" id="admin_att_delete" value="삭제" >
	</td>
	</tr>
	<tr>
	<td colspan="2">
	<table id="subGrid"  class="table table-striped table-bordered" >
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
</td>
</tr>
</table>
	
	
 <script type="text/javascript"> 
 $(document).ready(function(){
	 
	 $("#attGrid").DataTable({
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
	    	{ "width": "250px", "targets": 0 },
	        { "width": "150px", "targets": 1 }
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
	 
	 $("#subGrid").DataTable({
		 scrollY:500,
	     ajax: {
	      "type" : "GET",
	         "url" : "/attselect/${server}/${guildName}",
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
	    	{ "width": "250px", "targets": 0 },
	        { "width": "150px", "targets": 1 }
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
	 
	
	 var attTable = $('#attGrid').DataTable();
	 var subTable = $('#subGrid').DataTable();
	 
	 
		 
		 $("#home").click(function(){
			location.href="/${server}/${guildName}";	 
		 });
		 
		 $("#admin").click(function(){
				location.href="/admin/${server}/${guildName}";	 
			 });
		 
		 $('#subGrid').on( 'click', 'tr', function () {
		     $(this).toggleClass('selected');
		        
		 });
		 $('#attGrid').on( 'click', 'tr', function () {
		     $(this).toggleClass('selected');
		 });
		 
		 $("#admin_att_save").click(function(){
			 var all = attTable.rows('.selected').data().toArray();
			 
			 if(all.length <= 0){
				 alert("선택된 유저가 없습니다.");
				 return;
			 }
			 
			 var nick_select = [];
		     	for(var i = 0; i < all.length; i++){
		     		nick_select.push(all[i]);
		     	}
		     	
		     	var datas = {
		     		"list" : nick_select
		     	};
		     	
		     	jQuery.ajaxSettings.traditional = true;
		     	
		     	$.ajax({
	                url         :   "/save",
	                dataType    :   "json",
	                contentType : "application/json; charset=UTF-8",
	                type        :   "post",
	                data        :   JSON.stringify(datas),
	                complete     :   function(){
	                    location.reload();
	                }
	            });
		 });
		 
		 $("#admin_att_delete").click(function(){
		     	var list = subTable.rows('.selected').data().toArray();
		     	
		     	var sup_cnt = list.length;
		     	
		     	if(sup_cnt == 0){
		     		alert("선택된 유저가 없습니다.");
		     		return;
		     	}
		     	
		     	var nick_select = [];
		     	for(var i = 0; i < list.length; i++){
		     		nick_select.push(list[i]);
		     	}
		     	
		     	var datas = {
		     		"list" : nick_select
		     	};
		     	
		     	jQuery.ajaxSettings.traditional = true;
		     	
		     	$.ajax({
	                url         :   "/delete",
	                dataType    :   "json",
	                contentType : "application/json; charset=UTF-8",
	                type        :   "post",
	                data        :   JSON.stringify(datas),
	                complete     :   function(){
	                    location.reload();
	                }
	            });
		 });
		 
		 
		 $("#allAdd").click(function(){
			 if(!confirm("모든 길드원이 수료에 참여하나요?"))
				 return;
			 
			 var datas = {
			     		"guildName" : '${guildName}',
			     		"server"		: '${server}'
			 };
			 
		     	$.ajax({
	             url         :   "/allsave",
	             dataType    :   "json",
	             contentType : "application/json; charset=UTF-8",
	             type        :   "post",
	             data		  :		JSON.stringify(datas),
	             complete     :   function(){
	                location.reload();
	             }
	         });
		 });
		 
		 $("#allDel").click(function(){
			 if(!confirm("전체 삭제 하시겠습니까?"))
				 return;
			 
				 var datas = {
				     		"guildName" : '${guildName}',
				     		"server"		: '${server}'
				 };	
			 
		     	$.ajax({
	             url         :   "/alldel",
	             dataType    :   "json",
	             contentType : "application/json; charset=UTF-8",
	             type        :   "post",
	             data		  :		JSON.stringify(datas),
	             complete     :   function(){
	                 location.reload();
	             }
	         });
		 });
 });
 
 

</script>
</body>
</html>
