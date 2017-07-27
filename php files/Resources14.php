<?php
//this page is a copy of resources12 page
require("./connection2.php"); include("connection1.php");//has all connection(bewtween db and project (code)) related commands
session_start();
$var1="";
$var2="";
$temp1=0;//variable to address an year
$temp2=0;//variable to address a row
$submitted=0;//flag to check submit

$bands=array('P2','P1','U4','U3','U2','U1'); //has all bands listed in an array
$onsals=array(0,0,0,0,0,0);//initialise the values of offshore salaries with 0
$offsals=array(0,0,0,0,0,0);//initailise the values of onsite salaries with 0
$onbandcont=array();//array to store contributions of onsite resources 
$offbandcont=array();//array to store contributions of offshore resources 
$offmonthlycont=array(array(array()));//3d array to store the values of offshore contributions, yearwise, monthwise and band wise
$onmonthlycont=array(array(array()));//3d array to store the values of onsite contributions, yearwise, monthwise and band wise

$offyearlycont=array();//to store yearly offshore contributions 
$onyearlycont=array();//to store yearly onsite contributions 

$yearlycont=array();//sum of yearly contributions

$onsum=array(0,0,0,0,0,0);//to count number of onsite resources of the project
$offsum=array(0,0,0,0,0,0);//to count no of offshore rsources of the project
$totalcont=0;//to store the total contribution of the all resources

$projectid=$_SESSION['pid'];//should fetch the project id from the previous page
//$projectid=$_SESSION['pid'];//should fetch the project id from the previous page
$projectname="";//should fetch from database, 'projectdetails' table
$projectrevenue=0;//should fetch from database, 'projectdetails' table
$projectdetails="";//should fetch from database, 'projectdetails' table
$noofmonths=0;//should fetch from database, 'projectdetails' table
$noofyears=0;//should fetch from database, 'projectdetails' table

$projectmanagerid="";//should fetch from database, 'projectdetails' table
$projectmanagername="";//should fetch from database, 'projectdetails' table
$programmanagerid="";//should fetch from database, 'projectdetails' table
$programmanagername="";//should fetch from database, 'projectdetails' table
$ibuheadid="";//should fetch from database, 'projectdetails' table
$ibuheadname="";//should fetch from database, 'projectdetails' table
$ibgheadid="";//should fetch from database, 'projectdetails' table
$ibgheadname="";//should fetch from database, 'projectdetails' table

$row=0;
$col=0;
$table="";//part of body storing one tabkle(one year)
$tables="";//part of body containg all tables in the page
$form="";//total body of the page from 'Year' to 'save','submit','clearall'
$results="";//part of the body to print the project details like profit, toatal contribution 
$updatevaluesquery="";//a string to store a command for updating the entered values in a row in the page 
$number=0;

$query="";//appended updatevaluesquery commands of all the updates in the page for all tables
$resupquery="";//result of updatevaluesquery

$projectdetailsquery="SELECT * FROM `projectdetails` WHERE `ProjectID`='".$projectid."'";
$resprojectdetailsquery=mysqli_query($conn,$projectdetailsquery);
$row1=mysqli_fetch_assoc($resprojectdetailsquery);

$projectname=$row1['Name'];
$projectrevenue=$row1['Revenue'];
$noofmonths=$row1['NoOfMonths'];
$noofyears=$row1['NoOfYears'];
$ibuheadname=$row1['IBUHead'];
$ibgheadname=$row1['IBGHead'];
$programmanagername=$row1['ProgramManager'];
$projectmanagername=$row1['ProjectManager'];
$startdate=$row1['StartDate'];
$enddate=$row1['EndDate'];
$currency=$row1['Currency'];


$number=array(array());

if($noofmonths%12==0&&$noofmonths%2==0)
{
    $noofyears=($noofmonths/12);
}
else
{
    $noofyears=floor($noofmonths/12)+1;
}

