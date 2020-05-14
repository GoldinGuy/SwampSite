<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF">
<?
 include "globals.php3"; 
$aotw = mysql_query("SELECT * from aotw where id=1");
while ($aotw2 = mysql_fetch_array($aotw)) {
$aotw3 = "".$aotw2['image']."";
$day = "".$aotw2['date']."";
}

$random_query = mysql_query("SELECT * from images WHERE id=$aotw3");
while ($random1 = mysql_fetch_array($random_query)) {
$category = "".$random1['category']."";
$cat_query = mysql_query("SELECT * from categories where id=$category");
while ($cat1 = mysql_fetch_array($cat_query)) {
$categ1 = "".$cat1['dirName']."";
$parent = "".$cat1['parent']."";
}
$parent_query = mysql_query("SELECT * from categories where id=$parent");
while ($parent1 = mysql_fetch_array($parent_query)) {
$parent2 = "".$parent1['dirName']."";
}
echo "<br><p align='center'><font face='Arial, Verdana' size='1'>Animation For $day;</font><br><a href='http://www.gifs.net/image/$parent2/$categ1/".$random1['filename']."/".$random1['id']."' target='_parent'><img src='http://www.gifs.net/Animation11/$parent2/$categ1/".$random1['filename'].".gif' width='".$random1['width']."' height='".$random1['height']."' border='0' alt='".$random1['name']."''></a><br><font face='Arial, Verdana' size='1'>".$random1['name']."</font></p>";
}
?> 
</body>
</html>
