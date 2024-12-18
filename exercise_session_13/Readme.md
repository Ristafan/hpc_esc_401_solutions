## Exercise 1
```bash
root@martin:~/.ssh# ssh hadoop
Warning: No xauth data; using fake authentication data for X11 forwarding.
Welcome to Ubuntu 20.04.2 LTS (GNU/Linux 5.4.0-67-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Wed Dec 18 17:33:32 UTC 2024

  System load:  0.03              Processes:             167
  Usage of /:   3.3% of 96.75GB   Users logged in:       0
  Memory usage: 0%                IPv4 address for ens3: 172.23.70.23
  Swap usage:   0%


44 updates can be installed immediately.
18 of these updates are security updates.
To see these additional updates run: apt list --upgradable


The list of available updates is more than a week old.
To check for new updates run: sudo apt update
New release '22.04.5 LTS' available.
Run 'do-release-upgrade' to upgrade to it.


Last login: Wed Dec 18 17:32:48 2024 from 10.29.138.94
ubuntu@mafaeh-haduppi:~$ start-dfs.sh
Starting namenodes on [localhost]
localhost: Warning: Permanently added 'localhost' (ECDSA) to the list of known hosts.
Starting datanodes
Starting secondary namenodes [mafaeh-haduppi]
mafaeh-haduppi: Warning: Permanently added 'mafaeh-haduppi' (ECDSA) to the list of known hosts.
ubuntu@mafaeh-haduppi:~$ start-yarn.sh
Starting resourcemanager
Starting nodemanagers
```

## Exercise 2
- Launched map tasks=7
- Launched reduce tasks=1
- Map input records=35371
-----------------------------
- Output directory: output
- Files created:
  - _SUCCESS
  - part-00000
