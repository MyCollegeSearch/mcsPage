<?PHP
	SESSION_START();
	$_SESSION['category']=$_POST['option2'];
	$state=$_SESSION['state'];
	$size=$_SESSION['size'];
	$category=$_SESSION['category'];
	$conn = pg_connect("host=dbhost-pgsql.cs.missouri.edu dbname=cs3380s15grp19 user=cs3380s15grp19 password=iw2Gtb2E") or die('Could not connect: ' . pg_last_error());
	if($size==1){
        $result=pg_prepare($conn,"query","select un.instnm from unidb.offerings as offer inner join unidb.universities as un using (unitid) where un.stabbr=$1 and offer.enrlt<5000 and offer.cntlaffi=$2;");
        $result=pg_execute($conn,"query",array($state,$category));        
        }
        else if($size==2){
        $result=pg_prepare($conn,"query","select un.instnm from unidb.offerings as offer inner join unidb.universities as un using (unitid) where un.stabbr=$1 and offer.enrlt>5000 and offer.enrlt<12000 and offer.cntlaffi=$2;");
        $result=pg_execute($conn,"query",array($state,$category));
        }
	else if($size==3){
        $result=pg_prepare($conn,"query","select un.instnm from unidb.offerings as offer inner join unidb.universities as un using (unitid) where un.stabbr=$1 and offer.enrlt>12000 and offer.cntlaffi=$2;");
        $result=pg_execute($conn,"query",array($state,$category));
        }
//	echo "$state...$size...$category";//,sta $size size,$category cat,1111";
	//echo "$_SESSION[state] 11";
	if(!$result){
	echo pg_last_error();
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
