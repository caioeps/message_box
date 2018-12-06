$(document).ready(() => {
  $('span.flash-message').each((index, flashElement) => {
    Materialize.toast($(flashElement).html(), 3000);
  });
})
