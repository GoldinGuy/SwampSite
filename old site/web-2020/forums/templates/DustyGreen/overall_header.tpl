<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html dir="{S_CONTENT_DIRECTION}">
<head>
<meta http-equiv="Content-Type" content="text/html; charset={S_CONTENT_ENCODING}">
<meta http-equiv="Content-Style-Type" content="text/css">
{META}
{NAV_LINKS}
<title>{SITENAME} :: {PAGE_TITLE}</title>
<!-- link rel="stylesheet" href="templates/DustyGreen/{T_HEAD_STYLESHEET}" type="text/css" -->
<link rel="stylesheet" href="templates/DustyGreen/ssmitems.css" type="text/css">
</head>
<script>
<!--

/*
Copyright © MaXimuS 2002, All Rights Reserved.
Site: http://maximus.ravecore.com
E-mail: maximusforever@hotmail.com
Script: Static Slide Menu
Version: 6.6 Build 34
*/

NS6=(document.getElementById&&!document.all)
IE=(document.all);IE4=(document.all&&!document.getElementById)
NS=(navigator.appName=="Netscape" && navigator.appVersion.charAt(0)=="4")
OP=(navigator.userAgent.indexOf('Opera')>-1)

tempBar='';barBuilt=0;lastY=0;lastX=0;sI=new Array();moving=setTimeout('null',1);

function moveOut() {
	if(parseInt(ssm.left)<0&&mPos||parseInt(ssm.left)>0&&!mPos){
		clearTimeout(moving);
		moving=setTimeout('moveOut()', slideXSpeed);
		slideMenu((!mPos)?"out":"out");
		}
	else {
		clearTimeout(moving);
		moving=setTimeout('null',1);
	}
}
function moveBack() {
	clearTimeout(moving);
	moving=setTimeout('moveBack1()',waitTime);
}
function moveBack1() {
	if(parseInt(ssm.left)>-(menuWidth+1)&&mPos||parseInt(ssm.left)<menuWidth+1&&!mPos) {
		clearTimeout(moving);
		moving=setTimeout('moveBack1()',slideXSpeed);
		slideMenu((!mPos)?"in":"in");
	}
	else{
		clearTimeout(moving);
		moving=setTimeout('null',1);
	}
}
function slideMenu(way){
	fHow=(NS6)?0.4:0.2;
	if(way=="out")flow=fHow*-(parseInt(ssm.left));
	if(way=="in"&&!mPos)flow=fHow* (menuWidth+1-parseInt(ssm.left));
	else if(way=="in")flow=fHow*-(menuWidth+1+parseInt(ssm.left));
	if(flow>0)flow=Math.ceil(flow);
	else flow=Math.floor(flow);
	if(IE||NS6){
		lastX+=flow;
		bssm.clip="rect(0 "+((!mPos)?(barWidth+menuWidth+3):(barWidth+2+lastX))+" "+(((IE4)?document.body.clientHeight:0)+tssm.offsetHeight)+" "+((!mPos)?(lastX+1):0)+")";
		}
	ssm.left=parseInt(ssm.left)+flow;
	if(NS){
		if(!mPos){
			bssm.clip.left+=flow;
			bssm2.clip.left+=flow;
		}
		else{
			bssm.clip.right+=flow;
			bssm2.clip.right+=flow;
		}
		if(bssm.left+bssm.clip.right>document.width)document.width+=flow;
	}
}

function makeStatic() {
	winY=(IE)?document.body.scrollTop:window.pageYOffset;
	sHow=(NS6)?0.4:0.2;
	if(winY!=lastY&&winY>YOffset-staticYOffset)smooth=sHow*(winY-lastY-YOffset+staticYOffset);
	else if(YOffset-staticYOffset+lastY>YOffset-staticYOffset&&winY<=YOffset-staticYOffset)smooth=sHow*(winY-lastY-(YOffset-(YOffset-winY)));
	else smooth=0;
	if(smooth>0)smooth=Math.ceil(smooth);
	else smooth=Math.floor(smooth);
	bssm.top=parseInt(bssm.top)+smooth;
	lastY=lastY+smooth;
	setTimeout('makeStatic()',slideYSpeed);
}

function menuClick(id) { 
	obj=(document.all)?document.all(id):document.getElementById(id);
	with(obj){
		if(event.srcElement.id!=id){
			if(target=="_top")top.location=href;
			else if(target=="_parent")parent.location=href;
			else if(target=="_blank")window.open(href);
			else if(target>""&&top.frames[target])top.frames[target].location=href;
			else if(target>"")eval('window.open("'+href+'","'+target+'")');
			else location=href;
		}
	}
}

