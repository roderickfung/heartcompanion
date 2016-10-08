$(document).ready(function(){
  $(document).on('turbolinks:load', function(){


    // BP LOW SLIDER
    $( function() {
      $( "#bplow-slider" ).slider({
        range: "min",
        value: 60,
        min: 40,
        max: 120,
        slide: function( event, ui ) {
          $( "#bplow" ).val( ui.value );
        }
      });
      $( "#bplow" ).val( $( "#bplow-slider" ).slider( "value" ));
    } );

    // BP HIGH SLIDER
    $(function(){
      $( "#bphigh-slider" ).slider({
        range: "max",
        value: 110,
        min: 90,
        max: 180,
        slide: function( event, ui ) {
          $( "#bphigh" ).val( ui.value );
        }
      });
      $( "#bphigh" ).val( $( "#bphigh-slider" ).slider( "value" ));
    });

    $(function(){
      $( "#hrlow-slider" ).slider({
        range: "min",
        value: 75,
        min: 40,
        max: 90,
        slide: function( event, ui ) {
          $( "#hrlow" ).val( ui.value );
        }
      });
      $( "#hrlow" ).val( $( "#hrlow-slider" ).slider( "value" ));
    });

    $(function(){
      $( "#hrhigh-slider" ).slider({
        range: "max",
        value: 80,
        min: 60,
        max: 180,
        slide: function( event, ui ) {
          $( "#hrhigh" ).val( ui.value );
        }
      });
      $( "#hrhigh" ).val( $( "#hrhigh-slider" ).slider( "value" ));
    });

    $(function(){
      $( "#lblow-slider" ).slider({
        range: "min",
        value: 100,
        min: 80,
        max: 180,
        slide: function( event, ui ) {
          $( "#lblow" ).val( ui.value );
        }
      });
      $( "#lblow" ).val( $( "#lblow-slider" ).slider( "value" ));
    });

    $(function(){
      $( "#lbhigh-slider" ).slider({
        range: "max",
        value: 140,
        min: 110,
        max: 270,
        slide: function( event, ui ) {
          $( "#lbhigh" ).val( ui.value );
        }
      });
      $( "#lbhigh" ).val( $( "#lbhigh-slider" ).slider( "value" ));
    });

  });
});
