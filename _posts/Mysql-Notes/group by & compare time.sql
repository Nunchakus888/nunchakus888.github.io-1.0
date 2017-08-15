select * from t_log where APINAME="BOND_LIST_INFO" and SQL_TAKETIME>1000 order by LOGID DESC

SELECT * FROM t_log WHERE SQL_TAKETIME>(SELECT AVG(SQL_TAKETIME) FROM t_log WHERE APINAME="p_option_exercise_info") ORDER BY LOGID DESC

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 where UNIX_TIMESTAMP(CURDATE()) <= UNIX_TIMESTAMP(CREATETIME) and UNIX_TIMESTAMP(CREATETIME) < UNIX_TIMESTAMP(CURDATE() + INTERVAL 1 DAY)
 CURDATE() <= CREATETIME and CREATETIME < (CURDATE() + INTERVAL 1 DAY)

SELECT APINAME,COUNT(APINAME) AS COUNTNAME FROM t_log GROUP BY APINAME ORDER BY COUNTNAME DESC # API使用频率
SELECT APINAME,MSG_DETAIL, USERNAME, AVG(SQL_TAKETIME), COUNT(APINAME) AS COUNTNAME FROM t_log WHERE CURDATE() <= CREATETIME and CREATETIME < (CURDATE() + INTERVAL 1 DAY) GROUP BY APINAME ORDER BY COUNTNAME DESC # 当天的API使用频率
SELECT APINAME,COUNT(APINAME) AS COUNTNAME FROM t_log  where UNIX_TIMESTAMP(CURDATE()) <= UNIX_TIMESTAMP(CREATETIME) and UNIX_TIMESTAMP(CREATETIME) < UNIX_TIMESTAMP(CURDATE() + INTERVAL 1 DAY) GROUP BY APINAME ORDER BY COUNTNAME DESC # 当天的API使用频率
CDHplus_devinformation_schemainformation_schemaCDHplust_log
SELECT APINAME,SQL_TAKETIME AS SQL_TAKETIME FROM t_log GROUP BY SQL_TAKETIME DESC #SQL_TAKETIME
SELECT APINAME,SQL_TAKETIME AS SQL_TAKETIME FROM t_log WHERE CURDATE() <= CREATETIME and CREATETIME < (CURDATE() + INTERVAL 1 DAY) GROUP BY SQL_TAKETIME DESC #当天的 SQL_TAKETIME
SELECT APINAME,SQL_TAKETIME AS SQL_TAKETIME FROM t_log where UNIX_TIMESTAMP(CURDATE()) <= UNIX_TIMESTAMP(CREATETIME) and UNIX_TIMESTAMP(CREATETIME) < UNIX_TIMESTAMP(CURDATE() + INTERVAL 1 DAY) GROUP BY SQL_TAKETIME DESC #当天的 SQL_TAKETIME
SELECT APINAME,AVG(SQL_TAKETIME) AS SQL_TAKETIME FROM t_log where UNIX_TIMESTAMP(CURDATE()) <= UNIX_TIMESTAMP(CREATETIME) and UNIX_TIMESTAMP(CREATETIME) < UNIX_TIMESTAMP(CURDATE() + INTERVAL 1 DAY) GROUP BY APINAME DESC #当天的 SQL_TAKETIME平均耗时
SELECT APINAME,AVG(SQL_TAKETIME) AS SQL_TAKETIME FROM t_log GROUP BY APINAME DESC #SQL_TAKETIME平均耗时


SELECT USERNAME, MSG_DETAIL AS MSGDETAIL, COUNT(LOGLEVEL != 'Error') AS COUNTSQL, COUNT(LOGLEVEL='Error') AS COUNTERROR, AVG(SQL_TAKETIME) AS SQLTAKETIME FROM t_log WHERE APINAME=#{apiName} and loglevel != 'error' AND UNIX_TIMESTAMP(CURDATE() - INTERVAL 1 DAY)  &lt;= UNIX_TIMESTAMP(CREATETIME) and UNIX_TIMESTAMP(CREATETIME) &lt; UNIX_TIMESTAMP(CURDATE()) GROUP BY MSGDETAIL ORDER BY SQLTAKETIME DESC LIMIT #{page}, #{size}


SELECT USERNAME, MSG_DETAIL AS MSGDETAIL, COUNT(LOGLEVEL ='Warn') AS COUNTSQL, COUNT(LOGLEVEL='Error') AS COUNTERROR, AVG(SQL_TAKETIME) AS SQLTAKETIME FROM t_log WHERE APINAME='bond' AND UNIX_TIMESTAMP(CURDATE() - INTERVAL 1 DAY)  <= UNIX_TIMESTAMP(CREATETIME) and UNIX_TIMESTAMP(CREATETIME) < UNIX_TIMESTAMP(CURDATE()) GROUP BY MSGDETAIL ORDER BY SQLTAKETIME DESC