function buildBar() {
	if(!barType)tempBar='<IMG SRC="'+barText+'" BORDER="0">';
	else{
		for(b=0;b<barText.length;b++)tempBar+=barText.charAt(b)+"<BR>"
	}
	ssmHTML+='<td align="center" rowspan="100" width="'+barWidth+'" bgcolor="'+barBGColor+'" valign="'+barVAlign+'" align="'+barAlign+'" class="ssmBar" NOWRAP>'+tempBar+'</td>';
}

function initSlide() {
	if (!mPos)lastX=menuWidth
	if ((NS6||IE)&&!OP||(operaFix!=2&&OP)){
		ssm=(NS6)?document.getElementById("thessm").style:document.all("thessm").style;
		tssm=(NS6)?document.getElementById("thessm"):document.all("thessm");
		bssm=(NS6)?document.getElementById("basessm").style:document.all("basessm").style;
		bssm.clip="rect(0 "+(barWidth+2+((!mPos)?menuWidth+1:0))+" "+(((IE4)?document.body.clientHeight:0)+tssm.offsetHeight)+" "+((!mPos)?(menuWidth+1):0)+")";
		if (OP&&operaFix==1)XOff=(!mPos)?document.body.clientWidth-barWidth-3:0;
		bssm.left=(!mPos)?XOff-menuWidth:XOff;
		if(OP)ssm.left=ssm.left;
		bssm.visibility="visible";
		if(NS6&&!OP){
			bssm.top=YOffset;
			if(menuOpacity!=100)ssm.MozOpacity=menuOpacity/100;
			slideIsGo=window.innerHeight>tssm.offsetHeight+staticYOffset;
		}
		else{
			if(menuOpacity!=100)ssm.filter="alpha(opacity="+menuOpacity+")";
			slideIsGo=((OP)?window.innerHeight:document.body.clientHeight)>parseInt(tssm.offsetHeight)+staticYOffset;
			}
		if(autoHideXOverflow&&((IE?document.body.clientWidth:window.innerWidth-16)<parseInt(bssm.left)+parseInt(ssm.left)+menuWidth+barWidth+3)){
			document.body.style.overflowX="hidden";
			document.body.style.overflowY="scroll";
		}
	}
	else if(NS){
		bssm=document.layers["basessm1"];
		bssm2=bssm.document.layers["basessm2"];
		ssm=bssm2.document.layers["thessm"];
		bssm.clip.left=(!mPos)?menuWidth+1:0;
		bssm.clip.right=(!mPos)?(menuWidth+barWidth+3):barWidth+2;
		bssm.left=(!mPos)?XOff-menuWidth:XOff;
		ssm.visibility="show";
		slideIsGo=window.innerHeight>ssm.clip.bottom+staticYOffset;
	}
	if(slideY&&(slideOnYOverflow||(!slideOnYOverflow&&slideIsGo)))makeStatic();
	if(!slideX)moveOut();
}

function getXOff() {
	return (((!XAlign)?((IE||OP)?document.body.clientWidth-barWidth-3:window.innerWidth-barWidth-3-17):(XAlign==1)?Math.floor(((IE||OP)?document.body.clientWidth/2-barWidth/2-1.5:window.innerWidth/2-barWidth/2-1.5)):0)+XOffset);
}

