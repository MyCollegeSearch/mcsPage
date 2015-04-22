<html>
<head>
<meta charset=UTF-8>
<title>Find Your College</title>
</head>
<body>
<form method="POST" action="<?=$_SERVER['PHP_SELF']?>">
</br>Select the States<br/>
<select name="option">
        <option value="Al" >Al</option>
        <option value="AK" >AK</option>
        <option value="AZ" >AZ</option>
        <option value="AR" >AR</option>
        <option value="CA" >CA</option>
        <option value="CO" >CO</option>
        <option value="CT" >CT</option>
        <option value="DE" >DE</option>
        <option value="FL" >FL</option>
        <option value="GA" >GA</option>
        <option value="HI" >HI</option>
        <option value="ID" >ID</option>
        <option value="IL" >IL</option>
        <option value="IN" >IN</option>
        <option value="IA" >IA</option>
        <option value="KS" >KS</option>
        <option value="KY" >KY</option>
        <option value="LA" >LA</option>
        <option value="ME" >ME</option>
        <option value="MD" >MD</option>
        <option value="MA" >MA</option>
        <option value="MI" >MI</option>
        <option value="MN" >MN</option>
        <option value="MS" >MS</option>
        <option value="MO" >MO</option>
        <option value="MT" >MT</option>
        <option value="NE" >NE</option>
        <option value="NV" >NV</option>
        <option value="NH" >NH</option>
        <option value="NJ" >NJ</option>
        <option value="NM" >NM</option>
        <option value="NY" >NY</option>
        <option value="NC" >NC</option>
        <option value="ND" >ND</option>
        <option value="OH" >OH</option>
        <option value="OK" >OK</option>
        <option value="OR" >OR</option>
        <option value="PA" >PA</option>
        <option value="RI" >RI</option>
        <option value="SC" >SC</option>
        <option value="SD" >SD</option>
        <option value="TN" >TN</option>
        <option value="TX" >TX</option>
        <option value="UT" >UT</option>
        <option value="VT" >VT</option>
        <option value="VA" >VA</option>
        <option value="WA" >WA</option>
        <option value="WV" >WV</option>
        <option value="WI" >WI</option>
        <option value="WY" >WY</option>
</select>
<input type="submit" value="Next Step" onclick="javascript:form.action='condition1.php';"/>
<!--input type ="submit" value ="next step"-->
<br/> <a href="search.php">Go Back</a>
<form/>
<?php
	SESSION_START();
	$_SESSION['state'] = $_POST['option'];
//	header("location: https://babbage.cs.missouri.edu/~bsvm7/cs3380/group/condition1.php");
//	$conn = pg_connect("host=dbhost-pgsql.cs.missouri.edu dbname=bsvm7 user=bsvm7 password=42GYnxfs") or die('Could not connect: ' . pg_last_error());
//	$result=pg_prepare($conn,"query","SELECT * from xx where name=$1");
//	$result=pg_execute($conn,"query",array(option));
//	echo "$_SESSION[state]";
//	echo "$_POST[option] .111";
?>

