select * from okboard_info;

insert into okboard_info (cseq, bbsid, name, header) 
values (1, 'egov', '��������ǥ�������ӿ�ũ', '�������� ǥ�������ӿ�ũ ���� �Խ����Դϴ�.');

select * from okboard_info where bbsid = 'egov';

update okboard_info set header = '�������� ǥ�������ӿ�ũ ���� �Խ����Դϴ�.' where bbsid = 'egov';
