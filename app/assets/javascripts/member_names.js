$(function(){

    //全て開く
    $(document).on('click',"#open_all", function(){
        $("[id$='show']").show;
    });
    //全て閉じる
    $(document).on('click',"#close_all", function(){
        $("[id$='show']").hide;
    });

});