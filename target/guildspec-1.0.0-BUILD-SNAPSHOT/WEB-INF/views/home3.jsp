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
<h3>선택한 서포터 직업 : ${choicesup}</h3>
<input type="button" onclick="javascript:void(0)" id="home" value="메인으로" >
<input type="button" onclick="javascript:void(0)" id="admin" value="관리자 화면으로" >

<table>
	<tr>
<td style="vertical-align:top">
	<table>
	<tr>
	<td>
		<h2>서포터로 선택 안된 직업</h2>
	</td>
	<td align="right">
	<input type="button" onclick="javascript:void(0)" id="admin_sup_save" value="저장" >
	</td>
	</tr>
	<tr>
	<td colspan="2"  style="padding: 0 20 0 0px;">
	<table id="attGrid"  class="table table-striped table-bordered" >
	<thead>
		<tr>
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
		<h2>서포터로 선택된 직업</h2>
	</td>
	<td align="right">
	<input type="button" onclick="javascript:void(0)" id="admin_sup_delete" value="삭제" >
	</td>
	</tr>
	<tr>
	<td colspan="2">
	<table id="subGrid"  class="table table-striped table-bordered" >
	<thead>
		<tr>
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
	         "url" : "/suplist/${server}/${guildName}",
	            "dataType": "json",
	            "dataSrc": function (d) {
	                    return d;
	            }
	         },
	    columns: [
	               { data: "job" }
	           ],
	    columnDefs: [
	        { "width": "500px", "targets": 0 }
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
	         "url" : "/guildsuplist/${server}/${guildName}",
	            "dataType": "json",
	            "dataSrc": function (d) {
	                    return d;
	            }
	         },
	    columns: [
	               { data: "job" }
	           ],
	    columnDefs: [
	        { "width": "500px", "targets": 0 }
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
		 
		 $('#admin_sup_save').click(function () {
			 if(!confirm("저장하시겠습니까?"))
				 return;
		     
			 var all = attTable.rows('.selected').data().toArray();
		     if(all.length == 0){
		    	 alert('선택된 직업이 없습니다.');
		    	 return;
		     }
		     var nick_select = [];
		     
		     for(var i = 0; i < all.length; i++){
		     	nick_select.push({ job : all[i].job, guild_name : '${guild_name}', server : '${server}'});
		     }
		     
		     var datas = {
			 	"list" : nick_select
			 };
			 
			jQuery.ajaxSettings.traditional = true;
			 
			 $.ajax({
		         url         :   "/admin/supins",
		         dataType    :   "json",
		         contentType : "application/json; charset=UTF-8",
		         type        :   "post",
		         data        :   JSON.stringify(datas),
		         complete     :   function(){
		             location.reload();
		         }
		     });
		 });
		 
		 $('#admin_sup_delete').click(function () {
			 if(!confirm("삭제하시겠습니까?"))
				 return;
		     
			 var all = subTable.rows('.selected').data().toArray();
		     if(all.length == 0){
		    	 alert('선택된 직업이 없습니다.');
		    	 return;
		     }
		     var nick_select = [];
		     
		     for(var i = 0; i < all.length; i++){
		     	nick_select.push({ job : all[i].job, guild_name : '${guild_name}', server : '${server}'});
		     }
		     
		     var datas = {
			 	"list" : nick_select
			 };
			 
			jQuery.ajaxSettings.traditional = true;
			 
			 $.ajax({
		         url         :   "/admin/supdel",
		         dataType    :   "json",
		         contentType : "application/json; charset=UTF-8",
		         type        :   "post",
		         data        :   JSON.stringify(datas),
		         complete     :   function(){
		             location.reload();
		         }
		     });
		 });
		 
 });
 
 

</script>
</body>
</html>
