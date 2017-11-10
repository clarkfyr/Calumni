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

var numbers = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.whitespace,
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  // local:  ["(A)labama","Alaska","Arizona","Arkansas","Arkansas2","Barkansas"]
  remote: {
  	url: "autocomplete?search=%QUERY",
  	wildcard: "%QUERY"
  }
});

// initialize the bloodhound suggestion engine
numbers.initialize();

$("#username_search").typeahead({
  items: 6,
  source:numbers.ttAdapter()
});

  // $('#username_search').typeahead({
	
  //   name: "book",
  //   remote: "autocomplete?query=%QUERY"
  // });


});


