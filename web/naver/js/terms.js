$(document).ready(function () {

    //            전체동의 ->
    $('#all').change(function () {
        var chk = $(this).prop('checked');
        if (chk) {
            $('#inc').children().prop('checked', true);
        } else {
            $('#inc').children().prop('checked', false);
        }
    });
    //            <-전체동의
    
    $('.chk').on('click', function () {
         if (!$(this).prop('checked')) {
             $('#all').prop('checked', false);
         } else if ($('.chk').length == $('.chk:checked').length) {
             $('#all').prop('checked', true);
         }
     });


    $('#next').on('click', function () {
        if (!(bag.checked && mag.checked)) {
            $('#error').html('네이버 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.');

            return false;
        } else {
            $(this).attr('href')
        }
    });
});
