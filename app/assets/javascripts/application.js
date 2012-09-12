// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require jquery.ui.all
//= require_tree .
function split(val) {
    return val.split( /;\s*/ );
}
function extractLast(term) {
    return split(term).pop();
}

$(document).ready(function(){
    $('.autocomplete_input_multip_text').autocomplete({
        source: function (request, response){
            $.ajax({
                url: "/users.js",
                dataType: "json",
                data: {term: extractLast(request.term)},
                success: function(data){
                    response(data);
                }
            })
        },
        focus: function(){
            return false;
        },
        select: function(event, ui){
            var terms = split(this.value);
            terms.pop();
            terms.push(ui.item.value);
            terms.push("");
            this.value = terms.join(";");
            return false;
        }
    });
    $('.autocomplete_input_single_text').autocomplete({
        source: function (request, response){
            $.ajax({
                url: "/users.js",
                dataType: "json",
                data: {term: extractLast(request.term)},
                success: function(data){
                    response(data);
                }
            })
        },
        focus: function(){
            return false;
        }
    });
    $(function() {
        $( ".timepicker" ).datetimepicker({
            timeFormat: 'hh:mm',
            dateFormat: 'yy-MM-dd'
        });
    });

});


$(window).ready(
  function(){
    $('p.notice ').delay(6000).slideUp('slow');

    $('table tr td .details_info').click(function(){
        $(this).parent().parent().next().toggle();
    });


    $('.disable').each(function(){
        $(this).attr("disabled", "disabled")
    });

  }
);

