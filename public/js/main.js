$(document).ready(function() {

    $(".issue").click(function(event) {
        n = $(this).attr("data-target");
        $(".slides").hide()
        $(".errant-name-text").hide()
        $(".slides:nth(" + n +")").fadeIn("slow")
        $(".errant-name-text:nth(" + n +")").fadeIn("slow");;

    });

    $(".close-button").click(function() {
        $(".slides").hide();
        $(".almost-slide").hide();
    });

    //function showDivs(n){
    //    var x = document.getElementsByClassName("slides");
    //    for (var i = 0; i < x.length; i++) {
    //        x[i].style.display = "none";
    //    }
    //    x[n].style.display = "block";
    //}
    //function listeners(){
    //    var x = document.getElementsByClassName("slides");
    //    for (var n = 0; n < x.length; n++){
    //        console.log()
    //        $("issue-id-" + n).click(function(){
    //            showDivs(n);
    //        });
    //    }
    //}
    //function hideAllDivs(){
    //    var x = document.getElementsByClassName("slides");
    //    for (var i = 0; i < x.length; i++) {
    //        x[i].style.display = "none";
    //    }
    //    x[0].style.display = "block";
    //}
});

function showDivs(n){
    var x = document.getElementsByClassName("almost-slide");
    for (var i = 0; i < x.length; i++) {
        x[i].style.display = "none";
    }
    x[n].style.display = "block";

    var y = document.getElementsByClassName("errant-list-name");
    for (var i = 0; i < y.length; i++) {
        y[i].style.display = "none";
    }
    y[n].style.display = "block";

}

function listeners(){
    $("#activeerrants").click(function(){
        showDivs(0);
    });
    $("#closederrants").click(function(){
        showDivs(1);
    });
    $("#unaddressederrants").click(function(){
        showDivs(2);
    });
}
function hideAllDivs(){
    var x = document.getElementsByClassName("almost-slide");
    for (var i = 0; i < x.length; i++) {
        x[i].style.display = "none";
    }
    x[0].style.display = "block";

    var y = document.getElementsByClassName("errant-list-name");
    for (var i = 0; i < y.length; i++) {
        y[i].style.display = "none";
    }
    y[0].style.display = "block";
}

$ (document).ready(hideAllDivs);
$( document ).ready(listeners);