function buildMenu() {
	mPos=menuPosition;
	ssmHTML="";
	XOff=getXOff();
	if(IE||NS6)ssmHTML+='<DIV ID="basessm" style="visibility:hidden;Position : Absolute ;Top : '+YOffset+' ;Z-Index : 20;width:'+(barWidth+2)+';"><DIV ID="thessm" style="Position : Absolute ;Left : '+((!mPos)?menuWidth+1:-menuWidth-1)+' ;Top : 0px ;Z-Index : 30;'+((IE)?"width:1px":"")+'" '+((slideX)?'onmouseover="moveOut()" onmouseout="moveBack()")':'')+'>';
	if(NS)ssmHTML+='<LAYER name="basessm1" top="'+YOffset+'" visibility="show" onload="initSlide()"><ILAYER name="basessm2"><LAYER visibility="hide" name="thessm" bgcolor="'+menuBGColor+'" left="'+((!mPos)?menuWidth+1:-menuWidth-1)+'" '+((slideX)?'onmouseover="moveOut()" onmouseout="moveBack()")':'')+'>';
	if(NS6)ssmHTML+='<table border="0" cellpadding="0" cellspacing="0" width="'+(menuWidth+barWidth+3)+'"><TR><TD>';
	ssmHTML+='<table border="0" cellpadding="0" cellspacing="1" width="'+(menuWidth+barWidth+3)+'" bgcolor="'+((!NS)?menuBGColor:"")+'">';
	for(i=0;i<sI.length;i++){
		ssmHTML+='<TR>';
		if(barBuilt==0&&!mPos){
			buildBar();
			barBuilt=1
		}
		if(sI[i][3]>1)ssmHTML+='<TD BGCOLOR="'+hdrBGColor+'" ALIGN="'+hdrAlign+'" WIDTH="'+menuWidth+'"'+((NS6)?' style="padding:'+hdrPadding+'px"':'><TABLE CELLPADDING="'+hdrPadding+'" CELLSPACING="0" BORDER="0"><TR><TD')+' CLASS="ssmHdr" VALIGN="'+hdrVAlign+'">'+((sI[i][3]==3)?'<a HREF="'+((sI[i][1].indexOf("://")==-1&&sI[i][1].indexOf("../")==-1)?targetDomain:'')+sI[i][1]+'" target="'+sI[i][2]+'" class="ssmHdr">':'')+sI[i][0]+((sI[i][3]==3)?'</a>':'')+((NS6)?'':'</TD></TR></TABLE>')+'</TD>';
		else{
			if(!sI[i][2])sI[i][2]=targetFrame;
			ssmHTML+='<TD WIDTH="'+menuWidth+'"'+(NS&&!sI[i][3]?'':'BGCOLOR="'+linkBGColor+'"')+' '+((NS6)?'CLASS="ssmItem" style="padding:'+linkPadding+'px;" ALIGN="'+linkAlign+'"':'')+' '+((sI[i][3])?'>':'onmouseover="style.backgroundColor=\''+linkOverBGColor+'\'" onmouseout="style.backgroundColor=\''+linkBGColor+'\'" onclick="menuClick(\'item_'+i+'\');"'+(IE?' style="cursor:hand;"':'')+'><ILAYER><LAYER onmouseover="bgColor=\''+linkOverBGColor+'\'" onmouseout="bgColor=\''+linkBGColor+'\'" WIDTH="100%" ALIGN="'+linkAlign+'" bgcolor="'+linkBGColor+'">')+((NS6)?'':'<DIV ALIGN="'+linkAlign+'" CLASS="ssmItem"><TABLE CELLPADDING="'+linkPadding+'" CELLSPACING="0" BORDER="0"><TR><TD VALIGN="'+linkVAlign+'" CLASS="ssmItem">')+((sI[i][3])?'':'<A HREF="'+((sI[i][1].indexOf("://")==-1&&sI[i][1].indexOf("../")==-1)?targetDomain:'')+sI[i][1]+'" target="'+sI[i][2]+'" CLASS="ssmItem" id="item_'+i+'">')+sI[i][0]+''+((sI[i][3])?'':'</A>')+((NS6)?'':'</TD></TR></TABLE></DIV>')+((sI[i][3])?'':'</LAYER></ILAYER>')+'</TD>';
		}
		if(barBuilt==0&&mPos){
			buildBar();
			barBuilt=1;
		}
		ssmHTML+='</TR>';
	}
	ssmHTML+='</table>';
	if(NS6)ssmHTML+='</TD></TR></TABLE>';
	if(IE||NS6){
		ssmHTML+='</DIV></DIV>';
		setTimeout('initSlide();',1);
	}
	if(NS)ssmHTML+='</LAYER></ILAYER></LAYER>';
	document.write(ssmHTML);
}

function addHdr(text){sI[sI.length]=[text, '', '', 2]}

function addLink(text, link, target){if(!link)link="javascript://";sI[sI.length]=[text, link, target, 3]}

function addItem(text, link, target){if(!link)link="javascript://";sI[sI.length]=[text, link, target, 0]}

function addText(text){sI[sI.length]=[text, '', '', 1]}

//window.onresize=function(){setTimeout('alert(getOff());XOff=getXOff();bssm.left=(!mPos)?XOff-menuWidth:XOff;');}

