<html>
<head>
<meta charset=UTF-8>
<title>Find Your College</title>
</head>
<body>
<form method="POST" action="<?=$_SERVER['PHP_SELF']?>">
</br>College Category<br/>
<select name="Option">
        <option value="1" >Public</option>
        <option value="2" >Private for Profile </option>
        <option value="3" >Private NFP with No Religious Affiliation</option>
	<option value="4" >Private,Religious ffiliation</option>
</select>
<input type="submit" name="submit" value="Submit" />
</br> <a href="condition1.php">Go Back</a>
<form/>
<?PHP
	SESSION_START();
//	$state=$_SESSION['state'];
//	$size=$_SESSION['size'];
	$_SESSION['category']=$_POST['option'];
//	 $conn = pg_connect("host=dbhost-pgsql.cs.missouri.edu dbname=bsvm7 user=bsvm7 password=42GYnxfs") or die('Could not connect: ' . pg_last_error());
//	if($size==1){
//        $result=pg_prepare($conn,"query","SELECT * from xx where name=$1");
//        $result=pg_execute($conn,"query",array(option));
//	}
//	else if($size==2){
  //      $result=pg_prepare($conn,"query","SELECT * from xx where name=$1");
  //      $result=pg_execute($conn,"query",array(option));
//	}
//	else{
  //      $result=pg_prepare($conn,"query","SELECT * from xx where name=$1");
    //    $result=pg_execute($conn,"query",array(option));
//	}
?>
