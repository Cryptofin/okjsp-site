select * from okboard_info;

insert into okboard_info (cseq, bbsid, name, header) 
values (1, 'pr', 'ȫ��', '���, ��ǰ, ���͵� ���� �θ� �˸��� ���Դϴ�.');

select * from okboard_info where bbsid = 'bbs4';

update okboard_info set name = 'Java/JSP Tips' where bbsid = 'bbs4';
