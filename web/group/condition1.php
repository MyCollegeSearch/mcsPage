<html>
<head>
<meta charset=UTF-8>
<title>Find Your College</title>
</head>
<body>
<form method="POST" action="<?=$_SERVER['PHP_SELF']?>">
</br>Select the Amout of People of College<br/>
<select name="option1">
        <option value="1" >Small(1-5000)</option>
        <option value="2" >Medium(5000-12000) </option>
        <option value="3" >Lagre(Over 12000)</option>
</select>
<input type="submit" value="Next Step" onclick="javascript:form.action='condition2.php';"/>
</br> <a href="condition.php">Go Back</a>
<form/>
<?PHP
	SESSION_START();
	$_SESSION['size'] = $_POST['option1'];
	$_SESSION['state'] = $_POST['option'];
	//echo "$_SESSION[state] .1212$_SESSION[size]131 $_POST[option]";
?>
