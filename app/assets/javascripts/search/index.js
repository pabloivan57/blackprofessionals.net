$(function() {
  disableSearchButton();
  $('.search_field').change(function(){
   if(isAllInputEmpty()){
    disableSearchButton();
   } else {
     enableSearchButton();
   }
  });
})

function disableSearchButton(){
  $('.search_button').attr('disabled','disabled');
}

function enableSearchButton(){
  $('.search_button').removeAttr('disabled');
}

function isAllInputEmpty(){
  allIsEmpty = true
  if ($('#first_name').val().length > 0) allIsEmpty = false;
  if ($('#last_name').val().length > 0) allIsEmpty = false;
  if ($('#job_title').val().length > 0) allIsEmpty = false;
  if ($('#industry').val().length > 0) allIsEmpty = false;
  return allIsEmpty;
}
