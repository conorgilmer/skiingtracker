<?php
/*
 * Display a the properties in a grid 3 houses per row
 */
session_start();

/*
 * Set up constant to ensure include files cannot be called on their own
*/
define ( "MY_APP", 1 );
/*
 * Set up a constant to your main application path
 */
define ( "APPLICATION_PATH", "application" );
define ( "TEMPLATE_PATH", APPLICATION_PATH . "/view" );

//include_once(APPLICATION_PATH . "/inc/session.inc.php");


/*
 * Include the config.inc.php file
 */
include (APPLICATION_PATH . "/inc/config.inc.php");
include (APPLICATION_PATH . "/inc/db.inc.php");
include (APPLICATION_PATH . "/inc/functions.inc.php");

//Set up variable so 'active' class set on navbar link
$activeHome = "active";

include (TEMPLATE_PATH . "/public/header.html");

?>
<div class="container">
<div class="row">
<div class="span12">
<h1>Ski Trips </h1>
</div>
</div>
<div clas="row">
<div class="span9">

<?php 
// cross join
/*$sqlQuery = "SELECT a.property_addr1,
                    a.property_addr2,
                    a.property_addr3,
                    a.property_county,
                    a.property_price,
                    a.property_size,
                    a.property_type,
                    a.property_status,
                       a.property_desc,
                    a.property_id,
                    b.file_content,
                    b.file_type,
                    b.file_size,
                    b.file_name,
                    b.file_extension,
                    b.title
            FROM property a, photos b
            where a.property_photo = b.photo_id";

$sqlQuery ="select * 
FROM property a, housetype b, contact c, photos d
WHERE a.property_type = b.housetype_id
AND a.property_contact = c.contact_id
AND a.property_photo = d.photo_id";*/
$sqlQuery ="select * from skiholiday";
$result = mysql_query($sqlQuery);
 


if ($result) {
    	$htmlString = "";

	
        $htmlString .= "
            <div class=\"media\">";
       
	while ($product = mysql_fetch_assoc($result))
	{ 
              $statusString="<p><strong>Place </strong>".$product["ski_place"]."</p>";
       
            
      $htmlString .= "<div class=\"thumbnail\"/>";      
/*    $htmlString .=   "<div class=\"thumbnail\"> <a class=\"pull-right\" href=\"#\">
    <img class=\"media-object\" width=150 height=150 src=\"data:image/jpeg;base64,". 
           base64_encode( $product['file_content'] ) . "\" /></a>";
  */
        $htmlString .="<div class=\"media-body\">";
      
      
        $htmlString.="<h4 class=\"media-heading\"><strong>Place:  </strong>".$product["ski_place"].", ";
        $htmlString.= $product["ski_country"]."</h4>";
        $holiday_date = date('d-m-Y',strtotime($product["ski_date"]));

       //         ", <strong>County </strong> ".getCounty($product["property_county"])."</h4>";
        $htmlString.="<table><tr><td Style=\"white-space: normal; width:400px;\">";
        $htmlString.="<p><strong>Holiday No. </strong>".$product["ski_id"]."</p>";
        $htmlString.="<p><strong>Date: </strong>" . $holiday_date."</p>";
       
        $htmlString.="<p><strong>Type </strong>".$product["holiday_type"]."</p>";
        $htmlString.="<p><strong>Description </strong>".$product["ski_desc"]."</p>";
      
        $htmlString.="<p><strong>Days </strong>".$product["ski_days"]."</p>";
//       $htmlString.=$statusString; 
  //     $htmlString.="<p><strong>Price &euro; </strong>".$product["property_price"]."</p>";
        $htmlString.="</td><td>";
        $htmlString.="<p><strong>Ski Costs</strong></p>";
        $htmlString.="<p><strong>Flights </strong>".$product["ski_days"]."</p>";
        $htmlString.="<p><strong>Transfers </strong>".$product["ski_days"]."</p>";
        $htmlString.="<p><strong>Accommodation </strong>".$product["ski_days"]."</p>";
                $htmlString.="<p><strong>Ski Rental </strong>".$product["ski_days"]."</p>";
        $htmlString.="<p><strong>Ski Pass </strong>".$product["ski_days"]."</p>";
        $htmlString.="<p><strong>Total </strong>".$product["ski_days"]."</p>";

        //     $dateposted = date('d-m-Y',strtotime($product['property_ts']));
        //$htmlString.="<p><strong>Date Posted: </strong> ". $dateposted . "</p>";
   
        $htmlString.="</td></tr></table>";
        $htmlString.="<p><a href=\"skidetailsopen.php?ski_id=".$product['ski_id']."\" class=\"btn btn-primary\" role=\"button\">Holiday Details</a> </p>";
//           <a href=\"#\" class=\"btn btn-default\" role=\"button\">Button</a></p>";
      $htmlString.="</div>
    </div>
  ";
      
		
                
                } // While
	$htmlString .=  "</div>";
	
	echo $htmlString ;
	
} else {
	
	die("Failure: " . mysql_error($link_id));
}
?>
</div>
<div class="span3"></div>

</div>


</div> <!-- /container -->
<?php 
include (TEMPLATE_PATH . "/public/footer.html");
?>
