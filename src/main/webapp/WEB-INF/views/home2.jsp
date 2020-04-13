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
	<title>수로 파티 도우미(${guildName} 관리자 페이지)</title>
</head>
<body>
<h3>데이터 출처 : maple.gg</h3>
<h3>선택한 서포터 직업 : ${choicesup}</h3>
<input type="button" onclick="javascript:void(0)" id="specUdt" value="업데이트" >
<input type="button" onclick="javascript:void(0)" id="home" value="메인으로" >
<input type="button" onclick="javascript:void(0)" id="opensup" value="서포터 직업 선택" >
<input type="button" onclick="javascript:void(0)" id="openatt" value="수로 참여자 선택" >

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
	    <option value="1_1">1-1</option>
	    <option value="1_2">1-2</option>
	    <option value="1_3">1-3</option>
	    <option value="2_1">2-1</option>
	    <option value="2_2">2-2</option>
	    <option value="2_3">2-3</option>
	    <option value="3_1">3-1</option>
	    <option value="3_2">3-2</option>
	    <option value="3_3">3-3</option>
	    <option value="4_1">4-1</option>
	    <option value="4_2">4-2</option>
	    <option value="4_3">4-3</option>
	</select>
	
	<input type="button" onclick="javascript:void(0)" id="admin_suro_save" value="저장" >
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
</table>
<table>
<tr>
	<td>
	<table>
	<tr>
	<td>
		<h3>1수로</h3>
	</td>
	<td>
		<input type="button" onclick="javascript:void(0)" id="delete" value="삭제" >
	</td>
	</tr>
	</table>
	</td>
	</tr>
	<tr>
	<td style="padding: 0 20 0 0px; vertical-align:top;">
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
	<td style="padding: 0 20 0 0px ;vertical-align:top;">
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
	<td style="padding: 0 20 0 0px; vertical-align:top;">
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
	<td style="padding: 0 20 0 0px; vertical-align:top;">
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
	 
	 for(var i = 1; i<=4; i++){
		 for(var j = 1; j<4; j++){
			 $("#suro" + i + "_" + j).DataTable({
				 scrollY:500,
			     ajax: {
			      "type" : "GET",
			         "url" : "/suroselect/${server}/${guildName}/" + i + "_" + j,
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
		 		searching: false,
		 		ordering: false,
		 		info: false,
		 		paging: false,
		        bDestroy: true
		  });
		  
		  $('#suro' + i + "_" + j).on( 'click', 'tr', function () {
			     $(this).toggleClass('selected');
			        
			 });
		 }
	 }
	
	 var attTable = $('#attGrid').DataTable();
	 var subTable = $('#subGrid').DataTable();
	 var suro1_1Table = $('#suro1_1').DataTable();
	 var suro1_2Table = $('#suro1_2').DataTable();
	 var suro1_3Table = $('#suro1_3').DataTable();
	 var suro2_1Table = $('#suro2_1').DataTable();
	 var suro2_2Table = $('#suro2_2').DataTable();
	 var suro2_3Table = $('#suro2_3').DataTable();
	 var suro3_1Table = $('#suro3_1').DataTable();
	 var suro3_2Table = $('#suro3_2').DataTable();
	 var suro3_3Table = $('#suro3_3').DataTable();
	 var suro4_1Table = $('#suro4_1').DataTable();
	 var suro4_2Table = $('#suro4_2').DataTable();
	 var suro4_3Table = $('#suro4_3').DataTable();
	 
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
		 
		 $("#opensup").click(function(){
		 	location.href="/supselectpage/${server}/${guildName}";	 
		 });
		 
		 $("#openatt").click(function(){
			location.href="/attselectpage/${server}/${guildName}";	 
		 });
		 
		 $('#subGrid').on( 'click', 'tr', function () {
		     $(this).toggleClass('selected');
		        
		 });
		 $('#attGrid').on( 'click', 'tr', function () {
		     $(this).toggleClass('selected');
		 });
		 
		 $('#admin_suro_save').click(function () {
			 if(!confirm("저장하시겠습니까?"))
				 return;
			 var suro = $("#suro option:selected").val();
		     
			 var all = attTable.rows('.selected').data().toArray();
		     var sup = subTable.rows('.selected').data().toArray();
		     var list = $.merge(all,sup);
		     if(list.length == 0){
		    	 alert('선택된 길드원이 없습니다.');
		    	 return;
		     }
		     if(list.length > 6){
		    	 alert('최대 6명까지 선택 가능합니다.');
		    	 return;
		     }
		     if(eval('suro' + suro + 'Table').data().count() + list.length > 6){
		    	 alert('최대 6명까지 저장 가능합니다.');
		    	 return;
		     }
		     var nick_select = [];
		     for(var i = 0; i < list.length; i++){
		     	nick_select.push({ nickname : list[i].nickname, guild_code : list[i].guild_code, suro : suro});
		     }
		     
		     var datas = {
			 	"list" : nick_select
			 };
			 
			jQuery.ajaxSettings.traditional = true;
			 
			 $.ajax({
		         url         :   "/admin/suroins",
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
			 if(!confirm("삭제하시겠습니까?"))
				 return;
		     	for(var i = 1; i<=4; i++){
		   		 	for(var j = 1; j<4; j++){
		 				eval("var suro" + i + "_" + j + "select = suro" + i + "_" + j + "Table.rows('.selected').data().toArray()");
		   		 	}
		     	}
		     	
		 		var list = suro1_1select.concat(suro1_2select, suro1_3select, suro2_1select, suro2_2select, suro2_3select, suro3_1select, suro3_2select, suro3_3select, suro4_1select, suro4_2select, suro4_3select);
		 				     	
		     	
		     	if(list.length == 0){
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
	                url         :   "/admin/surodel",
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
