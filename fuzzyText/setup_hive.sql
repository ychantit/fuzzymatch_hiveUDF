add jar /home/ych/fuzzy_match/fuzzytext-1.0-SNAPSHOT-fat.jar;
CREATE TEMPORARY FUNCTION fuzzy_match as 'com.ych.fuzzytext.hive.udf.FuzzyMatch';
set hive.input.format=org.apache.hadoop.hive.ql.io.HiveInputFormat;
set mapreduce.input.fileinputformat.split.maxsize=100000;
set hive.merge.mapfiles=false;
set mapreduce.job.maps=8;
set mapreduce.job.reduces=8;
