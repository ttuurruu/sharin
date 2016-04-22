$(document).on("ready page:load", function(){

    $(function($){
        $(".new_evaluation_objective").validationEngine();
        $(".edit_evaluation_objective").validationEngine();
    });

});

$(function($){
    $('#q_enable_eq').select2({
        width: '20%',
        allowClear: true,
        placeholder: '全て'
    });
});
