<?php

/* 
 * Created by Zihad
 * بسم الله الرحمن الرحيم
 */

function uploadImages($dir, $filenameArray, $imageByteArray) {
	for ($i = 0; $i < count($filenameArray); $i += 1) {
		$target = __DIR__ . "/" . $dir . "/" . $filenameArray[$i];
		file_put_contents($target, base64_decode($imageByteArray[$i]));
	}
}