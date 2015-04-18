<html>
<head>
<meta charset=UTF-8>
<title>Find Your College</title>
</head>
<body>
<form method="POST" action="<?=$_SERVER['PHP_SELF']?>">
Serach for Your College<br/><br/>
College Search by Keyword: <input type="text" name="query_string" value="Search for the Keyword" /> <br /><br />
    <form id="action_form" method="POST" action="exec.php">
    <form id="action2" method="POST" action="success.php">
    <input type="submit" name="submit" value="Submit" />
</form>
Or Search the College by Condition <a href="condition.php">link</a>

