select * from okboard_info;

insert into okboard_info (cseq, bbsid, name, header) 
values (1, 'institute', '�п�', '������ �ϴ� �л� �����ϴ� �Խ����Դϴ�.');

select * from okboard_info where bbsid = 'bbs4';

update okboard_info set name = 'Java/JSP Tips' where bbsid = 'bbs4';
