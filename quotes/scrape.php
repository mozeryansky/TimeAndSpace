<?php

$quotes = array();

$uniq = array();

for($i = 1; $i <= 40; $i++){
	echo "time: ".$i."\n";
	
	$url = "http://www.brainyquote.com/quotes/topics/topic_time".$i.".html?vm=l";
	$html = file_get_contents($url);
	$html = str_replace("\n", '', $html);
	$html = str_replace('&#39;', "'", $html);
	
	preg_match_all('/bqQuoteLink"><.+?>(.+?)<.+?\)">(.+?)</', $html, $matches);

	foreach($matches[0] as $key=>$match){
		if(isset($uniq[$matches[1][$key]])){
			echo "Dup: ".$matches[1][$key]."\n";
			continue;
		}
		$uniq[$matches[1][$key]] = true;
		
		$quote = array(
			'quote' => $matches[1][$key],
			'author' => $matches[2][$key]
		);
		$quotes[] = $quote;
	}
}

for($i = 1; $i <= 40; $i++){
	echo "space: ".$i."\n";
	
	$url = "http://www.brainyquote.com/quotes/keywords/space_".$i.".html?vm=l";
	$html = file_get_contents($url);
	$html = str_replace("\n", '', $html);
	$html = str_replace('&#39;', "'", $html);
	
	preg_match_all('/bqQuoteLink"><.+?>(.+?)<.+?\)">(.+?)</', $html, $matches);

	foreach($matches[0] as $key=>$match){
		if(isset($uniq[$matches[1][$key]])){
			echo "Dup: ".$matches[1][$key]."\n";
			continue;
		}
		$uniq[$matches[1][$key]] = true;
		
		$quote = array(
			'quote' => $matches[1][$key],
			'author' => $matches[2][$key]
		);
		$quotes[] = $quote;
	}
}

$json = json_encode($quotes);

file_put_contents('quotes.json', $json);

?>