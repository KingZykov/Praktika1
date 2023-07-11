$(document).ready(function(){
   $("#col1").sortable({connectWith:"#col2, #col3"});
   $("#col2").sortable({connectWith:"#col1, #col3"});
   $("#col3").sortable({connectWith:"#col1, #col2"});
});
/*src="/js/d&d.js"*/