select count(LOGLEVEL='ERROR') from (select * from t_log where 1=1)
select count(case when LOGLEVEL='warn' then LOGLEVEL end) from t_log           #level中,值为warn的数据
select count(case when LOGLEVEL='Error' then LOGLEVEL end) from t_log

SELECT APINAME,AVG(SQL_TAKETIME) AS SQL_TAKETIME FROM t_log where UNIX_TIMESTAMP(CURDATE()) <= UNIX_TIMESTAMP(CREATETIME) GROUP BY APINAME DESC #当天的 SQL_TAKETIME平均耗时

select * from t_log where UNIX_TIMESTAMP(CURDATE() - INTERVAL 1 DAY) <= UNIX_TIMESTAMP(CREATETIME) AND UNIX_TIMESTAMP(CREATETIME) < UNIX_TIMESTAMP(CURDATE())

select * from t_log where CURDATE() <= CREATETIME


select * from t_log where to_days(CREATETIME) = to_days(now()) - 1;
select CURDATE() #tomorrow
select CURDATE() - INTERVAL 1 DAY #today
select (CURDATE() + INTERVAL 1 DAY)
select UNIX_TIMESTAMP(CURDATE())                       #1476806400
select UNIX_TIMESTAMP('2016-10-19 00:00:00.0000')                    #1476806400
select ROUND(UNIX_TIMESTAMP(CREATETIME)) from t_log #1476199610


SELECT * FROM t_log WHERE APINAME='BOND' #某个API使用情况
SELECT * FROM t_log WHERE APINAME='BOND' AND CURDATE() <= CREATETIME and CREATETIME < (CURDATE() + INTERVAL 1 DAY) #某个API当天的使用情况
SELECT * FROM t_log WHERE APINAME='BOND' AND UNIX_TIMESTAMP(CURDATE()) <= UNIX_TIMESTAMP(CREATETIME) and UNIX_TIMESTAMP(CREATETIME) < UNIX_TIMESTAMP(CURDATE() + INTERVAL 1 DAY) limit 0, 20 #某个API当天的使用情况 //分页
SELECT USERNAME, loglevel, MSG_DETAIL AS MSGDETAIL, AVG(SQL_TAKETIME) AS SQLTAKETIME FROM t_log  WHERE APINAME = 'mm_quote_offline_qb_history' and loglevel != 'error' group by  MSGDETAIL;

SELECT count(USERNAME='liuyan') from t_log


SELECT USERNAME,COUNT(USERNAME) AS COUNTUSER FROM t_log GROUP BY USERNAME ORDER BY COUNTUSER DESC #用户访问API次数排名
SELECT USERNAME,COUNT(USERNAME) AS COUNTUSER FROM t_log WHERE CURDATE() <= CREATETIME and CREATETIME < (CURDATE() + INTERVAL 1 DAY) GROUP BY USERNAME ORDER BY COUNTUSER DESC #当天的用户访问API次数排名
SELECT USERNAME,COUNT(USERNAME) AS COUNTUSER FROM t_log where UNIX_TIMESTAMP(CURDATE()) <= UNIX_TIMESTAMP(CREATETIME) and UNIX_TIMESTAMP(CREATETIME) < UNIX_TIMESTAMP(CURDATE() + INTERVAL 1 DAY) GROUP BY USERNAME ORDER BY COUNTUSER DESC #当天的用户访问API次数排名

SELECT APINAME, COUNT(APINAME) AS COUNTAPINAME FROM t_log WHERE USERNAME='liuyan' GROUP BY APINAME ORDER BY COUNTAPINAME DESC #某个用户访问的API列表
SELECT APINAME, COUNT(APINAME) AS COUNTAPINAME FROM t_log WHERE USERNAME='liuyan' AND CURDATE() <= CREATETIME and CREATETIME < (CURDATE() + INTERVAL 1 DAY) GROUP BY APINAME ORDER BY COUNTAPINAME DESC #某个用户访问的API列表
SELECT APINAME, COUNT(APINAME) AS COUNTAPINAME FROM t_log WHERE USERNAME='liuyan' AND UNIX_TIMESTAMP(CURDATE()) <= UNIX_TIMESTAMP(CREATETIME) and UNIX_TIMESTAMP(CREATETIME) < UNIX_TIMESTAMP(CURDATE() + INTERVAL 1 DAY) GROUP BY APINAME ORDER BY COUNTAPINAME DESC #某个用户访问的API列表

