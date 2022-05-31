select * from user_sequences

INSERT
INTO USERS
VALUES('teacher51','teacher52','teacher5','teacher5','55555',null,null,null,null,0,null,null);

INSERT
INTO USERS
VALUES('teacher52','teacher52','teacher5','teacher5','5252',null,null,null,null,0,null,null);

INSERT
INTO USERS
VALUES('student5','student5','student5','stduent5','525252','비트고1',null,null,null,0,null,null);

INSERT
INTO USERS
VALUES('parent5','parent5','parent5','parent5','123123',null,null,null,null,0,null,null);

INSERT
INTO LESSON 
VALUES ('abcd1234','teacher51','비트고1 자바','월수금','09:00','21:00','비트',40000,'java','안녕하세요',TO_CHAR(sysdate, 'yyyy/mm/dd HH24:MI:SS'));

INSERT 
INTO LESSON
VALUES ('agho1216','teacher51','비트고3 파이썬','화목','09:00','21:00','비트',40000,'python','하이루',TO_CHAR(sysdate, 'yyyy/mm/dd HH24:MI:SS'));

INSERT 
INTO LESSON
VALUES ('abcd4321','teacher52','비트고2 파이썬','토일','11:00','20:00','강남',80000,'javascript','비싸다비싸다',TO_CHAR(sysdate, 'yyyy/mm/dd HH24:MI:SS'));

/*book*/
INSERT
INTO BOOK
VALUES('9788997924325','자바의 신','어디지','20000','이상민','2017-01=01','IMG');

INSERT
INTO BOOK 
VALUES('12312312355487','논어','어디지','20000','공자','2010-01=01','IMG');

INSERT
INTO BOOK 
VALUES('99','국가론','여기','20000','플라톤','2010/03/01','IMG');

--lesson_book
INSERT
INTO LESSON_BOOK
VALUES(
SEQ_LESSON_BOOK_BOOK_CODE.nextVal,
(SELECT lesson_code FROM lesson WHERE lesson_code='abcd1234'),
(SELECT isbn FROM BOOK WHERE ISBN = '9788997924325'));

INSERT
INTO LESSON_BOOK
VALUES(
SEQ_LESSON_BOOK_BOOK_CODE.nextVal,
(SELECT lesson_code FROM lesson WHERE lesson_code='abcd4321'),
(SELECT isbn FROM BOOK WHERE ISBN = '12312312355487'));

INSERT
INTO LESSON_BOOK
VALUES(
SEQ_LESSON_BOOK_BOOK_CODE.nextVal,
(SELECT lesson_code FROM lesson WHERE lesson_code='abcd4321'),
(SELECT isbn FROM BOOK WHERE ISBN = '99'));

--//STUDENTS_RECORD
INSERT
INTO STUDENTS_RECORD
VALUES(seq_students_record.nextVal,'abcd1234','student5',0,TO_CHAR(sysdate),40000,0);

INSERT
INTO STUDENTS_RECORD
VALUES(seq_students_record.nextVal,'agho4567','student5',0,TO_CHAR(sysdate),40000,0);

INSERT
INTO STUDENTS_RECORD
VALUES(seq_students_record.nextVal,'abcd4321','student5',0,TO_CHAR(sysdate),40000,0);

INSERT
INTO STUDENTS_RECORD
VALUES(seq_students_record.nextVal,'agho1216','student52',0,TO_CHAR(sysdate),40000,0);

INSERT
INTO schdule
 ==========================================
/* getLesson*/
SELECT * from lesson
where lesson_code like 'abcd1234';

/* updateLesson */
UPDATE lesson
SET lesson_name = '비트초2 c언어',
	lesson_day = '월 금',
	lesson_place = '비트초 2-2반',
	fees = '300000',
	subject = 'c언어',
	le.lesson_content='어린이 여러분 안뇽?'
WHERE lesson_name like '비트고1 자바';

UPDATE lesson le, students_record sr
SET le.lesson_name = '비트초3 c언어',
	sr.fees = 10000
where le.lesson_code = sr.lesson_code AND lesson_name like '비트고1 자바';

