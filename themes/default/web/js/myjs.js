$(document).ready(function () { 
    if(!localStorage.getItem("language"))
    {
        $(".page_topline").fadeOut();
        $(".page_header").fadeOut();
        $("#popupOne").fadeIn();

    }

    $('#english').on('click', function () {
        localStorage.setItem("language", "en");
        window.location.replace('/en');
    });

    $('#russian').on('click', function () {
        localStorage.setItem("language", "ru");
        window.location.replace('/ru');
    });
    $('#korean').on('click', function () {
        localStorage.setItem("language", "kr");
        window.location.replace('/kr');
    });
    $('#changeLang').on('click', function () {
        localStorage.removeItem("language");
        window.location.replace('/');
    });


})