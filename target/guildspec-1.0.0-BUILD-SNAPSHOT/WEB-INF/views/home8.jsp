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
	<title> ${guildName} 길드 수로용</title>
</head>
<body>
<h3>데이터 출처 : maple.gg</h3>
<h3>최근 저장 : ${udtTime}</h3>
<input type="button" onclick="javascript:void(0)" id="specUdt" value="업데이트" >
<input type="button" onclick="javascript:void(0)" id="admin" value="관리자페이지(개발중...)" >

<table>
<tr>
<td style="vertical-align:top">
	<table>
	<tr>
	<td>
		<h2>딜러</h2>
	</td>
	<td align="right">
	&nbsp;
	</td>
	</tr>
	<tr>
	<td colspan="2"  style="padding: 0 20 0 0px;">
	<table id="attGrid"  class="table table-striped table-bordered" >
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
</td>
<td valign="top">
<table>
	<tr>
	<td>
		<h2>서포터</h2>
	</td>
	<td align="right">
	<select id="suro">
	    <option value="1-1">1-1</option>
	    <option value="1-2">1-2</option>
	    <option value="1-3">1-3</option>
	    <option value="2-1">2-1</option>
	    <option value="2-2">2-2</option>
	    <option value="2-3">2-3</option>
	    <option value="3-1">3-1</option>
	    <option value="3-2">3-2</option>
	    <option value="3-3">3-3</option>
	    <option value="4-2">4-1</option>
	    <option value="4-2">4-2</option>
	    <option value="4-3">4-3</option>
	</select>
	
	<input type="button" onclick="javascript:void(0)" id="m1" value="저장" >
	<input type="button" onclick="javascript:void(0)" id="m2" value="리셋" >
	<input type="button" onclick="javascript:void(0)" id="delete" value="삭제" >
	</td>
	</tr>
	<tr>
	<td colspan="2">
	<table id="subGrid"  class="table table-striped table-bordered" >
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
</td>
</tr>
<tr>
<td colspan="2">
<p id="1-1"></p>
<p id="1-2"></p>
<p id="1-3"></p>
<p id="2-1"></p>
<p id="2-2"></p>
<p id="2-3"></p>
<p id="3-1"></p>
<p id="3-2"></p>
<p id="3-3"></p>
<p id="4-1"></p>
<p id="4-2"></p>
<p id="4-3"></p>
</td>
</tr>
<tr>
<td style="vertical-align:top">
	<table>
	<tr>
	<td >
		<h2>전체</h2>
	</td>
	<td align="right">
	<input type="button" onclick="javascript:void(0)" id="allAdd" value="전체추가" >
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
	 
	 
	 $("#attGrid").DataTable({
		 scrollY:500,
	     ajax: {
	      "type" : "GET",
	         "url" : "/select/${server}/${guildName}",
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
	 
	 $("#subGrid").DataTable({
		 scrollY:500,
	     ajax: {
	      "type" : "GET",
	         "url" : "/supselect/${server}/${guildName}",
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
	 
	
	 var allTable = $('#allGrid').DataTable();
	 var attTable = $('#attGrid').DataTable();
	 var subTable = $('#subGrid').DataTable();
	 
	 
	 $('#allGrid').on( 'click', 'tr', function () {
	     $(this).toggleClass('selected');
	        
	 });
	 $('#subGrid').on( 'click', 'tr', function () {
	     $(this).toggleClass('selected');
	        
	 });
	 $('#attGrid').on( 'click', 'tr', function () {
	     $(this).toggleClass('selected');
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
	 
	 $("#m1").click(function(){
     	var suro = $("#suro option:selected").val();
			if(!confirm(suro + '에 저장하시겠습니까?')){
     		return ;
     	}
     	var all = attTable.rows('.selected').data().toArray();
     	var sup = subTable.rows('.selected').data().toArray();
     	
     	var all_cnt = all.length;
     	var sup_cnt = sup.length;
     	var list = $.merge(all,sup);
     	
     	if(all_cnt + sup_cnt == 0){
     		return;
     	}
     	
     	if(all_cnt + sup_cnt > 6){
     		alert("최대 6명까지 선택 가능합니다.");
     		return;
     	}
     	
     	var nick_select = [];
     	for(var i = 0; i < list.length; i++){
     		nick_select.push(list[i].nickname);
     	}
     	
     	$("#"+suro).html(suro+ " : " + nick_select);
     	
     	for(var i = 0; i< all.length; i++){
     		attTable.row('.selected').remove().draw( false );	
     	}
     	
     	for(var i = 0; i< sup.length; i++){
     		subTable.row('.selected').remove().draw( false );	
     	}
     	
     });
	 
	 $("#m2").click(function(){
		 if(!confirm("리셋하시겠습니까?"))
			 return;
     	location.reload();
     });
	 
	 $("#add").click(function(){
		 var all = allTable.rows('.selected').data().toArray();
		 
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
	 
	 $("#delete").click(function(){
		 var all = attTable.rows('.selected').data().toArray();
	     	var sup = subTable.rows('.selected').data().toArray();
	     	
	     	var all_cnt = all.length;
	     	var sup_cnt = sup.length;
	     	var list = $.merge(all,sup);
	     	
	     	if(all_cnt + sup_cnt == 0){
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
	 
	 $("#admin").click(function(){
		location.href="/admin/${server}/${guildName}";	 
	 });
 });
 
 

</script>
</body>
</html>
