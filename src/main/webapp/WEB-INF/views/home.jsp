<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
	<title>뒤에서 수로용</title>
</head>
<body>
<h3>데이터 출처 : maple.gg</h3>
<h3>데이터는 매 정각에 자동 저장됩니다.</h3>
<h3>1~6명 선택 후 우측상단 수로 선택 후 저장버튼 클릭시 GRID아래 복사하기 쉽게 표시</h3>
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
</table>
 <script type="text/javascript"> 
 $(document).ready(function(){
	 $("#attGrid").DataTable({
		 scrollY:500,
	     ajax: {
	      "type" : "GET",
	         "url" : "/select",
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
 		select: {
            style: 'multi'
        }
  });
	 
	 $("#subGrid").DataTable({
		 scrollY:500,
	     ajax: {
	      "type" : "GET",
	         "url" : "/supselect",
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
 		paging: false
  });
	
	 var attTable = $('#attGrid').DataTable();
	 var subTable = $('#subGrid').DataTable();
	 
	 
	 $('#subGrid').on( 'click', 'tr', function () {
		 console.log(attTable.rows('.selected').data().length + subTable.rows('.selected').data().length);
		 if(attTable.rows('.selected').data().length + subTable.rows('.selected').data().length >= 6){
			 alert('6명까지 선택할 수 있습니다.');
			 return;
		 }
	     $(this).toggleClass('selected');
	        
	 });
	 $('#attGrid').on( 'click', 'tr', function () {
		 console.log(attTable.rows('.selected').data().length + subTable.rows('.selected').data().length);
		 if(attTable.rows('.selected').data().length + subTable.rows('.selected').data().length >= 6){
			 alert('6명까지 선택할 수 있습니다.');
			 return;
		 }
	     $(this).toggleClass('selected');
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
     	
     	var nick_select = [];
     	for(var i = 0; i < list.length; i++){
     		nick_select.push(list[i].nickname);
     	}
     	console.log(nick_select);
     	
     	$("#"+suro).html(suro+ " : " + nick_select);
     	
     	for(var i = 0; i< all.length; i++){
     		attTable.row('.selected').remove().draw( false );	
     	}
     	
     	for(var i = 0; i< sup.length; i++){
     		subTable.row('.selected').remove().draw( false );	
     	}
     	
     });
	 
	 $("#m2").click(function(){
     	location.reload();
     });
 });

</script>
</body>
</html>
