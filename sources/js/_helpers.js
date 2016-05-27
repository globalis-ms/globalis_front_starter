// requestAnimationFrame polyfill
// Thanks Paul Irish (www.paulirish.com/2011/requestanimationframe-for-smart-animating/)
window.requestAnimFrame=function(){return window.requestAnimationFrame||window.webkitRequestAnimationFrame||window.mozRequestAnimationFrame||function(e){window.setTimeout(e,1e3/60)}}();


/*
// NOTE declare global helpers like this to make them available everywhere
function globalHelper() {
    // instructions
    // …
}
*/
