select * from okboard_info;

insert into okboard_info (cseq, bbsid, name, header) 
values (1, 'egov', '�������������ӿ�', '�������������ӿ� ���� �Խ����Դϴ�.');

select * from okboard_info where bbsid = 'egov';

update okboard_info set name = '����' where bbsid = 'recruit';
