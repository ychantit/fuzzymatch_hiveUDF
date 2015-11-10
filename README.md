# fuzzy_match hive udf function
Hive udf utility method to do fuzzy string matching for two strings using Jaro Winkler (JW), Levensteing (LV) or Ngram (NG) distance.

fuzzy_match udf method is a wrapper of matching distance calculus available in lucene spell checker package :

><a href="https://lucene.apache.org/core/3_5_0/api/contrib-spellchecker/org/apache/lucene/search/spell/JaroWinklerDistance.html" target="_blank">JaroWinklerDistance</a>

><a href="https://lucene.apache.org/core/3_5_0/api/contrib-spellchecker/org/apache/lucene/search/spell/LevensteinDistance.html" target="_blank">LevensteinDistance</a>

><a href="https://lucene.apache.org/core/3_5_0/api/contrib-spellchecker/org/apache/lucene/search/spell/NGramDistance.html" target="_blank">NGramDistance</a>

this projet provide an implementation example of Hive <a href="https://hive.apache.org/javadocs/r1.2.1/api/org/apache/hadoop/hive/ql/udf/generic/GenericUDF.html" target="_blank">GenericUDF</a>

### fuzzy_match hive udf method intput & output

**Param 1** : First string to match.

**Param 2** : Second string to match with the first one.

**Param 3** : Algo to use to choose from : JW, LV or NG.

**Return** : Double, the distance separating the two string

#### How to build fuzzy_match projet
fuzzy_match is a maven projet so building and installing it is straightforward with a `mvn clean install`
The task will build a fat jar including all the dependencies of the fuzzy_match udf

#### How to use fuzzy_match method in hive script
1. Put the jar `fuzzy_text-1.0-SNAPSHOT.jar` in your home directory, in my case `/home/ych/fuzzy_match`
2. In your hive script or shell add the following two lignes :

    ```
     add jar /home/ych/fuzzy_match/fuzzytext-1.0-SNAPSHOT-fat.jar;
     CREATE TEMPORARY FUNCTION fuzzy_match as 'com.ych.fuzzytext.hive.udf.FuzzyMatch';'
    ```
    
#### That's it your are good to go !
Start using fuzzy_match `select a, b, fuzzy_match(a,b,"JW") from mytable`
