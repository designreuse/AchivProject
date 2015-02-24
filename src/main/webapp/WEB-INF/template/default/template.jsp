<%@ include file="taglib.jsp"%>
<!Doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ITAchiever</title>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value="/resources/css/bootstrap-theme.min.css" />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/datepicker.css" />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/jquery.timepicker.css" />"
	rel="stylesheet" type="text/css" />
<%-- <link href="<c:url value="/resources/css/pickmeup.min.css" />"
	rel="stylesheet" type="text/css" />  --%>
<link href="<c:url value="/resources/js/jquery.validate.js" />"
	type="text/javascript" />
<script src="<c:url value="/resources/js/js.js" />"></script>
<script src="<c:url value="/resources/js/jquery.jsontotable.min.js" />"></script>
<script src="<c:url value="/resources/js/jquery.validate.min.js" />"></script>
<script src="<c:url value="/resources/js/sorttable.js" />"></script>
<script src="<c:url value="/resources/js/validation.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap-datepicker.js" />"></script>
<script src="<c:url value="/resources/js/jquery.timepicker.js" />"></script>
<script src="<c:url value="/resources/js/jquery.timepicker.js" />"></script>


</head>
<body>
	<tiles:insertAttribute name="menu" />
	<div class="container">
		<tiles:insertAttribute name="body" />
	</div>
	<tiles:insertAttribute name="footer" />
</body>
</html>