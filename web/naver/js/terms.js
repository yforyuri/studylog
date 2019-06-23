$(document).ready(function () {

    //            전체동의 
    $('#all').change(function () {
        if ($(this).prop('checked')) {
            $('#inc').children().prop('checked', true);
        } else {
            $('#inc').children().prop('checked', false);
        }
    });


//    전체동의 후 uncheck 될 때 전체동의 박스 off
    $('.chk').change(function(){
        if(!$(this).prop('checked')) {
            $('#all').prop('checked', false);
        } else {
            $('#all').prop('checked', true);
        }
    });
    
//    필수동의사항 uncheck될 때 error msg
    $('#next').on('click', function () {
        if(!($('#mag').prop('checked') && $('#bag').prop('checked'))){
            $('#error').html('네이버 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.');
            return false;
        } else {
            $(this).attr('href')
        }
    });
});
