<!--<?php
	$conn = pg_connect("host=dbhost-pgsql.cs.missouri.edu dbname=cs3380s15grp19 user=cs3380s15grp19 password=iw2Gtb2E") or die ('Could not connect: ' . pg_last_error());
?>-->
<!DOCTYPE HTML>
  <!-- Comment -->
<html lang="en">

<head> 
<!--Font Links (Through Google Fonts API!) --!>
<link href='http://fonts.googleapis.com/css?family=PT+Sans|Oswald:400,700' rel='stylesheet' type='text/css' />

<!-- Meta Data for the Google Robots-->
<meta charset="UTF-8"/>
<meta name="description" content="description of everything you will cover" />
<meta name="keywords" content="college, university, search, gpa, school, tuition" />

<link rel="stylesheet" href="getStats.css"/>
<link rel="icon" href="imgs/MCSicon.ico"/>

<title>Landing - MyCollegeSearch </title>
</head>

<body>
<div id="pageWrapper">

<div id="header">
		<h1 id="pageTitle"> MyCollegeSearch </h1>
		<p id="pageSlogan"> Your search, personalized. </p>
		<img src = "./imgs/mcsLogo2.png" alt= "MCS logo 2" id="logo2" align="left"  width="75px" height="75px"/>
		<img src = "./imgs/mcsLogo.png" alt= "MyCollegeSearch Logo" id="logo" width="220px" height="220px" align="right" />
		</hr>
</div> <!--End of Header -->

<div id='cssmenu' align="left">
<ul>
   <li class='active'><a href='#'><span>Home</span></a></li>
   <li><a href='#'><span>Get Stats</span></a></li>
   <li><a href='#'><span>College Match Tool</span></a></li>
   <li><a href='#'><span>On A Budget?</span></a></li>
   <li><a href='#'><span>About</span></a></li>
   <li class='last'><a href='#'><span>Contact</span></a></li>
</ul>
</div>

</br>
<!-- COST CONTENT HERE -->
<?php
	$conn = pg_connect("host=dbhost-pgsql.cs.missouri.edu dbname=cs3380s15grp19 user=cs3380s15grp19 password=iw2Gtb2E") or die ('Could not connect: ' . pg_last_error());
	$universityName = $_POST['uniname'];
	//echo $universityName;
	$incomeLevel = $_POST['income'];
	//echo $incomeLevel;
	$unitid = (int) $_POST['unitid'];
	//echo $unitid;
	$result = pg_prepare($conn, "cost", "SELECT * FROM unidb.tuitstats WHERE unitid = $1") OR DIE (pg_last_error());
	$result = pg_execute($conn, "cost", array($unitid)) OR DIE (pg_last_error());
	$arr = pg_fetch_array($result, null, PGSQL_ASSOC);
	//echo "\n";
	$cost = $arr["$incomeLevel"];
	//echo $cost;
	//echo "\n";
	/*
	var_dump( $cost);
     echo "There were <em>" . pg_num_rows($result) . "</em> rows returned<br /><br />";
                echo "<table border='1'>\n";
                //echo "<th> Actions </th>\n";
                /*$i = 0;
                while($i < pg_num_fields($result)){
                        $column_name = pg_field_name($result, $i++);
                        echo "<th> $column_name </th>\n";
                }*/ 
		/*
		while($line = pg_fetch_array($result, null, PGSQL_ASSOC)){
                        echo "\t<tr>\n";
                        foreach($line as $col_value){
                                echo "\t\t<td>$col_value</td>\n";
                        }
                        echo "\t</tr>\n";
                }

                echo "</table>\n";
		*/
	//end test block
		//echo "$universityName costs $cost !!! U cannot afford it!!!";
	if( $cost <> null ){
		echo "$universityName costs $$cost!!! U cannot afford it!!!";
	} else {
		echo "Sorry, we could not find that information for you";
	}
?>
</br>
</br>


					<!-- OUTPUTTING RELEVANT STATS ABOUT UNI FROM NAME SEARCH -->
</body>

</html>
