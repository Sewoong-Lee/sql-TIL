
--영화 장르 등록
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0001','드라마');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0002','판타지');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0003','서부');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0004','공포');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0005','로맨스');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0006','모험');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0007','스릴러');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0008','느와르');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0009','컬트');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0010','다큐멘터리');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0011','코미디');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0012','가족');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0013','미스터리');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0014','전쟁');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0015','애니메이션');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0016','범죄');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0017','뮤지컬');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0018',' SF');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0019','액션');
insert into MV_GENRE(GENRE_CODE,GENRE_NAME)values('c0020','무협');

--영화 정보 등록
insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM,COUNTRY_NAME,MOVIE_NAME,DIRECTOR,MOVIE_MEMO,MOVIE_POSTER_LINK,ACTOR_NAME)
values('c0019',MV_MOVIE_DATA_NUM.NEXTVAL,'미국','블랙 위도우','케이트 쇼트랜드','소개없음','https://movie-phinf.pstatic.net/20210617_272/1623906098516QjpeS_JPEG/movie_image.jpg?type=m203_290_2','스칼릿 조핸슨|데이빗 하버|플로렌스 퓨|레이첼 와이즈');

insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM,COUNTRY_NAME,MOVIE_NAME,DIRECTOR,MOVIE_MEMO,MOVIE_POSTER_LINK,ACTOR_NAME)
values('c0019',MV_MOVIE_DATA_NUM.NEXTVAL,'한국','모가디슈','반종 류승완','소개없음','https://movie-phinf.pstatic.net/20210728_297/1627455490166xkeCf_JPEG/movie_image.jpg?type=m203_290_2','김윤석|조인성|허준호|구교환|김소진|정만식|');

insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM,COUNTRY_NAME,MOVIE_NAME,DIRECTOR,MOVIE_MEMO,MOVIE_POSTER_LINK,ACTOR_NAME)
values('c0019',MV_MOVIE_DATA_NUM.NEXTVAL,'미국','정글 크루즈','자움 콜렛 세라','소개없음','https://movie-phinf.pstatic.net/20210715_64/1626327374894hunxa_JPEG/movie_image.jpg?type=m203_290_2','드웨인 존슨|에밀리 블런트|');

insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM,COUNTRY_NAME,MOVIE_NAME,DIRECTOR,MOVIE_MEMO,MOVIE_POSTER_LINK,ACTOR_NAME)
values('c0001',MV_MOVIE_DATA_NUM.NEXTVAL,'한국','싱크홀','김지훈|','소개없음','https://movie-phinf.pstatic.net/20210726_114/1627265960693kkM0B_JPEG/movie_image.jpg?type=m203_290_2','차승원, 김성균, 이광수, 김혜준, 남다름, 김홍파');

insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM,COUNTRY_NAME,MOVIE_NAME,DIRECTOR,MOVIE_MEMO,MOVIE_POSTER_LINK,ACTOR_NAME)
values('c0004',MV_MOVIE_DATA_NUM.NEXTVAL,'미국','보스 베이비 2','톰 맥그라스|','소개없음','https://movie-phinf.pstatic.net/20210622_174/1624324910624JhEq2_JPEG/movie_image.jpg?type=m203_290_2','알렉 볼드윈|에이미 세다리스|제임스 마스던|');

insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM,COUNTRY_NAME,MOVIE_NAME,DIRECTOR,MOVIE_MEMO,MOVIE_POSTER_LINK,ACTOR_NAME)
values('c0019',MV_MOVIE_DATA_NUM.NEXTVAL,'미국','프리 가이','숀 레비|','소개없음','https://movie-phinf.pstatic.net/20210721_243/1626844891093xnPK1_JPEG/movie_image.jpg?type=m203_290_2','라이언 레이놀즈|');

insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM,COUNTRY_NAME,MOVIE_NAME,DIRECTOR,MOVIE_MEMO,MOVIE_POSTER_LINK,ACTOR_NAME)
values('c0001',MV_MOVIE_DATA_NUM.NEXTVAL,'한국','생각의 여름','김종재|','소개없음','https://movie-phinf.pstatic.net/20210721_95/1626855805268YRF0d_JPEG/movie_image.jpg?type=m203_290_2','김예은|곽민규|오규철|한해인|신기환|');

insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM,COUNTRY_NAME,MOVIE_NAME,DIRECTOR,MOVIE_MEMO,MOVIE_POSTER_LINK,ACTOR_NAME)
values('c0006',MV_MOVIE_DATA_NUM.NEXTVAL,'미국','그린 나이트','데이빗 로워리|','소개없음','https://movie-phinf.pstatic.net/20210728_155/16274361314942FPXi_JPEG/movie_image.jpg?type=m203_290_2','데브 파텔|알리시아 비칸데르|조엘 에저튼|사리타 초우드리|숀 해리스|케이트 딕키|랄프 이네슨|배리 케오간|');

insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM,COUNTRY_NAME,MOVIE_NAME,DIRECTOR,MOVIE_MEMO,MOVIE_POSTER_LINK,ACTOR_NAME)
values('c0005',MV_MOVIE_DATA_NUM.NEXTVAL,'일본','꽃다발 같은 사랑을 했다','도이 노부히로|','소개없음','https://movie-phinf.pstatic.net/20210615_3/1623748505590DVbIq_JPEG/movie_image.jpg?type=m203_290_2','아리무라 카스미|스다 마사키|키요하라 카야|호소다 카나타|');

insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM,COUNTRY_NAME,MOVIE_NAME,DIRECTOR,MOVIE_MEMO,MOVIE_POSTER_LINK,ACTOR_NAME)
values('c0013',MV_MOVIE_DATA_NUM.NEXTVAL,'한국','방법 :재차의 ','김용완|','소개없음','https://movie-phinf.pstatic.net/20210719_225/1626671578245ptE5v_JPEG/movie_image.jpg?type=m203_290_2','엄지원|정지소||');

insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM,COUNTRY_NAME,MOVIE_NAME,DIRECTOR,MOVIE_MEMO,MOVIE_POSTER_LINK,ACTOR_NAME)
values('c0011',MV_MOVIE_DATA_NUM.NEXTVAL,'영국','트립 투 그리스','마이클 윈터바텀||','소개없음','https://movie-phinf.pstatic.net/20210614_272/1623638971526LBra1_JPEG/movie_image.jpg?type=m203_290_2','스티브 쿠건|롭 브라이든|');

insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM,COUNTRY_NAME,MOVIE_NAME,DIRECTOR,MOVIE_MEMO,MOVIE_POSTER_LINK,ACTOR_NAME)
values('c0001',MV_MOVIE_DATA_NUM.NEXTVAL,'미국','크루엘라','크레이그 질레스피|','소개없음','https://movie-phinf.pstatic.net/20210512_139/1620799657168vGIqq_JPEG/movie_image.jpg?type=m203_290_2','엠마 스톤||');

insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM,COUNTRY_NAME,MOVIE_NAME,DIRECTOR,MOVIE_MEMO,MOVIE_POSTER_LINK,ACTOR_NAME)
values('c0007',MV_MOVIE_DATA_NUM.NEXTVAL,'홍콩','이도공간','나지량|','소개없음','https://movie-phinf.pstatic.net/20210712_294/1626058129094esNz5_JPEG/movie_image.jpg?type=m203_290_2','장국영|임가흔|');

insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM,COUNTRY_NAME,MOVIE_NAME,DIRECTOR,MOVIE_MEMO,MOVIE_POSTER_LINK,ACTOR_NAME)
values('c0007',MV_MOVIE_DATA_NUM.NEXTVAL,'미국','아이스 로드','조나단 헨슬레이||','소개없음','https://movie-phinf.pstatic.net/20210721_115/1626832082638hCp4s_JPEG/movie_image.jpg?type=m203_290_2','리암 니슨|로렌스 피시번|');

insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM,COUNTRY_NAME,MOVIE_NAME,DIRECTOR,MOVIE_MEMO,MOVIE_POSTER_LINK,ACTOR_NAME)
values('c0006',MV_MOVIE_DATA_NUM.NEXTVAL,'아일랜드','그린 나이트','데이빗 로워리|','소개없음','https://movie-phinf.pstatic.net/20200325_138/1585125822569DvkJ5_JPEG/movie_image.jpg?type=m203_290_2','데브 파텔, 알리시아 비칸데르, 조엘 에저튼|');

insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM,COUNTRY_NAME,MOVIE_NAME,DIRECTOR,MOVIE_MEMO,MOVIE_POSTER_LINK,ACTOR_NAME)
values('c0018',MV_MOVIE_DATA_NUM.NEXTVAL,'미국','더 수어사이드 스쿼드','제임스 건|','소개없음','https://movie-phinf.pstatic.net/20210728_221/1627440327667GyoYj_JPEG/movie_image.jpg?type=m203_290_2','마고 로비(할리 퀸), 이드리스 엘바(블러드스포트), 존 시나|');

insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM,COUNTRY_NAME,MOVIE_NAME,DIRECTOR,MOVIE_MEMO,MOVIE_POSTER_LINK,ACTOR_NAME)
values('c0015',MV_MOVIE_DATA_NUM.NEXTVAL,'일본','극장판 도라에몽: 진구의 신공룡','이마이 카즈아키|','소개없음','https://movie-phinf.pstatic.net/20210805_35/1628142193088hCOyc_JPEG/movie_image.jpg?type=m203_290_2','윤아영(도라에몽 한국어 목소리)|');

insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM,COUNTRY_NAME,MOVIE_NAME,DIRECTOR,MOVIE_MEMO,MOVIE_POSTER_LINK,ACTOR_NAME)
values('c0015',MV_MOVIE_DATA_NUM.NEXTVAL,'일본','하이큐!! 땅 VS 하늘','미츠나카 스스무|','소개없음','https://movie-phinf.pstatic.net/20210723_279/1627030886121u2QeP_JPEG/movie_image.jpg?type=m203_290_2','구자형, 김영선, 양정화|');

insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM,COUNTRY_NAME,MOVIE_NAME,DIRECTOR,MOVIE_MEMO,MOVIE_POSTER_LINK,ACTOR_NAME)
values('c0019',MV_MOVIE_DATA_NUM.NEXTVAL,'미국','이스케이프 룸 2: 노 웨이 아웃','애덤 로비텔|','소개없음','https://movie-phinf.pstatic.net/20210707_1/1625644082274E6g2t_JPEG/movie_image.jpg?type=m203_290_2','테일러 러셀(조이 데이비스), 로건 밀러(벤 밀러)|');

insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM,COUNTRY_NAME,MOVIE_NAME,DIRECTOR,MOVIE_MEMO,MOVIE_POSTER_LINK,ACTOR_NAME)
values('c0017',MV_MOVIE_DATA_NUM.NEXTVAL,'한국','블랙핑크 더 무비','오윤동, 정수이','소개없음','https://movie-phinf.pstatic.net/20210728_52/1627460563825oHtpq_JPEG/movie_image.jpg?type=m203_290_2','블랙핑크|');

insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM,COUNTRY_NAME,MOVIE_NAME,DIRECTOR,MOVIE_MEMO,MOVIE_POSTER_LINK,ACTOR_NAME)
values('c0007',MV_MOVIE_DATA_NUM.NEXTVAL,'한국','이번엔 잘 되겠지','이승수|','소개없음','https://movie-phinf.pstatic.net/20210514_148/1620977566896hBk6r_JPEG/movie_image.jpg?type=m203_290_2','윤다훈, 김명국, 이선진|');

insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM,COUNTRY_NAME,MOVIE_NAME,DIRECTOR,MOVIE_MEMO,MOVIE_POSTER_LINK,ACTOR_NAME)
values('c0001',MV_MOVIE_DATA_NUM.NEXTVAL,'독일|폴란드','피닉스','크리스티안 펫졸드|','소개없음','https://movie-phinf.pstatic.net/20210705_273/1625464181084sOca8_JPEG/movie_image.jpg?type=m203_290_2','니나 호스, 로날드 제르필드, 니나 쿤젠도르프|');

insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM,COUNTRY_NAME,MOVIE_NAME,DIRECTOR,MOVIE_MEMO,MOVIE_POSTER_LINK,ACTOR_NAME)
values('c0016',MV_MOVIE_DATA_NUM.NEXTVAL,'미국|영국','킬러의 보디가드 2 ','패트릭 휴즈|','소개없음','https://movie-phinf.pstatic.net/20210624_286/1624496856988kAD9f_JPEG/movie_image.jpg?type=m203_290_2','라이언 레이놀즈(마이클 브라이스), 사무엘 L. 잭슨(다리우스 킨케이드)|');

insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM,COUNTRY_NAME,MOVIE_NAME,DIRECTOR,MOVIE_MEMO,MOVIE_POSTER_LINK,ACTOR_NAME)
values('c0007',MV_MOVIE_DATA_NUM.NEXTVAL,'한국','발신제한','김창주|','소개없음','https://movie-phinf.pstatic.net/20210609_138/1623220637715dKMK5_JPEG/movie_image.jpg?type=m203_290_2','조우진, 이재인, 진경|');

insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM,COUNTRY_NAME,MOVIE_NAME,DIRECTOR,MOVIE_MEMO,MOVIE_POSTER_LINK,ACTOR_NAME)
values('c0005',MV_MOVIE_DATA_NUM.NEXTVAL,'프랑스|벨기에','우리, 둘','필리포 메네게티|','소개없음','https://movie-phinf.pstatic.net/20210728_269/162746188898434IGq_JPEG/movie_image.jpg?type=m203_290_2','바바라 수코바(니나), 마틴 슈발리에(마도)|');

insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM,COUNTRY_NAME,MOVIE_NAME,DIRECTOR,MOVIE_MEMO,MOVIE_POSTER_LINK,ACTOR_NAME)
values('c0001',MV_MOVIE_DATA_NUM.NEXTVAL,'캐나다|이탈리아','이도공간','숀 시스터나|','소개없음','https://movie-phinf.pstatic.net/20210609_210/1623214576414CO9Bm_JPEG/movie_image.jpg?type=m203_290_2','조 판톨리아노, 웬디 크로슨, 폴라 브랜카티|');

insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM,COUNTRY_NAME,MOVIE_NAME,DIRECTOR,MOVIE_MEMO,MOVIE_POSTER_LINK,ACTOR_NAME)
values('c0015',MV_MOVIE_DATA_NUM.NEXTVAL,'미국','퍼피 구조대 더 무비','캘런 브런커|','소개없음','https://movie-phinf.pstatic.net/20210812_203/1628732251223GrttL_JPEG/movie_image.jpg?type=m203_290_2','정선혜, 신용우, 김새해|');

insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM,COUNTRY_NAME,MOVIE_NAME,DIRECTOR,MOVIE_MEMO,MOVIE_POSTER_LINK,ACTOR_NAME)
values('c0005',MV_MOVIE_DATA_NUM.NEXTVAL,'프랑스','퐁네프의 연인들','레오 까락스|','소개없음','https://movie-phinf.pstatic.net/20141104_9/14150629820356f2NK_JPEG/movie_image.jpg?type=m203_290_2','줄리엣 비노쉬(미셸), 드니 라방(알렉스), 클라우스-마이클|');

insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM,COUNTRY_NAME,MOVIE_NAME,DIRECTOR,MOVIE_MEMO,MOVIE_POSTER_LINK,ACTOR_NAME)
values('c0001',MV_MOVIE_DATA_NUM.NEXTVAL,'한국','갈매기','김미조|','소개없음','https://movie-phinf.pstatic.net/20210714_292/162622480175929f7c_JPEG/movie_image.jpg?type=m203_290_2','정애화(오복)|');

insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM,COUNTRY_NAME,MOVIE_NAME,DIRECTOR,MOVIE_MEMO,MOVIE_POSTER_LINK,ACTOR_NAME)
values('c0019',MV_MOVIE_DATA_NUM.NEXTVAL,'인도','잘리카투','리조 조세 펠리세리|','소개없음','https://movie-phinf.pstatic.net/20210726_76/1627268183438g0c9i_JPEG/movie_image.jpg?type=m203_290_2','안토니 바기스|');

insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM,COUNTRY_NAME,MOVIE_NAME,DIRECTOR,MOVIE_MEMO,MOVIE_POSTER_LINK,ACTOR_NAME)
values('c0001',MV_MOVIE_DATA_NUM.NEXTVAL,'미국','오필리아','클레어 맥카시|','소개없음','https://movie-phinf.pstatic.net/20210714_140/1626240346885Dpe03_JPEG/movie_image.jpg?type=m203_290_2','데이지 리들리(오필리아), 조지 맥케이(햄릿), 나오미 왓츠(거트루드)|');

insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM,COUNTRY_NAME,MOVIE_NAME,DIRECTOR,MOVIE_MEMO,MOVIE_POSTER_LINK,ACTOR_NAME)
values('c0019',MV_MOVIE_DATA_NUM.NEXTVAL,'한국','액션히어로','이진호|','소개없음','https://movie-phinf.pstatic.net/20210702_184/1625189946076GGSGT_JPEG/movie_image.jpg?type=m203_290_2','이석형(주성), 이주영(선아), 김재화(차교수)|');

insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM,COUNTRY_NAME,MOVIE_NAME,DIRECTOR,MOVIE_MEMO,MOVIE_POSTER_LINK,ACTOR_NAME)
values('c0001',MV_MOVIE_DATA_NUM.NEXTVAL,'일본','나는 나대로 혼자서 간다','오키타 슈이치|','소개없음','https://movie-phinf.pstatic.net/20210629_142/1624943003859r8KML_JPEG/movie_image.jpg?type=m203_290_2','다나카 유코, 아오이 유우, 히가시데 마사히로|');

insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM,COUNTRY_NAME,MOVIE_NAME,DIRECTOR,MOVIE_MEMO,MOVIE_POSTER_LINK,ACTOR_NAME)
values('c0001',MV_MOVIE_DATA_NUM.NEXTVAL,'한국','워스','사라 코랑겔로|','소개없음','https://movie-phinf.pstatic.net/20210702_132/1625194106481bHkXl_JPEG/movie_image.jpg?type=m203_290_2','마이클 키튼(케네스 파인버그), 스탠리 투치(찰스 울프)|');

insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM,COUNTRY_NAME,MOVIE_NAME,DIRECTOR,MOVIE_MEMO,MOVIE_POSTER_LINK,ACTOR_NAME)
values('c0011',MV_MOVIE_DATA_NUM.NEXTVAL,'한국','좀비크러쉬: 헤이리','장현상|','소개없음','https://movie-phinf.pstatic.net/20210629_79/1624955458845GVSiY_JPEG/movie_image.jpg?type=m203_290_2','공민정(공진선), 이민지(민현아), 박소진(김가연)|');

insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM,COUNTRY_NAME,MOVIE_NAME,DIRECTOR,MOVIE_MEMO,MOVIE_POSTER_LINK,ACTOR_NAME)
values('c0001',MV_MOVIE_DATA_NUM.NEXTVAL,'한국','인트로덕션','홍상수|','소개없음','https://movie-phinf.pstatic.net/20210426_268/1619414355444DtDxz_JPEG/movie_image.jpg?type=m203_290_2','신석호, 박미소, 예지원)|');

insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM,COUNTRY_NAME,MOVIE_NAME,DIRECTOR,MOVIE_MEMO,MOVIE_POSTER_LINK,ACTOR_NAME)
values('c0004',MV_MOVIE_DATA_NUM.NEXTVAL,'미국|이란','더 나이트','코우로시 아하리|','소개없음','https://movie-phinf.pstatic.net/20210625_188/1624598673307SxNw9_JPEG/movie_image.jpg?type=m203_290_2','샤하브 호세이니)|');

insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM,COUNTRY_NAME,MOVIE_NAME,DIRECTOR,MOVIE_MEMO,MOVIE_POSTER_LINK,ACTOR_NAME)
values('c0007',MV_MOVIE_DATA_NUM.NEXTVAL,'미국','포이즌 로즈','조지 갤로, 프란체스코 친퀘마니|','소개없음','https://movie-phinf.pstatic.net/20210709_235/1625820006754LS5W8_JPEG/movie_image.jpg?type=m203_290_2','존 트라볼타(카슨), 모건 프리먼(닥)|');

insert into MV_MOVIE_DATA(GENRE_CODE,MOVIE_NUM,COUNTRY_NAME,MOVIE_NAME,DIRECTOR,MOVIE_MEMO,MOVIE_POSTER_LINK,ACTOR_NAME)
values('c0015',MV_MOVIE_DATA_NUM.NEXTVAL,'라트비아','어웨이','긴츠 질발로디스|','소개없음','https://movie-phinf.pstatic.net/20210721_25/1626834545261PP7u8_JPEG/movie_image.jpg?type=m203_290_2',' |');

