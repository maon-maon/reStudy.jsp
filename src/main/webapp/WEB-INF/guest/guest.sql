show tables;

create table guest (
	idx int not null auto_increment primary key, /* 방명록 고유번호*/
	name varchar(20) not null, 				/* 방명록 작성자 성명 */
	content text not null, 						/* 방명록 글 내용*/ /* text=메모리 제한 없는 글상자*/.
	email varchar(60),								/* 메일주소 */ /* 강제사항 아님= not null 안 씀*/
	homePage varchar(60),							/* 홈페이지주소(유투브, 블로그주소) */
	visitDate datetime default now(), /* 방문일자 */ /*입력요구하지 않음 시스템에서 가져옴*/
	hostIp varchar(30) not null 			/* 방문자의 접속 IP */ /* 필수입력 아님.입력요구하지 않음 서버에서 가져옴*/
);
desc guest;
drop table guest;


insert into guest values (default, '관리자', '방명록 서비스를 시작합니다.', 'green@gmail.com', 'blog.green.naver.com', default, '192.168.50.52'); 

select * from guest;

insert	into	guest	values	(default,	'홍길동',	" '방명록 서비스 환영합니다.자주 방문하겠습니다..',"	'green@naver.com',	'blog.naver.com',	 default,	'192.168.50.52');
insert	into	guest	values	(default,	'이기자',	 '좋은 사진 놓고 갑니다.<br><img src=""https://www.w3schools.com/w3css/img_5terre.jpg"">',	'green@naver.com',	'blog.naver.com',	 default,	'192.168.50.55');
insert	into	guest	values	(default,	'스티브',	" '좋은 소식 전하러왔습니다~~<br>',"	'green@naver.com',	'blog.naver.com',	 default,	'192.168.50.55');
insert	into	guest	values	(default,	'찰 스',	 '또 놀라왔어요',	'green@naver.com',	'blog.naver.com',	 default,	'192.168.50.55');
insert	into	guest	values	(default,	'방랑객',	" '반갑습니다<br><img src=""https://cdn.pixabay.com/photo/2023/02/22/19/13/tea-ceremony-7807230_640.jpg"">',"	'green@naver.com',	'blog.naver.com',	 default,	'192.168.50.55');
insert	into	guest	values	(default,	'관람객',	 '>HI~ ;)',	'green@gmail.com',	'blog.naver.com',	 default,	'192.168.50.56');
insert	into	guest	values	(default,	'낯선이',	 '안녕하세요',	'green@gmail.com',	'blog.naver.com',	 default,	'192.168.50.56');
insert	into	guest	values	(default,	'로또',	 '<긴급>좋은 소식 입니다.',	'green@gmail.com',	'blog.naver.com',	 default,	'192.168.50.56');
insert	into	guest	values	(default,	'오하늘',	 '하늘이네 블로그 놀러오세요~~',	'green@gmail.com',	'blog.naver.com',	 default,	'192.168.50.56');
insert	into	guest	values	(default,	'김말숙',	 '전세계를 뒤흔든 놀라운 소식 지금 확인하세요<br><img src=""https://img2.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202410/25/IZE/20241025132508964durl.jpg"">',	'green@gmail.com',	'blog.naver.com',	 default,	'192.168.50.58');
insert	into	guest	values	(default,	'인사',	 '호국보은의 달 행사 소식입니다',	'green@kakao.com',	'tistory.com',	 default,	'192.168.50.58');
insert	into	guest	values	(default,	'오늘의',	 '제 홈페이지 방문하시면 선물을 드려요',	'green@kakao.com',	'tistory.com',	 default,	'192.168.50.58');
insert	into	guest	values	(default,	'좋은 소식',	 '빨리 접속해서 확인하세요<img src="data:image/jpeg;base64,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">',	'green@kakao.com',	'tistory.com',	 default,	'192.168.50.58');
insert	into	guest	values	(default,	'긴급',	 '나가자 싸우자 이기자',	'green@kakao.com',	'tistory.com',	 default,	'192.168.50.60');
insert	into	guest	values	(default,	'뉴스레터',	 '확인하세요<br>보이.스.피싱. 새로운.방법.주의',	'green@kakao.com',	'tistory.com',	 default,	'192.168.50.60');
insert	into	guest	values	(default,	'광고',	 '오늘의 운세 확인하세요<br><img src="data:image/jpeg;base64,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"">',	'green@kakao.com',	'tistory.com',	 default,	'192.168.50.60');
insert	into	guest	values	(default,	'인사드립니다',	 '방문 요청드립니다.<br>메일로 연락주세요',	'green@gmail.com',	'tistory.com',	 default,	'192.168.50.60');
insert	into	guest	values	(default,	'요청',	 '문의드립니다',	'green@gmail.com',	'tistory.com',	 default,	'192.168.50.64');
insert	into	guest	values	(default,	'김말숙',	 '덤디 덤덤',	'green@daum.com',	'tistory.com',	 default,	'192.168.50.64');
insert	into	guest	values	(default,	'왕안영',	" '홈페이지 변경하였습니다.<br>방문하셔서 확인해 주세요</td>',"	'green@daum.com',	'tistory.com',	 default,	'192.168.50.65');
insert	into	guest	values	(default,	'김하늘',	" '더미더미<br>더미더미<br>덤덤덤덤',"	'green@daum.com',	'tistory.com',	 default,	'192.168.50.65');
insert	into	guest	values	(default,	'가나다',	" '아파트 아파트<br>아파트 아파트',"	'green@daum.com',	'tistory.com',	 default,	'192.168.50.20');


