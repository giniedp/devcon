(function() {
  var Slides = this.Slides = {};

  Slides.last = 0;
  Slides.current = 0;

  Slides.fixNumbers = function(){
    Slides.last = Slides.last | 0;
    Slides.current = Slides.current | 0;
  };
  
  Slides.index = function(){
    Slides.current = 0;
    Slides.display();
  };
    
  Slides.next = function(){
    Slides.current += 1;
    Slides.display();
  };

  Slides.previous = function(){
    Slides.current -= 1;
    Slides.display();
  };

  Slides.currentName = function(){
    Slides.fixNumbers();
    
    return Slides.pageName(Slides.current);;
  };
    
  Slides.pageName = function(id){
    return "slide" + id;
  };
  
  Slides.slide = function(data){
    return $("<div id='slide'/>").append(data);//.prepend(Slides.navigation());
  };
  
  Slides.navigation = function(){
    Slides.fixNumbers();
    
    var navigation = $("<div id='slides_navigation'/>");
    navigation.append("<a href='#" + Slides.pageName(Slides.current - 1) + "' onclick='Slides.previous();'>\<\< prev </a>");
    navigation.append("<a href='#" + Slides.pageName(0) + "' onclick='Slides.index();'>index</a>");
    navigation.append("<a href='#" + Slides.pageName(Slides.current + 1) + "' onclick='Slides.next();'> next \>\> </a>");
    return navigation;
  };
  
  Slides.display = function(){
    Slides.fixNumbers();
    
    $.ajax({
      url : "slides/" + Slides.current,
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
  };
  
  Slides.init = function(){
    Slides.current = Number(window.location.hash.replace(/.*\#slide/, ""));
    Slides.display();
  };
  
  $(document).bind('keydown', 'left', Slides.previous);
  $(document).bind('keydown', 'down', Slides.previous);
  $(document).bind('keydown', 'right', Slides.next);
  $(document).bind('keydown', 'up', Slides.next);
}());