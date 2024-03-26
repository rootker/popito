#!/bin/php7
<?php
$default = "md5";
if( $argc < 2 ){
			$string = <<<EOF
				-d wordlists md5hash
				-c sha256,md5,bcrypt,strong_ARGON2I word
			EOF;
			echo $string;
			echo "\n";
			return;
} 
switch ($argv[1]) {
			case '-md5':
					$hash = $argv[2];
					$h = md5($hash);
					echo $h;
					echo "\n";
			break;
			case '-sha256':
					$hash = $argv[2];
					$h = hash('sha256', $hash);
					echo $h;
					echo "\n";
			break;
			case '-sha512':
					$hash = $argv[2];
					$h = hash('sha512', $hash);
					echo $h;
					echo "\n";
					break;
			case '-sha1':
				$hash = $argv[2];
				$h = sha1($hash);
				echo $h;
				echo "\n";
				break;
}
if($argv[1] == "-i"){
//$hash = "'".$argv[2]."'";
$hash = "$argv[2]";
echo $hash;
//$hash = '1f2121f36f817bd18540e5fa7de06f59';
if (preg_match('/^\$2[ayb]\$/', $hash)) {
    // The hash is a bcrypt hash
    $options = [
        'cost' => 12,
    ];
    $info = password_get_info($hash);
    echo "Hash is a bcrypt hash.\n";
    echo "Algorithm: ".$info['algo']."\n";
    echo "Algorithm Name: ".$info['algoName']."\n";
    echo "Options: ".implode(', ', array_map(
        function ($key, $value) {
            return sprintf("%s=%s", $key, $value);
        },
        array_keys($options),
        $options
    ))."\n";
    echo "Salt: ".substr($hash, 29)."\n";
} elseif (substr($hash, 0, 4) === '$2y$') {
    // The hash is a Blowfish hash
    $info = password_get_info($hash);
    echo "Hash is a Blowfish hash.\n";
    echo "Algorithm: ".$info['algo']."\n";
    echo "Algorithm Name: ".$info['algoName']."\n";
    echo "Salt: ".substr($hash, 29)."\n";
} elseif (substr($hash, 0, 6) === '$argon') {
    // The hash is a Argon2 hash
    $info = password_get_info($hash);
    echo "Hash is a Argon2 hash.\n";
    echo "Algorithm: ".$info['algo']."\n";
    echo "Algorithm Name: ".$info['algoName']."\n";
    echo "Salt: ".substr($hash, 29)."\n";
} elseif (substr($hash, 0, 5) === '$2a$') {
    // The hash is a BCrypt hash
    $info = password_get_info($hash);
    echo "Hash is a BCrypt hash.\n";
    echo "Algorithm: ".$info['algo']."\n";
    echo "Algorithm Name: ".$info['algoName']."\n";
    echo "Salt: ".substr($hash, 29)."\n";
} elseif (substr($hash, 0, 5) === '$2x$') {
    // The hash is a BCrypt hash
    $info = password_get_info($hash);
    echo "Hash is a BCrypt hash.\n";
    echo "Algorithm: ".$info['algo']."\n";
    echo "Algorithm Name: ".$info['algoName']."\n";
    echo "Salt: ".substr($hash, 29)."\n";
} elseif (substr($hash, 0, 3) === '$5$') {
	// The hash is a SHA-256 hash
		echo "Hash is a SHA-256 hash.\n";
		echo "Salt: ".substr($hash, 12)."\n";
} elseif (substr($hash, 0, 3) === '$6$') {
// The hash is a SHA-512 hash
		echo "Hash is a SHA-512 hash.\n";
		echo "Salt: ".substr($hash, 12)."\n";
} elseif (strlen($hash) === 32) {
// The hash is a MD5 hash
	echo "Hash is a MD5 hash.\n";
} else {
	echo "Could not detect the hash algorithm.\n";
}
}
if($argv[1] == "-d"){
	//echo $argv[2];
	if(!empty($argv[2])){
		$start = microtime(true);
		$file = $argv[3]; 
		if(file_exists($file)){
				if(empty($argv[3])){
					echo "script wordlists hash";
					return;
				}else{
					$hash = $argv[4]; 
				}
				$file = fopen($file, "r");
$i=1;
if($argv[2] == "-md5"){
while(!feof($file)) {
    $password = trim(fgets($file));
    echo "Trying password $i: $password\r";
    if(md5($password) == $hash) {
        $end = microtime(true);
        $elapsed = $end - $start;
			  $elapsed_minutes = floor($elapsed / 60);
        $elapsed_seconds = $elapsed % 60;
        echo "\nPassword found: $password\n";
        echo "Lines processed: $i\n";
			  echo "Time taken: $elapsed_minutes minutes $elapsed_seconds seconds\n";
        exit();
    }
    $i++;
}
} elseif($argv[2] == "-aes"){
while (!feof($file)) {
	$file = fopen("/usr/share/dirb/wordlists/big.txt", "r");
    $password = trim(fgets($file));
    echo "Trying password $i: $password\r";
	$iv = str_pad("16_BYTES_IV", 16, "\0");
	$decrypted = openssl_decrypt($hash, "AES-256-CBC", $password, 0, $iv);
    if ($decrypted == $password) {
        $end = microtime(true);
        $elapsed = $end - $start;
        $elapsed_minutes = floor($elapsed / 60);
        $elapsed_seconds = $elapsed % 60;
        echo "\nPassword found: $password\n";
        echo "Lines processed: $i\n";
        echo "Time taken: $elapsed_minutes minutes $elapsed_seconds seconds\n";
        exit();
    }
    $i++;
}

}
fclose($file);
    $end = microtime(true);
    $elapsed = $end - $start;
		$elapsed_minutes = floor($elapsed / 60);
    $elapsed_seconds = $elapsed % 60;
    echo "Trying password $i: $password\r";
		echo "Time taken: $elapsed_minutes minutes $elapsed_seconds seconds\n";
		echo "\nPassword not found.\n";
		}else {
			print("file not extis");
		}
	}
	return;
}
if($argv[1] == '-c' ) {
	if($argv[2] == "md5"){
		$md5 = $argv[3];
		echo md5($md5);
		echo "\n";
		return;
		}elseif($argv[2] == "bcrypt"){
			$bcrypt = $argv[3];
			echo password_hash($bcrypt, PASSWORD_DEFAULT);
			echo "\n";
			return;
		}elseif($argv[2] == "sha256"){
			$sha = $argv[3];
			echo hash("SHA256",$sha); 
			echo "\n";
			return;
		}elseif($argv[2] == "strong"){
			$ha = $argv[3];
			echo  password_hash($ha, PASSWORD_ARGON2I);
			echo "\n";
			return;
		}
}
?>
