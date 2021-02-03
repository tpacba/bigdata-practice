package com.kosmik.bigdata.hadoop;

import java.io.IOException;

import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class WordCountMapper extends Mapper<LongWritable, Text, Text, LongWritable> {
@Override
protected void map(LongWritable key, Text value, Context context)
	throws IOException, InterruptedException {
// read the line
String line = value.toString();

// split the line into words
String[] words = line.split(" ");

// assign count (1) to each word
for (String word : words) {
	
	//Text  t = new Text(word);
	//LongWritable  t1 = new LongWritable(1);
	context.write(new Text(word), new LongWritable(1));
}
}
}

