let FT = require('./follow_toggle');

$(function(){
    $('button.follow-toggle').each ((i, button) => new FT(button));
});
