<?php
//use app\models\User;
	//echo "Hello ".$user->user_email;
	
	$mshtype='BeLocum Account Reset Credentials';
	$toname=$user->full_name;
  //$tousername=$user->sp_email;
  //$topass=$password;
	
	
	echo '<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>BeLocum App</title>
</head>

<body>
<div id="mailsub" class="notification" align="center">
  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="min-width: 320px;">
    <tr>
      <td align="center" bgcolor="#1C2B39"><!--[if gte mso 10]>
<table width="680" border="0" cellspacing="0" cellpadding="0">
<tr><td>
<![endif]-->
        
        <table border="0" cellspacing="0" cellpadding="0" class="table_width_100" width="100%" style="max-width: 680px; min-width: 300px;">
          <tr>
            <td><!-- padding -->
              <div style="height: 80px; line-height: 80px; font-size: 10px;"> </div></td>
          </tr>
          <!--header -->
          <tr>
            <td align="center" bgcolor="#ffffff"><!-- padding -->
              <div style="height: 20px; line-height: 30px; font-size: 10px;"> </div>
              <table width="90%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td align="left"><!-- 

				Item -->
                    <div class="mob_center_bl" style="float: left; display: inline-block; width: 115px;">
                      <table class="mob_center" width="150" border="0" cellspacing="0" cellpadding="0" align="left" style="border-collapse: collapse;">
                        <tr>
                          <td align="left" valign="middle"><!-- padding -->
                            <div style="height: 0px; line-height: 0px; font-size: 10px;"> </div>
                            <table width="150" border="0" cellspacing="0" cellpadding="0" >
                              <tr>
                                <td align="left" valign="top" class="mob_center"><a href="#" target="_blank" style="color: #596167; font-family: Arial, Helvetica, sans-serif; font-size: 13px;"> <font face="Arial, Helvetica, sans-seri; font-size: 13px;" size="3" color="#596167"> <img src="'.\Yii::$app->params['ImagePath'].'web/logo.png'.'" width="150" height="150" alt="" border="0" style="display: block;" /></font></a></td>
                              </tr>
                            </table></td>
                        </tr>
                      </table>
                    </div>
                    <!-- Item END--><!--[if gte mso 10]>
					</td>
					<td align="right">
				<![endif]--><!-- 

				Item -->
                    <div class="mob_center_bl" style="float: right; display: inline-block; width: 88px;">
                      <table width="88" border="0" cellspacing="0" cellpadding="0" align="right" style="border-collapse: collapse;">
                        <tr>
                          <td align="right" valign="middle"><!-- padding -->
                            <div style="height: 0px; line-height: 0px; font-size: 10px;"> </div>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0" >
                              <tr>
                                <td align="right"><!--social -->
                                  
                                 
                                  
                                  <!--social END--></td>
                              </tr>
                            </table></td>
                        </tr>
                      </table>
                    </div>
                    <!-- Item END--></td>
                </tr>
              </table>
              
              <!-- padding -->
              <div style="height: 20px; line-height: 50px; font-size: 10px;"> </div></td>
          </tr>
          <!--header END--> 
          
          <!--content 1 -->
          <tr>
            <td align="center" bgcolor="#fbfcfd"><table width="90%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td align="center"><!-- padding -->
                    <div style="height: 30px; line-height: 60px; font-size: 10px;"> </div>
                    <div style="line-height: 44px;"> <font face="Arial, Helvetica, sans-serif" size="5" color="#57697e" style="font-size: 30px;"> <span style="font-family: Arial, Helvetica, sans-serif; font-size: 30px; color: #57697e;">
                      '.$mshtype.'
                      </span></font> </div>
                    
                    <!-- padding -->
                    <div style="height: 20px; line-height: 40px; font-size: 10px;"> </div></td>
                </tr>
                <tr>
                  <td align="left"><div style="line-height: 24px;"> <font face="Arial, Helvetica, sans-serif" size="4" color="#57697e" style="font-size: 15px;"> <span style="font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e;"> <b>
                      Hello '.$toname.',                      
                      </b> 
                      </span></font> </div>
                    
                    <!-- padding -->
                    <div style="height: 10px; line-height: 20px; font-size: 10px;"> </div></td>
                </tr>
                <tr>
                  <td align="left"><div style="line-height: 20px;">
                      <h2>
                        Your Belocum Account New Credentials.
                      </h2>
                      <h3>Username : '.$user->email.'</h3>
                      <h3>Password : '.$pass.'</h3>                      
                    </div>
                    <br/><br/>
                     <h3>Bien à vous,<br/>
                     BeLocum</h3>
                    <!-- padding -->
                    <div style="height: 20px; line-height: 60px; font-size: 10px;"> </div></td>
                </tr>
              </table></td>
          </tr>
          <!--content 1 END--> 
          <!--footer -->
          <tr>
            <td class="iage_footer" align="center" bgcolor="#ffffff"><!-- padding -->
              <div style="height: 20px; line-height: 20px; font-size: 10px;"> </div>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td align="center"><font face="Arial, Helvetica, sans-serif" size="3" color="#96a5b5" style="font-size: 13px;"> <span style="font-family: Arial, Helvetica, sans-serif; font-size: 13px; color: #52bcb5;">
                    BeLocum App
                    </span></font></td>
                </tr>
              </table>
              
              
              <div style="height: 30px; line-height: 30px; font-size: 10px;"> </div></td>
          </tr>
          <!--footer END-->
          <tr>
            <td><div style="height: 80px; line-height: 80px; font-size: 10px;"> </div></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
</body>
</html>';
	
?>