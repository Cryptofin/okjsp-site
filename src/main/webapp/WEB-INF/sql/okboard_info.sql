select * from okboard_info;

insert into okboard_info (cseq, bbsid, name, header) 
values (1, 'getjob', '����', '������ ���ϴ� ���α׷��Ӹ� ���� �Խ����Դϴ�.');

select * from okboard_info where bbsid = 'bbs4';

update okboard_info set name = '����' where bbsid = 'recruit';
