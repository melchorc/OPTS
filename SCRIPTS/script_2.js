// -----------------------------------------------------------------------------------
// http://wowslider.com/
// JavaScript Wow Slider is a free software that helps you easily generate delicious 
// slideshows with gorgeous transition effects, in a few clicks without writing a single line of code.
// Generated by WOW Slider 3.1
//
//***********************************************
// Obfuscated by Javascript Obfuscator
// http://javascript-source.com
//***********************************************
function ws_kenburns(c,j,k){var d=jQuery;var e=document.createElement("canvas").getContext;var m=c.paths||[{from:[0,0,1],to:[0,0,1.2]},{from:[0,0,1.2],to:[0,0,1]},{from:[1,0,1],to:[1,0,1.2]},{from:[0,1,1.2],to:[0,1,1]},{from:[1,1,1],to:[1,1,1.2]},{from:[0.5,1,1],to:[0.5,1,1.3]},{from:[1,0.5,1.2],to:[1,0.5,1]},{from:[1,0.5,1],to:[1,0.5,1.2]},{from:[0,0.5,1.2],to:[0,0.5,1]},{from:[1,0.5,1.2],to:[1,0.5,1]},{from:[0.5,0.5,1],to:[0.5,0.5,1.2]},{from:[0.5,0.5,1.3],to:[0.5,0.5,1]},{from:[0.5,1,1],to:[0.5,0,1.15]}];function a(h){return m[h?Math.floor(Math.random()*(e?m.length:Math.min(5,m.length))):0]}function l(y,v){var x,h=0,u=40/v;var z=setInterval(function(){if(h<1){if(!x){x=1;y(h);x=0}h+=u}else{w(1)}},40);function w(A){clearInterval(z);if(A){y(1)}}return{stop:w}}var i=c.width,p=c.height;var f;var n,o;if(e){var b=d('<canvas width="'+i+'" height="'+p+'"/>');b.css({"z-index":8,position:"absolute",left:0,top:0,width:"100%",height:"100%"}).appendTo(k);n=b.get(0).getContext("2d");o=b.clone().appendTo(k).get(0).getContext("2d")}else{var b=d('<div style="width:100%;height:100%"></div>');b.css({"z-index":8,position:"absolute",left:0,top:0}).appendTo(k);var g=[d('<img src="'+j.get(c.startSlide)+'"/>').css({position:"absolute","z-index":1}).appendTo(b)];g[1]=g[0].clone().appendTo(b).hide();var t=0}function s(x,u,h){var v={width:100*x[2]+"%"};v[u?"right":"left"]=-100*(x[2]-1)*(u?(1-x[0]):x[0])+"%";v[h?"bottom":"top"]=-100*(x[2]-1)*(h?(1-x[1]):x[1])+"%";if(!e){for(var w in v){if(/\%/.test(v[w])){v[w]=(/right|left|width/.test(w)?i:p)*parseFloat(v[w])/100+"px"}}}return v}var r;function q(h,w,u){if(n){if(f){f.stop()}f=l(function(x){var z=[w.from[0]*(1-x)+x*w.to[0],w.from[1]*(1-x)+x*w.to[1],w.from[2]*(1-x)+x*w.to[2]];o.globalAlpha=(u?Math.min(x*(1+c.delay/c.duration),1):1);o.drawImage(h,-i*(z[2]-1)*z[0],-p*(z[2]-1)*z[1],i*z[2],p*z[2]);n.clearRect(0,0,i,p);var y=n;n=o;o=y},c.duration+c.delay);r=0}else{if(u){g[t].css({"z-index":1}).fadeOut(c.duration);t=t?0:1}var v=g[t].stop(1,1).attr("src",h.src).css({"z-index":2,left:"auto",right:"auto",top:"auto",bottom:"auto"}).css(s(w.from,w.from[0]>0.5,w.from[1]>0.5)).animate(s(w.to,w.from[0]>0.5,w.from[1]>0.5),{easing:"linear",queue:false,duration:(1.5*c.duration+c.delay)});if(u){v.fadeIn(c.duration,function(){r=0})}else{r=0}}}j.each(function(h){d(this).css({visibility:"hidden"});if(h==c.startSlide){q(this,a(0),0)}});this.go=function(h,u){if(r){return -1}r=1;q(j.get(h),a(h),1);return h}};// -----------------------------------------------------------------------------------
// http://wowslider.com/
// JavaScript Wow Slider is a free software that helps you easily generate delicious 
// slideshows with gorgeous transition effects, in a few clicks without writing a single line of code.
// Generated by WOW Slider 3.1
//
//***********************************************
// Obfuscated by Javascript Obfuscator
// http://javascript-source.com
//***********************************************
jQuery("#wowslider-container1").wowSlider({effect:"kenburns",prev:"",next:"",duration:20*100,delay:20*100,width:640,height:480,autoPlay:true,stopOnHover:false,loop:false,bullets:true,caption:true,captionEffect:"slide",controls:true,logo:"engine1/loading.gif",onBeforeStep:0,images:0});