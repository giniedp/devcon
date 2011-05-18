(function() {
  var Slides = this.Slides = {};

  Slides.last = -1;
  Slides.current = -1;

  Slides.index = function(){
    Slides.current -1;
    Slides.display();
  };
    
  Slides.next = function(){
    Slides.current += 1;
    Slides.display();
  };

  Slides.prvious = function(){
    Slides.current -= 1;
    Slides.display();
  };

  Slides.currentName = function(){
    return Slides.pageName(Slides.current);;
  };
    
  Slides.pageName = function(id){
    var name = "index.html";
    if (id > 0){
      name = "page" + id + ".html";
    }
    return name;
  };
  
  Slides.slide = function(data){
    return $("<div id='slide'/>").append(data).append(Slides.navigation());
  };
  
  Slides.navigation = function(){
    var navigation = $("<div id='slides_navigation'/>");
    navigation.append("<a href='#" + Slides.pageName(Slides.current - 1) + "' onclick='Slides.prvious();'>\<\< prev </a>");
    navigation.append("<a href='#" + Slides.pageName(-1) + "' onclick='Slides.index();'>index</a>");
    navigation.append("<a href='#" + Slides.pageName(Slides.current + 1) + "' onclick='Slides.next();'> next \>\> </a>");
    return navigation;
  };
  
  Slides.display = function(){
    $.ajax({
      url : "slides/" + Slides.currentName(),
      success : function(data){
        Slides.last = Slides.current;
        $(".js-content").fadeOut(100, function(){
          $(this).html(Slides.slide(data)).fadeIn(100);
        });
      },
      error : function(data){
        Slides.current = Slides.last;
      }
    });
  }
}());