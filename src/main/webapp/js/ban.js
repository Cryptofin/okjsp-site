// �����ܾ�
var ban = new Array(
'ī����', 'qpr1000', '�渶', 'imc100', 'dmlover', 'first-shop', 'first-dm', 'rkdrkdskarn', 
'jjr8858', '�º���', 'clippers', '�ξ�'
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
