$(document).ready(function() {

    $(".issue").click(function(event) {
        n = $(this).attr("data-target");
        console.debug(n);
        $(".slides").hide()
        $(".errant-name-text").hide()
        $(".slides:nth(" + n +")").fadeIn("slow")
        $(".errant-name-text:nth(" + n +")").fadeIn("slow");;

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