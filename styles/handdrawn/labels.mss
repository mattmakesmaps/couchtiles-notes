/* Fonts and font sets can be assigned to variables. The first font
   will be preferred, and fall back to subsequent fonts for characters
   that are not available, or if the entire font is not available to
   Mapnik. */
@futura_med: "Futura Medium","Function Pro Medium","Ubuntu Regular","Trebuchet MS Regular","DejaVu Sans Book";
@futura_italic: "Futura Medium Italic","Function Pro Medium Italic","Ubuntu Italic","Trebuchet MS Italic","DejaVu Sans Oblique";
@futura_bold: "Futura Bold","Function Pro Bold","Ubuntu Bold","Trebuchet MS Bold","DejaVu Sans Bold";
@line_text: #000000;

@country_name_face: "Walter Turncoat Regular";
@cities_name_face: "Short Stack Regular";
@geo_lines_face: "Short Stack Regular";

/* ---- Countries ---- */
#country-name[zoom>1][TYPE='Sovereign country'],
#country-name[zoom>1][TYPE='Country']{
  text-face-name: @country_name_face;
  text-fill:@line_text * 0.6;
  text-size: 10;
  text-halo-fill:rgba(255,255,255,0.5);
  text-halo-radius:1;
  text-line-spacing:1;
  text-wrap-width:20;
  text-name:"''"; /* hackish? */
  
  [zoom=3] { 
    text-size:10; 
  }
  [zoom=4] { 
    text-size:11; 
  }
  [zoom=5] { 
    text-size:12;
    text-character-spacing:1;
    text-line-spacing:1;
  }
  [zoom=6] {
    text-size:14;
    text-character-spacing:2;
    text-line-spacing:2;
  }
   [zoom>6] {
    text-size:17;
    text-character-spacing:2;
    text-line-spacing:2;
  }
  
  [zoom>=2][zoom<4] { text-name: "[ABBREV]"; }
  [zoom>=4] { text-name: "[NAME]"; }

}

#country-name[zoom>4][TYPE='Dependency']{
  text-face-name: @country_name_face;
  text-fill:@line_text * 0.6;
  text-size:9;
  text-transform:uppercase;
  text-halo-fill:rgba(255,255,255,0.5);
  text-halo-radius:1;
  text-line-spacing:1;
  text-wrap-width:20;
  text-name:"[NAME]";
  [zoom=6] { text-size:10; }
  [zoom>6] { text-size:11; }
}

/* ---- CITIES ---- */
#cities[WORLDCITY=1][zoom>5] {
  text-name: "[NAME]";
  text-fill: @line_text * 0.3;
  text-face-name:@cities_name_face;
  text-size: 10;
  text-dy: -10;
  text-halo-fill: rgba(255,255,255,0.75);
  text-halo-radius: 2;
  point-file: url(./icons/circle_8.png);
  point-allow-overlap: false;
}

#cities[ADM0CAP=1][zoom>4] {
  text-name: "[NAME]";
  text-fill: @line_text * 0.3;
  text-face-name:@cities_name_face;
  text-size: 10;
  text-dy: -10;
  text-halo-fill: rgba(255,255,255,0.75);
  text-halo-radius: 2;
  point-file: url(./icons/star_bold_16.png);
  point-allow-overlap: false;
}

/* ---- GEOGRAPHIC LINES ---- */
#geo-lines[zoom>1][DISPLAY!='International Date Line � 1995 Kiribati adjustment']{ 
  text-dy:-7;
  text-name:"[DISPLAY]";
  text-face-name:@geo_lines_face;
  text-fill:@line_text;
  text-placement:line;
  text-spacing:600;
}}