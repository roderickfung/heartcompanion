$(document).ready(function(){
  $(document).on('turbolinks:load', function(){
    // BP Low Slider Script
    $( function() {
      $( "#bp-min" ).slider({
        range: "min",
        value: 60,
        min: 40,
        max: 120,
        slide: function( event, ui ) {
          $( "#bp_low" ).val( ui.value );
        }
      });
      $( "#bp_low" ).val( $( "#bp-min" ).slider( "value" ));
    } );

    // BP Hi Slider Script
    $( function() {
      $( "#bp-max" ).slider({
        range: "max",
        value: 110,
        min: 90,
        max: 180,
        slide: function( event, ui ) {
          $( "#bp_hi" ).val( ui.value );
        }
      });
      $( "#bp_hi" ).val( $( "#bp-max" ).slider( "value" ));
    } );

    // Exerting Breath Slider Script
    $( function() {
      var handle = $( "#handle1" );
      $( "#exbreath" ).slider({
        range: "min",
        value: 0,
        min: -10,
        max: 10,
        change: function( event, ui ) {
          $( "#exbreath-input" ).val( $( "#handle1" ).html());
          console.log($("#exbreath-input").val());
        },
        create: function() {
          handle.text( $( this ).slider( "value" ) );
        },
        slide: function( event, ui ) {
          handle.text( ui.value );
        },
      });
    } );

    // Night Breath Slider Script
    $( function() {
      var handle = $( "#handle2" );
      $( "#nightbreath" ).slider({
        range: "min",
        value: 0,
        min: -10,
        max: 10,
        change: function( event, ui ) {
          $( "#nightbreath-input" ).val( $( "#handle2" ).html());
          console.log($("#nightbreath-input").val());
        },
        create: function() {
          handle.text( $( this ).slider( "value" ) );
        },
        slide: function( event, ui ) {
          handle.text( ui.value );
        },
      });
    } );

    // Swollen Ankle Slider Script

    $( function() {
      var handle = $( "#handle3" );
      $( "#swollen" ).slider({
        range: "min",
        value: 0,
        min: -10,
        max: 10,
        change: function( event, ui ) {
          $( "#swollen-input" ).val( $( "#handle3" ).html());
          console.log($("#swollen-input").val());
        },
        create: function() {
          handle.text( $( this ).slider( "value" ) );
        },
        slide: function( event, ui ) {
          handle.text( ui.value );
        },
      });
    } );


    // Lightheadedness Slider Script
    $( function() {
      var handle = $( "#handle4" );
      $( "#lightheaded" ).slider({
        range: "min",
        value: 0,
        min: -10,
        max: 10,
        change: function( event, ui ) {
          $( "#lightheaded-input" ).val( $( "#handle4" ).html());
          console.log($("#lightheaded-input").val());
        },
        create: function() {
          handle.text( $( this ).slider( "value" ) );
        },
        slide: function( event, ui ) {
          handle.text( ui.value );
        },
      });
    } );
  });
});
