<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/InstructionPage.css">
<title><%= session.getAttribute("test_name") %></title>
</head>

<body>
<div class="test_portion">
<h1 class="header">Test :<%= session.getAttribute("test_name") %></h1>
<div class="Time">
Duration : <%= request.getAttribute("TestTime") %>
</div>

<div class="instruction">
Istructions.....
</div>
<form method="post" action="StartTest">
<input class="closestartbtn"type="submit" value="Start Test"/>
</form>

</body>
</html>
