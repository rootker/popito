<?php
/*
 WebShell Checker 
 @author : Ray Ricardo
 @Facebook : fb.me/Root0xkit
 @Last Edit : 24 Sept 2018 02:26 WIB  
*/
$list = file($argv[1]) or die("php $argv[0] file");
foreach($list as $key) {
    if(empty($key)) continue;
	  $word = array("SHELL","Webshell","IndoXploit","Marmathe"); //Add Specific String To Identified Webshell
	  $keyx = '/(' .implode('|', $word) .')/i';
    $key = trim(str_replace("\n", "\n", $key));
    $Arr = explode("\n", $key);
    $url = explode("\n", $Arr[0]);
    $url = array_pop($url);
	  $ch = curl_init($url);
	  curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
	  curl_setopt($ch,CURLOPT_TIMEOUT,10);
	  $opt = curl_exec($ch);
	  $httpcode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
	  curl_close($ch);
	  preg_match($keyx, $opt,$match);
	  if (!empty($match)&& $httpcode == "200" || $httpcode == 200) {
		    echo "[LIVE] $url\n";
	      $file = fopen("ShellLive.txt","a+");
        $xUrl = $url.PHP_EOL;
	      fwrite($file,$xUrl);
	      fclose($file);
	 }else{
		 echo "[DIE] $url\n";
	 }
}
$totals = file('ShellLive.txt');
echo "[}{]================================[}{]\n";
echo "[ WebShell Live ] ".count($totals)."\n";
echo "[}{]================================[}{]\n";
