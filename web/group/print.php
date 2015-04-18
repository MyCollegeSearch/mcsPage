<?PHP
	SESSION_START();
	$state=$_SESSION['state'];
	$size=$_SESSION['size'];
	$category=$_SESSION['category'];
	if($size==1){
        $result=pg_prepare($conn,"query","SELECT universities.instnm from unidb.offerings as offer,unidb.universities as un where un.STABBR='$1' and offer.ENRLT<5000 and offer.CNTLAFFI ='$2'");
        $result=pg_execute($conn,"query",array(state,size));        
        }
        else if($size==2){
        $result=pg_prepare($conn,"query","SELECT * from xx where name=$1");
        $result=pg_execute($conn,"query",array(option));
        }
        else{
        $result=pg_prepare($conn,"query","SELECT * from xx where name=$1");
        $result=pg_execute($conn,"query",array(option));
        }
$number=pg_num_rows($result);
echo "<br> There are $number rows</br>";
$table = "<table border='1px'>";
$table .= "<thead>";
$table .= "<tr>";
$i = pg_num_fields($result);
for ($j = 0; $j < $i; $j++) {
    $fieldname = pg_field_name($result, $j);
    $table .= "<th>$fieldname</th>";
}
$table .= "</tr>";
//table body
$table .= "<tbody>";
while($row = pg_fetch_assoc($result))
{
    $table .= "<tr>";
    foreach ($row as $key => $value)
    {
        $table .= "<td>$value</td>";
    }
    $table .= "</tr>";
}
$table .= "</tbody>";
$table .= "</table>";
//echo table
echo $table;
?>