--지역 등록
insert into MV_CITY(CITY_CODE,CITY_NAME)values('ct1','서울');
insert into MV_CITY(CITY_CODE,CITY_NAME)values('ct2','경기');
insert into MV_CITY(CITY_CODE,CITY_NAME)values('ct3','인천');




--영화관 등록
insert into CINEMA(CINEMA_CODE,CITY_CODE,CINEMA_NAME,CINEMA_TEL)
            values('cn01','ct1','신촌 CCV',0211111111);
insert into CINEMA(CINEMA_CODE,CITY_CODE,CINEMA_NAME,CINEMA_TEL)
            values('cn02','ct1','홍대 CCV',0222222222);
insert into CINEMA(CINEMA_CODE,CITY_CODE,CINEMA_NAME,CINEMA_TEL)
            values('cn03','ct1','강남 CCV',0233333333);
insert into CINEMA(CINEMA_CODE,CITY_CODE,CINEMA_NAME,CINEMA_TEL)
            values('cn04','ct2','부천역 CCV',0324444444);
insert into CINEMA(CINEMA_CODE,CITY_CODE,CINEMA_NAME,CINEMA_TEL)
            values('cn05','ct2','역곡 CCV',03255555555);
insert into CINEMA(CINEMA_CODE,CITY_CODE,CINEMA_NAME,CINEMA_TEL)
            values('cn06','ct2','부평 CCV',03266666666);
insert into CINEMA(CINEMA_CODE,CITY_CODE,CINEMA_NAME,CINEMA_TEL)
            values('cn07','ct2','계양 CCV',03277777777);


            
--상영정보 등록
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti15','cn01',12,'2021-08-17','07:00~09:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti16','cn01',12,'2021-08-17','10:00~12:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti23','cn01',15,'2021-08-18','07:00~09:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti24','cn01',15,'2021-08-18','10:00~12:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti25','cn01',70,'2021-08-19','07:00~09:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti26','cn01',15,'2021-08-19','10:00~12:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti27','cn01',70,'2021-08-19','10:00~12:00');

insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti28','cn01',54,'2021-08-29','07:00~09:00');
insert into MV_TIME(TIME_CODE,CINEMA_CODE, MOVIE_NUM, TIME_DAY, TIME_TIME)
values('ti29','cn01',54,'2021-08-29','10:00~12:00');

select * from MV_TIME;

--예매정보 등록
insert into MV_SALES(SAL_NUM, TIME_CODE, USER_ID, TICKETS, PRICE, SALES_CHECK) 
values(SALES_NUM.NEXTVAL,'ti05', 'ddd', 1, 1000, 1);



--좌석 마스터 등록
SELECT *FROM MV_SEATS;
insert into MV_SEATS(SEATS_CODE,SEATS_ROW, SEATS_COL)
values('A-1',1,'A');
insert into MV_SEATS(SEATS_CODE,SEATS_ROW, SEATS_COL)
values('A-2',2,'A');
insert into MV_SEATS(SEATS_CODE,SEATS_ROW, SEATS_COL)
values('A-3',3,'A');
insert into MV_SEATS(SEATS_CODE,SEATS_ROW, SEATS_COL)
values('A-4',4,'A');
insert into MV_SEATS(SEATS_CODE,SEATS_ROW, SEATS_COL)
values('B-1',1,'B');
insert into MV_SEATS(SEATS_CODE,SEATS_ROW, SEATS_COL)
values('B-2',2,'B');
insert into MV_SEATS(SEATS_CODE,SEATS_ROW, SEATS_COL)
values('B-3',3,'B');
insert into MV_SEATS(SEATS_CODE,SEATS_ROW, SEATS_COL)
values('B-4',4,'B');
SELECT *FROM MV_SEATS;

--예약좌석 등록
insert into MV_SALES_SEATS(SAL_NUM, SEATS_CODE) 
values (3, 'A-3');
insert into MV_SALES_SEATS(SAL_NUM, SEATS_CODE) 
values (4, 'B-1');

--공지사항 등록
insert into MV_BOARD(BOARD_NUM, USER_ID, SUBJECT, CONTENT, IP) 
values (mv_bseq.NEXTVAL, 'ddd', '제목','내용', 'ip');

