// �����ܾ�
var ban = new Array(

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