insert	into	guest	values	(default,	'홍길동',	 '방명록 서비스 환영합니다.자주 방문하겠습니다..',	'green@naver.com',	'blog.naver.com',	 default,	'192.168.50.52');
insert	into	guest	values	(default,	'스티브', '좋은 소식 전하러왔습니다~~',	'green@naver.com',	'blog.naver.com',	 default,	'192.168.50.55');
insert	into	guest	values	(default,	'찰 스',	 '또 놀라왔어요',	'green@naver.com',	'blog.naver.com',	 default,	'192.168.50.55');
insert	into	guest	values	(default,	'관람객',	 'HI~ ;)',	'green@gmail.com',	'blog.naver.com',	 default,	'192.168.50.56');
insert	into	guest	values	(default,	'낯선이',	 '안녕하세요',	'green@gmail.com',	'blog.naver.com',	 default,	'192.168.50.56');
insert	into	guest	values	(default,	'로또',	 '<긴급>좋은 소식 입니다.',	'green@gmail.com',	'blog.naver.com',	 default,	'192.168.50.56');
insert	into	guest	values	(default,	'오하늘',	 '하늘이네 블로그 놀러오세요~~',	'green@gmail.com',	'blog.naver.com',	 default,	'192.168.50.56');
insert	into	guest	values	(default,	'인사',	 '호국보은의 달 행사 소식입니다',	'green@kakao.com',	'tistory.com',	 default,	'192.168.50.58');
insert	into	guest	values	(default,	'오늘의',	 '제 홈페이지 방문하시면 선물을 드려요',	'green@kakao.com',	'tistory.com',	 default,	'192.168.50.58');
insert	into	guest	values	(default,	'긴급',	 '나가자 싸우자 이기자',	'green@kakao.com',	'tistory.com',	 default,	'192.168.50.60');
insert	into	guest	values	(default,	'뉴스레터',	 '확인하세요보이.스.피싱. 새로운.방법.주의','green@kakao.com',	'tistory.com',	 default,	'192.168.50.60');
insert	into	guest	values	(default,	'인사드립니다',	 '방문 요청드립니다.메일로 연락주세요',	'green@gmail.com',	'tistory.com',	 default,	'192.168.50.60');
insert	into	guest	values	(default,	'요청',	 '문의드립니다',	'green@gmail.com',	'tistory.com',	 default,	'192.168.50.64');
insert	into	guest	values	(default,	'김말숙',	 '덤디 덤덤',	'green@daum.com',	'tistory.com',	 default,	'192.168.50.64');
insert	into	guest	values	(default,	'왕안영',	 '홈페이지 변경하였습니다.방문하셔서 확인해 주세요</td>','green@daum.com',	'tistory.com',	 default,	'192.168.50.65');
insert	into	guest	values	(default,	'김하늘',	 '더미더미더미더미덤덤덤덤',	'green@daum.com',	'tistory.com',	 default,	'192.168.50.65');
insert	into	guest	values	(default,	'가나다',	 '아파트 아파트아파트 아파트',	'green@daum.com',	'tistory.com',	 default,	'192.168.50.20');

delete from guest where idx 33;
alter table guest auto_increment = 33;
