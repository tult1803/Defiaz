String urlDemo =
    "https://www.pixsy.com/wp-content/uploads/2021/04/edi-libedinsky-1bhp9zBPHVE-unsplash-1.jpeg";
String urlDemo1 =
    "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg";
String urlDemo2 =
    "https://cdn.pixabay.com/photo/2014/12/16/22/25/woman-570883__340.jpg";
String urlDemo3 =
    "https://cdn.pixabay.com/photo/2021/09/16/21/27/container-ship-6631117__480.jpg";
String urlDemo4 =
    "https://cdn.pixabay.com/photo/2014/10/07/13/48/mountain-477832__480.jpg";
String urlDemo5 =
    "https://cdn.pixabay.com/photo/2014/07/30/02/00/iceberg-404966__480.jpg";
String titleDemo =
    "Tesla is building a humanoid robot for boring, repetitive and dangerous work";
String authorDemo = "Marcuez Muciti";
String timeDemo = "4 hours ago";
String typeDemo = "FUNNEWS";
String viewsDemo = "132 views";

getUrlDemo(index) {
  switch (index) {
    case 0:
      return urlDemo;
    case 1:
      return urlDemo1;
    case 2:
      return urlDemo2;
    case 3:
      return urlDemo3;
    case 4:
      return urlDemo4;
    case 5:
      return urlDemo5;
    default:
      return urlDemo;
  }
}

