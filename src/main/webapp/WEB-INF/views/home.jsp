<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
	<link rel="stylesheet" type="text/css" media="screen" href="/resources/css/jquery-ui.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="/resources/css/ui.jqgrid.css" />
    
    <script type="text/javascript" src="/resources/js/jquery-3.2.1.js"></script> 
    <script type="text/javascript" src="/resources/js/i18n/grid.locale-kr.js"></script>
    <script type="text/javascript" src="/resources/js/jquery.jqGrid.min.js"></script>
    
    <meta charset="utf-8" />
	<title>뒤에서 수로용</title>
</head>
<body>
<h3>데이터 출처 : maple.gg</h3>
<table>
<tr>
<td>
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
	<td colspan="2">
	<table id="jqGrid"></table>
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
	<table id="subGrid"></table>
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
        $(document).ready(function () {
            $("#jqGrid").jqGrid({
                url: '/select',
                mtype: "GET",
                datatype: "json",
                colNames: ["닉네임", "레벨", "직업", "무릉"],
                colModel: [
                    { name: 'nickname', key: true, width: 150, sortable:false },
                    { name: 'level', width: 75, align:"right", sortable:false },
                    { name: 'job', width: 150, sortable:false },
                    { name: 'spec', width: 300, sortable:false }
                ],
                viewrecords: true,
                height: 500,
                rowNum: 300,
                multiselect: true,
                
                onSelectRow: function(rowid, status, e) {
                	var all = jQuery("#jqGrid").jqGrid('getGridParam', 'selarrrow');
                	var sup = jQuery("#subGrid").jqGrid('getGridParam', 'selarrrow');
                	if(all.length + sup.length == 7){
                		alert('6명까지만 선택가능합니다.');
                		$('#jqGrid').jqGrid('setSelection', rowid).prop('checkbox', false);
                	}else if(all.length + sup.length > 7){
                		alert('다시 선택해주세요.');
                		$("#jqGrid").jqGrid("resetSelection");
                		$("#subGrid").jqGrid("resetSelection");
                	}
                  },
            });
            
            $("#subGrid").jqGrid({
                url: '/supselect',
                mtype: "GET",
                datatype: "json",
                colNames: ["닉네임", "레벨", "직업", "무릉"],
                colModel: [
                    { name: 'nickname', key: true, width: 150, sortable:false },
                    { name: 'level', width: 75, align:"right", sortable:false },
                    { name: 'job', width: 150, sortable:false },
                    { name: 'spec', width: 300, sortable:false }
                ],
                viewrecords: true,
                height: 500,
                rowNum: 300,
                multiselect: true,
                onSelectRow: function(rowid, status, e) {
                	var all = jQuery("#jqGrid").jqGrid('getGridParam', 'selarrrow');
                	var sup = jQuery("#subGrid").jqGrid('getGridParam', 'selarrrow');
                	console.log(all.length + sup.length);
                	if(all.length + sup.length == 7){
                		alert('6명까지만 선택가능합니다.');
                		$('#subGrid').jqGrid('setSelection', rowid).prop('checkbox', false);
                	}else if(all.length + sup.length > 7){
                		alert('다시 선택해주세요.');
                		$("#jqGrid").jqGrid("resetSelection");
                		$("#subGrid").jqGrid("resetSelection");
                	}
                  },
            });
            
            $("#m1").click(function(){
            	var suro = $("#suro option:selected").val();
				if(!confirm(suro + '에 저장하시겠습니까?')){
            		return false;
            	}
            	var all = jQuery("#jqGrid").jqGrid('getGridParam', 'selarrrow');
            	var sup = jQuery("#subGrid").jqGrid('getGridParam', 'selarrrow');
            	
            	var all_cnt = all.length;
            	var sup_cnt = sup.length;
            	var list = $.merge(all,sup);
            	
            	$("#"+suro).html(suro+ " : " + list);

            	for(var i=0; i<all_cnt; i ++) {
            	    $('#jqGrid').jqGrid('delRowData', all[0])
            	}
            	for(var i=0; i<sup_cnt; i ++) {
            	    $('#subGrid').jqGrid('delRowData', sup[0])
            	}
            	

            	$("#jqGrid").jqGrid("resetSelection");
        		$("#subGrid").jqGrid("resetSelection");
            });
            
            $("#m2").click(function(){
            	location.reload();
            });
            
        });
</script>
</body>
</html>
