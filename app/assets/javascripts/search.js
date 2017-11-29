$(function() {
// var bestPictures = new Bloodhound({
//   datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
//   queryTokenizer: Bloodhound.tokenizers.whitespace,
//   remote: {
//   	url: "autocomplete?query=%QUERY",
//   	wildcard: "%QUERY"
//   }
// });

// bestPictures.initialize();

// $('#username_search').typeahead(null, {
//   name: 'best-pictures',
//   displayKey: 'username',
//   source: bestPictures.ttAdapter()
// });
// $('#username_search').bind('typeahead:selected', function(event, datum, name) {
// 	console.log("sdf")
  
//   // doSomething(datum.id);
// });


// $('#username_search').typeahead({                              
//   name: 'example',                                                             
//   local: [
//         'Salt Lake City',
//         'Provo',
//         'Ogden',
//         'Bountiful',
//         'Orem',
//         'Centerville',
//         'St. George',
//         'Cedar City',
//         'Hurricane',
//   ]                                                                           
// }); 
var array=["nav_search","company_search","position_search"];
var state=[$("#"+array[0]).val(),$("#"+array[1]).val(),$("#"+array[2]).val()];
var numbers = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.whitespace,
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  remote: {
  	url: "autocomplete?search=%QUERY",
  	wildcard: "%QUERY",
    replace: function(){
      // add type info
      var q="autocomplete?search=";
      for (var j = 0 ; j < array.length; j++) {
        // console.log(j);
        // console.log(array[j]);
        // console.log($("#"+array[j]).val());
        // only capture the changed input
        if($("#"+array[j]).val()!== state[j]){
          q+=encodeURIComponent($("#"+array[j]).val())+"&type="+array[j];
          state[j]=$("#"+array[j]).val();
        };
      }
      // console.log(q);
      return q;
    }
  }
});
// initialize the bloodhound suggestion engine
numbers.initialize();

var nav_search_tmp;
$("#nav_search").bind('input',function(){
  nav_search_tmp=$("#nav_search").val();
});

$("#nav_search").typeahead({
  items: 6,
  source:numbers.ttAdapter(),
  displayText: function(data){
      // console.log(data);
      if(data.type=="last"){
        return '<div><strong>'+data.username+'</strong></div>';
      }else {
        var dis_start='<div><img src='+data.img+' alt=" " width="30" height="30" style="border-radius:50%;margin-left:-0.3cm;">'
        if(data.type=="username"){
          return dis_start+'<strong>'+data.username+'</strong>'+' - '+data.position+' at '+data.company+'</div>';
        }else if(data.type=="company"){
          return dis_start+data.username+' - '+data.position+' at '+'<strong>'+data.company+'</strong>'+'</div>';
        }else if(data.type=="position"){
          return dis_start+data.username+' - '+'<strong>'+data.position+'</strong>'+' at '+data.company+'</div>';
        };
      }
  },
  fitToElement: true,
  afterSelect: function(data){
    $("#nav_search").val(nav_search_tmp);
    window.location.href=data.url;
  },
}).on('keydown',this,function(e){
  if(e.which==38 || e.which==40){
    $("#nav_search").val(nav_search_tmp);
  }
});



$("#company_search").typeahead({
  items: 6,
  source:numbers.ttAdapter()
});
$("#position_search").typeahead({
  items: 6,
  source:numbers.ttAdapter()
});


});