$projectdetails="<font><center><table style=\"width:90%;border:2px solid black;\"><tr><p><td><b>Project ID:</b></td><td>".$projectid."</td> </p><p><td><b>Project Name:</b></td><td>".$projectname."</td> </p></tr><tr><p><td><b>IBG Head:</b></td><td>".$ibgheadname."</td> </p><p><td><b>IBU Head :</b></td><td>".$ibuheadname."</td> </p></tr><tr><p><td><b>Program Manger :</b></td><td>".$programmanagername."</td> </p><p><td><b>Project Manager:</b></td><td>".$projectmanagername."</td> </p></tr><tr><p><td><b>Start Date :</b></td><td>".$startdate."</td> </p><p><td><b>End Date:</b></td><td>".$enddate."</td> </p></tr><tr><p><td><b>No of Months:</b></td><td>$noofmonths</td></p><p><td><b>Project Revenue:</b></td><td>$projectrevenue</td></p></tr></table></center></font>";



for($i=0;$i<=5;$i++)//to fetch from database and set all average Salary in an array 
{
    $onsalsquery="SELECT `maxSal`,`minSal` FROM `bandsal` WHERE `Location`='ONSITE' AND `Band`='".$bands[$i]."';";
    $resonsalquery=mysqli_query($conn,$onsalsquery);
    $row2=mysqli_fetch_assoc($resonsalquery);
    $onsals[$i]=($row2['maxSal']+$row2['minSal'])/2;
}

for($j=0;$j<=5;$j++)//to fetch from database and set all average Salary in an array 
{
    $offsalsquery="SELECT `maxSal`,`minSal` FROM `bandsal` WHERE `Location`='OFFSHORE' AND `Band`='".$bands[$j]."';";
    $resoffsalquery=mysqli_query($conn,$offsalsquery);
    $row3=mysqli_fetch_assoc($resoffsalquery);
    $offsals[$j]=($row3['maxSal']+$row3['minSal'])/2;
}

$form="<center>
    <div class=\"sam\" style=\"height: 450px; width: 1200px;\">
    <form action=\"Resources14.php\" method='post'>";
$tables=$form;