//-->
</script>
<script>
<!--
YOffset=40;
XAlign=2;
XOffset=0;
staticYOffset=20;
waitTime=500;
slideX=1;
slideXSpeed=15;
slideY=1;
slideYSpeed=15;
slideOnYOverflow=1;
autoHideXOverflow=1;
targetFrame="";
targetDomain="";
operaFix=0;
menuOpacity=100;
menuPosition=1;
menuBGColor="black";
menuWidth=125;
hdrBGColor="#2C323B";
hdrPadding=3;
hdrAlign="left";
hdrVAlign="center";
linkBGColor="#545C65";
linkOverBGColor="#2C323B";
linkAlign="left";
linkVAlign="center";
linkPadding=3;
barWidth=15;
barBGColor="#2C323B";
barAlign="left";
barVAlign="center";
barType=1;
barText="NAVIGATION";


//The Menu's Items
addHdr("Forum Navi.");
addItem("Home", "{U_INDEX}", "");
addItem("FAQ", "{U_FAQ}", "");
addItem("Search", "{U_SEARCH}", "");
addItem("Memberslist", "{U_MEMBERLIST}", "");
addItem("User Groups", "{U_GROUP_CP}", "");
<!-- BEGIN switch_user_logged_out -->
addItem("Register", "{U_REGISTER}", "");
<!-- END switch_user_logged_out -->
addItem("Profile", "{U_PROFILE}", "");
addItem("Priv.Msgs.", "{U_PRIVATEMSGS}", "");
addItem("{L_LOGIN_LOGOUT}", "{U_LOGIN_LOGOUT}", "");
buildMenu();


//-->
</script>
<style type="text/css">
<!--
/*
  The original subSilver Theme for phpBB version 2+
  Created by subBlue design
  http://www.subBlue.com

  NOTE: These CSS definitions are stored within the main page body so that you can use the phpBB2
  theme administration centre. When you have finalised your style you could cut the final CSS code
  and place it in an external file, deleting this section to save bandwidth.
*/

/* General page style. The scroll bar colours only visible in IE5.5+ */
body { 
	background-color: {T_BODY_BGCOLOR};
	scrollbar-face-color: {T_TR_COLOR2};
	scrollbar-highlight-color: {T_TD_COLOR2};
	scrollbar-shadow-color: {T_TR_COLOR2};
	scrollbar-3dlight-color: {T_TR_COLOR3};
	scrollbar-arrow-color:  {T_BODY_LINK};
	scrollbar-track-color: {T_TR_COLOR1};
	scrollbar-darkshadow-color: {T_TH_COLOR1};
}

/* General font families for common tags */
font,th,td,p { font-family: {T_FONTFACE1} }
a:link,a:active,a:visited { color : {T_BODY_LINK}; }
a:hover		{ text-decoration: underline; color : {T_BODY_HLINK}; }
hr	{ height: 0px; border: solid {T_TR_COLOR3} 0px; border-top-width: 0px;}

/* This is the border line & background colour round the entire page */
.bodyline	{ background-color: {T_TD_COLOR2}; border: 0px {T_TH_COLOR1} solid; }

/* This is the outline round the main forum tables */
.forumline	{ background-color: {T_TD_COLOR2}; border: 0px {T_TH_COLOR2} solid; }

/* Main table cell colours and backgrounds */
td.row1	{ background-color: {T_TR_COLOR1}; }
td.row2	{ background-color: {T_TR_COLOR2}; }
td.row3	{ background-color: {T_TR_COLOR3}; }

/*
  This is for the table cell above the Topics, Post & Last posts on the index.php page
  By default this is the fading out gradiated silver background.
  However, you could replace this with a bitmap specific for each forum
*/
td.rowpic {
		background-color: {T_TD_COLOR2};
		background-image: url(templates/DustyGreen/images/{T_TH_CLASS3});
		background-repeat: repeat-y;
}

/* Header cells - the blue and silver gradient backgrounds */
th	{
	color: {T_FONTCOLOR3}; font-size: {T_FONTSIZE2}px; font-weight : bold; 
	background-color: {T_BODY_LINK}; height: 25px;
	background-image: url(templates/DustyGreen/images/{T_TH_CLASS2});
}

td.cat,td.catHead,td.catSides,td.catLeft,td.catRight,td.catBottom {
			background-image: url(templates/DustyGreen/images/{T_TH_CLASS1});
			background-color:{T_TR_COLOR3}; border: {T_TH_COLOR3}; border-style: solid; height: 28px;
}

