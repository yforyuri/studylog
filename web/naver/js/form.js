$(document).ready(function () {
    //            div box focus in/out effect
    $('input[type=text], input[type=password], select').focusin(function () {
        $(this).closest('div').css('border', '1px solid #08a600');
    });
    $('input[type=text], input[type=password], select').focusout(function () {
        $(this).closest('div').css('border', '1px solid #DADADA');
    });


    //            정규식 한 곳으로 빼기


    //            유효성검사
    $('#userId').focusout(function () {
        var idPt = /^[a-z0-9_-]{5,20}$/;
        if ($(this).val().length < 1) {
            $('#idMsg').html('필수 정보입니다.').css('color', 'red');
            return false;
        }else if (idPt.test($(this).val())) {
            $('#idMsg').html('멋진 아이디네요!').css('color', '#08A600');
            return true;
        } else {
            $('#idMsg').html('5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.').css('color', 'red');
            return false;
        }
    });

    $('#userPw').focusout(function () {
        var pwPt = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/;
        if ($(this).val().length < 1) {
            $('#pwMsg').html('필수 정보입니다.').css('color', 'red');
            return false;
        }else if (pwPt.test($(this).val())) {
            $('#pwMsg').css('display', 'none');
//            lock img change
            return true;
        } else {
            $('#pwMsg').html('8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.').css('color', 'red');
            return false;
        }
    });

    $('#conPw').focusout(function () {
        if ($(this).val().length < 1) {
            $('#cpMsg').html('필수 정보입니다.').css('color', 'red');
            return false;
        }
    });

    $('#userName').focusout(function () {
        var nPt = /^[가-힣a-zA-Z]$/;
        if ($(this).val().length < 1) {
            $('#nMsg').html('필수 정보입니다.').css('color', 'red');
            return false;
        }else if (nPt.test($(this).val())) {
            $('#nMsg').css('display', 'none');
            return true;
        } else {
            $('#nMsg').html('한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)').css('color', 'red');
            return false;
        }
    });
    
    $('.dBox').focusout(function(){
        var bPt=/^[1919-2019]$/;
        if($(this).val().length<1){
            $('#bMsg').html('태어난 년도 4자리를 정확하게 입력하세요.').css('color', 'red');
            return false;
        }
    });
});
