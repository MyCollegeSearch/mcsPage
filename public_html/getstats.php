<?php
	$conn = pg_connect("host=dbhost-pgsql.cs.missouri.edu dbname=cs3380s15grp19 user=cs3380s15grp19 password=iw2Gtb2E") or die ('Could not connect: ' . pg_last_error());
?>
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


<div id="namesearch">
		<form action="<?= $_SERVER['PHP_SELF'] ?>" method = "POST">
			Enter the name of the college you'd like to know about: 
		<input type="text" id="uniname" name="input" <? if(isset($_POST['submit'])){echo "value='".$_POST['input']."'";}?> />
		
		<input type="submit" name="submit" id="submit" />
		</form>
</div>

</br>
</br>


					<!-- OUTPUTTING RELEVANT STATS ABOUT UNI FROM NAME SEARCH -->
	<div> <!-- wrapper div added by scott -->
	<div id="ass">
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
			
			//Obtain University Stats on college:
			$result = pg_prepare($conn, "Stats", "SELECT UNITID, OPENADMP, CNTLAFFI, ENRLT, LEVEL3, LEVEL5, LEVEL7, LEVEL19, WEBADDR, APPLURL FROM unidb.unistats WHERE INSTNM ILIKE $1 LIMIT 1");		
			$result = pg_execute($conn, "Stats", array("%".$nameSearched."%"));
			if(!$result) //check if query succeeded...
			{
				$errormessage = pg_last_error();
				echo "Error with stat retrieval query: " . $errormessage;
				exit();
			}
		
			$arr2 = pg_fetch_assoc($result); //ARR2 DEE TOO
			$unitID = $arr2['unitid'];	
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
			if( pg_num_rows($result) == 0 ){
				echo "<p>Sorry, we did not find any schools with that name :(</p>";
			} else { //display stats
				//display university name	
				echo "<p><span class='result_type'>";
				echo "University Name:";
				echo "</span>";
				echo "<span class='result'>";
				echo $universityName;
				echo "</span></p>";
				//Calculate ADMISSIONS POLICY \\
				echo "<p><span class='result_type'>";
				echo "Admissions Policy:";
				echo "</span>";
				echo "<span class='result'>";
				switch ($arr2['openadmp'])
				{
					case 1:
					echo "Open";
					break;
					
					case 2:
					echo "Closed";
					break;
					
					default: 
					echo "Information Not Recorded";
					break;				
				}
				echo "</span></p>";
				
				//Calculate UNIVERSITY TYPE (Public, Private etc.): \\ 
				echo "<p><span class='result_type'>";
				echo "University Type:";
				echo "</span>";
				echo "<span class='result'>";
				switch ($arr2['cntlaffi'])
				{
					case 1:
					echo "Public";
					break;
					
					case 2:
					echo "Private for-profit";
					break;
					
					case 3: 
					echo "Private non-profit (No Religious Affiliation)";
					break;
					
					case 4:
					echo "Private non-profit (Religious Affiliation)";
					break;
					
					default: 
					echo "Information Not Recorded";
					break;				
				}
				echo "</span></p>";
				
				//CALCULATE DEGREE TYPES: \\
				echo "<p><span class='result_type'>";
				echo "Degree Types Offered:";
				echo "</span></p>";
				//associates
				echo "<p><span class='result_subtype'>";
				echo "Associates:";
				echo "</span>";
				echo "<span class='result'>";
				if ($arr2['level3'] == 1)
				{
					echo "Yes";
				} else {
					echo "Implied No";
				}
				echo "</span></p>";
				//bachelors
				echo "<p><span class='result_subtype'>";
				echo "Bachelors:";
				echo "</span>";
				echo "<span class='result'>";
				if ($arr2['level5'] == 1)
				{
					echo "Yes";
				} else {
					echo "Implied No";
				}
				echo "</span></p>";
				//masters
				echo "<p><span class='result_subtype'>";
				echo "Masters:";
				echo "</span>";
				echo "<span class='result'>";
				if ($arr2['level7'] == 1)
				{
					echo "Yes";
				} else {
					echo "Implied No";
				}	
				echo "</span></p>";		
				//masters
				echo "<p><span class='result_subtype'>";
				echo "Doctorate:";
				echo "</span>";
				echo "<span class='result'>";
				if ($arr2['level19'] == 1)
				{
					echo "Yes";
				} else {
					echo "Implied No";
				}	
				echo "</span></p>";		
				//////////////////////////////////////
				
				//Calculate Number of Students Enrolled:
				echo "<p><span class='result_type'>";
				echo "Students Currently Enrolled:";
				echo "</span>";
				echo "<span class='result'>";
				if ($arr2['enrlt'] != NULL)
				{
					$studentsEnrolled = $arr2['enrlt'] * 10; //formula to obtain accurate count of number of students enrolled
					echo $studentsEnrolled;
				}
				else 
				{
					echo "Information not currently provided";	
				}
				echo "</span></p>";
				
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
				echo "</div>";	//<!--End of RelevantStats Output Section -->
				
				// begin budget dropdown 
				echo "<div id='netcost_block'>";
				echo "<form action='cost.php' method = 'POST'>
					Select your income level:";
				
				echo "<select name='income'>
					<option value='npis412'>0-30,000</option>
					<option value='NPIS422'>30,001-48,000</option>
					<option value='NPIS432'>48,001-75,000</option>
					<option value='NPIS442'>75,001-110,000</option>
					<option value='NPIS452'>Over 110,000</option>
					</select>";	
				echo "<input type='hidden' name='uniname' id='uniname' value='" .$universityName. "'>";			
				echo "<input type='hidden' name='unitid' id='uniit' value='" .$unitID. "'>";			
				echo "<input type='submit' name='submit' id='submit' />
				</form>";
				//output cost info here
				echo "</div>";
			} //end display stats	
		
		} //end if isset submit
	?>
	</div>	<!--End of wrapper div->
	</main>
		
</div> <!--End of pageWrapper -->
</body>

</html>
