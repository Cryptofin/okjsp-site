select * from okboard_info;

insert into okboard_info (cseq, bbsid, name, header) 
values (1, 'review', 'OKJSP ����', 'OKJSP ���� �Խ����Դϴ�.');

select * from okboard_info where bbsid = 'review';

update okboard_info set header = '�������� ǥ�������ӿ�ũ ���� �Խ����Դϴ�.' where bbsid = 'egov';