for($temp1=1;$temp1<=$noofyears;$temp1++)//temp1---table or year
{
    $onsum=array(0,0,0,0,0,0);
    $offsum=array(0,0,0,0,0,0);


    $table="<center><h2>Year ".$temp1."</h2></center><center><table style=\"width:80%;border:2px solid #FFFFFF;border-collapse:collapse;\">";
    for($temp2=1;$temp2<=17;$temp2++)//temp2----row in a table
    {
        $table.="<tr>";
        if($temp2==1) 
        {
            $table.="<center><td colspan=\"15\" style=\"border:2px solid #DDD;padding:15px;background-color:#FF0000;\" align = \"center\">&nbsp;<b>OFFSHORE</b></td></center>";
        }
        elseif($temp2==2) 
        {
            $table.="<td style=\"border:1px solid #DDD;padding:15px;\"> Band\Month</td><td>Month 1</td><td>Month 2</td><td>Month 3</td><td>Month 4</td><td>Month 5</td><td>Month 6</td><td>Month 7</td><td>Month 8</td><td>Month 9</td><td>Month 10</td><td>Month 11</td><td>Month 12</td><td>Rate</td><td>Contribution</td>";
        }
        elseif($temp2>=3 && $temp2<=8){
            for($col=1;$col<=14;$col++)
            {
                if($col==1)
                {
                    $table.="<td>HeadCount: ".$bands[$temp2-3]."</td>";
                }
                elseif($col<=13)
                {
                    $varquery="SELECT `M".intval($col-1)."` FROM  `projectresources` WHERE `ProjectID`='".$projectid."' AND `Year`=$temp1 AND `Band`='".$bands[$temp2-3]."' AND `Location`='OFFSHORE';"; 
                    $resvarquery=mysqli_query($conn,$varquery);
                    $row3=mysqli_fetch_assoc($resvarquery);
                    $val=$row3["M".intval($col-1).""];
                    $offsum[$temp2-3]=$offsum[$temp2-3]+$val;
                    $offmonthlycont[$temp1-1][$col-1][$temp2-3]=$val*$offsals[$temp2-3];
                    if($val==0) $val=NULL;
                    if($noofmonths%12!=0 && $temp1==$noofyears && ($col-1)>$noofmonths%12)
                    {
                        $str="<td><input style=\"background-color:#D5D5D5\" type=\"number\" readonly=\"readonly\" name=t".$temp1."r".intval($temp2-2)."c".intval($col-1)." min=\"0\" max=\"999\" ></td>";
                    }
                    else
                    {
                        $str="<td><input type=\"number\" value=\"".$val."\" name=t".$temp1."r".intval($temp2-2)."c".intval($col-1)."  min=\"0\" max=\"999\" ></td>"; 
                    }
                    $table.=$str;
                }
                else
                {
                    $offbandcont[$temp2-3]=($offsum[$temp2-3]*$offsals[$temp2-3]);//band wise contribution calculation
                    $table.="<td><output name=t".$temp1."r".intval($temp2-2)."c".intval($col-1)." size=\"2\">".intval($offbandcont[$temp2-3])."<td>".number_format((($projectrevenue-($offbandcont[$temp2-3]))/$projectrevenue)*100,3)."%</output></td>";//calculation
                }
            }
        }
        elseif($temp2==9) 
        {
            for($col=1;$col<=14;$col++)
            {
                if($col==1)
                {
                    $table.="<td>Monthly Contribution($currency)</td>";
                }
                elseif($col<=13)
                {
                    $table.="<td><output name=t".$temp1."r".intval($temp2-2)."c".intval($col-1)." size=\"2\">".intval(array_sum($offmonthlycont[$temp1-1][$col-1]))."<br>(".number_format((($projectrevenue-array_sum($offmonthlycont[$temp1-1][$col-1]))/$projectrevenue)*100,3)."%)</output></td>"; //calculation
                }
                else
                {
                    //if both array sums are equal...
                    $table.="<td style=\"color:#FF6262;\"><output><b>".array_sum($offbandcont)."<td>".number_format(((($projectrevenue-array_sum($offbandcont)))/$projectrevenue)*100,3)." %</b></output></td>"; //calculation
                }
            }
        }
        elseif($temp2==10)
        {
            $table.="<center><td colspan=\"15\" style=\"border:2px solid #DDD;padding:15px;background-color:#FF0000;\" align = \"center\">&nbsp;<b>ONSITE</b></td></center>";
        }
        elseif($temp2>=11 && $temp2<=16)
        {
            for($col=1;$col<=14;$col++)
            {
                if($col==1)
                {
                   $table.="<td>HeadCount: ".$bands[$temp2-11]."</td>";
                }
                elseif($col<=13)
                {
                    $varquery="SELECT M".intval($col-1)." FROM  `projectresources` WHERE `ProjectID`=$projectid AND `Year`=$temp1 AND `Band`='".$bands[$temp2-11]."' AND `Location`='ONSITE';"; 
                    $resvarquery=mysqli_query($conn,$varquery);
                    $row3=mysqli_fetch_assoc($resvarquery);
                    $val=$row3['M'.intval($col-1)];
                    $onsum[$temp2-11]+=$val;
                    $onmonthlycont[$temp1-1][$col-1][$temp2-11]=$val*$onsals[$temp2-11];
                    if($val==0)     $val=NULL;
                    if($noofmonths%12!=0 && $temp1==$noofyears && ($col-1)>$noofmonths%12)//if noofmonths exceeds then dont allow to take input
                    {
                        $str="<td><input style=\"background-color:#D5D5D5\" type=\"number\"  readonly=\"readonly\" name=t".$temp1."r".intval($temp2-4)."c".intval($col-1)." size=\"2\" min=\"0\" max=\"99\" ></td>";
                    }
                    else
                    {
                        $str="<td><input type=\"number\" value=\"".$val."\" name=t".$temp1."r".intval($temp2-4)."c".intval($col-1)." size=\"2\"  min=\"0\" max=\"99\" ></td>";
                    }
                    $table.=$str;
                    $onyearlycont[$temp1-1]=array_sum($onmonthlycont[$temp1-1]);
                }
                else
                {
                    $onbandcont[$temp2-11]=($onsum[$temp2-11]*$onsals[$temp2-11]);
                    $table.="<td><output name=t".$temp1."r".intval($temp2-10)."c".intval($col-1)." size=\"2\">".intval($onbandcont[$temp2-11])."<td>".number_format((($projectrevenue-($onbandcont[$temp2-11]))/$projectrevenue)*100,3)."%</output></td>"; //calculation
                    
                }
            }
        }
        else    //    elseif($temp2==17) 
        {
            for($col=1;$col<=14;$col++)
            {
                if($col==1)
                {
                    $table.="<td>Monthly Contribution</td>";
                }
                elseif($col<=13)
                {
                    $table.="<td><output name=t".$temp1."r".intval($temp2-11)."c".intval($col-1)." size=\"2\">".intval(array_sum($onmonthlycont[$temp1-1][$col-1]))."<br>(".number_format((($projectrevenue-array_sum($onmonthlycont[$temp1-1][$col-1]))/$projectrevenue)*100,3)."%)</output></td>"; //calculation
                }
                else
                {
                    $table.="<td style=\"color:#FF6262;\"><output><b>".array_sum($onbandcont)."<td>".number_format((($projectrevenue-(array_sum($onbandcont)))/$projectrevenue)*100,3)."%</b></output></td>"; //contribution calculation
                }
            }
        }
        $table.="</tr>";    
    }
    $table.="</table><br>";
    $tables.=$table;
    
    $offyearlycont[$temp1-1]=array_sum($offmonthlycont[$temp1-1][1])+array_sum($offmonthlycont[$temp1-1][2])+array_sum($offmonthlycont[$temp1-1][3])+array_sum($offmonthlycont[$temp1-1][4])+array_sum($offmonthlycont[$temp1-1][5])+array_sum($offmonthlycont[$temp1-1][6])+array_sum($offmonthlycont[$temp1-1][7])+array_sum($offmonthlycont[$temp1-1][8])+array_sum($offmonthlycont[$temp1-1][9])+array_sum($offmonthlycont[$temp1-1][10])+array_sum($offmonthlycont[$temp1-1][11])+array_sum($offmonthlycont[$temp1-1][12]);
    $onyearlycont[$temp1-1]=array_sum($onmonthlycont[$temp1-1][1])+array_sum($onmonthlycont[$temp1-1][2])+array_sum($onmonthlycont[$temp1-1][3])+array_sum($onmonthlycont[$temp1-1][4])+array_sum($onmonthlycont[$temp1-1][5])+array_sum($onmonthlycont[$temp1-1][6])+array_sum($onmonthlycont[$temp1-1][7])+array_sum($onmonthlycont[$temp1-1][8])+array_sum($onmonthlycont[$temp1-1][9])+array_sum($onmonthlycont[$temp1-1][10])+array_sum($onmonthlycont[$temp1-1][11])+array_sum($onmonthlycont[$temp1-1][12]);
    $yearlycont[$temp1-1]=$offyearlycont[$temp1-1]+$onyearlycont[$temp1-1];
    
}
//    $totcontributionquery="SELECT SUM(Contribution) FROM projectresources WHERE ProjectID='$projectid';";
//    $rstotcont=mysqli_query($conn,$totcontributionquery);
//    $fet=mysqli_fetch_assoc($rstotcont);
//    $totalcontribution=$fet['SUM(Contribution)'];//formula and calculation

    $ratequery="SELECT SUM(Rate) FROM projectresources WHERE ProjectID='$projectid';";
    $rsratequery=mysqli_query($conn,$ratequery);
    $fet=mysqli_fetch_assoc($rsratequery);
    $totalrate=$fet['SUM(Rate)'];
    $totalcontribution=number_format((($projectrevenue-$totalrate)/$projectrevenue)*100,3);//formula and calculation of contribution
    
    $form=$tables."</div><br><button class=\"btnButton\" type=\"submit\" name=\"save\">SAVE</button>&emsp;&emsp;&emsp;<button class=\"btnButton\" type=\"submit\" name=\"submit\">SUBMIT</button>&emsp;&emsp;&emsp;<button class=\"btnButton\" type=\"submit\" name=\"clearall\">CLEAR ALL</button><br></form></center>";

    $results.="<br><center><div style=background-color:#bfbfbf;width:20%;>";
    $results.="<br><strong><i>Total Contribution: ".$totalcontribution." %</i></strong><br><br>";

