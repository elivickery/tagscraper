$(document).ready(function() {

    prettyPrint();

    $('#results').on('click', "#tag-list li", function(e){
        console.log('listening');
        $tag = $('#tag-list').find(this).find('span').text();
        $regex = new RegExp("<[/]?" + $tag + ".*","g");
        $spans = $('pre').find('span');
        $spans.removeClass('highlighted');
        $spans.filter(function() {
            return $(this).text().match($regex);
        }).addClass('highlighted');
    });

    $('#scraper form').on('submit',function(e){
        e.preventDefault();
        $('#results').html('<div class="waiting"><p>Generating your code...</p></div>');
        $data = $(this).serialize();

        $.ajax({
            url: "/scrape",
            data: $data,
            success: function(response) {
                $('#results').html(response);
                prettyPrint();
            }
        });
    });

});
