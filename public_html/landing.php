<?php
	$conn = pg_connect("host=dbhost-pgsql.cs.missouri.edu dbname=cs3380s15grp19 user=cs3380s15grp19 password=iw2Gtb2E") or die ('Could not connect: ' . pg_last_error());
?>
<!DOCTYPE HTML>
  <!-- Comment -->
<html lang="en">

<head> 
<!--Font Links (Through Google Fonts API!) --!>
<link href='http://fonts.googleapis.com/css?family=PT+Sans|Oswald:400,700' rel='stylesheet' type='text/css'>

<!-- Meta Data for the Google Robots-->
<meta charset="UTF-8"/>
<meta name="description" content="description of everything you will cover" />
<meta name="keywords" content="college, university, search, gpa, school, tuition" />

<link rel="stylesheet" href="styles.css"/>
<link rel="icon" href="imgs/MCSicon.ico"/>

<title>Landing - MyCollegeSearch </title>
</head>
<body>
<div id="wrapper">
<!--Structuring our data -->
	<header>
		<h1> MyCollegeSearch </h1>
	</header>
		
	<nav id="horzNav"> <!-- Nav Section: Navigation Bar of our webpage -->
		<p>
			<a href="file">  3 Step Search. </a>
			
			<a href="file2">  Compare Colleges.  </a>
			
			<a href="file3">  3rd Functionality.  </a>
		</p>
	</nav>
	
	<main id="content">  <!-- Holds the main content for each page --> 
	
	<section id="namesearch">
		<form action="/~cs3380s15grp19/landing.php" method = "POST">
		<br>
		<br>
			Enter the name of the college you'd like to know about: 
		<br>
		<br>
		<input type="text" id="uniname" name="input">
		<br>
		<br>
		<input type="submit" name="submit" id="submit">
		</form>
	</section>
	
	
					<!-- OUTPUTTING RELEVANT STATS ABOUT UNI FROM NAME SEARCH -->
	<section id="RelevantStats">
	<?php
			
		if (isset($_POST['submit']))  //what can we do when search returns no values?
		{					
			$nameSearched = htmlspecialchars($_POST['input']); //convert input to SQL INJECTION safe format
		//PATTERN MATCH USER INPUT TO CLOSEST UNIVERSITY NAME\\
			$result = pg_prepare($conn, "name", "SELECT INSTNM FROM unidb.unistats WHERE INSTNM ILIKE $1 LIMIT 1");
			$result = pg_execute($conn, "name", array("%".$nameSearched."%"));
			if(!$result) //check if query succeeded...
		{
			$errormessage = pg_last_error();
			echo "Error with 1st  query: " . $errormessage;
			exit();
		}
		$arr = pg_fetch_assoc($result); //store query results in $arr var
		$universityName = $arr['instnm'];
		echo "<p> University Name " . $arr['instnm'] . "</p>"; //print UniversityName
		
		//Obtain University Stats on college:
		$result = pg_prepare($conn, "Stats", "SELECT OPENADMP, CNTLAFFI, ENRLT, LEVEL3, LEVEL5, LEVEL7, LEVEL19, WEBADDR, APPLURL FROM unidb.unistats WHERE INSTNM ILIKE $1 LIMIT 1");		
		$result = pg_execute($conn, "Stats", array("%".$nameSearched."%"));
			if(!$result) //check if query succeeded...
		{
			$errormessage = pg_last_error();
			echo "Error with stat retrieval query: " . $errormessage;
			exit();
		}
		
		$arr2 = pg_fetch_assoc($result); //ARR2 DEE TOO
		
		/*
		echo "<p>" . $arr2['openadmp'] . " <- Admissions Policy Value  </p> "; //print:
		echo "<p>" . $arr2['cntlaffi'] . " <-  University Type Value   </p>"; //print:
		echo "<p>" . $arr2['enrlt'] . " <-  Students Currently Enrolled  </p>"; //print:
		echo "<p>" . $arr2['level3'] . " <- Associates (level3)  </p> "; //print:
		echo "<p>" . $arr2['level5'] . " <- Bachelors (level5)   </p>"; //print:
		echo "<p>" . $arr2['level7'] . " <- Masters (Level7)   </p>"; //print:
		echo "<p>" . $arr2['level19'] . " <-  Doctorate (Level19)  </p> "; //print:
		echo "<p>" . $arr2['webaddr'] . " <-  University Website  </p>"; //print:
		echo "<p>" . $arr2['applurl'] . " <-    Apply Here!  </p>"; //print:
		*/
		
		//Calculate ADMISSIONS POLICY \\
		switch ($arr2['openadmp'])
		{
			case 1:
			echo "<p> Admissions Policy: Open </p>";
			break;
			
			case 2:
			echo "<p> Admissions Policy: Closed </p>";
			break;
			
			default: 
			echo "<p> Admissions Policy: Information Not Recorded </p>";
			break;				
		}
		
		//Calculate UNIVERSITY TYPE (Public, Private etc.): \\ 
		switch ($arr2['cntlaffi'])
		{
			case 1:
			echo "<p> University Type: Public </p>";
			break;
			
			case 2:
			echo "<p> University Type: Private for-profit </p>";
			break;
			
			case 3: 
			echo "<p> University Type: Private non-profit (No Religious Affiliation) </p>";
			break;
			
			case 4:
			echo "<p> University Type: Private non-profit (Religious Affiliation) </p>";
			break;
			
			default: 
			echo "<p> University Type: Information Not Recorded </p>";
			break;				
		}
		
		//CALCULATE DEGREE TYPES: \\
		echo "<p> Degree Types Offered: </p>";
		if ($arr2['level3'] == 1)
		{
			echo "<p> Associates: Yes </p>";
		}
		else 
		{
			echo "<p> Associates: Implied No </p>";
		}
		
		if ($arr2['level5'] == 1)
		{
			echo "<p> Bachelors: Yes </p>";
		}
		else 
		{
			echo "<p> Bachelors: Implied No </p>";
		}
		
		if ($arr2['level7'] == 1)
		{
			echo "<p> Master's: Yes </p>";
		}
		else 
		{
			echo "<p> Master's: Implied No </p>";
		}	
				
		if ($arr2['level19'] == 1)
		{
			echo "<p> Doctorate: Yes </p>";
		}
		else 
		{
			echo "<p> Doctorate: Implied No </p>";
		}
		//////////////////////////////////////
		
		//Calculate Number of Students Enrolled:
		if ($arr2['enrlt'] != NULL)
		{
			$studentsEnrolled = $arr2['enrlt'] * 10; //formula to obtain accurate count of number of students enrolled
			echo "<p> Students currently enrolled: " . $studentsEnrolled . "</p>";
		}
		else 
		{
			echo "<p> Student enrollment information not currently provided </p>";	
		}
		
		//Print Institution Web Address
		if ($arr2['webaddr'] != NULL)
		{
			echo "<p> Visit <a href=".$arr2['webaddr'].">" . $arr2['webaddr'] . "</a></p>";
		}
		else 
		{
			echo "<p> Web Address Not Provided </p>";	
		}
		
		//provide a link to the application
		if ($arr2['applurl'] != NULL)
		{
			echo "<p> Apply Now! ->  <a href=".$arr2['applurl'].">" . $arr2['applurl'] . "</a></p>";
		}
		else 
		{
			echo "<p> Application Link Not Provided </p>";	
		}
		
		
		
		} //end if isset submit
	?>
	</section>	<!--End of RelevantStats Output Section -->
	</main>
		
</div>
</body>
</html>