//    $results.="<strong><i>Profit: ".$profit." %</i></strong><br><br></div></center>";
    $results.="</div></center>";

if(isset($_POST['save']))
{
    for($temp1=1;$temp1<=$noofyears;$temp1++)//temp1---year
    {
        $updatevaluesquery="";
        
        for($k=1;$k<=12;$k++)//rows
        {
                $var[1]= $_POST['t'.$temp1.'r'.$k.'c1']; 
                if($_POST['t'.$temp1.'r'.$k.'c1']==NULL) $var[1]=0;
                $var[2]= $_POST['t'.$temp1.'r'.$k.'c2'];           
                if($_POST['t'.$temp1.'r'.$k.'c2']==NULL) $var[2]=0;
                $var[3]= $_POST['t'.$temp1.'r'.$k.'c3'];       
                if($_POST['t'.$temp1.'r'.$k.'c3']==NULL) $var[3]=0;
                $var[4]= $_POST['t'.$temp1.'r'.$k.'c4'];       
                if($_POST['t'.$temp1.'r'.$k.'c4']==NULL) $var[4]=0;
                $var[5]= $_POST['t'.$temp1.'r'.$k.'c5'];       
                if($_POST['t'.$temp1.'r'.$k.'c5']==NULL) $var[5]=0;
                $var[6]= $_POST['t'.$temp1.'r'.$k.'c6'];       
                if($_POST['t'.$temp1.'r'.$k.'c6']==NULL) $var[6]=0;
                $var[7]= $_POST['t'.$temp1.'r'.$k.'c7'];       
                if($_POST['t'.$temp1.'r'.$k.'c7']==NULL) $var[7]=0;
                $var[8]= $_POST['t'.$temp1.'r'.$k.'c8'];       
                if($_POST['t'.$temp1.'r'.$k.'c8']==NULL) $var[8]=0;
                $var[9]= $_POST['t'.$temp1.'r'.$k.'c9'];       
                if($_POST['t'.$temp1.'r'.$k.'c9']==NULL) $var[9]=0;
                $var[10]= $_POST['t'.$temp1.'r'.$k.'c10'];     
                if($_POST['t'.$temp1.'r'.$k.'c10']==NULL) $var[10]=0;
                $var[11]= $_POST['t'.$temp1.'r'.$k.'c11'];     
                if($_POST['t'.$temp1.'r'.$k.'c11']==NULL) $var[11]=0;
                $var[12]= $_POST['t'.$temp1.'r'.$k.'c12'];     
                if($_POST['t'.$temp1.'r'.$k.'c12']==NULL) $var[12]=0;
            
              if($k<=6)
                {
                    $loc='OFFSHORE';
                    $band=$bands[$k-1];
                    $sal=$offsals[$k-1];
                }
                else 
                {
                    $loc='ONSITE';
                    $band=$bands[$k-7];
                    $sal=$onsals[$k-7];
                }
                
                $updatevaluesquery .= "UPDATE `projectresources` SET `M1`=$var[1],`M2`=$var[2],`M3`=$var[3],`M4`=$var[4],`M5`=$var[5],`M6`=$var[6],`M7`=$var[7],`M8`=$var[8],`M9`=$var[9],`M10`=$var[10],`M11`=$var[11],`M12`=$var[12],`HeadCount`=".array_sum($var).", `Rate`=".intval(array_sum($var)*$sal).",  `Contribution`=".number_format(array_sum($var)*$sal*100/$projectrevenue,3)." WHERE `ProjectID`='$projectid' AND  `Year`=".intval($temp1)." AND `LOCATION`='$loc' AND `Band`='".$band."';";
        }
        $query=$query.$updatevaluesquery;
    }   
    
    
    $resupvalquery = mysqli_multi_query($conn,$query) or trigger_error("Query Failed! SQL:  - Error: ".mysqli_error($conn), E_USER_ERROR) ;
    
    $plonhcquery="SELECT SUM(HeadCount) FROM projectresources WHERE ProjectID='".$projectid."' AND Location='ONSITE';";
    $rsplonhc=mysql_query($plonhcquery);
    $fet1=mysql_fetch_assoc($rsplonhc);
    $plonsitehc=$fet1['SUM(HeadCount)'];
        
    $ploffhcquery="SELECT SUM(HeadCount) FROM projectresources WHERE ProjectID='".$projectid."' AND Location='OFFSHORE';";
    $rsploffhc=mysql_query($ploffhcquery);
    $fet2=mysql_fetch_assoc($rsploffhc);
    $ploffshorehc=$fet2['SUM(HeadCount)'];
    
    $updatedetailsquery="UPDATE projectdetails SET `PlannedOffshoreHeadCount`=$ploffshorehc, `PlannedOnsiteHeadCount`=$plonsitehc, `PlannedContribution`=$totalcontribution WHERE ProjectID='$projectid';";
    $rsupdates=mysql_query($updatedetailsquery);
        
    if($resupvalquery)
    {
        echo "<center><font size = '5'>Please Wait...</font></center>";//if part of the query runs, it echos 'please wait'
        }
    header("Refresh:3; url=DevResources.php");
}

