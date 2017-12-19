$(document).ready(() => {
  $('span.flash-message').each((index, flashElement) => {
    console.log('oi!');
    Materialize.toast($(flashElement).html(), 3000);
  });
})
