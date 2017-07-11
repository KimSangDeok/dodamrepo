
function id_search()
{
	var f = document.id_f;

	if(f.per_name.value=="")
	{
		alert("이름을 입력해주세요.");
		f.per_name.focus();
		return;
	}

	if(f.per_mail.value=="")
	{
		alert("E-mail을 입력해주세요.");
		f.per_mail.focus();
		return;
	}

	f.submit();
}



function pw_search()
{
	var f = document.pw_f;

	if(f.per_id.value=="")
	{
		alert("ID를 입력해주세요.");
		f.per_id.focus();
		return;
	}

	if(f.per_mail.value=="")
	{
		alert("E-mail을 입력해주세요.");
		f.per_mail.focus();
		return;
	}

	f.submit();
}
