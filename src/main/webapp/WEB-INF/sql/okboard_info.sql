select * from okboard_info;

insert into okboard_info (cseq, bbsid, name, header) 
values (1, 'okhee2', 'OKJSP������', 'OKJSP ������ ������Ʈ ���� �Խ����Դϴ�.');

select * from okboard_info where bbsid = 'okhee2';

update okboard_info set header = '�������� ǥ�������ӿ�ũ ���� �Խ����Դϴ�.' where bbsid = 'egov';
