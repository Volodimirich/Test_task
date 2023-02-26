# Launch
```angular2html
docker-compose up
<!--In new terminal, or docker-compose up -d on previous step:-->
docker exec -it sql_task-db-1 bash
<!-- In docker bash terminal: -->
psql -U postgres < /var/lib/postgresql/solution.sql
exit
<!-- Now we are in local terminal: -->
./check.sh 
```
## Code structure
```angular2html
.
├── ReadMe.md
├── check.sh - bash check script, check identity of result/result.csv and goal/goal_utf8.csv
├── data_dump
│   ├── dump.sql - basic init data
│   └── dump_utf8.sql - basic data in utf8 encoding format
├── docker-compose.yml - psql docker-compose with dump_utf8.sql init 
├── goal
│   ├── goal.csv - goal file in windows-1251 encoding format
│   └── goal_utf8.csv - goal file in utf8 encoding format
├── result
│   └── result.csv - result file after solution.sql  
└── solution.sql - result solution.sql file

```