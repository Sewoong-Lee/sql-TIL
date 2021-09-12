select * from MV_TIME;
select * from MV_SALES;
select * from MV_MOVIE_DATA;

select * 
    from MV_TIME MT
    join MV_SALES MS
      on MT.TIME_CODE = MS.TIME_CODE
    JOIN MV_MOVIE_DATA MMD
      ON MT.MOVIE_NUM = MMD.MOVIE_NUM
    JOIN MV_USER MU
      ON MS.USER_ID = MU.USER_ID
WHERE MS.USER_ID = 'ddd';

