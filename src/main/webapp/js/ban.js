// �����ܾ�
var ban = new Array(
'ab88', 'ī����', 'qpr1000', '�渶', 'imc100', 'dmlover', 'first-shop', 'first-dm', 'rkdrkdskarn', 
'baekhee', '.lu.to', 'jjr8858', '�þ˹�', '�º���', 'clippers', '�ξ�', 'hyejin000', 'caspinmsn'
);
// �����ܾ� �Ǵ�
function filterWord(content) {
	for (prop in ban) {
		if(content.toLowerCase().indexOf(ban[prop]) > -1) {
			return ban[prop];
		}
	}
	return '';
}
