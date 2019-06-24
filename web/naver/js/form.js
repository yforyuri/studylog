$(document).ready(function () {

    //    focus in/out effect
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
        } else if (idPt.test($(this).val())) {
            $('#idMsg').html('멋진 아이디네요!').css('color', '#08A600');
            return true;
        } else {
            $('#idMsg').html('5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.').css('color', 'red');
            return false;
        }
    });

    $('#userPw').focusout(function () {
        var pwPt = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,16}$/;
        if ($(this).val().length < 1) {
            $('#pwMsg').html('필수 정보입니다.').css('color', 'red');
            return false;
        } else if (pwPt.test($(this).val())) {
            $('#pw').css('background-image', 'url(https://static.nid.naver.com/images/ui/join/pc_icon_safe_180417.png)');
            $('#pwMsg').css('display', 'none');
            return true;
        } else {
            $('#pw').css('background-image', 'url(https://static.nid.naver.com/images/ui/join/pc_icon_not_use.png)');
            $('#pwMsg').html('8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.').css('color', 'red');
            return false;
        }
    });

    $('#conPw').focusout(function () {
        if ($(this).val().length < 1) {
            $('#cpMsg').html('필수 정보입니다.').css('color', 'red');
            return false;
        } else if ($(this).val() == $('#userPw').val()) {
            $('#confirmPw').css('background-image', 'url(https://static.nid.naver.com/images/ui/join/pc_icon_check_enable.png)');
            $('#cpMsg').html('비밀번호가 일치합니다.').css('color', '#08A600');
        } else {
            $('#cpMsg').html('비밀번호가 일치하지 않습니다').css('color', 'red');
        }
    });

    $('#userName').focusout(function () {
        var nPt = /^[가-힣a-zA-Z]+$/;
        if ($(this).val().length < 1) {
            $('#nMsg').html('필수 정보입니다.').css('color', 'red');
            return false;
        } else if (nPt.test($(this).val())) {
            $('#nMsg').css('display', 'none');
            return true;
        } else {
            $('#nMsg').html('한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)').css('color', 'red');
            return false;
        }
    });

    $('#by, #bd').focusout(function () {
        var byPt = /^(19[0-9][0-9]|20\d{2})$/;
        var bdPt = /^(0[1-9]|[1-2][0-9]|3[0-1])$/;
        if ($(this).val().length < 1) {
            $('#bMsg').html('태어난 년도 4자리를 정확하게 입력하세요.').css('color', 'red');
            return false;
        } else if (!byPt.test($('#by').val())) {
            $('#bMsg').html('태어난 년도 4자리를 정확하게 입력하세요.').css('color', 'red');
            return false;
        }
        if (!bdPt.test($('#bd').val())) {
            $('#bMsg').html('태어난 일(날짜) 2자리를 정확하게 입력하세요.').css('color', 'red');
            return false;
        } else {
            $('#bMsg').css('display', 'none');
            return true;
        }
    });

    $('#userM').focusout(function () {
        var mPt = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
        if (mPt.test($(this).val())) {
            $('#mMsg').css('display', 'none');
            return true;
        } else if($(this).val().length > 0){
            $('#mMsg').html('이메일 주소를 다시 확인해주세요.').css('color', 'red');
            return false;
        }
    });
    
    $('#userP').focusout(function () {
        var pPt = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
        if ($(this).val().length < 1) {
            $('#pMsg').html('필수 정보입니다.').css('color', 'red');
            return false;
        }else if (pPt.test($(this).val())) {          
            $('#confirmpnum').removeAttr('disabled');
            $('#pMsg').html('인증번호를 발송했습니다.(유효시간 30분)<br>인증번호가 오지 않으면 입력하신 정보가 정확한지 확인하여 주세요.<br>이미 가입된 번호이거나, 가상전화번호는 인증번호를 받을 수 없습니다.').css('color', '#08A600');
            return true;
        } else {
            $('#pMsg').html('형식에 맞지 않는 번호입니다.').css('color', 'red');
            return false;
        }
    });

});