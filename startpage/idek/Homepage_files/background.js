!function(){function n(){u=window.innerWidth,f=window.innerHeight,w={x:u/2,y:f/2},h=document.getElementById("header"),h.width=u,h.height=f,v=h.getContext("2d"),m=[];for(var n=0;u>n;n+=u/35)for(var o=0;f>o;o+=f/35){var t=n+Math.random()*u/20,e=o+Math.random()*f/20,i={x:t,originX:t,y:e,originY:e};m.push(i)}for(var r=0;r<m.length;r++){for(var a=[],c=m[r],l=0;l<m.length;l++){var g=m[l];if(c!=g){for(var y=!1,p=0;5>p;p++)y||void 0==a[p]&&(a[p]=g,y=!0);for(var p=0;5>p;p++)y||s(c,g)<s(c,a[p])&&(a[p]=g,y=!0)}}c.closest=a}for(var r in m){var x=new d(m[r],2+2*Math.random(),"rgba(255,255,255,0.3)");m[r].circle=x}}function o(){"ontouchstart"in window||window.addEventListener("mousemove",t),window.addEventListener("scroll",e),window.addEventListener("resize",i)}function t(n){var o=posy=0;n.pageX||n.pageY?(o=n.pageX,posy=n.pageY):(n.clientX||n.clientY)&&(o=n.clientX+document.body.scrollLeft+document.documentElement.scrollLeft,posy=n.clientY+document.body.scrollTop+document.documentElement.scrollTop),w.x=o,w.y=posy}function e(){g=document.body.scrollTop>f?!1:!0}function i(){u=window.innerWidth,f=window.innerHeight,h.width=u,h.height=f}function r(){a();for(var n in m)c(m[n])}function a(){if(g){v.clearRect(0,0,u,f);for(var n in m)m[n].active=.04,m[n].circle.active=.04,l(m[n])}requestAnimationFrame(a)}function c(n){TweenLite.to(n,1+1*Math.random(),{x:n.originX-50+100*Math.random(),y:n.originY-50+100*Math.random(),ease:Circ.easeInOut,onComplete:function(){c(n)}})}function l(n){if(n.active)for(var o in n.closest)v.beginPath(),v.moveTo(n.x,n.y),v.lineTo(n.closest[o].x,n.closest[o].y),v.strokeStyle="rgba(127, 140, 141,"+n.active+")",v.stroke()}function d(n,o,t){var e=this;!function(){e.pos=n||null,e.radius=o||null,e.color=t||null}(),this.draw=function(){e.active&&(v.beginPath(),v.arc(e.pos.x,e.pos.y,e.radius,0,2*Math.PI,!1),v.fillStyle="rgba(127, 140, 141"+e.active+")",v.fill())}}function s(n,o){return Math.pow(n.x-o.x,2)+Math.pow(n.y-o.y,2)}var u,f,h,v,m,w,g=!0;n(),r(),o()}();