- some results:
```
0       10
00      1
000     6
000he   1
```
-----------------------------
```
http://localhost:9870/explorer.html#/user/ubuntu/output
```
![image](https://github.com/user-attachments/assets/a2a37c1d-15d9-4cfd-8356-ec1cf5317bc1)

-----------------------------

```bash
ubuntu@mafaeh-haduppi:~/hpc_esc_401_solutions/exercise_session_13$ wc trump_tweets_0?.csv
    4999    96713  1577185 trump_tweets_01.csv
    5000   100415  1683133 trump_tweets_02.csv
    5000    93947  1743471 trump_tweets_03.csv
    5000   110660  1845308 trump_tweets_04.csv
    5000   116535  2059835 trump_tweets_05.csv
    5000    98398  1920669 trump_tweets_06.csv
    5371   120576  2084224 trump_tweets_07.csv
   35370   737244 12913825 total
ubuntu@mafaeh-haduppi:~/hpc_esc_401_solutions/exercise_session_13$ hadoop fs -ls
ubuntu@mafaeh-haduppi:~/hpc_esc_401_solutions/exercise_session_13$ hadoop fs -mkdir DonaldTrump
ubuntu@mafaeh-haduppi:~/hpc_esc_401_solutions/exercise_session_13$ hadoop fs -ls
Found 1 items
drwxr-xr-x   - ubuntu supergroup          0 2024-12-18 17:51 DonaldTrump
ubuntu@mafaeh-haduppi:~/hpc_esc_401_solutions/exercise_session_13$ hadoop fs -put trump_tweets_0?.csv DonaldTrump/
ubuntu@mafaeh-haduppi:~/hpc_esc_401_solutions/exercise_session_13$ hadoop fs -ls DonaldTrump/
Found 7 items
-rw-r--r--   1 ubuntu supergroup    1577185 2024-12-18 17:52 DonaldTrump/trump_tweets_01.csv
-rw-r--r--   1 ubuntu supergroup    1683133 2024-12-18 17:52 DonaldTrump/trump_tweets_02.csv
-rw-r--r--   1 ubuntu supergroup    1743471 2024-12-18 17:52 DonaldTrump/trump_tweets_03.csv
-rw-r--r--   1 ubuntu supergroup    1845308 2024-12-18 17:52 DonaldTrump/trump_tweets_04.csv
-rw-r--r--   1 ubuntu supergroup    2059835 2024-12-18 17:52 DonaldTrump/trump_tweets_05.csv
-rw-r--r--   1 ubuntu supergroup    1920669 2024-12-18 17:52 DonaldTrump/trump_tweets_06.csv
-rw-r--r--   1 ubuntu supergroup    2084224 2024-12-18 17:52 DonaldTrump/trump_tweets_07.csv
ubuntu@mafaeh-haduppi:~/hpc_esc_401_solutions/exercise_session_13$ cat pymapred.sh
#!/bin/bash
hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-3.2.2.jar\
 -files mapper.py,reducer.py\
 -mapper mapper.py -reducer reducer.py\
 -input DonaldTrump/* -output output
ubuntu@mafaeh-haduppi:~/hpc_esc_401_solutions/exercise_session_13$ . pymapred.sh
packageJobJar: [/tmp/hadoop-unjar2117941988338720188/] [] /tmp/streamjob5560514341128999875.jar tmpDir=null
2024-12-18 17:52:46,111 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
2024-12-18 17:52:46,243 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
2024-12-18 17:52:46,554 INFO mapreduce.JobResourceUploader: Disabling Erasure Coding for path: /tmp/hadoop-yarn/staging/ubuntu/.staging/job_1734543258852_0002
2024-12-18 17:52:46,779 INFO mapred.FileInputFormat: Total input files to process : 7
2024-12-18 17:52:47,249 INFO mapreduce.JobSubmitter: number of splits:7
2024-12-18 17:52:47,879 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1734543258852_0002
2024-12-18 17:52:47,880 INFO mapreduce.JobSubmitter: Executing with tokens: []
2024-12-18 17:52:48,096 INFO conf.Configuration: resource-types.xml not found
2024-12-18 17:52:48,096 INFO resource.ResourceUtils: Unable to find 'resource-types.xml'.
2024-12-18 17:52:48,432 INFO impl.YarnClientImpl: Submitted application application_1734543258852_0002
2024-12-18 17:52:48,462 INFO mapreduce.Job: The url to track the job: http://localhost:8088/proxy/application_1734543258852_0002/
2024-12-18 17:52:48,464 INFO mapreduce.Job: Running job: job_1734543258852_0002
2024-12-18 17:52:53,518 INFO mapreduce.Job: Job job_1734543258852_0002 running in uber mode : false
2024-12-18 17:52:53,519 INFO mapreduce.Job:  map 0% reduce 0%
2024-12-18 17:52:59,595 INFO mapreduce.Job:  map 86% reduce 0%
2024-12-18 17:53:02,615 INFO mapreduce.Job:  map 100% reduce 0%
2024-12-18 17:53:04,622 INFO mapreduce.Job:  map 100% reduce 100%
2024-12-18 17:53:04,627 INFO mapreduce.Job: Job job_1734543258852_0002 completed successfully
2024-12-18 17:53:04,683 INFO mapreduce.Job: Counters: 54
        File System Counters
                FILE: Number of bytes read=5550040
                FILE: Number of bytes written=13012765
                FILE: Number of read operations=0
                FILE: Number of large read operations=0
                FILE: Number of write operations=0
                HDFS: Number of bytes read=12914644
                HDFS: Number of bytes written=642476
                HDFS: Number of read operations=26
                HDFS: Number of large read operations=0
                HDFS: Number of write operations=2
                HDFS: Number of bytes read erasure-coded=0
        Job Counters
                Launched map tasks=7
                Launched reduce tasks=1
                Data-local map tasks=7
                Total time spent by all maps in occupied slots (ms)=24182
                Total time spent by all reduces in occupied slots (ms)=2595
                Total time spent by all map tasks (ms)=24182
                Total time spent by all reduce tasks (ms)=2595
                Total vcore-milliseconds taken by all map tasks=24182
                Total vcore-milliseconds taken by all reduce tasks=2595
                Total megabyte-milliseconds taken by all map tasks=24762368
                Total megabyte-milliseconds taken by all reduce tasks=2657280
        Map-Reduce Framework
                Map input records=35371
                Map output records=538568
                Map output bytes=4472896
                Map output materialized bytes=5550076
                Input split bytes=819
                Combine input records=0
                Combine output records=0
                Reduce input groups=47090
                Reduce shuffle bytes=5550076
                Reduce input records=538568
                Reduce output records=47090
                Spilled Records=1077136
                Shuffled Maps =7
                Failed Shuffles=0
                Merged Map outputs=7
                GC time elapsed (ms)=842
                CPU time spent (ms)=8600
                Physical memory (bytes) snapshot=2619949056
                Virtual memory (bytes) snapshot=20620361728
                Total committed heap usage (bytes)=3499622400
                Peak Map Physical memory (bytes)=336736256
                Peak Map Virtual memory (bytes)=2578075648
                Peak Reduce Physical memory (bytes)=276811776
                Peak Reduce Virtual memory (bytes)=2584285184
        Shuffle Errors
                BAD_ID=0
                CONNECTION=0
                IO_ERROR=0
                WRONG_LENGTH=0
                WRONG_MAP=0
                WRONG_REDUCE=0
        File Input Format Counters
                Bytes Read=12913825
        File Output Format Counters
                Bytes Written=642476
2024-12-18 17:53:04,683 INFO streaming.StreamJob: Output directory: output
```
![image](https://github.com/user-attachments/assets/7d64b735-1184-4ec1-834e-206eec79efd8)
```bash
ubuntu@mafaeh-haduppi:~/hpc_esc_401_solutions/exercise_session_13$ hadoop fs -ls output/
Found 2 items
-rw-r--r--   1 ubuntu supergroup          0 2024-12-18 17:53 output/_SUCCESS
-rw-r--r--   1 ubuntu supergroup     642476 2024-12-18 17:53 output/part-00000
```
![image](https://github.com/user-attachments/assets/86c6ead2-1f6b-4902-8a28-967935d9375e)
```bash
ubuntu@mafaeh-haduppi:~/hpc_esc_401_solutions/exercise_session_13$ hadoop fs -get output/part-00000 part-00000
```
