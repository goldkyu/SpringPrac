var idCheck = 0;
var pwCheck = 0;
var pwRightCheck = 0;

$(function () {


    $('.noKor').on("blur keyup", function () {
        $(this).val($(this).val().replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, ''));
    });

    $('.onlyNum').on("blur keyup", function () {
        $(this).val($(this).val().replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|a-z|A-Z]/g, ''));
    });

    $("#subBtn").attr("disabled", true);

    $("#gnb").hide();

    $("#logoMenu").mouseenter(function () {
        $("#gnb").slideDown();
    });

    $("#gnb").mouseleave(function () {
        $("#gnb").slideUp();
    });

    $("input[name=dupCheck]").click(function () {
        dupCheck();
    });

    $("input[name=userPW]").keyup(function(){
        var inputPW = $("input[name=userPW]").val();
        if (inputPW.length > 20 || inputPW.length < 8) {
            $("#passWarn").text("사용 불가능한 비밀번호 형식 입니다.");
            $("#passWarn").css("color", "red");
            $("#subBtn").attr("disabled", true);
            pwRightCheck = 0;
        }
        else {
            $("#passWarn").text("사용 가능한 비밀번호 형식 입니다.");
            $("#passWarn").css("color", "green");
            pwRightCheck = 1;
        }

    });

    $("input[name=userPWCH]").keyup(function () {
        var inputPW = $("input[name=userPWCH]").val();
        if (inputPW != $("input[name=userPW]").val() || nullCheck(inputPW)) {
            $("#passChWarn").text("다시 한번 확인하세요.");
            $("#passChWarn").css("color", "red");
            $("#subBtn").attr("disabled", true);
            pwCheck = 0;
        }
        else {
            $("#passChWarn").text("올바른 비밀번호 입니다.");
            $("#passChWarn").css("color", "green");
            pwCheck = 1;
            $("#subBtn").attr("disabled", false);
        }
    });

    $("input[name=userID]").keyup(function () {
        var inputID = $("input[name=userID]").val();
        if (inputID.length > 20 || inputID.length < 4) {
            $("#idwarn").text("사용 불가능한 아이디 형식 입니다.");
            $("#idwarn").css("color", "red");
            $("#dupBtn").attr("disabled", true);
            idCheck = 0;
        }
        else {
            $("#idwarn").text("사용 가능한 아이디 형식 입니다.\n중복 체크를 눌러주세요.");
            $("#idwarn").css("color", "green");
            $("#dupBtn").attr("disabled", false);
            idCheck = 1;
        }
    });

   



});

function infoSubmit() {
        if (nullCheck($("input[name=userID]").val()) || nullCheck($("input[name=userPW]").val()) || nullCheck($("input[name=userPWCH]").val())  || nullCheck($("input[name=userEmail]").val()) || nullCheck($("input[name=userPnum]").val()) || nullCheck($("input[name=uBirthYear]").val()) || nullCheck($("input[name=uAd]").val()) || nullCheck($("input[name=uExAd]").val()) || idCheck != 1 || pwCheck != 1) {
            alert("입력칸을 확인 해주세요.");
            return false;
        }
        else if(($("input[name=userPWCH]").val() != $("input[name=userPW]").val()) ){
            alert("비밀번호 확인을 재입력 해주세요.");

            return false;
        }
        else{
            alert("가입되셨습니다. 로그인 해 주세요");
            return true;
        }
}
function dupCheck() {
    var pop_title = "popupOpener";

    window.open("", pop_title, "width=400, height=200, left=600, top=300");

    var frmData = document.mainRegist;
    frmData.target = pop_title;
    frmData.action = "dupCheck.jsp";

    frmData.submit();

    frmData.target = "_self"
    frmData.action = "memCheck.jsp";

}




function nullCheck(val) {

    if (val === null) return true;
    if (typeof val === 'string' && val === '') return true;
    if (typeof val === 'undefined') return true;

    return false;

}