if(isset($_POST['submit']))
{
    $plonhcquery="SELECT SUM(HeadCount) FROM projectresources WHERE ProjectID='".$projectid."' AND Location='ONSITE';";
    $rsplonhc=mysql_query($plonhcquery);
    $fet1=mysql_fetch_assoc($rsplonhc);
    $plonsitehc=$fet1['SUM(HeadCount)'];
        
    $ploffhcquery="SELECT SUM(HeadCount) FROM projectresources WHERE ProjectID='".$projectid."' AND Location='OFFSHORE';";
    $rsploffhc=mysql_query($ploffhcquery);
    $fet2=mysql_fetch_assoc($rsploffhc);
    $ploffshorehc=$fet2['SUM(HeadCount)'];
    
    $updatedetailsquery="UPDATE projectdetails SET `PlannedOffshoreHeadCount`=$ploffshorehc, `PlannedOnsiteHeadCount`=$plonsitehc, `PlannedContribution`=$totalcontribution WHERE ProjectID='$projectid';";
    $rsupdates=mysql_query($updatedetailsquery);
    
    header('location:./forecast.php');
}

if(isset($_POST['clearall']))
{
    ?>
    <script type="text/javascript">
          if (confirm("This will erase all the previously entered data"))
              {
                  <?php
                    $clearallquery="DELETE FROM `projectresources` WHERE `ProjectID`=$projectid ;";
                    $resclearallquery=mysqli_query($conn,$clearallquery);
    
                    for($ind=1;$ind<=$noofyears*12;$ind++)
                    {
                        if($ind%12==0 && $ind%2==0)
                        {
                            $year=($ind/12);
                        }
                        else
                        {
                            $year=floor($ind/12)+1;
                        }
                        if(($ind-1)%12<=5) 
                        {    
                            $location='OFFSHORE';
                        }
                        else 
                        {
                            $location='ONSITE';
                        }
                            $band=$bands[intval(($ind-1)%6)];
                        
                        $vals.="($projectid,$year,'$location','$band',0,0,0,0,0,0,0,0,0,0,0,0), ";
                    }
                    $insertzerosquery="INSERT INTO `projectresources` (`ProjectID`, `Year`, `Location`, `Band`, `M1`, `M2`, `M3`, `M4`, `M5`, `M6`, `M7`, `M8`, `M9`, `M10`, `M11`, `M12`) VALUES ".rtrim($vals,", ").";";
                    if (!mysqli_query($conn,$insertzerosquery))
                    {
                        $deleteentryquery="DELETE FROM `projectdetails` WHERE ProjectID=$projectid;";
                        $resdeleteentryquery=mysqli_query($conn,$deleteentryquery);
                        
                        ?>alert("Invalid Details entered");location.href = "newproject.php"<?php
                        
//                       die("<p style=\"color:red;\"> Invalid Details<br>".mysqli_error($conn)."</p>");
                        
                    }
                    else
                    {
                        $resinsertzeroesquery = mysqli_query($conn,$insertzerosquery);
                    }
                    ?>
              }
    </script>
  
    <?php      

    header('location:./Resources14.php');
}
?>
<!DOCTYPE html>
<html>

