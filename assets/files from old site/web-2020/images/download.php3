<? 



include "globals.php3";


$image_id=$_GET['image_id'];

$image_array = mysql_query("SELECT * FROM images WHERE id = '$image_id'");

while ($image_row = mysql_fetch_array($image_array))

			{

			$image_id = $image_row['id'];

            $image_name = $image_row['name'];

            $image_filename = $image_row['filename'];

            $image_description = $image_row['description'];

            $image_author_name = $image_row['authorName'];

            $image_author_email = $image_row['authorEMail'];

            $image_author_url = $image_row['authorUrl'];

            $image_contributor = $image_row['contributorName'];

            $image_contributor_email = $image_row['contributorEmail'];

            $image_contributor_url = $image_row['contributorUrl'];

            $image_category = $image_row['category'];

            $image_rating = $image_row['ratings'];

            $image_width = $image_row['width'];

            $image_height = $image_row['height'];

            $image_size = $image_row['size'];

            $image_enabled = $image_row['enabled'];

			break;

}



$cat_array = mysql_query("SELECT * FROM categories WHERE id = '$image_category'");

while ($cat_row = mysql_fetch_array($cat_array))

			{

			$cat_id = $cat_row['id'];

            $cat_name = $cat_row['name'];

            $cat_directory = $cat_row['dirName'];

            $cat_parent = $cat_row['parent'];

			break;

			}



if ($cat_parent == '0'){

$sub_parent = "";

}

else {

$sub_array = mysql_query("SELECT * FROM categories WHERE id = '$cat_parent'");

while ($sub_row = mysql_fetch_array($sub_array))

			{

            $subcat_directory = $sub_row['dirName'];

			}



}



if ($subcat_directory == ""){

$sub_parent = "";

}else{

$sub_parent = "".$subcat_directory." >";

}



$subcat_dir_1 = "".$subcat_directory."/";

?>

<html>

<head>

<script LANGUAGE="JavaScript">
<!--


// Preload and play audio files with event handler (MouseOver sound)

// designed by JavaScript Archive, (c)1999

// Get more free javascripts at http://jsarchive.8m.com



var aySound = new Array();

// Below: source for sound files to be preloaded

aySound[0] = "sound1.wav";



// DO NOT edit below this line

document.write('<BGSOUND ID="auIEContainer">')

IE = (navigator.appVersion.indexOf("MSIE")!=-1 && document.all)? 1:0;

NS = (navigator.appName=="Netscape" && navigator.plugins["LiveAudio"])? 1:0;

ver4 = IE||NS? 1:0;

onload=auPreload;



function auPreload() {

if (!ver4) return;

if (NS) auEmb = new Layer(0,window);

else {

Str = "<DIV ID='auEmb' STYLE='position:absolute;'></DIV>";

document.body.insertAdjacentHTML("BeforeEnd",Str);

}

var Str = '';

for (i=0;i<aySound.length;i++)

Str += "<EMBED SRC='"+aySound[i]+"' AUTOSTART='FALSE' HIDDEN='TRUE'>"

if (IE) auEmb.innerHTML = Str;

else {

auEmb.document.open();

auEmb.document.write(Str);

auEmb.document.close();

}

auCon = IE? document.all.auIEContainer:auEmb;

auCon.control = auCtrl;

}

function auCtrl(whSound,play) {

if (IE) this.src = play? aySound[whSound]:'';

else eval("this.document.embeds[whSound]." + (play? "play()":"stop()"))

}

function playSound(whSound) { if (window.auCon) auCon.control(whSound,true); }

function stopSound(whSound) { if (window.auCon) auCon.control(whSound,false); }



