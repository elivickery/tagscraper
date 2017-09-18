$(document).ready(function() {

    $('#tag-list li').on('click', function(e){
        $tag = $('#tag-list').find(this).find('span').text();
        $regex = new RegExp("<[/]?" + $tag + ".*","g");
        $spans = $('pre').find('span');
        $spans.removeClass('highlighted');
        $spans.filter(function() {
            return $(this).text().match($regex);
        }).addClass('highlighted');
    });

});