<head>
<title> Resources </title>
    <link rel="stylesheet" type="text/css" href="ResourcePageStyles.css">
    <style type="text/css">
        tr:nth-child(even){background-color: #f2f2f2}
            .sam
            {
                overflow: hidden;
                overflow:auto;
                scrollbar-base-color:#ff0000;
            }
    </style>

   
</head>
    
<body>
    <form method = "post">
        <button class = "btnsubmit" type="submit" name="back">Back</button>
        <style type = "text/css">
            .btnSubmit{
                color: #FF0000;
                background: #D5D5D5;
                font-weight: bold;
                border: 1px solid #D5D5D5;
                border-radius: 8px;
                box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
            }
            .btnSubmit:hover {
              color: #FFF;
              background: #FF0000;
            }
        </style>
    </form>
    <?php
        if(isset($_POST["back"]))
        {
            switch($_SESSION['rname'])
            {
                case 'PGM': ?><script>location.href = "dashboardpgm.php";</script><?php
                case 'IBU': ?><script>location.href = "dashboardibu.php";</script><?php
                case 'IBG': ?><script>location.href = "dashboardibg.php";</script><?php
                case 'Admin': ?><script>location.href = "project.php";</script><?php
            }
        }
    ?>
    <?php 
        echo $projectdetails."<br><br>";
    ?>
  
        <?php
        echo $form."<br>";
        ?>
    
    <?php
        echo "<br>".$results;
    ?>
    <br><br>
    <center>
    <div style=border-left:6pxsolid#ffeb3b;background-color:#ffffcc;width:43%;>
        <br><h><strong>NOTE: </strong></h>
        <p><font color = "#FF0000">Please Click on <strong>SAVE</strong> before clicking on <strong>SUBMIT</strong></font></p>
        <p>Contribution : Sum of resource cost.</p>
        <p>Monthly Contribution : Sum of resource cost in the month.</p>
        <p style="color:#FF6262;">Contribution = Total resource contribution from that location in that year.</p>
        <p>Yearly Contribution : Total resource contribution in that year.</p>
        <p><strong><i>Total Contribution : Total resource contribution of the project.</i></strong></p>
        <p><strong><i>Profit : (Revenue-total contribution)/revenue*100.</i></strong></p><br>
    </div>
    </center>
</body>
</html>