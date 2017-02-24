CREATE TABLE #counts
(
    table_name varchar(255),
    row_count int
)

EXEC sp_MSForEachTable @command1='INSERT #counts (table_name, row_count) SELECT ''?'', COUNT(*) FROM ?'
SELECT table_name, row_count FROM #counts ORDER BY table_name, row_count DESC

select sum(row_count) registrostotales from #counts

DROP TABLE #counts

--http://stackoverflow.com/questions/2221555/how-to-fetch-the-row-count-for-all-tables-in-a-sql-server-database/19631059
