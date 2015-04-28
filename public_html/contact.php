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

<title>Contact Us</title>
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
		<form name="contactform" method="post" action="send_form_email.php">
		<h2>If you have any questions or wish to add an accredited university to the website, e-mail us using the form below!</h3>
		<br>
		<table width="450px">
			<tr>
				<td valign="top">
  					<label for="first_name">First Name *</label>
 				</td>
 				<td valign="top">
 					 <input  type="text" name="first_name" maxlength="50" size="30">
 				</td>
			</tr>
			<tr>
 				<td valign="top"">
  					<label for="last_name">Last Name *</label>
 				</td>
 				<td valign="top">
  					<input  type="text" name="last_name" maxlength="50" size="30">
 				</td>
			</tr>
			<tr>
 				<td valign="top">
  					<label for="email">Email Address *</label>
 				</td>
 				<td valign="top">
  					<input  type="text" name="email" maxlength="80" size="30">
 				</td>
			</tr>
			<tr>
 				<td valign="top">
  					<label for="comments">Comments</label>
 				</td>
 				<td valign="top">
  					<textarea  name="comments" maxlength="1000" cols="25" rows="6"></textarea>
 				</td>
			</tr>
			<tr>
 				<td colspan="2" style="text-align:center">
 					 <input type="submit" value="Submit">
 				</td>
			</tr>
		</table>
	</form>
</main>
</body>
</html>

<?php
	// Here we get all the information from the fields sent over by the form.
	$email = $_POST['email'];
	$subject = $_POST['subject'];
	$message = $_POST['comments'];
 
	$to = 'cde9d5@mail.missouri.edu';
	$message = $message;
	$headers = 'From: '.$email."\r\n";
	
	if (filter_var($email, FILTER_VALIDATE_EMAIL)) { // this line checks that we have a valid email address
		mail($to, $subject, $message, $headers); //This method sends the mail.
		echo "Your email was sent!"; // success message
	}
	else{
		echo "Invalid Email, please provide an correct email.";
	}
?>
