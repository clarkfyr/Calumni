$(function() {
 
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
var max_length=45;
var tol_length=max_length-3;
function cut_length(a){
  flag=0
  if(a.length>tol_length){
    a.slice(0,tol_length)+"...";
    flag=1
  }
  return [a,flag];
}
$("#nav_search").typeahead({
  items: 6,
  source:numbers.ttAdapter(),
  displayText: function(data){
      // console.log(data);
      if(data.type=="last"){
        return '<div><strong>'+data.username+'</strong></div>';
      }else {
        var dis_start='<div><img src='+data.img+' alt=" " width="30" height="30" style="border-radius:50%;margin-left:-0.3cm;">';
        [d1,flag]=cut_length(data.username);
        if(flag==0){
          d1=data.username;
          [d2,flag]=cut_length(data.username+data.position);
          if(flag==0){
            d2=data.position;
            [d3,flag]=cut_length(data.username+data.position+data.company);
            if(flag==0){d3=data.company;}else{d3=data.company.slice(0,tol_length-(d1+d2).length)+"...";}
          }else{d2=data.position.slice(0,tol_length-d1.length)+"...";d3="";}
        }else{d1=data.position.slice(0,tol_length)+"...";d2="";d3="";}
        if(data.type=="username"){d1='<strong>'+d1+'</strong>';
        }else if(data.type=="company"){d3='<strong>'+d3+'</strong>';
        }else if(data.type=="position"){d2='<strong>'+d2+'</strong>';};
        if(d3!=""){d3=' at '+d3;}
        return dis_start+d1+' - '+d2+d3+'</div>';
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

