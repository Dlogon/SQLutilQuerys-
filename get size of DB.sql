SELECT 
      DB = DB_NAME(database_id)
    , tamanologMB = CAST(SUM(CASE WHEN type_desc = 'LOG' THEN size END) * 8. / 1024 AS DECIMAL(8,2))
    , tamanofilasMB = CAST(SUM(CASE WHEN type_desc = 'ROWS' THEN size END) * 8. / 1024 AS DECIMAL(8,2))
    , tamanototalMB = CAST(SUM(size) * 8. / 1024 AS DECIMAL(8,2))
FROM sys.master_files WITH(NOWAIT)
WHERE database_id = DB_ID() -- for current db 
GROUP BY database_id

--http://stackoverflow.com/questions/18014392/select-sql-server-database-size