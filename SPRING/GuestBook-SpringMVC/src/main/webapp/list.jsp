<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="<c:url value="/css/default.css"/>" rel="stylesheet" type="text/css">
</head>
<body>
<!-- to make single page using JSON/ajax --> 
<div id="contents">
	<H1>GUESTBOOK</H1>

	<a href="#">✔️write message</a>

	<article id="list">

	</article>
	<div id="paging">
	</div>
</div>
<script>
	$(document).ready(function(){
		page(1);
	});
	
	/* page function */
	function page(num) {
		$.ajax({
			url : 'guest/listJson',
			type : 'get',
			data : {page:num},
			success : function(data){
				/* alert(data);
				console.log(data);
				alert(data.messageTotalCount);
				alert(JSON.stringify(data)); */
				
				var output = '';
				
				var list = data.messageList;
				for(var i = 0; i < list.length; i++){
					console.log(list[i]);
					var id = list[i].id;
					var guestname = list[i].guestname;
					var message = list[i].message;
					
					
					output += '<div id="msgbox">\n';
					output += 'no      : '+id+' <br>\n';
					output += 'writer  : '+guestname+' <br>\n';
					output += 'message : '+message+' <br>\n';
					output += '<a href="#?messageId='+id+'">delete message</a>';
					output += '</div>\n';
				}
				
				var paging = '';
				
				for(var p=1; p<=data.pageTotalCount; p++){
					paging += '<span class ="paging"><a href="#" onclick="page('+p+')">'+ p + '</a></span> ';
				}
				
				$('#list').html(output);
				$('#paging').html(paging);
				
			}
		});
	
	};
	
</script>
</body>
</html>