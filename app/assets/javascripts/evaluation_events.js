$(function($){
    $("#new_evaluation_event").validationEngine();
    $('#evaluation_event_category').select2({
        theme: "bootstrap",
        width: '30%',
        allowClear: false
    });
    $('#evaluation_event_rate_max').select2({
        theme: "bootstrap",
        width: '30%',
        allowClear: false
    });
    $('#evaluation_event_rate_min').select2({
        theme: "bootstrap",
        width: '30%',
        allowClear: false
    });

});