
function id_search()
{
    var f = document.id_f;

        if(f.mem_name.value=="")
        {
            alert("이름을 입력해주세요.");
            f.mem_name.focus();
            return;
        }

        if(f.mem_email.value=="")
        {
            alert("E-mail을 입력해주세요.");
            f.mem_email.focus();
            return;
        }
        
f.submit();
	}
	
	
	
function pw_search()
{
    var f = document.pw_f;

        if(f.mem_id.value=="")
        {
            alert("ID를 입력해주세요.");
            f.mem_id.focus();
            return;
        }

        if(f.mem_email.value=="")
        {
            alert("E-mail을 입력해주세요.");
            f.mem_email.focus();
            return;
        }

f.submit();
	}
