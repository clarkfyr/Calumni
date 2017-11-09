$(function() {
  return $('#username_search').typeahead({
    name: "book",
    remote: "autocomplete?query=%QUERY"
  });
});