/*
  Setting additional nice inner borders for the main table cells.
  The names indicate which sides the border will be on.
  Don't worry if you don't understand this, just ignore it :-)
*/
td.cat,td.catHead,td.catBottom {
	height: 29px;
	border-width: 0px 0px 0px 0px;
}
th.thHead,th.thSides,th.thTop,th.thLeft,th.thRight,th.thBottom,th.thCornerL,th.thCornerR {
	font-weight: bold; border: {T_TD_COLOR2}; border-style: solid; height: 28px;
}
td.row3Right,td.spaceRow {
	background-color: {T_TR_COLOR3}; border: {T_TH_COLOR3}; border-style: solid;
}

th.thHead,td.catHead { font-size: {T_FONTSIZE3}px; border-width: 0px 0px 0px 0px; }
th.thSides,td.catSides,td.spaceRow	 { border-width: 0px 0px 0px 0px; }
th.thRight,td.catRight,td.row3Right	 { border-width: 0px 0px 0px 0px; }
th.thLeft,td.catLeft	  { border-width: 0px 0px 0px 0px; }
th.thBottom,td.catBottom  { border-width: 0px 0px 0px 0px; }
th.thTop	 { border-width: 0px 0px 0px 0px; }
th.thCornerL { border-width: 0px 0px 0px 0px; }
th.thCornerR { border-width: 0px 0px 0px 0px; }

/* The largest text used in the index page title and toptic title etc. */
.maintitle	{
	font-weight: bold; font-size: 22px; font-family: "{T_FONTFACE2}",{T_FONTFACE1};
	text-decoration: none; line-height : 120%; color : {T_BODY_TEXT};
}

/* General text */
.gen { font-size : {T_FONTSIZE3}px; }
.genmed { font-size : {T_FONTSIZE2}px; }
.gensmall { font-size : {T_FONTSIZE1}px; }
.gen,.genmed,.gensmall { color : {T_BODY_TEXT}; }
a.gen,a.genmed,a.gensmall { color: {T_BODY_LINK}; text-decoration: none; }
a.gen:hover,a.genmed:hover,a.gensmall:hover	{ color: {T_BODY_HLINK}; text-decoration: underline; }

/* The register, login, search etc links at the top of the page */
.mainmenu		{ font-size : {T_FONTSIZE2}px; color : {T_BODY_TEXT} }
a.mainmenu		{ text-decoration: none; color : {T_BODY_LINK};  }
a.mainmenu:hover{ text-decoration: underline; color : {T_BODY_HLINK}; }

/* Forum category titles */
.cattitle		{ font-weight: bold; font-size: {T_FONTSIZE3}px ; letter-spacing: 1px; color : {T_BODY_LINK}}
a.cattitle		{ text-decoration: none; color : {T_BODY_LINK}; }
a.cattitle:hover{ text-decoration: underline; }

/* Forum title: Text and link to the forums used in: index.php */
.forumlink		{ font-weight: bold; font-size: {T_FONTSIZE3}px; color : {T_BODY_LINK}; }
a.forumlink 	{ text-decoration: none; color : {T_BODY_LINK}; }
a.forumlink:hover{ text-decoration: underline; color : {T_BODY_HLINK}; }

/* Used for the navigation text, (Page 1,2,3 etc) and the navigation bar when in a forum */
.nav			{ font-weight: bold; font-size: {T_FONTSIZE2}px; color : {T_BODY_TEXT};}
a.nav			{ text-decoration: none; color : {T_BODY_LINK}; }
a.nav:hover		{ text-decoration: underline; }

/* titles for the topics: could specify viewed link colour too */
.topictitle,h1,h2	{ font-weight: bold; font-size: {T_FONTSIZE2}px; color : {T_BODY_TEXT}; }
a.topictitle:link   { text-decoration: none; color : {T_BODY_LINK}; }
a.topictitle:visited { text-decoration: none; color : {T_BODY_VLINK}; }
a.topictitle:hover	{ text-decoration: underline; color : {T_BODY_HLINK}; }

/* Name of poster in viewmsg.php and viewtopic.php and other places */
.name			{ font-size : {T_FONTSIZE2}px; color : {T_BODY_TEXT};}

/* Location, number of posts, post date etc */
.postdetails		{ font-size : {T_FONTSIZE1}px; color : {T_BODY_TEXT}; }

/* The content of the posts (body of text) */
.postbody { font-size : {T_FONTSIZE3}px; line-height: 18px}
a.postlink:link	{ text-decoration: none; color : {T_BODY_LINK} }
a.postlink:visited { text-decoration: none; color : {T_BODY_VLINK}; }
a.postlink:hover { text-decoration: underline; color : {T_BODY_HLINK}}

