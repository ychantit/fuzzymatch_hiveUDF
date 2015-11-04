# fuzzymatch_hiveUDF
Hive udf utility method to do fuzzy string matching for two strings using Jaro winckler (JW), Levensteing (LV) distance or Ngram (NG).

**Param 1** : First string to match.

**Param 2** : Second string to match with the first one.

**Param 3** : Algo to use to choose from : JW, LV or NG.

**Return** : Double, the distance separating the two string

#### How to build fuzzy_match projet
fuzzy_match is a maven projet so building and installing it is straightforward with a `mvn clean install`
The task will build a fat jar including all the dependencies of the fuzzy_match udf

#### How to use fuzzy match hive udf
1. Put the jar `fuzzy_match-1.0-SNAPSHOT.jar` in your home directory, in my case `/home/ych/fuzzy_match`
2. In your hive script or shell add the following two lignes :

    ```
     add jar /home/indusbdint/fuzymatch/fuzzytext-1.0-SNAPSHOT-fat.jar;
     CREATE TEMPORARY FUNCTION fuzzy_match as 'com.ych.fuzzytext.hive.udf.FuzzyMatch';'
    ```
    
#### That's it your are good to go !
Start using fuzzy_match `select a, b, fuzzy_match(a,b,"JW") from mytable`
