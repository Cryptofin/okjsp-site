// �����ܾ�
var ban = new Array(
'ī����', 'qpr1000', '�渶', 'imc100', 'dmlover'
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
