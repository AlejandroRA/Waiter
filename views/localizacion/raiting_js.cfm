<script>window.jQuery || document.write('<script src="/includes/js/vendor/jquery-1.11.2.min.js"><\/script>')</script> 
<script src="/includes/js/plugins/raiting/jquery.barrating.js"></script>
<script>


function ratingEnable() {
       

        $('#example-fontawesome').barrating({
            theme: 'fontawesome-stars',
            showSelectedRating: false,
            initialRating: <cfoutput>#prc.puntaje.puntaje#</cfoutput>,
            readonly: true
        });

         $('#puntuacion').barrating({
            theme: 'fontawesome-stars',
            showSelectedRating: true,
            initialRating: 1,
            
             onSelect: function(value, text) {
               // console.log(value);
               // console.log($('#example-fontawesome').val());
            }
        });


       

        var currentRating = $('#example-fontawesome-o').data('current-rating');

        $('.stars-example-fontawesome-o .current-rating')
            .find('span')
            .html(currentRating);

        $('.stars-example-fontawesome-o .clear-rating').on('click', function(event) {
            event.preventDefault();

            $('#example-fontawesome-o')
                .barrating('clear');
        });
    }

$(document).ready(function() {
	//console.log("Valor");
	ratingEnable();
});

</script>