function MM_timelinePlay(tmLnName, myID) { //v1.2

  //Copyright 1997 Macromedia, Inc. All rights reserved.

  var i,j,tmLn,props,keyFrm,sprite,numKeyFr,firstKeyFr,propNum,theObj,firstTime=false;

  if (document.MM_Time == null) MM_initTimelines(); //if *very* 1st time

  tmLn = document.MM_Time[tmLnName];

  if (myID == null) { myID = ++tmLn.ID; firstTime=true;}//if new call, incr ID

  if (myID == tmLn.ID) { //if Im newest

    setTimeout('MM_timelinePlay("'+tmLnName+'",'+myID+')',tmLn.delay);

    fNew = ++tmLn.curFrame;

    for (i=0; i<tmLn.length; i++) {

      sprite = tmLn[i];

      if (sprite.charAt(0) == 's') {

        if (sprite.obj) {

          numKeyFr = sprite.keyFrames.length; firstKeyFr = sprite.keyFrames[0];

          if (fNew >= firstKeyFr && fNew <= sprite.keyFrames[numKeyFr-1]) {//in range

            keyFrm=1;

            for (j=0; j<sprite.values.length; j++) {

              props = sprite.values[j]; 

              if (numKeyFr != props.length) {

                if (props.prop2 == null) sprite.obj[props.prop] = props[fNew-firstKeyFr];

                else        sprite.obj[props.prop2][props.prop] = props[fNew-firstKeyFr];

              } else {

                while (keyFrm<numKeyFr && fNew>=sprite.keyFrames[keyFrm]) keyFrm++;

                if (firstTime || fNew==sprite.keyFrames[keyFrm-1]) {

                  if (props.prop2 == null) sprite.obj[props.prop] = props[keyFrm-1];

                  else        sprite.obj[props.prop2][props.prop] = props[keyFrm-1];

        } } } } }

      } else if (sprite.charAt(0)=='b' && fNew == sprite.frame) eval(sprite.value);

      if (fNew > tmLn.lastFrame) tmLn.ID = 0;

  } }

}
//-->
</script>



<title>Gifs.net - Download <? echo "$image_name"; ?></title>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

</head>



<body bgcolor="#FFFFFF" topmargin="2">

<table width="98%" border="0" cellspacing="0" cellpadding="0">

  <tr bgcolor="#31639C"> 

    <td background="tabtop.jpg"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="3" color="#FFFFFF"> 
      &nbsp;<? echo "".$image_name.""; ?></font></b></td>

    <td align="right" valign="top" background="tabtop.jpg">&nbsp;</td>

  </tr>

</table>

<table width="98%" border="1" cellspacing="0" cellpadding="0" bordercolor="#efefef">

  <tr id='tableRow1' bgcolor="" valign="top"> 

    <td height="12"> 

      <div align="center"><font color="#FF0000" size="2" face="Verdana, Arial, Helvetica, sans-serif"> 

        </font> 

        <table width="98%" border="0" cellspacing="0" cellpadding="0">

          <tr> 


<td>

<script language="JavaScript">
<!--
ctxt_ad_partner = "1191208173";
ctxt_ad_section = "14696";
ctxt_ad_bg = "";
ctxt_ad_width = 160;
ctxt_ad_height = 600;
ctxt_ad_bc = "FFFFFF";
ctxt_ad_cc = "FFFFFF";
ctxt_ad_lc = "0000FF";
ctxt_ad_tc = "000000";
ctxt_ad_uc = "999999";
// -->
</script>
<script language="JavaScript" src="http://ypn-js.overture.com/partner/js/ypn.js">
</script>


</td>



            <td align="center" width="60%" valign="top"><font face=arial color=#000000 

                        size=-1><br><br>


                <center>
                <br>
                <? echo "<img src='../Animation11/".$subcat_dir_1."".$cat_directory."/".$image_filename.".gif' Alt='".$image_filename.".gif - (".$image_size."K)' width='".$image_width."' height='".$image_height."'>";?> 
                <br>
                <br>
              </center>
              </font> 
              <table width=300 align=center>

                <tbody> 

                <tr> 

                  <td bgcolor=black> 

                    <center>

                      <font face="arial" color="white" size="3"><b>How to Download</b></font> 

                    </center>

                  </td>

                <tr> 

                  <td bgcolor=white height="186"> 

                    <p align=left> <font face="arial" size="2"><b>To download 

                      in Windows or Linux:</b> Position your mouse over the image, 

                      click your right mouse button, then select "Save Image as 

                      ..." or "Save Picture as ..." from the pulldown menu. </font> 

                    <p><font face="arial" size="2"><b>To download in MAC:</b> 

                      Position your mouse over the image, hold your mouse button 

                      down for second, then select "Save Image as ..." or "Save 

                      Picture as ..." from the menu that will pop up. </font> 
                  
                  </td>

                </tr>

                </tbody> 

              </table>

              <br>

  

              <br>

              <br>

              <div align="center"><font face=Verdana size=1><font face=Verdana color=#000000 

            size=1><br>

                </font></font></div>

              <div align="center"></div>

              <font face=arial color=#000000 

                        size=-1><br>

              </font> <br>

              <font face=arial color=#000000 

                        size=-1> </font> <font face=arial color=#000000 

                        size=-1> </font></td>

          </tr>

        </table>

      </div>

      <div align="center"> <br>

      </div>

      <div align="center"> </div>

    </td>

  </tr>

</table>

<br>

</body>

</html>
<? mysql_close($link); ?>



