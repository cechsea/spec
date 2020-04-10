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
	<title>수로 파티 도우미</title>
</head>
<body>
<h3>데이터 출처 : maple.gg</h3>
<h3>길드를 검색후 더블클릭하면 이동됩니다.</h3>

	<table>
	<tr>
	<td>
		<h2>길드</h2>
	</td>
	<td align="right">
	&nbsp;
	</td>
	</tr>
	<tr>
	<td colspan="2"  style="padding: 0 20 0 0px;">
	<table id="guildGrid"  class="table table-striped table-bordered" >
	<thead>
		<tr>
			<th>길드명</th>
			<th>서버</th>
			<th>서버2</th>
		</tr>
	</thead>
	</table>
	</td>
	</tr>
	</table>
 <script type="text/javascript"> 
 $(document).ready(function(){
	 $("#guildGrid").DataTable({
		 scrollY:500,
	     ajax: {
	      "type" : "GET",
	         "url" : "/guildselect",
	            "dataType": "json",
	            "dataSrc": function (d) {
	                    return d;
	            }
	         },
	    columns: [
	               { data: "guild_name" },
	               { data: "serverNm" },
	               { data: "server"},
	           ],
	    columnDefs: [
	        { "width": "150", "targets": 0 },
	        { "width": "120", "targets": 1 },
	        { "width": "120", "targets": 2, "visible" : false },
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
	 
	 
	
	 var allTable = $('#guildGrid').DataTable();
	 
	 
	 $('#guildGrid').on( 'dblclick', 'tr', function () {
	     $(this).toggleClass('selected');
	     var data = allTable.row(this).data();
	     location.href="/" + data.server + "/" + data.guild_name;
	 });
	 
 });
 
 

</script>
</body>
</html>
