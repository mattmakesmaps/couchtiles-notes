@line_org: #226688;
@line_mk: #8a8a8a;
@grat: #acacac;
Map {
  background-color: #f6f7f9;
}

#grat5dd_ne {
    line-color: @grat;
    line-width: 0.5;
}

#countries {
  ::outline {
    line-color: #6e6c6c;
    line-width: 2;
    line-join: round;
  }
  polygon-fill: #fff;
}

/* Useful/significant lines */
#geo-lines[DISPLAY!='International Date Line - Pre 1995 alignment'] {
  line-color:@line_mk;
  line-dasharray:6,2;
  [zoom=0] { line-width:0.2; }
  [zoom=1] { line-width:0.4; }
  [zoom=2] { line-width:0.6; }
  [zoom=3] { line-width:0.8; }
  [zoom>3] { line-width:1; }
}

.border.country[zoom>1],
.border.disputed[zoom>2] {
  line-width:1;
  line-color:#fff;
  line-join:round;
  .country[FeatureCla='Disputed (please verify)'] {
    [zoom=3] { line-dasharray:4,1; }
    [zoom=4] { line-dasharray:5,2; }
    [zoom=5] { line-dasharray:6,2; }
    [zoom=6] { line-dasharray:8,3; }
    [zoom>6] { line-dasharray:10,3; }
  }
  .disputed[FeatureCla='Breakaway'] {
    [zoom=3] { line-dasharray: 3,2; }
    [zoom=4] { line-dasharray: 4,4; }
    [zoom=5] { line-dasharray: 5,5; }
    [zoom=6] { line-dasharray: 6,6; }
    [zoom>6] { line-dasharray: 8,8; }
  }
  .disputed[FeatureCla='Claim boundary'] { 
    line-dasharray: 1,3;
    [zoom>6] { line-dasharray: 2,4; }
  }
  .country[FeatureCla='Indefinite (please verify)'] {
    line-dasharray: 6,1;
  }
}

/* Transparent PNG overlay for paper texture */
#paper[zoom<2] { 
  polygon-pattern-file:url(textures/paperfolds_256.png);
}
#paper[zoom>1] { 
  polygon-pattern-file:url(textures/paperfolds_512.png);
}