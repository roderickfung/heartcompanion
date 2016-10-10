$(document).ready(function(){
  $(document).on('turbolinks:load', function(){
    $('.c-login-submit').click(function(){
      $('#ClinLogInModal').modal('toggle');
    });

    $('.p-login-submit').click(function(){
      $('#PatLogInModal').modal('toggle');
    });

    $('.reg-c-submit').click(function(){
      $('#CRegModal').modal('toggle');
    });
  });
});
