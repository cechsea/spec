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
 <script type="text/javascript"> 
 $(document).ready(function(){
	 var nic = prompt('[수로 참여or불참]닉네임을 입력해주세요.', '');
	 var gono = "${gono}";
	 if(nic == null){
		 alert("취소!");
		 location.href="/";
	 }
	 
	 $.ajax({
         url         :   "/userGoNo",
         type        :   "post",
         data		 :	 {nickName: nic, status: gono},
         complete     :   function(data){
        	 alert(data.responseText);
             location.href="/";
         }
     });
 });
 
 

</script>
</body>
</html>