SELECT LOGLEVEL, COUNT(LOGLEVEL) AS COUNTLOGLEVEL FROM t_log GROUP BY LOGLEVEL DESC #loglevel
SELECT LOGLEVEL, COUNT(LOGLEVEL) AS COUNTLOGLEVEL FROM t_log WHERE CURDATE() <= CREATETIME and CREATETIME < (CURDATE() + INTERVAL 1 DAY) GROUP BY LOGLEVEL DESC #loglevel
SELECT LOGLEVEL, COUNT(LOGLEVEL) AS COUNTLOGLEVEL FROM t_log WHERE UNIX_TIMESTAMP(CURDATE()) <= UNIX_TIMESTAMP(CREATETIME) and UNIX_TIMESTAMP(CREATETIME) < UNIX_TIMESTAMP(CURDATE() + INTERVAL 1 DAY) GROUP BY LOGLEVEL DESC #loglevel
t_logt_log
SELECT * FROM t_log WHERE LOGLEVEL='Error' ORDER BY SQL_TAKETIME DESC #所有的error监控和延时排名
SELECT * FROM t_log WHERE LOGLEVEL='Error' AND CURDATE() <= CREATETIME and CREATETIME < (CURDATE() + INTERVAL 1 DAY) ORDER BY SQL_TAKETIME DESC #所有的error监控和延时排名
SELECT * FROM t_log WHERE LOGLEVEL='Error' AND CREATETIME < (CURDATE() + INTERVAL 1 DAY) ORDER BY SQL_TAKETIME DESC #所有的error监控和延时排名
SELECT * FROM t_log WHERE LOGLEVEL='Error' AND UNIX_TIMESTAMP(CURDATE() - INTERVAL 1 DAY) <= UNIX_TIMESTAMP(CREATETIME) and UNIX_TIMESTAMP(CREATETIME) < UNIX_TIMESTAMP(CURDATE()) ORDER BY SQL_TAKETIME DESC #所有的error监控和延时排名


SELECT LOGID as logId,LOGTYPE as logType,loglevel,USERNAME as userName,CLASSNAME as className,METHOD as method,CREATETIME as createTime,MSG as msg,SQL_ROWCOUNT as sqlRowCount,MSG_DETAIL as msgDetail,APINAME as apiName,SQL_COLCOUNT as sqlColcount,SQL_TAKETIME as sqlTakeTime,DATA_SOURCE_ID as dataSource FROM t_log WHERE LOGLEVEL='Error' AND UNIX_TIMESTAMP(CURDATE() - INTERVAL 1 DAY) <= UNIX_TIMESTAMP(CREATETIME) and UNIX_TIMESTAMP(CREATETIME) < UNIX_TIMESTAMP(CURDATE()) ORDER BY SQL_TAKETIME DESC LIMIT 0, 15

SELECT LOGID as logId,LOGTYPE as logType,USERNAME as userName,CLASSNAME as className,METHOD as method,CREATETIME as createTime,MSG as msg,SQL_ROWCOUNT as sqlRowCount,MSG_DETAIL as msgDetail,APINAME as apiName,SQL_COLCOUNT as sqlColcount,SQL_TAKETIME as sqlTakeTime,DATA_SOURCE_ID as dataSource FROM t_log WHERE LOGLEVEL='Error' AND UNIX_TIMESTAMP(CURDATE() - INTERVAL 3 DAY) <= UNIX_TIMESTAMP(CREATETIME) and UNIX_TIMESTAMP(CREATETIME) < UNIX_TIMESTAMP(CURDATE()) AND DATA_SOURCE_ID LIKE concat('%','0', '%' ) ORDER BY SQL_TAKETIME DESC LIMIT 0, 15


SELECT * FROM t_log WHERE LOGLEVEL='Error' 
AND USERNAME LIKE CONCAT('%','LIUYAN','%') OR CLASSNAME LIKE CONCAT('%','N','%') OR METHOD LIKE CONCAT('%','C','%') OR APINAME LIKE CONCAT('%','B','%') OR DATA_SOURCE_ID LIKE CONCAT('%',1,'%')
ORDER BY SQL_TAKETIME DESC #所有的error监控和延时排名

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SELECT COUNT(*) FROM t_api

SELECT LOGLEVEL AS LOGLEVEL, COUNT(LOGLEVEL) AS COUNTLEVEL FROM t_log GROUP BY LOGLEVEL DESC

select DATE_FORMAT(NOW(),'%m-%d-%Y %H:%m:%r')

select DATE('2015-8-9')

select now(),'%F %T'

select CURDATE() + INTERVAL 1 DAY

SELECT * from t_log where CREATETIME > DATE_FORMAT(now(), '%F %T')

SELECT * from t_log where  CURDATE() <= CREATETIME and CREATETIME < (CURDATE() + INTERVAL 1 DAY)

SELECT * from t_log where  CURDATE() <= CREATETIME

SELECT * from t_log where UNIX_TIMESTAMP(CURDATE()) <= UNIX_TIMESTAMP(CREATETIME) and UNIX_TIMESTAMP(CREATETIME) < UNIX_TIMESTAMP(CURDATE() + INTERVAL 1 DAY)

select UNIX_TIMESTAMP(CURDATE())

select UNIX_TIMESTAMP(CURDATE() + INTERVAL 1 DAY) - UNIX_TIMESTAMP(CURDATE())