/* Quote & Code blocks */
.code { 
	font-family: {T_FONTFACE3}; font-size: {T_FONTSIZE2}px; color: {T_FONTCOLOR2};
	background-color: {T_TD_COLOR1}; border: {T_TR_COLOR3}; border-style: solid;
	border-left-width: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px
}

.quote {
	font-family: {T_FONTFACE1}; font-size: {T_FONTSIZE2}px; color: {T_FONTCOLOR1}; line-height: 125%;
	background-color: {T_TD_COLOR1}; border: {T_TR_COLOR3}; border-style: solid;
	border-left-width: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px
}

/* Copyright and bottom info */
.copyright		{ font-size: {T_FONTSIZE1}px; font-family: {T_FONTFACE1}; color: {T_FONTCOLOR1}; letter-spacing: -1px;}
a.copyright		{ color: {T_FONTCOLOR1}; text-decoration: none;}
a.copyright:hover { color: {T_BODY_TEXT}; text-decoration: underline;}

/* Form elements */
input,textarea, select {
	color : {T_BODY_TEXT};
	font: normal {T_FONTSIZE2}px {T_FONTFACE1};
	border-color : {T_BODY_TEXT};
}

/* The text input fields background colour */
input.post, textarea.post, select {
	background-color : {T_TD_COLOR2};
}

input { text-indent : 2px; }

/* The buttons used for bbCode styling in message post */
input.button {
	background-color : {T_TR_COLOR1};
	color : {T_BODY_TEXT};
	font-size: {T_FONTSIZE2}px; font-family: {T_FONTFACE1};
}

/* The main submit button option */
input.mainoption {
	background-color : {T_TD_COLOR1};
	font-weight : bold;
}

/* None-bold submit button */
input.liteoption {
	background-color : {T_TD_COLOR1};
	font-weight : normal;
}

/* This is the line in the posting page which shows the rollover
  help line. This is actually a text box, but if set to be the same
  colour as the background no one will know ;)
*/
.helpline { background-color: {T_TR_COLOR2}; border-style: none; }

/* Import the fancy styles for IE only (NS4.x doesn't use the @import function) */
@import url("templates/DustyGreen/formIE.css"); 
-->
</style>
<!-- BEGIN switch_enable_pm_popup -->
<script language="Javascript" type="text/javascript">
<!--
	if ( {PRIVATE_MESSAGE_NEW_FLAG} )
	{
		window.open('{U_PRIVATEMSGS_POPUP}', '_phpbbprivmsg', 'HEIGHT=225,resizable=yes,WIDTH=400');;
	}
//-->
</script>
<!-- END switch_enable_pm_popup -->
<a name="top"></a>
<body bgcolor="{T_BODY_BGCOLOR}" text="{T_BODY_TEXT}" link="{T_BODY_LINK}" vlink="{T_BODY_VLINK}" />
<table width="98%" cellspacing="0" border="0" cellpadding="0" align="center">
  <tr> 
		
    <td class="bodyline" background="templates/DustyGreen/images/head.jpg" valign="top"> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td background="templates/DustyGreen/images/forum-new2-top-left.jpg" width="26" height="163"> 
            <div align="center"></div>
          </td>
          <td height="163" background="templates/DustyGreen/images/forum-new2-top-fill.gif" valign="bottom"> 
            <div align="center"><img src="templates/DustyGreen/images/trans.gif" width="10" height="10"></div>
          </td>
          <td background="templates/DustyGreen/images/forum-new2-top-center.gif" width="256" height="163"> 
            <div align="center"></div>
          </td>
          <td height="163" background="templates/DustyGreen/images/forum-new2-top-fill.gif" valign="bottom"> 
            <div align="center"><img src="templates/DustyGreen/images/trans.gif" width="10" height="10"></div>
          </td>
          <td height="163" background="templates/DustyGreen/images/forum-new2-top-right.jpg" width="26"> 
            <div align="center"></div>
          </td>
        </tr>
      </table>
  </tr>
  <tr> 		
    <td class="bodyline" background="templates/DustyGreen/images/forum5-bg.gif">
      <div align="center">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="26" background="templates/DustyGreen/images/forum-new2-body-left.jpg"><img src="templates/DustyGreen/images/trans26.gif" width="26" height="10"></td>
            <td background="templates/DustyGreen/images/forum-new2-body-bg.jpg" valign="top" width="100%"> 
              <div align="center">