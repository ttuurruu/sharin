$(document).on("ready page:load", function(){

    $(function($){
        $("#new_user").validationEngine();
        $(".edit_user").validationEngine();
    });

});

$(function($){
    $('#q_enable_eq').select2({
        theme: "bootstrap",
        width: '20%',
        allowClear: true,
        placeholder: '全て'
    });
    $('#member_role_id').select2({
        theme: "bootstrap",
        width: '100%',
        allowClear: false
    });

    $('#select_list').on('click', function () {
        $("#search_btn").click();
    })

});