/* deleteLesson */
DELETE FROM lesson
WHERE lesson_code like 'abcd1234';

/* listLesson 수업명, 학생명 */
SELECT * FROM LESSON
ORDER BY lesson_create_at DESC;

select *
from lesson
where lesson_name like '%비트고3 파이썬%';

SELECT *
FROM lesson le, students_record sr
where le.lesson_code = sr.lesson_code and student_id like 'student52';

select *
from lesson
where lesson_create_at between '2022/05/30 00:00:00' AND '2022/05/31 23:59:59';

/* 선생님 */
SELECT*
FROM (SELECT inner_table.*
	FROM (SELECT * FROM lesson
		WHERE lesson_name like '%비트%'
		ORDER BY lesson_create_at DESC) inner_table
	WHERE lesson_create_at <='20220531')
WHERE lesson_create_at between '2022/05/30 00:00:00' AND '20220531 23:59:59';

/* 학생 */
SELECT*
FROM (SELECT inner_table.*
	FROM (SELECT * FROM lesson
		WHERE student_id like 'student5'
		ORDER BY lesson_create_at DESC) inner_table
	WHERE lesson_create_at <='20220531')
WHERE lesson_create_at between '2022/05/30 00:00:00' AND '20220531 23:59:59';


select*from lesson le, students_record sr
where le.lesson_code = sr.lesson_code AND student_id = 'student5'
order by lesson_create_at desc;

/* 둘이 같은 코드*/
select*from lesson le, students_record sr
where le.lesson_code = sr.lesson_code AND sr.student_id = 'student5'
ORDER BY le.lesson_create_at desc;

select *
from lesson le, (select*from students_record
		where student_id = 'student5') sr
WHERE le.lesson_code = sr.lesson_code AND sr.student_id = 'student5';
/*=================================================================*/


/* Book=================*/
/* listLesson Book*/
SELECT*
FROM ( SELECT inner_table.*, ROWNUM AS row_seq
	FROM ( SELECT * FROM lesson_book
			WHERE lesson_code ='abcd4321'
			ORDER BY book_code) inner_table
	WHERE ROWNUM <= 3)
WHERE row_seq BETWEEN 1 AND 3;

/* deleteLessonBook*/
DELETE
FROM LESSON_BOOK LB
where EXISTS(
	SELECT *
	FROM BOOK B
	WHERE B.ISBN = LB.ISBN AND ISBN ='99'
);

DELETE
FROM (
	SELECT *
	FROM LESSON_BOOK LB, BOOK B
	WHERE LB.ISBN = B.ISBN)
WHERE 

DELETE FROM 
	(SELECT*
	FROM BOOK B, LESSON_BOOK LB
	WHERE B.ISBN=LB.ISBN AND B.ISBN = '99' AND LB.ISBN='99');
	
/*addlessonschedule*/
INSERT
INTO schedule
VALUES(SEQ_SCHEDULE_SCHEDULE_CODE.nextVal,'teacher51',TO_CHAR(sysdate,'yyyy/mm/dd'),TO_CHAR(sysdate,'HH24:MI:SS'),'2022/07/01',null,'휴가');
	

INSERT
INTO schedule
VALUES(SEQ_SCHEDULE_SCHEDULE_CODE.nextVal,'teacher51',TO_CHAR(sysdate,'yyyy/mm/dd'),TO_CHAR(sysdate,'HH24:MI:SS'),'2022/06/03',null,'열심히 하는 날');

(SELECT user_id FROM USERS WHERE user_id = 'teacher51'));


/*getLessonschedule*/
SELECT * FROM schedule
WHERE schedule_start_date = '2022/05/31';

/*udpateLessonSchedule*/
UPDATE schedule
SET schedule_Start_Date = TO_CHAR(sysdate,'yyyy/mm/dd'),
	schedule_End_Date = '2022/06/16',
	schedule_Start_Time = TO_CHAR(sysdate,'HH24:MI:SS'),
	schedule_content = '화이팅하자'
WHERE schedule_start_date ='2022/05/31' AND schedule_start_time='19:06:13' and teacher_id='teacher51';



