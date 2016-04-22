$(function($){
    $("#new_evaluation_setting").validationEngine();
    $('#evaluation_setting_evaluation_event_id').select2({
        width: '30%',
        allowClear: true,
        placeholder: '選択してください'
    });
    $('#evaluation_setting_user_id').select2({
        width: '30%',
        allowClear: true,
        placeholder: '選択してください'
    });
    $('#evaluation_setting_objective_id').select2({
        width: '30%',
        allowClear: true,
        placeholder: '選択してください'
    });
    $('.evaluator').select2({
        width: '30%',
        allowClear: true,
        placeholder: '選択してください'
    });

});