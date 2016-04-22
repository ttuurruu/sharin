$(document).on("ready page:load", function(){

    //初期表示
    $(function(){
        $("[id$='show']").hide();
    });

    //全て開く
    $(document).on('click',"#open_all", function(){
        $("[id$='show']").show;
    });
    //全て閉じる
    $(document).on('click',"#close_all", function(){
        $("[id$='show']").hide;
    });

});
